---
title: Manage advanced connector policies programmatically
description: Learn how to create, assign, copy, modify, and remove advanced connector policies (ACP) by using the Power Platform API and the administration (Admin) SDKs for PowerShell, C#, and Python.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/02/2026
author: laneswenka
ms.author: laswenka
ms.reviewer: ellenwehrle
ms.contributor: rurimmer
ms.subservice: admin
search.audienceType:
  - admin
---

# Tutorial: Manage advanced connector policies programmatically

[Advanced connector policies](advanced-connector-policies.md) (ACP) govern connector usage with a strict allowlist that blocks connectors by default. In addition to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) experience, you can manage ACP with code by using the [Power Platform API](/rest/api/power-platform/governance/rule-based-policies) and the administration (Admin) SDKs. Automating ACP is useful when you standardize governance across many environment groups, replicate a baseline policy between groups, or manage policies as part of a deployment pipeline.

In this tutorial, learn how to:

1. [Authenticate using Power Platform API](#step-1-authenticate-using-power-platform-api).
1. [Understand the ACP policy shape](#step-2-understand-the-acp-policy-shape).
1. [Create a policy and add it to an environment group](#step-3-create-a-policy-and-add-it-to-an-environment-group).
1. [Enable an individual connector action](#step-4-enable-an-individual-connector-action).
1. [Apply or update a policy on a single environment](#step-5-apply-or-update-a-policy-on-a-single-environment).
1. [Copy a policy from one environment group to another](#step-6-copy-a-policy-from-one-environment-group-to-another).
1. [Remove ACP from an environment group](#step-7-remove-acp-from-an-environment-group).

Advanced connector policies are exposed through the `governance/ruleBasedPolicies` operations of the Power Platform API. A *policy* contains one or more *rule sets*; the rule set with the ID `ConnectorManagement` holds the ACP connector allowlist. All examples in the article use API version `2024-10-01`.

## Prerequisites

- An [app registration configured for Power Platform API](programmability-authentication-v2.md). Note the app registration's **application (client) ID** and **directory (tenant) ID**.
- Permission to manage governance policies. For service principals, assign an RBAC role that can write resources, such as **Power Platform contributor** or **Power Platform owner**. For more information, see [Tutorial: Assign roles to service principals](programmability-tutorial-rbac-role-assignment.md).
- For the SDK examples, install the SDK that ships monthly on its public gallery:
  - **C#**: the [Microsoft.PowerPlatform.Management](https://www.nuget.org/packages/Microsoft.PowerPlatform.Management/) NuGet package.
  - **Python**: the [powerplatform-management](https://pypi.org/project/powerplatform-management/) PyPI package.

  ```dotnetcli
  dotnet add package Microsoft.PowerPlatform.Management
  ```

  ```bash
  pip install powerplatform-management
  ```

## Step 1. Authenticate using Power Platform API

All examples authenticate with your app registration's **client ID**, following the guidance in [Authentication](programmability-authentication-v2.md). The following examples sign in interactively as the current user. To run unattended as a service principal, see the confidential client flow in the [Authentication](programmability-authentication-v2.md#confidential-client-service-principal) article and assign the service principal an [RBAC role](programmability-tutorial-rbac-role-assignment.md).

### [PowerShell](#tab/powershell)

```powershell
# Requires the MSAL.PS module: Install-Module MSAL.PS -Scope CurrentUser
Import-Module "MSAL.PS"

$clientId  = "<application (client) ID of your app registration>"
$apiBaseUrl = "https://api.powerplatform.com"
$apiVersion = "2024-10-01"

# Sign in interactively and request a token for the Power Platform API
$auth = Get-MsalToken -ClientId $clientId -Scope "https://api.powerplatform.com/.default" -Interactive
$headers = @{ Authorization = "Bearer $($auth.AccessToken)" }
```

### [C#](#tab/csharp)

```csharp
using Microsoft.PowerPlatform.Management;
using Microsoft.PowerPlatform.Management.Models;

// Create an interactive client using your app registration's client ID.
// A browser window opens for sign-in.
var factory = new ServiceClientFactory();
var client = factory.Create("YOUR_CLIENT_ID");
```

### [Python](#tab/python)

```python
import asyncio
from azure.identity import InteractiveBrowserCredential
from kiota_authentication_azure.azure_identity_authentication_provider import (
    AzureIdentityAuthenticationProvider,
)
from kiota_http.httpx_request_adapter import HttpxRequestAdapter
from mspp_management.service_client_base import ServiceClientBase

# Sign in interactively using your app registration's client ID.
credential = InteractiveBrowserCredential(client_id="YOUR_CLIENT_ID")
auth_provider = AzureIdentityAuthenticationProvider(
    credentials=credential,
    scopes=["https://api.powerplatform.com/.default"],
)
adapter = HttpxRequestAdapter(authentication_provider=auth_provider)
client = ServiceClientBase(adapter)
```

---

## Step 2. Understand the ACP policy shape

An advanced connector policy is a rule-based policy that contains a rule set with the ID `ConnectorManagement`. That rule set carries a `version` and its `inputs` hold an `AllowedConnectorList`, where each entry allows a connector and sets how its actions and connection types are governed:

```json
{
  "name": "Contoso ACP baseline",
  "ruleSets": [
    {
      "id": "ConnectorManagement",
      "version": "1.0",
      "inputs": {
        "AllowedConnectorList": [
          {
            "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_office365",
            "AllowedActionsMode": "AllAllowed",
            "AllowedConnectionTypesMode": "AllAllowed"
          },
          {
            "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_commondataserviceforapps",
            "AllowedActionsMode": "SomeAllowed",
            "AllowedActions": ["GetItem", "CreateRecord"],
            "AllowedConnectionTypesMode": "AllAllowed"
          }
        ]
      }
    }
  ]
}
```

Keep the following semantics in mind:

- A connector that isn't in `AllowedConnectorList` is **blocked** (default-deny).
- Each entry sets `AllowedActionsMode`. `AllAllowed` permits every action on the connector. `SomeAllowed` restricts the connector to the actions listed in the entry's `AllowedActions` array. [Step 4](#step-4-enable-an-individual-connector-action) shows how to add an action and set this mode.
- `AllowedConnectionTypesMode` governs which connection types are allowed and follows the same `AllAllowed` pattern.
- Include the rule set's `version` when you create or update a policy. Read it from an existing policy and preserve the value that the service returns.

> [!TIP]
> The exact value of `AllowedConnector` is the connector's resource identifier. The most reliable way to learn the shape for connectors already in your tenant is to read an existing policy first ([Step 4](#step-4-enable-an-individual-connector-action) shows how) or use the connector catalog (described next), then mirror that shape when you create or update policies.

### Find connector and action IDs with the connector catalog

To discover which connectors and actions you can allow, use the [Connector Catalog API](/rest/api/power-platform/connectivity/connectors/list-connectors). It lists the connectors available in an environment, along with the identifiers you place in `AllowedConnector` and `AllowedActions`.

> [!NOTE]
> The connector catalog operations require an **environment ID in the path** *and* an OData `$filter` that specifies the **same** environment - for example, `$filter=environment eq '<environmentId>'`. Both are required.

```powershell
$environmentId = "<environment ID>"
$filter = [uri]::EscapeDataString("environment eq '$environmentId'")

# List connectors available in the environment
$connectors = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/connectivity/environments/$environmentId/connectors?`$filter=$filter&api-version=$apiVersion" `
    -Headers $headers
$connectors.value | Select-Object name, @{ n = "displayName"; e = { $_.properties.displayName } }

# Get a single connector by ID (the connector's name, such as shared_office365)
$connectorId = "shared_office365"
$connector = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/connectivity/environments/$environmentId/connectors/$connectorId?`$filter=$filter&api-version=$apiVersion" `
    -Headers $headers
$connector.id   # full resource path to use as AllowedConnector
```

Use the connector's `id` (its full resource path, such as `/providers/Microsoft.PowerApps/apis/shared_office365`) as the `AllowedConnector` value, and the connector's operation IDs as the values in `AllowedActions`. You can access the same catalog through the `connectivity` namespace of the Admin SDKs.

## Step 3. Create a policy and add it to an environment group

Adding ACP to an environment group is a two-part operation: create the policy, then assign it to the group. The create call returns the new policy `id`, which you use in the assignment call.

To assign the policy to the whole group, send an assignment request with an empty body (`{}`). Every environment in the group inherits the policy and stays in sync with it.

### [PowerShell](#tab/powershell)

```powershell
$environmentGroupId = "<environment group ID>"

# 1. Create the policy with a ConnectorManagement rule set
$policyBody = @{
    name     = "Contoso ACP baseline"
    ruleSets = @(
        @{
            id      = "ConnectorManagement"
            version = "1.0"
            inputs  = @{
                AllowedConnectorList = @(
                    @{
                        AllowedConnector           = "/providers/Microsoft.PowerApps/apis/shared_office365"
                        AllowedActionsMode         = "AllAllowed"
                        AllowedConnectionTypesMode = "AllAllowed"
                    }
                )
            }
        }
    )
} | ConvertTo-Json -Depth 10

$policy = Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body $policyBody
Write-Host "Created policy $($policy.id)"

# 2. Assign the policy to the environment group (empty body = whole group)
Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$($policy.id)/environmentGroups/$environmentGroupId/assignments?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body "{}"
Write-Host "Assigned policy $($policy.id) to group $environmentGroupId"
```

### [C#](#tab/csharp)

```csharp
var environmentGroupId = "<environment group ID>";

// 1. Create the policy with a ConnectorManagement rule set
var ruleSet = new RuleSet { Id = "ConnectorManagement", Version = "1.0", Inputs = new RuleSet_inputs() };
ruleSet.Inputs.AdditionalData["AllowedConnectorList"] = new List<object>
{
    new Dictionary<string, object>
    {
        ["AllowedConnector"] = "/providers/Microsoft.PowerApps/apis/shared_office365",
        ["AllowedActionsMode"] = "AllAllowed",
        ["AllowedConnectionTypesMode"] = "AllAllowed"
    }
};

var policyRequest = new PolicyRequest
{
    Name = "Contoso ACP baseline",
    RuleSets = new List<RuleSet> { ruleSet }
};

var policy = await client.Governance.RuleBasedPolicies.PostAsync(policyRequest);
Console.WriteLine($"Created policy {policy.Id}");

// 2. Assign the policy to the environment group (empty request = whole group)
await client.Governance.RuleBasedPolicies[policy.Id]
    .EnvironmentGroups[environmentGroupId]
    .Assignments.PostAsync(new PolicyAssignmentRequest());
Console.WriteLine($"Assigned policy {policy.Id} to group {environmentGroupId}");
```

### [Python](#tab/python)

```python
from mspp_management.models.policy_request import PolicyRequest
from mspp_management.models.rule_set import RuleSet
from mspp_management.models.rule_set_inputs import RuleSet_inputs
from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest

async def create_and_assign(client, environment_group_id: str):
    # 1. Create the policy with a ConnectorManagement rule set
    rule_set = RuleSet()
    rule_set.id = "ConnectorManagement"
    rule_set.version = "1.0"
    rule_set.inputs = RuleSet_inputs()
    rule_set.inputs.additional_data = {
        "AllowedConnectorList": [
            {
                "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_office365",
                "AllowedActionsMode": "AllAllowed",
                "AllowedConnectionTypesMode": "AllAllowed",
            }
        ]
    }

    policy_request = PolicyRequest()
    policy_request.name = "Contoso ACP baseline"
    policy_request.rule_sets = [rule_set]

    policy = await client.governance.rule_based_policies.post(policy_request)
    print(f"Created policy {policy.id}")

    # 2. Assign the policy to the environment group (empty request = whole group)
    await (
        client.governance.rule_based_policies
        .by_policy_id(policy.id)
        .environment_groups.by_group_id(environment_group_id)
        .assignments.post(PolicyAssignmentRequest())
    )
    print(f"Assigned policy {policy.id} to group {environment_group_id}")
```

---

## Step 4. Enable an individual connector action

To allow only specific actions on a connector, set its `AllowedActionsMode` to `SomeAllowed` and list the permitted actions in `AllowedActions`. This example adds an action, such as a hidden action that isn't selectable in the admin center, to a connector's allowlist and sets the connector to `SomeAllowed`. Read the policy, update the connector entry, and send the updated rule set back by using *patch*. Patch updates a rule set by ID and leaves the policy's other rule sets untouched.

### [PowerShell](#tab/powershell)

```powershell
$policyId     = "<policy ID>"
$connectorId  = "shared_commondataserviceforapps"   # last segment of AllowedConnector
$actionToAdd  = "aibuilderpredict_customprompt"

# 1. Read the current policy
$policy = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
    -Headers $headers

# 2. Find the ConnectorManagement rule set and the connector entry
$ruleSet = $policy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }
$entry = $ruleSet.inputs.AllowedConnectorList |
    Where-Object { ($_.AllowedConnector -split "/")[-1] -eq $connectorId }

# 3. Restrict the connector to specific actions: add the action and set SomeAllowed
if ($entry) {
    $actions = @()
    if ($entry.PSObject.Properties.Name -contains "AllowedActions") { $actions = @($entry.AllowedActions) }
    if ($actions -notcontains $actionToAdd) { $actions += $actionToAdd }
    $entry | Add-Member -NotePropertyName AllowedActions -NotePropertyValue $actions -Force
    $entry.AllowedActionsMode = "SomeAllowed"

    # 4. Patch only the modified rule set back to the policy
    $patchBody = @{ name = $policy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
    Invoke-RestMethod -Method Patch `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $patchBody
    Write-Host "Set '$connectorId' to SomeAllowed with '$actionToAdd' in policy $policyId"
}
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";
var connectorId = "shared_commondataserviceforapps";   // last segment of AllowedConnector
var actionToAdd = "aibuilderpredict_customprompt";

// 1. Read the current policy
var policy = await client.Governance.RuleBasedPolicies[policyId].GetAsync();

// 2. Find the ConnectorManagement rule set and the connector entry
var ruleSet = policy.RuleSets.First(r => r.Id == "ConnectorManagement");
var connectorList = (List<object>)ruleSet.Inputs.AdditionalData["AllowedConnectorList"];
var entry = connectorList
    .Cast<Dictionary<string, object>>()
    .First(e => ((string)e["AllowedConnector"]).Split('/').Last() == connectorId);

// 3. Restrict the connector to specific actions: add the action and set SomeAllowed
if (!(entry.TryGetValue("AllowedActions", out var actionsObj) && actionsObj is List<object> actions))
{
    actions = new List<object>();
}
if (!actions.Contains(actionToAdd)) actions.Add(actionToAdd);
entry["AllowedActions"] = actions;
entry["AllowedActionsMode"] = "SomeAllowed";

// 4. Patch only the modified rule set back to the policy
var patch = new PolicyRequest { Name = policy.Name, RuleSets = new List<RuleSet> { ruleSet } };
await client.Governance.RuleBasedPolicies[policyId].PatchAsync(patch);
Console.WriteLine($"Set '{connectorId}' to SomeAllowed with '{actionToAdd}' in policy {policyId}");
```

### [Python](#tab/python)

```python
async def enable_action(client, policy_id: str, connector_id: str, action_to_add: str):
    # 1. Read the current policy
    policy = await client.governance.rule_based_policies.by_policy_id(policy_id).get()

    # 2. Find the ConnectorManagement rule set and the connector entry
    rule_set = next(r for r in policy.rule_sets if r.id == "ConnectorManagement")
    connector_list = rule_set.inputs.additional_data["AllowedConnectorList"]
    entry = next(
        e for e in connector_list
        if e["AllowedConnector"].split("/")[-1] == connector_id
    )

    # 3. Restrict the connector to specific actions: add the action and set SomeAllowed
    actions = entry.get("AllowedActions") or []
    if action_to_add not in actions:
        actions.append(action_to_add)
    entry["AllowedActions"] = actions
    entry["AllowedActionsMode"] = "SomeAllowed"

    # 4. Patch only the modified rule set back to the policy
    from mspp_management.models.policy_request import PolicyRequest
    patch = PolicyRequest()
    patch.name = policy.name
    patch.rule_sets = [rule_set]
    await client.governance.rule_based_policies.by_policy_id(policy_id).patch(patch)
    print(f"Set '{connector_id}' to SomeAllowed with '{action_to_add}' in policy {policy_id}")
```

---

## Step 5. Apply or update a policy on a single environment

You can target a policy at a single environment instead of an environment group. This approach is useful for high-risk, pilot, or regulated environments. Assign the policy to the environment, and use the same patch pattern from Step 4 to modify it later. Each environment supports one effective ACP policy.

### [PowerShell](#tab/powershell)

```powershell
$policyId       = "<policy ID>"
$environmentId  = "<environment ID>"

# Assign the policy directly to the environment
Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId/environments/$environmentId/assignments?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body "{}"
Write-Host "Assigned policy $policyId to environment $environmentId"
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";
var environmentId = "<environment ID>";

// Assign the policy directly to the environment
await client.Governance.RuleBasedPolicies[policyId]
    .Environments[environmentId]
    .Assignments.PostAsync(new PolicyAssignmentRequest());
Console.WriteLine($"Assigned policy {policyId} to environment {environmentId}");
```

### [Python](#tab/python)

```python
async def assign_to_environment(client, policy_id: str, environment_id: str):
    from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest
    await (
        client.governance.rule_based_policies
        .by_policy_id(policy_id)
        .environments.by_environment_id(environment_id)
        .assignments.post(PolicyAssignmentRequest())
    )
    print(f"Assigned policy {policy_id} to environment {environment_id}")
```

---

## Step 6. Copy a policy from one environment group to another

When you replicate a governance baseline to another group, choose how much to copy by using the `CopyAllRules` flag:

- **`CopyAllRules = true`**: Create a new policy from *all* of the source group's rule sets and assign it to the target group. The target group's governance becomes an independent copy of the source.
- **`CopyAllRules = false`**: Extract only the `ConnectorManagement` rule set from the source policy and merge it into the target group's existing policy. The patch operation adds or updates the rule set by ID, so the target group keeps its other rules.

### [PowerShell](#tab/powershell)

```powershell
$sourceGroupId = "<source environment group ID>"
$targetGroupId = "<target environment group ID>"
$CopyAllRules  = $true

# 1. Find and read the policy assigned to the source group
$sourceAssignments = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environmentGroups/$sourceGroupId/assignments?api-version=$apiVersion" `
    -Headers $headers
$sourcePolicyId = $sourceAssignments.value[0].policyId
$source = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$sourcePolicyId`?api-version=$apiVersion" `
    -Headers $headers

if ($CopyAllRules) {
    # 2a. Copy ALL rule sets into a new policy and assign it to the target group
    $copyBody = @{ name = "$($source.name) (copy)"; ruleSets = $source.ruleSets } | ConvertTo-Json -Depth 20
    $copy = Invoke-RestMethod -Method Post `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $copyBody
    Invoke-RestMethod -Method Post `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$($copy.id)/environmentGroups/$targetGroupId/assignments?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body "{}"
    Write-Host "Copied all rules to policy $($copy.id) and assigned it to group $targetGroupId"
}
else {
    # 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
    $sourceCm = $source.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }

    $targetAssignments = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environmentGroups/$targetGroupId/assignments?api-version=$apiVersion" `
        -Headers $headers
    $targetPolicyId = $targetAssignments.value[0].policyId
    $targetPolicy = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$targetPolicyId`?api-version=$apiVersion" `
        -Headers $headers

    # Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
    $patchBody = @{ name = $targetPolicy.name; ruleSets = @($sourceCm) } | ConvertTo-Json -Depth 20
    Invoke-RestMethod -Method Patch `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$targetPolicyId`?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $patchBody
    Write-Host "Merged the ConnectorManagement rule into target policy $targetPolicyId"
}
```

### [C#](#tab/csharp)

```csharp
var sourceGroupId = "<source environment group ID>";
var targetGroupId = "<target environment group ID>";
var copyAllRules = true;

// 1. Find and read the policy assigned to the source group
var sourceAssignments = await client.Governance.RuleBasedPolicies
    .EnvironmentGroups[sourceGroupId].Assignments.GetAsync();
var sourcePolicyId = sourceAssignments.Value.First().PolicyId;
var source = await client.Governance.RuleBasedPolicies[sourcePolicyId].GetAsync();

if (copyAllRules)
{
    // 2a. Copy ALL rule sets into a new policy and assign it to the target group
    var copyRequest = new PolicyRequest { Name = $"{source.Name} (copy)", RuleSets = source.RuleSets };
    var copy = await client.Governance.RuleBasedPolicies.PostAsync(copyRequest);
    await client.Governance.RuleBasedPolicies[copy.Id]
        .EnvironmentGroups[targetGroupId]
        .Assignments.PostAsync(new PolicyAssignmentRequest());
    Console.WriteLine($"Copied all rules to policy {copy.Id} and assigned it to group {targetGroupId}");
}
else
{
    // 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
    var sourceCm = source.RuleSets.First(r => r.Id == "ConnectorManagement");

    var targetAssignments = await client.Governance.RuleBasedPolicies
        .EnvironmentGroups[targetGroupId].Assignments.GetAsync();
    var targetPolicyId = targetAssignments.Value.First().PolicyId;
    var targetPolicy = await client.Governance.RuleBasedPolicies[targetPolicyId].GetAsync();

    // Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
    var patch = new PolicyRequest { Name = targetPolicy.Name, RuleSets = new List<RuleSet> { sourceCm } };
    await client.Governance.RuleBasedPolicies[targetPolicyId].PatchAsync(patch);
    Console.WriteLine($"Merged the ConnectorManagement rule into target policy {targetPolicyId}");
}
```

### [Python](#tab/python)

```python
async def copy_policy(client, source_group_id: str, target_group_id: str, copy_all_rules: bool = True):
    from mspp_management.models.policy_request import PolicyRequest
    from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest

    # 1. Find and read the policy assigned to the source group
    source_assignments = await (
        client.governance.rule_based_policies
        .environment_groups.by_environment_group_id(source_group_id)
        .assignments.get()
    )
    source_policy_id = source_assignments.value[0].policy_id
    source = await client.governance.rule_based_policies.by_policy_id(source_policy_id).get()

    if copy_all_rules:
        # 2a. Copy ALL rule sets into a new policy and assign it to the target group
        copy_request = PolicyRequest()
        copy_request.name = f"{source.name} (copy)"
        copy_request.rule_sets = source.rule_sets
        copy = await client.governance.rule_based_policies.post(copy_request)
        await (
            client.governance.rule_based_policies
            .by_policy_id(copy.id)
            .environment_groups.by_group_id(target_group_id)
            .assignments.post(PolicyAssignmentRequest())
        )
        print(f"Copied all rules to policy {copy.id} and assigned it to group {target_group_id}")
    else:
        # 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
        source_cm = next(r for r in source.rule_sets if r.id == "ConnectorManagement")

        target_assignments = await (
            client.governance.rule_based_policies
            .environment_groups.by_environment_group_id(target_group_id)
            .assignments.get()
        )
        target_policy_id = target_assignments.value[0].policy_id
        target_policy = await client.governance.rule_based_policies.by_policy_id(target_policy_id).get()

        # Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
        patch = PolicyRequest()
        patch.name = target_policy.name
        patch.rule_sets = [source_cm]
        await client.governance.rule_based_policies.by_policy_id(target_policy_id).patch(patch)
        print(f"Merged the ConnectorManagement rule into target policy {target_policy_id}")
```
---

## Step 6b. Copy a policy from one environment group to another including connector actions

When you replicate a governance baseline to another group, choose how much to copy by using the `CopyAllRules` flag:

- **`CopyAllRules = true`**: Create a new policy from *all* of the source group's rule sets and assign it to the target group. The target group's governance becomes an independent copy of the source.
- **`CopyAllRules = false`**: Extract only the `ConnectorManagement` rule set from the source policy and merge it into the target group's existing policy. The patch operation adds or updates the rule set by ID, so the target group keeps its other rules.

### [PowerShell](#tab/powershell)

```powershell
$tenantId   = "<tenant-id>"
$apiBaseUrl = "https://api.powerplatform.com"
$apiVersion = "2024-10-01"

$sourceGroupId = "<source environment group ID>"
$targetGroupId = "<target environment group ID>"
$CopyAllRules  = $true

# ---------- Helpers ----------
function Get-Prop($obj, $name) {
    if ($null -ne $obj -and $obj.PSObject.Properties.Name -contains $name) { return $obj.$name }
    return $null
}

function Get-ConnectorKey($entry) { (([string]$entry.AllowedConnector) -split "/")[-1].ToLowerInvariant() }

function Get-ConnectorManagement($policy) {
    $policy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" } | Select-Object -First 1
}

function Get-ActionSignature($entry) {
    $mode = Get-Prop $entry "AllowedActionsMode"
    if (-not $mode) { $mode = "AllAllowed" }
    if ($mode -ne "SomeAllowed") { return $mode }
    $actions = (@(Get-Prop $entry "AllowedActions") | Where-Object { $_ } | Sort-Object) -join "|"
    return "$mode::$actions"
}

# Copies AllowedActionsMode/AllowedActions from each source connector to the matching target connector.
# Returns the number of connectors that were changed.
function Sync-ConnectorActions($sourceCm, $targetCm) {
    $changed = 0
    foreach ($src in @($sourceCm.inputs.AllowedConnectorList)) {
        $key = Get-ConnectorKey $src
        $tgt = @($targetCm.inputs.AllowedConnectorList) | Where-Object { (Get-ConnectorKey $_) -eq $key } | Select-Object -First 1
        if (-not $tgt) { Write-Warning "  $key is in the source but not in the target rule - skipped"; continue }
        if ((Get-ActionSignature $src) -eq (Get-ActionSignature $tgt)) { continue }

        $mode = Get-Prop $src "AllowedActionsMode"
        if (-not $mode) { $mode = "AllAllowed" }
        $tgt | Add-Member -NotePropertyName AllowedActionsMode -NotePropertyValue $mode -Force
        if ($mode -eq "SomeAllowed") {
            $actions = [object[]]@(Get-Prop $src "AllowedActions")
            $tgt | Add-Member -NotePropertyName AllowedActions -NotePropertyValue $actions -Force
            Write-Host "  $key -> SomeAllowed ($($actions.Count) allowed): $($actions -join ', ')"
        }
        else {
            $tgt.PSObject.Properties.Remove("AllowedActions")
            Write-Host "  $key -> $mode"
        }
        $changed++
    }
    return $changed
}

if ($MyInvocation.InvocationName -eq ".") { return }  # dot-sourced: load helpers only

# ---------- Authenticate (requires the Az.Accounts module: Install-Module Az.Accounts -Scope CurrentUser) ----------
Connect-AzAccount -Tenant $tenantId | Out-Null
$token = (Get-AzAccessToken -ResourceUrl $apiBaseUrl -AsSecureString).Token | ConvertFrom-SecureString -AsPlainText
$headers = @{ Authorization = "Bearer $token" }

function Invoke-PpApi($method, $path, $body) {
    $params = @{ Method = $method; Uri = "$apiBaseUrl/$path`?api-version=$apiVersion"; Headers = $headers }
    if ($body) { $params.ContentType = "application/json"; $params.Body = $body }
    Invoke-RestMethod @params
}

# ---------- 1. Read the source group's policy ----------
$sourceAssignments = Invoke-PpApi Get "governance/ruleBasedPolicies/environmentGroups/$sourceGroupId/assignments"
if (-not $sourceAssignments.value) { throw "No policy is assigned to source group $sourceGroupId" }
$sourcePolicyId = $sourceAssignments.value[0].policyId
$source   = Invoke-PpApi Get "governance/ruleBasedPolicies/$sourcePolicyId"
$sourceCm = Get-ConnectorManagement $source

# ---------- 2. Copy the rules (unchanged logic) ----------
# A group can have only one assigned policy, so check the target first
$targetAssignments = Invoke-PpApi Get "governance/ruleBasedPolicies/environmentGroups/$targetGroupId/assignments"
$targetPolicyId = if ($targetAssignments.value) { $targetAssignments.value[0].policyId } else { $null }

if ($targetPolicyId) {
    # Target already has a policy: patch the source rule sets into it (patch adds/updates rule sets by ID)
    $targetPolicy = Invoke-PpApi Get "governance/ruleBasedPolicies/$targetPolicyId"
    $ruleSetsToCopy = if ($CopyAllRules) { @($source.ruleSets) } else { @($sourceCm) }
    if (-not $ruleSetsToCopy -or -not $ruleSetsToCopy[0]) { throw "Source policy $sourcePolicyId has no rule sets to copy." }

    $patchBody = @{ name = $targetPolicy.name; ruleSets = $ruleSetsToCopy } | ConvertTo-Json -Depth 20
    Invoke-PpApi Patch "governance/ruleBasedPolicies/$targetPolicyId" $patchBody | Out-Null
    Write-Host "Target group already uses policy $targetPolicyId - updated it with $($ruleSetsToCopy.Count) rule set(s): $(($ruleSetsToCopy.id) -join ', ')"
}
elseif ($CopyAllRules) {
    # No policy on the target: copy ALL rule sets into a new policy and assign it
    $copyBody = @{ name = "$($source.name) (copy)"; ruleSets = $source.ruleSets } | ConvertTo-Json -Depth 20
    $copy = Invoke-PpApi Post "governance/ruleBasedPolicies" $copyBody
    Invoke-PpApi Post "governance/ruleBasedPolicies/$($copy.id)/environmentGroups/$targetGroupId/assignments" "{}" | Out-Null
    $targetPolicyId = $copy.id
    Write-Host "Copied all rules to new policy $targetPolicyId and assigned it to group $targetGroupId"
}
else {
    throw "No policy is assigned to target group $targetGroupId. Set `$CopyAllRules = `$true to create one."
}

# ---------- 3. Copy connector actions for each copied connector rule ----------
if (-not $sourceCm) { Write-Host "Source policy has no ConnectorManagement rule set - no connector actions to copy."; return }

$restricted = @($sourceCm.inputs.AllowedConnectorList | Where-Object { (Get-Prop $_ "AllowedActionsMode") -eq "SomeAllowed" })
Write-Host "Source has $($restricted.Count) connector(s) with restricted (partly disabled) actions."

# Re-read what the service actually stored for the target
$target   = Invoke-PpApi Get "governance/ruleBasedPolicies/$targetPolicyId"
$targetCm = Get-ConnectorManagement $target
if (-not $targetCm) { throw "Target policy $targetPolicyId has no ConnectorManagement rule set after the copy." }

Write-Host "Syncing connector actions into policy $targetPolicyId :"
$changed = Sync-ConnectorActions $sourceCm $targetCm
if ($changed -gt 0) {
    $patchBody = @{ name = $target.name; ruleSets = @($targetCm) } | ConvertTo-Json -Depth 20
    Invoke-PpApi Patch "governance/ruleBasedPolicies/$targetPolicyId" $patchBody | Out-Null
    Write-Host "Updated actions on $changed connector(s)."
}
else {
    Write-Host "Connector actions already match the source - nothing to update."
}

# ---------- 4. Verify ----------
$verifyCm = Get-ConnectorManagement (Invoke-PpApi Get "governance/ruleBasedPolicies/$targetPolicyId")
$mismatches = 0
foreach ($src in @($sourceCm.inputs.AllowedConnectorList)) {
    $key = Get-ConnectorKey $src
    $tgt = @($verifyCm.inputs.AllowedConnectorList) | Where-Object { (Get-ConnectorKey $_) -eq $key } | Select-Object -First 1
    if (-not $tgt -or (Get-ActionSignature $src) -ne (Get-ActionSignature $tgt)) {
        Write-Warning "Mismatch for $key - source: $(Get-ActionSignature $src) | target: $(Get-ActionSignature $tgt)"
        $mismatches++
    }
}
if ($mismatches -eq 0) { Write-Host "Verified: connector actions in $targetPolicyId match the source." }
```

### [C#](#tab/csharp)

```csharp
// Requires the .NET 10 SDK. Run with:
//   dotnet run CopyAcpPolicy.cs -- --tenant <tenant-id> --source <source group ID> --target <target group ID> [--connector-only]
#:package Azure.Identity@1.21.0
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json.Nodes;
using Azure.Core;
using Azure.Identity;

// ---------- Settings (can be overridden: --tenant <id> --source <id> --target <id> --connector-only) ----------
var tenantId      = "<tenant-id>";
var sourceGroupId = "<source environment group ID>";
var targetGroupId = "<target environment group ID>";
var copyAllRules  = true;   // false = copy only the ConnectorManagement rule set

const string ApiBaseUrl = "https://api.powerplatform.com";
const string ApiVersion = "2024-10-01";

for (var i = 0; i < args.Length; i++)
{
    switch (args[i].ToLowerInvariant())
    {
        case "--tenant": tenantId = args[++i]; break;
        case "--source": sourceGroupId = args[++i]; break;
        case "--target": targetGroupId = args[++i]; break;
        case "--connector-only": copyAllRules = false; break;
        default: Console.Error.WriteLine($"Unknown argument: {args[i]}"); return 1;
    }
}

try
{
    // ---------- Authenticate (interactive browser sign-in, like Connect-AzAccount) ----------
    var credential = new InteractiveBrowserCredential(new InteractiveBrowserCredentialOptions { TenantId = tenantId });
    var token = await credential.GetTokenAsync(new TokenRequestContext([$"{ApiBaseUrl}/.default"]));

    using var http = new HttpClient { BaseAddress = new Uri($"{ApiBaseUrl}/") };
    http.DefaultRequestHeaders.Authorization = new("Bearer", token.Token);
    var api = new PowerPlatformApi(http, ApiVersion);

    // ---------- 1. Read the source group's policy ----------
    var sourcePolicyId = await GetAssignedPolicyIdAsync(api, sourceGroupId)
        ?? throw new InvalidOperationException($"No policy is assigned to source group {sourceGroupId}");
    var source = await api.GetAsync($"governance/ruleBasedPolicies/{sourcePolicyId}")
        ?? throw new InvalidOperationException($"Source policy {sourcePolicyId} returned no content");
    var sourceCm = Acp.GetConnectorManagement(source);

    // ---------- 2. Copy the rules ----------
    // A group can have only one assigned policy, so check the target first
    var targetPolicyId = await GetAssignedPolicyIdAsync(api, targetGroupId);
    var sourceRuleSets = (source["ruleSets"] as JsonArray)?.OfType<JsonObject>().ToList() ?? [];

    if (targetPolicyId is not null)
    {
        // Target already has a policy: patch the source rule sets into it (patch adds/updates rule sets by ID)
        var targetPolicy = await api.GetAsync($"governance/ruleBasedPolicies/{targetPolicyId}");
        var ruleSetsToCopy = copyAllRules ? sourceRuleSets : sourceCm is null ? [] : [sourceCm];
        if (ruleSetsToCopy.Count == 0)
            throw new InvalidOperationException($"Source policy {sourcePolicyId} has no rule sets to copy.");

        await api.PatchAsync($"governance/ruleBasedPolicies/{targetPolicyId}", PolicyBody(Acp.GetString(targetPolicy, "name"), ruleSetsToCopy));
        Console.WriteLine($"Target group already uses policy {targetPolicyId} - updated it with {ruleSetsToCopy.Count} rule set(s): " +
                          string.Join(", ", ruleSetsToCopy.Select(r => Acp.GetString(r, "id"))));
    }
    else if (copyAllRules)
    {
        // No policy on the target: copy ALL rule sets into a new policy and assign it
        var copy = await api.PostAsync("governance/ruleBasedPolicies", PolicyBody($"{Acp.GetString(source, "name")} (copy)", sourceRuleSets));
        targetPolicyId = Acp.GetString(copy, "id")
            ?? throw new InvalidOperationException("Create policy response did not include an id.");
        await api.PostAsync($"governance/ruleBasedPolicies/{targetPolicyId}/environmentGroups/{targetGroupId}/assignments", new JsonObject());
        Console.WriteLine($"Copied all rules to new policy {targetPolicyId} and assigned it to group {targetGroupId}");
    }
    else
    {
        throw new InvalidOperationException($"No policy is assigned to target group {targetGroupId}. Omit --connector-only to create one.");
    }

    // ---------- 3. Copy connector actions for each copied connector rule ----------
    if (sourceCm is null)
    {
        Console.WriteLine("Source policy has no ConnectorManagement rule set - no connector actions to copy.");
        return 0;
    }

    var restricted = Acp.GetConnectors(sourceCm).Count(e => Acp.GetActionsMode(e) == "SomeAllowed");
    Console.WriteLine($"Source has {restricted} connector(s) with restricted (partly disabled) actions.");

    // Re-read what the service actually stored for the target
    var target = await api.GetAsync($"governance/ruleBasedPolicies/{targetPolicyId}");
    var targetCm = Acp.GetConnectorManagement(target)
        ?? throw new InvalidOperationException($"Target policy {targetPolicyId} has no ConnectorManagement rule set after the copy.");

    Console.WriteLine($"Syncing connector actions into policy {targetPolicyId}:");
    var changed = Acp.SyncConnectorActions(sourceCm, targetCm);
    if (changed > 0)
    {
        await api.PatchAsync($"governance/ruleBasedPolicies/{targetPolicyId}", PolicyBody(Acp.GetString(target, "name"), [targetCm]));
        Console.WriteLine($"Updated actions on {changed} connector(s).");
    }
    else
    {
        Console.WriteLine("Connector actions already match the source - nothing to update.");
    }

    // ---------- 4. Verify ----------
    var verifyCm = Acp.GetConnectorManagement(await api.GetAsync($"governance/ruleBasedPolicies/{targetPolicyId}"));
    var mismatches = 0;
    foreach (var src in Acp.GetConnectors(sourceCm))
    {
        var key = Acp.GetConnectorKey(src);
        var tgt = Acp.FindConnector(verifyCm, key);
        if (tgt is null || Acp.GetActionSignature(src) != Acp.GetActionSignature(tgt))
        {
            Log.Warn($"Mismatch for {key} - source: {Acp.GetActionSignature(src)} | target: {Acp.GetActionSignature(tgt)}");
            mismatches++;
        }
    }
    if (mismatches == 0) Console.WriteLine($"Verified: connector actions in {targetPolicyId} match the source.");
    return mismatches == 0 ? 0 : 2;
}
catch (Exception ex) when (ex is HttpRequestException or InvalidOperationException or AuthenticationFailedException)
{
    Console.Error.WriteLine($"ERROR: {ex.Message}");
    return 1;
}

static async Task<string?> GetAssignedPolicyIdAsync(PowerPlatformApi api, string groupId)
{
    var assignments = await api.GetAsync($"governance/ruleBasedPolicies/environmentGroups/{groupId}/assignments");
    var first = (assignments?["value"] as JsonArray)?.FirstOrDefault();
    return Acp.GetString(first, "policyId");
}

// Rule sets are deep-cloned because a JsonNode can only belong to one parent.
static JsonObject PolicyBody(string? name, IEnumerable<JsonObject> ruleSets) => new()
{
    ["name"] = name,
    ["ruleSets"] = new JsonArray(ruleSets.Select(r => (JsonNode?)r.DeepClone()).ToArray()),
};

// ---------- Types ----------

/// <summary>Minimal Power Platform API client (equivalent of Invoke-PpApi in the PowerShell version).</summary>
public sealed class PowerPlatformApi(HttpClient http, string apiVersion)
{
    public async Task<JsonNode?> SendAsync(HttpMethod method, string path, JsonNode? body = null)
    {
        using var request = new HttpRequestMessage(method, $"{path}?api-version={apiVersion}");
        if (body is not null)
        {
            request.Content = new StringContent(body.ToJsonString(), Encoding.UTF8);
            request.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
        }

        using var response = await http.SendAsync(request);
        var text = await response.Content.ReadAsStringAsync();
        if (!response.IsSuccessStatusCode)
        {
            throw new HttpRequestException(
                $"{method} {path} failed with {(int)response.StatusCode} {response.ReasonPhrase}: {text}",
                null, response.StatusCode);
        }
        return string.IsNullOrWhiteSpace(text) ? null : JsonNode.Parse(text, Acp.NodeOptions);
    }

    public Task<JsonNode?> GetAsync(string path) => SendAsync(HttpMethod.Get, path);
    public Task<JsonNode?> PostAsync(string path, JsonNode body) => SendAsync(HttpMethod.Post, path, body);
    public Task<JsonNode?> PatchAsync(string path, JsonNode body) => SendAsync(HttpMethod.Patch, path, body);
}

/// <summary>Helpers for the ConnectorManagement (advanced connector policy) rule set.</summary>
public static class Acp
{
    public const string RuleSetId = "ConnectorManagement";

    // Policy JSON is parsed case-insensitively to match PowerShell's property semantics.
    public static readonly JsonNodeOptions NodeOptions = new() { PropertyNameCaseInsensitive = true };

    public static string? GetString(JsonNode? node, string name) =>
        node is JsonObject obj && obj.TryGetPropertyValue(name, out var value) && value is JsonValue v &&
        v.TryGetValue<string>(out var s) ? s : null;

    public static JsonObject? GetConnectorManagement(JsonNode? policy) =>
        (policy?["ruleSets"] as JsonArray)?
            .OfType<JsonObject>()
            .FirstOrDefault(r => GetString(r, "id") == RuleSetId);

    public static IEnumerable<JsonObject> GetConnectors(JsonObject? connectorManagement) =>
        (connectorManagement?["inputs"]?["AllowedConnectorList"] as JsonArray)?.OfType<JsonObject>()
        ?? Enumerable.Empty<JsonObject>();

    public static string GetConnectorKey(JsonObject entry) =>
        (GetString(entry, "AllowedConnector") ?? "").Split('/').Last().ToLowerInvariant();

    public static JsonObject? FindConnector(JsonObject? connectorManagement, string key) =>
        GetConnectors(connectorManagement).FirstOrDefault(e => GetConnectorKey(e) == key);

    public static string GetActionsMode(JsonObject entry) =>
        string.IsNullOrEmpty(GetString(entry, "AllowedActionsMode")) ? "AllAllowed" : GetString(entry, "AllowedActionsMode")!;

    public static List<string> GetAllowedActions(JsonObject entry) =>
        (entry["AllowedActions"] as JsonArray)?
            .Select(a => a?.GetValue<string>())
            .Where(a => !string.IsNullOrEmpty(a))
            .Select(a => a!)
            .ToList()
        ?? new List<string>();

    public static string GetActionSignature(JsonObject? entry)
    {
        if (entry is null) return "";
        var mode = GetActionsMode(entry);
        if (mode != "SomeAllowed") return mode;
        return $"{mode}::{string.Join("|", GetAllowedActions(entry).OrderBy(a => a, StringComparer.Ordinal))}";
    }

    /// <summary>
    /// Copies AllowedActionsMode/AllowedActions from each source connector to the matching target connector.
    /// Returns the number of connectors that were changed.
    /// </summary>
    public static int SyncConnectorActions(JsonObject sourceCm, JsonObject targetCm)
    {
        var changed = 0;
        foreach (var src in GetConnectors(sourceCm))
        {
            var key = GetConnectorKey(src);
            var tgt = FindConnector(targetCm, key);
            if (tgt is null)
            {
                Log.Warn($"  {key} is in the source but not in the target rule - skipped");
                continue;
            }
            if (GetActionSignature(src) == GetActionSignature(tgt)) continue;

            var mode = GetActionsMode(src);
            tgt["AllowedActionsMode"] = mode;
            if (mode == "SomeAllowed")
            {
                var actions = GetAllowedActions(src);
                tgt["AllowedActions"] = new JsonArray(actions.Select(a => (JsonNode?)JsonValue.Create(a)).ToArray());
                Console.WriteLine($"  {key} -> SomeAllowed ({actions.Count} allowed): {string.Join(", ", actions)}");
            }
            else
            {
                tgt.Remove("AllowedActions");
                Console.WriteLine($"  {key} -> {mode}");
            }
            changed++;
        }
        return changed;
    }
}

public static class Log
{
    public static void Warn(string message)
    {
        var previous = Console.ForegroundColor;
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine($"WARNING: {message}");
        Console.ForegroundColor = previous;
    }
}
```

### [Python](#tab/python)

```python
# requires-python = ">=3.9"
# dependencies = ["azure-identity"]
"""
Copies rule-based policies (including advanced connector policy actions) from one
Power Platform environment group to another.

Setup:   pip install azure-identity
Run:     python copy_acp_policy.py --tenant <tenant-id> --source <source group ID> --target <target group ID> [--connector-only]
   or:   uv run copy_acp_policy.py --tenant ... (installs dependencies automatically)
"""

import argparse
import copy
import json
import sys
import urllib.error
import urllib.request

from azure.identity import InteractiveBrowserCredential

# ---------- Settings (can be overridden on the command line) ----------
TENANT_ID = "<tenant-id>"
SOURCE_GROUP_ID = "<source environment group ID>"
TARGET_GROUP_ID = "<target environment group ID>"
COPY_ALL_RULES = True  # False = copy only the ConnectorManagement rule set

API_BASE_URL = "https://api.powerplatform.com"
API_VERSION = "2024-10-01"
RULE_SET_ID = "ConnectorManagement"


# ---------- Helpers ----------
# Property lookups are case-insensitive to match PowerShell's semantics.
def _find_key(obj, name):
    if isinstance(obj, dict):
        lowered = name.lower()
        for key in obj:
            if key.lower() == lowered:
                return key
    return None


def get_prop(obj, name):
    key = _find_key(obj, name)
    return obj[key] if key is not None else None


def set_prop(obj, name, value):
    obj[_find_key(obj, name) or name] = value


def remove_prop(obj, name):
    key = _find_key(obj, name)
    if key is not None:
        del obj[key]


def get_connector_management(policy):
    for rule_set in get_prop(policy, "ruleSets") or []:
        if get_prop(rule_set, "id") == RULE_SET_ID:
            return rule_set
    return None


def get_connectors(connector_management):
    return get_prop(get_prop(connector_management, "inputs"), "AllowedConnectorList") or []


def get_connector_key(entry):
    return str(get_prop(entry, "AllowedConnector") or "").split("/")[-1].lower()


def find_connector(connector_management, key):
    return next((e for e in get_connectors(connector_management) if get_connector_key(e) == key), None)


def get_actions_mode(entry):
    return get_prop(entry, "AllowedActionsMode") or "AllAllowed"


def get_allowed_actions(entry):
    return [a for a in (get_prop(entry, "AllowedActions") or []) if a]


def get_action_signature(entry):
    if entry is None:
        return ""
    mode = get_actions_mode(entry)
    if mode != "SomeAllowed":
        return mode
    return f"{mode}::{'|'.join(sorted(get_allowed_actions(entry)))}"


def warn(message):
    print(f"WARNING: {message}", file=sys.stderr)


def sync_connector_actions(source_cm, target_cm):
    """Copies AllowedActionsMode/AllowedActions from each source connector to the matching
    target connector. Returns the number of connectors that were changed."""
    changed = 0
    for src in get_connectors(source_cm):
        key = get_connector_key(src)
        tgt = find_connector(target_cm, key)
        if tgt is None:
            warn(f"  {key} is in the source but not in the target rule - skipped")
            continue
        if get_action_signature(src) == get_action_signature(tgt):
            continue

        mode = get_actions_mode(src)
        set_prop(tgt, "AllowedActionsMode", mode)
        if mode == "SomeAllowed":
            actions = get_allowed_actions(src)
            set_prop(tgt, "AllowedActions", list(actions))
            print(f"  {key} -> SomeAllowed ({len(actions)} allowed): {', '.join(actions)}")
        else:
            remove_prop(tgt, "AllowedActions")
            print(f"  {key} -> {mode}")
        changed += 1
    return changed


def policy_body(name, rule_sets):
    return {"name": name, "ruleSets": copy.deepcopy(list(rule_sets))}


# ---------- Power Platform API client (equivalent of Invoke-PpApi) ----------
class PowerPlatformApi:
    def __init__(self, token):
        self._token = token

    def send(self, method, path, body=None):
        data = json.dumps(body).encode("utf-8") if body is not None else None
        request = urllib.request.Request(
            f"{API_BASE_URL}/{path}?api-version={API_VERSION}", data=data, method=method)
        request.add_header("Authorization", f"Bearer {self._token}")
        if data is not None:
            request.add_header("Content-Type", "application/json")
        try:
            with urllib.request.urlopen(request) as response:
                text = response.read().decode("utf-8")
        except urllib.error.HTTPError as err:
            detail = err.read().decode("utf-8", errors="replace")
            raise RuntimeError(f"{method} {path} failed with {err.code} {err.reason}: {detail}") from None
        return json.loads(text) if text.strip() else None

    def get(self, path):
        return self.send("GET", path)

    def post(self, path, body):
        return self.send("POST", path, body)

    def patch(self, path, body):
        return self.send("PATCH", path, body)


def get_assigned_policy_id(api, group_id):
    assignments = api.get(f"governance/ruleBasedPolicies/environmentGroups/{group_id}/assignments")
    values = get_prop(assignments, "value") or []
    return get_prop(values[0], "policyId") if values else None


# ---------- Main ----------
def run(tenant_id, source_group_id, target_group_id, copy_all_rules):
    # Authenticate (interactive browser sign-in, like Connect-AzAccount)
    credential = InteractiveBrowserCredential(tenant_id=tenant_id)
    token = credential.get_token(f"{API_BASE_URL}/.default").token
    api = PowerPlatformApi(token)

    # 1. Read the source group's policy
    source_policy_id = get_assigned_policy_id(api, source_group_id)
    if not source_policy_id:
        raise RuntimeError(f"No policy is assigned to source group {source_group_id}")
    source = api.get(f"governance/ruleBasedPolicies/{source_policy_id}")
    source_cm = get_connector_management(source)
    source_rule_sets = get_prop(source, "ruleSets") or []

    # 2. Copy the rules. A group can have only one assigned policy, so check the target first.
    target_policy_id = get_assigned_policy_id(api, target_group_id)
    if target_policy_id:
        # Target already has a policy: patch the source rule sets into it (patch adds/updates rule sets by ID)
        target_policy = api.get(f"governance/ruleBasedPolicies/{target_policy_id}")
        rule_sets_to_copy = source_rule_sets if copy_all_rules else ([source_cm] if source_cm else [])
        if not rule_sets_to_copy:
            raise RuntimeError(f"Source policy {source_policy_id} has no rule sets to copy.")

        api.patch(f"governance/ruleBasedPolicies/{target_policy_id}",
                  policy_body(get_prop(target_policy, "name"), rule_sets_to_copy))
        ids = ", ".join(str(get_prop(r, "id")) for r in rule_sets_to_copy)
        print(f"Target group already uses policy {target_policy_id} - updated it with "
              f"{len(rule_sets_to_copy)} rule set(s): {ids}")
    elif copy_all_rules:
        # No policy on the target: copy ALL rule sets into a new policy and assign it
        new_policy = api.post("governance/ruleBasedPolicies",
                              policy_body(f"{get_prop(source, 'name')} (copy)", source_rule_sets))
        target_policy_id = get_prop(new_policy, "id")
        if not target_policy_id:
            raise RuntimeError("Create policy response did not include an id.")
        api.post(f"governance/ruleBasedPolicies/{target_policy_id}/environmentGroups/{target_group_id}/assignments", {})
        print(f"Copied all rules to new policy {target_policy_id} and assigned it to group {target_group_id}")
    else:
        raise RuntimeError(f"No policy is assigned to target group {target_group_id}. "
                           "Omit --connector-only to create one.")

    # 3. Copy connector actions for each copied connector rule
    if source_cm is None:
        print("Source policy has no ConnectorManagement rule set - no connector actions to copy.")
        return 0

    restricted = sum(1 for e in get_connectors(source_cm) if get_actions_mode(e) == "SomeAllowed")
    print(f"Source has {restricted} connector(s) with restricted (partly disabled) actions.")

    # Re-read what the service actually stored for the target
    target = api.get(f"governance/ruleBasedPolicies/{target_policy_id}")
    target_cm = get_connector_management(target)
    if target_cm is None:
        raise RuntimeError(f"Target policy {target_policy_id} has no ConnectorManagement rule set after the copy.")

    print(f"Syncing connector actions into policy {target_policy_id}:")
    changed = sync_connector_actions(source_cm, target_cm)
    if changed:
        api.patch(f"governance/ruleBasedPolicies/{target_policy_id}",
                  policy_body(get_prop(target, "name"), [target_cm]))
        print(f"Updated actions on {changed} connector(s).")
    else:
        print("Connector actions already match the source - nothing to update.")

    # 4. Verify
    verify_cm = get_connector_management(api.get(f"governance/ruleBasedPolicies/{target_policy_id}"))
    mismatches = 0
    for src in get_connectors(source_cm):
        key = get_connector_key(src)
        tgt = find_connector(verify_cm, key)
        if tgt is None or get_action_signature(src) != get_action_signature(tgt):
            warn(f"Mismatch for {key} - source: {get_action_signature(src)} | target: {get_action_signature(tgt)}")
            mismatches += 1
    if mismatches == 0:
        print(f"Verified: connector actions in {target_policy_id} match the source.")
    return 0 if mismatches == 0 else 2


def main():
    parser = argparse.ArgumentParser(description="Copy Power Platform rule-based policies between environment groups.")
    parser.add_argument("--tenant", default=TENANT_ID)
    parser.add_argument("--source", default=SOURCE_GROUP_ID, help="Source environment group ID")
    parser.add_argument("--target", default=TARGET_GROUP_ID, help="Target environment group ID")
    parser.add_argument("--connector-only", action="store_true",
                        help="Copy only the ConnectorManagement rule set")
    args = parser.parse_args()

    try:
        return run(args.tenant, args.source, args.target, COPY_ALL_RULES and not args.connector_only)
    except Exception as ex:  # noqa: BLE001 - report any failure cleanly
        print(f"ERROR: {ex}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())

```

---

## Step 7. Remove ACP from an environment group

While a group has an active ACP rule, every environment in the group matches the group's policy. How you remove enforcement depends on whether you want those environments to keep their current configuration or clear ACP entirely:

- **Remove the rule from the group's policy** to stop the group from managing ACP. Use the `removeRule` operation to remove the `ConnectorManagement` rule set from the group's policy. The environments keep their last-applied ACP configuration, but they're no longer kept in sync with the group. You can manage each environment individually and let them diverge.
- **Remove ACP from the group and from every environment** to turn ACP off everywhere. Remove the rule from the group's policy, then loop through the group's environments and remove the `ConnectorManagement` rule set from each environment's policy as well.

> [!NOTE]
> Removing the rule from a group's policy doesn't automatically clear ACP from the environments that inherited it. Those environments retain their last-applied configuration to avoid an enforcement gap. To clear ACP everywhere, remove it from each environment, as shown in the loop example. For more information, see [Advanced connector policies](advanced-connector-policies.md).

### Remove the rule from the group's policy

The following example removes the `ConnectorManagement` rule set from a policy by using the `removeRule` operation.

### [PowerShell](#tab/powershell)

```powershell
$policyId = "<policy ID>"

# Read the policy, then send the rule set to remove
$policy = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
    -Headers $headers
$ruleSet = $policy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }

$body = @{ name = $policy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
Invoke-RestMethod -Method Patch `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId/removeRule?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body $body
Write-Host "Removed the ConnectorManagement rule set from policy $policyId"
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";

// Remove the ConnectorManagement rule set from the policy
var policy = await client.Governance.RuleBasedPolicies[policyId].GetAsync();
var ruleSet = policy.RuleSets.First(r => r.Id == "ConnectorManagement");

var removeRequest = new PolicyRequest { Name = policy.Name, RuleSets = new List<RuleSet> { ruleSet } };
await client.Governance.RuleBasedPolicies[policyId].RemoveRule.PatchAsync(removeRequest);
Console.WriteLine($"Removed the ConnectorManagement rule set from policy {policyId}");
```

### [Python](#tab/python)

```python
async def remove_rule(client, policy_id: str):
    from mspp_management.models.policy_request import PolicyRequest

    # Remove the ConnectorManagement rule set from the policy
    policy = await client.governance.rule_based_policies.by_policy_id(policy_id).get()
    rule_set = next(r for r in policy.rule_sets if r.id == "ConnectorManagement")

    remove_request = PolicyRequest()
    remove_request.name = policy.name
    remove_request.rule_sets = [rule_set]
    await client.governance.rule_based_policies.by_policy_id(policy_id).remove_rule.patch(remove_request)
    print(f"Removed the ConnectorManagement rule set from policy {policy_id}")
```

---

### Remove ACP from every environment in the group

To turn off ACP across all environments in a group, first remove the rule from the group's policy (previous example), then repeat the removal for each environment's own policy. Read each environment's assigned policy from its environment assignment, then call `removeRule` on that policy. Provide the environment IDs that belong to the group, or enumerate them by using the [environment management APIs](/rest/api/power-platform/environmentmanagement/environment-groups).

```powershell
# Environment IDs that belong to the group
$environmentIds = @("<environment ID 1>", "<environment ID 2>")

foreach ($environmentId in $environmentIds) {
    # Find the policy currently assigned to the environment
    $envAssignments = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environments/$environmentId/assignments?api-version=$apiVersion" `
        -Headers $headers
    if (-not $envAssignments.value) { continue }
    $envPolicyId = $envAssignments.value[0].policyId

    # Remove the ConnectorManagement rule set from that environment's policy
    $envPolicy = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$envPolicyId`?api-version=$apiVersion" `
        -Headers $headers
    $ruleSet = $envPolicy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }
    if ($ruleSet) {
        $body = @{ name = $envPolicy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
        Invoke-RestMethod -Method Patch `
            -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$envPolicyId/removeRule?api-version=$apiVersion" `
            -Headers $headers -ContentType "application/json" -Body $body
        Write-Host "Removed ACP from environment $environmentId"
    }
}
```

The same per-environment `removeRule` call works with the C# and Python SDKs shown earlier. Wrap the call in a loop over the group's environment IDs.

## Related content

[Advanced connector policies](advanced-connector-policies.md)<br/>
[Rule Based Policies - REST API reference](/rest/api/power-platform/governance/rule-based-policies)<br/>
[Authentication](programmability-authentication-v2.md)<br/>
[Tutorial: Assign roles to service principals](programmability-tutorial-rbac-role-assignment.md)<br/>
[Programmability and extensibility overview](programmability-extensibility-overview.md)
