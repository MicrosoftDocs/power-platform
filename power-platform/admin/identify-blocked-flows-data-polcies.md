---
title: "Identify blocked Power Automate flows from Data Policies | MicrosoftDocs"
description: Quickly identify flows which are impacted by Data Policies using PowerShell.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/04/2025
ms.subservice: admin
author: laneswenka
ms.author: laswenka
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Identify blocked Power Automate flows from Data Policies
As new capabilities become available such as the inclusion of Triggers as part of [Connector action control](./connector-action-control.md), it can become urgent to quickly identify flows which are in violation of existing Data Policies.  The below scripts help you identify and provide an inventory of these flows for review, and can also be used to update your policies if you wish for those flows to not fail at runtime.

## Inventory flows with blocked triggers
The PowerShell script below can be used to create an Impacted Flows CSV file.  It will query all Data Policies in your tenant, and find the applicable environments that are in scope.  Thereafter, it will recurse every environment and find Power Automate flows which are in violation of applicable policy due to using Triggers which are currently blocked.  

```powershell
# Prompt user to capture TenantId
$TenantId = Read-Host "Please provide your Microsoft Entra TenantId Guid"
if($TenantId -eq "")
{
    Write-Host "TenantId is required. Exiting..." -ForegroundColor Red
    Exit;
}

function Is-Guid {
    param (
        [string]$Guid
    )
    try {
        [Guid]::Parse($Guid) | Out-Null
        return $true
    } catch {
        return $false
    }
}

if(Is-Guid -Guid $TenantId)
{
    ##We can proceed
}
else
{
    Write-Host "TenantId is not a valid Guid format. Exiting..." -ForegroundColor Red
    Exit;
}

# Load Power Platform Administration PowerShell module
Import-Module Microsoft.PowerApps.Administration.PowerShell -ErrorAction Stop
Import-Module Microsoft.PowerApps.PowerShell -ErrorAction Stop

Add-PowerAppsAccount

# Initialize output
$output = @()

Write-Host "Fetching all DLP policies in the tenant..." -ForegroundColor Cyan

try {
    # Fetch all DLP policies
    #$dlpPolicies = Get-AdminDlpPolicy
    $totalPolicies = $dlpPolicies.Count

    Write-Host "Done. Fetching all Environments in the tenant..." -ForegroundColor Cyan
    $allEnvironments = Get-AdminPowerAppEnvironment
    Write-Host "Done."
} catch {
    Write-Host "Failed to fetch DLP policies: $_" -ForegroundColor Red
    exit
}

$policyIndex = 0
foreach ($policy in $dlpPolicies) {

$policyIndex++
Write-Progress -Activity "Processing Policies" -Status "Processing $policyIndex of $totalPolicies" -PercentComplete (($policyIndex / $totalPolicies) * 100)

    try {
        Write-Host "Processing DLP Policy: $($policy.DisplayName)" -ForegroundColor Cyan

        # Initialize actionBlockedConnectorIds
        $actionBlockedConnectorIds = @()

        # Retrieve connector configurations for the policy
        $connectorConfigurations = Get-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $policy.PolicyName

        if (-not $connectorConfigurations.connectorActionConfigurations) {
            Write-Host "Skipping policy $($policy.DisplayName) - No action control policy settings defined." -ForegroundColor Gray
            continue
        }

        foreach ($connectorConfig in $connectorConfigurations.connectorActionConfigurations) {
            $connectorId = $connectorConfig.connectorId

            # Check if the connector has actions blocked by default
            if ($connectorConfig.defaultConnectorActionRuleBehavior -eq 'Block') {
                Write-Host "Connector with default blocked actions found: $connectorId in Policy $($policy.DisplayName)" -ForegroundColor Yellow

                $actionBlockedConnectorIds += $connectorId
            }
        }

        # Determine environments impacted by the policy
        Write-Host "Determining environments impacted by the policy..." -ForegroundColor Cyan
        $environments = @()

        switch ($policy.FilterType) {
            "" {
                $environments = $allEnvironments
            }
            "include" {
                $environments = $policy.Environments | ForEach-Object { $_.name }
            }
            "exclude" {
                $policyEnvironmentNames = $policy.Environments | ForEach-Object { $_.name }
                $environments = $allEnvironments | Where-Object { $_.EnvironmentName -notin $policyEnvironmentNames }
            }
        }

        $environmentIndex = 0
        $environmentCount = $environments.Count
        foreach ($environment in $environments) {
            $environmentIndex++
            Write-Progress -Activity "Processing Environments" -Status "Environment $environmentIndex of $environmentCount" -PercentComplete (($environmentIndex / $environments.Count) * 100)

            $environmentId = if ($environment -is [string]) { $environment } else { $environment.EnvironmentName }

            $environmentDetails = Get-AdminPowerAppEnvironment -EnvironmentName $environmentId
            Write-Host "Processing environment: $environmentId - " + $environmentDetails.DisplayName -ForegroundColor Green

            # Capture Flow Management API URI
            $flowBaseUri = $environmentDetails.Internal.properties.runtimeEndpoints.'microsoft.Flow'

            # Fetch flows in the environment
            try {
                $flowsUri = $flowBaseUri + '/providers/Microsoft.ProcessSimple/scopes/admin/environments/' + $environmentId + '/v2/flows'
                $flowsOutput = InvokeAPi -Method Get -Route $flowsUri -Body ""
                        
            } catch {
                Write-Host "Failed to fetch flows for environment $environmentId : $_" -ForegroundColor Red
                continue
            }

            $flows = $flowsOutput
            $flowIndex = 0
            $flowsCount = $flows.value.Count
            foreach ($flow in $flows.value) {
                $flowIndex++
                Write-Progress -Activity "Processing Flows" -Status "Flow $flowIndex of $flowsCount " -PercentComplete (($flowIndex / $flows.value.Count) * 100)

                # Check if flow's trigger uses the restricted connector
                Write-Host "Flow display name: " $flow.properties.displayName 
                Write-Host "Flow status: " $flow.properties.state
                        
                $flowDetailsUri = $flowBaseUri + '/providers/Microsoft.ProcessSimple/scopes/admin/environments/' + $environmentId + '/flows/' + $flow.name
                $flowDetailsOutput = InvokeAPi -Method Get -Route $flowDetailsUri -Body ""

                $HasBlockedTriggers = "No"
                foreach($trig in $flowDetailsOutput.properties.definitionSummary.triggers)
                {
                    Write-Host $trig.type $trig.swaggerOperationId $trig.api
                    if($trig.api.id -in $actionBlockedConnectorIds)
                    {
                        Write-Host "Flow using restricted trigger connector found: $($flow.properties.displayName)" -ForegroundColor Yellow
                        $output += [PSCustomObject]@{
                            FlowId            = $flow.name
                            FlowName          = $flow.properties.displayName
                            EnvironmentId     = $environmentId
                            PolicyId          = $policy.PolicyName
                            ConnectorId       = $trig.api.id
                            TriggerOperationId = $trig.swaggerOperationId
                            PolicyUrl         = "https://admin.powerplatform.microsoft.com/policies/dlp/policyId/$($policy.PolicyName)"
                        }
                        $HasBlockedTriggers = "Yes"
                    }

                }

                if($HasBlockedTriggers -eq "No")
                {
                    Write-Host "No blocked triggers found."
                }
            }
        }
    } catch {
        Write-Host "Error processing policy $($policy.DisplayName): $_" -ForegroundColor Red
    }
}

# Final Output
Write-Host "`nResults Summary:" -ForegroundColor Cyan
$output | Format-Table -AutoSize

