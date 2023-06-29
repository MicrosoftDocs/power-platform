---
title: "Disable new connectors by default | MicrosoftDocs"
description: Describes how new connectors are disabled by default in GCC High and DoD.

ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/25/2022
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Disable new connectors by default in GCC High and DoD

All new connectors that are introduced by Microsoft and partners to the Power Platform will be disabled by default for customers operating in the following US government clouds: GCC High and DoD. Administrators will be able to review these new connectors before  authorizing their use across the organization in the **Data policy** page of the Power Platform admin center. Connectors already published in GCC High and DoD will remain enabled.

Power Platform and third parties continuously release new connectors and administrators can set a [default classification](dlp-connector-classification.md#default-data-group-for-new-connectors) for those connectors via its DLP policies. Depending on how these DLP policies are configured within the customer's tenant, new connectors can unintentionally become available to makers in certain environments without administrators approving their use. Such occurrences must be avoided in US government clouds where strict compliance is mandated. Administrators can rely on this safeguard mechanism in GCC High and DoD to better control the use of connectors.

> [!NOTE]
> - Custom connectors can't be disabled via this new DLP control.
> - When a connector is disabled, the administrators can still classify and configure the connector in the DLP policies, but its use will be blocked in Power Apps and Power Automate.

## Availability

This feature is being progressively released, and all customers operating in GCC High and DoD will have access to it by the end of March 2022. Sign-up is not required.

## Workflow

### Step one: View the new connector

1. Select the **Data policies** tab where all DLP policies are located.

2. Select **Enable connectors** in the toolbar.

3. New connectors (those that haven’t been reviewed) have the status "Mark as reviewed".

4. Connectors that have already been reviewed and authorized have the status "Reviewed".

:::image type="content" source="media/enable-connector.png" alt-text="Enabled connector":::

### Step two: Enable or disable the new connector

1. If you want to keep the connector disabled, select **Mark as reviewed**.

2. If you want to enable the connector, select the **Enable** toggle.

3. In both cases, the status is changed to "Reviewing".

4. Select **Save**. The status of the connector is now set to "Reviewed".

:::image type="content" source="media/connector-mark-as-reviewed.png" alt-text="Disabled connector Mark as reviewed":::

### Step three: View a disabled connector in a DLP policy

1. Select a data policy in the **Data policies** page.

2. Consult the **Prebuilt connectors** tab. Connectors that are disabled have the status "Disabled".

:::image type="content" source="media/disabled-connector.png" alt-text="Disabled connector":::

### Step four: Attempt to add a disabled connector in a Power App

1. Open any Power App.

2. Add a connector that has been disabled. An error message appears.

:::image type="content" source="media/disabled-connector-error-message.png" alt-text="Disabled connector error message":::

> [!NOTE]
> - This new tenant-level setting is also enforced on existing apps and flows that were built using connectors that are now disabled.

## PowerShell support

The new DLP control has the following structure in PowerShell. The **connectorSettings** object is an array of connectors specifying whether it’s enabled or disabled ("behavior") and whether it has been reviewed or not ("isReviewed").

```powershell
$connectorBlockingDefinition = [pscustomobject] @{ 
  ConnectorSettings= @( 
    [pscustomobject] @{ 
 			id  # connectorId -- string 
 			behavior # connector behavior -- “Allow”/”Deny” 
 			isReviewed # whether connector has been reviewed -- boolean 
 		} 
  ) 
} 
``` 

**Retrieve the existing connector blocking policy for the tenant**

```powershell
Get-PowerAppDlpConnectorBlockingPolicies
``` 

Example: 
```powershell
Get-PowerAppDlpConnectorBlockingPolicies -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531”
```

The above cmdlet outputs the connectors that are blocked/allowed for the evaluation and the policyId. 

**Create a new connector blocking policy for the tenant**

```powershell
New-PowerAppDlpConnectorBlockingPolicy –TenantId “8dfd3b6e-2fd1-42ac-a874-b1edc2db1531” -ConnectorBlockingDefinition $connectorBlockingDefinition
  Where $connectorBlockingDefinition = [pscustomobject] @{
    ConnectorSettings= @
      [pscustomobject] @{
        id  = “/providers/Microsoft.PowerApps/apis/connector1”
        behavior = “Allow”
        isReviewed = $true
      },
      [pscustomobject] @{
        id = “/providers/Microsoft.PowerApps/apis/connector2”
        behavior=”Deny”
        IsReviewed=$false
      }
    )
  }
```

**Update the connector blocking policy for the tenant**

```powershell
Set-PowerAppDlpConnectorBlockingPolicy -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531” -PolicyId “235d9cd9-edb1-4fe4-9a5a-e6eb2ba4ed80” -ConnectorBlockingDefinition $connectorBlockingDefinition
```

**Fetch the connector blocking policy using the policyId**

```powershell
Get-PowerAppDlpConnectorBlockingPolicy -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531” -PolicyId “235d9cd9-edb1-4fe4-9a5a-e6eb2ba4ed80”
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