# Prompt user to save output as CSV
$saveCsv = Read-Host "Do you want to save the results to ImpactedFlows.csv? (Y/N)"
if ($saveCsv -eq 'Y') {
    $output | Export-Csv -Path "$(Get-Location)\ImpactedFlows.csv" -NoTypeInformation -Force
    Write-Host "Results saved to ImpactedFlows.csv" -ForegroundColor Green
} else {
    Write-Host "Results not saved." -ForegroundColor Yellow
}

# Instructions for deep linking
Write-Host "`nTo review a DLP policy, navigate to:" -ForegroundColor Cyan
Write-Host "https://admin.powerplatform.microsoft.com/policies/dlp/policyId/{PolicyId}" -ForegroundColor Green
Write-Host "You may need to adjust the PPAC Admin URL for GCC, GCCH, Mooncake, DoD, and other clouds." -ForegroundColor Cyan
```

## Update policies to include triggers in connector action control
The following PowerShell script can be used to update your Data Policies to include triggers which are at risk of being blocked.  This uses the output Impacted Flows CSV file from the prior script as an input.  If you don't want to enable all triggers identified in the earlier section, you can remove them from the CSV file prior to running this script.

```powershell
# Prompt user to capture TenantId
$TenantId = Read-Host "Please provide your Microsoft Entra TenantId Guid"
if($TenantId -eq "")
{
    Write-Host "TenantId is required. Exiting..." -ForegroundColor Red
    Exit;
}

function Is-Guid {
    param (
        [string]$Guid
    )
    try {
        [Guid]::Parse($Guid) | Out-Null
        return $true
    } catch {
        return $false
    }
}

if (-not (Is-Guid -Guid $TenantId)) {
    Write-Host "TenantId is not a valid Guid format. Exiting..." -ForegroundColor Red
    Exit;
}

# Load Power Platform Administration PowerShell module
Import-Module Microsoft.PowerApps.Administration.PowerShell -ErrorAction Stop
Import-Module Microsoft.PowerApps.PowerShell -ErrorAction Stop

Add-PowerAppsAccount

# Prompt for CSV file path
$csvPath = Read-Host "Enter the path to ImpactedFlows.csv"
if (-not (Test-Path $csvPath)) {
    Write-Host "File not found at $csvPath. Exiting..." -ForegroundColor Red
    Exit;
}

# Import the CSV data
$impactedFlows = Import-Csv -Path $csvPath

# Group by PolicyId for efficient updates
$groupedPolicies = $impactedFlows | Group-Object -Property PolicyId

foreach ($policyGroup in $groupedPolicies) {
    $policyId = $policyGroup.Name
    $flowsInPolicy = $policyGroup.Group
    $policyNeedsUpdated = $false

    Write-Host "Processing DLP Policy: $policyId" -ForegroundColor Cyan

    # Get existing connector configurations for the policy
    try {
        $connectorConfigurations = Get-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $policyId
    } catch {
        Write-Host "Failed to retrieve connector configurations for policy $policyId : $_" -ForegroundColor Red
        continue
    }

    foreach ($flow in $flowsInPolicy) {
        $connectorId = $flow.ConnectorId
        $triggerOperationId = $flow.TriggerOperationId

        # Check if the connector already has configurations
        $existingConfig = $connectorConfigurations.connectorActionConfigurations | Where-Object { $_.connectorId -eq $connectorId }

        if ($existingConfig) {

            # Check if the triggerOperationId already exists in the actionRules array
            $triggerExists = $existingConfig.actionRules | Where-Object { $_.actionId -eq $triggerOperationId } 
            if($triggerExists -ne $null)
            {
                Write-Host "TriggerOperationId $triggerOperationId already exists for connector $connectorId in policy $policyId" -ForegroundColor Yellow
            } else {
                # Add the new triggerOperationId to the existing configuration
                $triggerRule = [pscustomobject]@{
                    actionId = $triggerOperationId
                    behavior = "Allow"
                }
                $existingConfig.actionRules+= $triggerRule
                $policyNeedsUpdated = $true
                
                Write-Host "Adding TriggerOperationId $triggerOperationId to connector $connectorId in policy $policyId" -ForegroundColor Green
            }
        }
    }

    if($policyNeedsUpdated)
    {
        # Update the DLP policy with modified configurations
        try {
            Set-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $policyId -UpdatedConnectorConfigurations $connectorConfigurations
            Write-Host "Successfully updated DLP Policy: $policyId" -ForegroundColor Cyan
        } catch {
            Write-Host "Failed to update DLP Policy $policyId : $_" -ForegroundColor Red
        }
    }
}

Write-Host "All impacted flows processed and DLP policies updated." -ForegroundColor Cyan
```