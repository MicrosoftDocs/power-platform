---
title: Review new connectors disabled by default in GCC High and DoD
description: Describes how new connectors are disabled by default in GCC High and DoD.
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/24/2025
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - ellenwehrle
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# New connectors disabled by default in GCC High and DoD

All new connectors that are introduced by Microsoft and partners to Power Platform are disabled by default for customers operating in the following US government clouds: Government Community Cloud - High (GCC High) and Department of Defense (DoD). Administrators can review these new connectors before authorizing their use across the organization in the **Data policy** page of the Power Platform admin center. Connectors already published in GCC High and DoD remain enabled.

Power Platform and third parties continuously release new connectors and administrators can set a [default classification](dlp-connector-classification.md#default-data-group-for-new-connectors) for those connectors via its data policies. Depending on how these data policies are configured within the customer's tenant, new connectors can unintentionally become available to makers in certain environments without administrators approving their use. Such occurrences must be avoided in US government clouds where strict compliance is mandated. Administrators can rely on this safeguard mechanism in GCC High and DoD to better control the use of connectors.

> [!NOTE]
> Custom connectors can't be disabled with this new data policy control.
>
> When a connector is disabled, administrators can still classify and configure the connector in the data policies, but its use is blocked in Power Apps and Power Automate.

## Prerequisites

New connectors are only disabled by default for the following US government clouds:

- Government Community Cloud - High (GCC High)
- Department of Defense (DoD)

## Review new connectors disabled by default

Take these steps to review a connector disabled by default, change a connector setting, and test ability to add a connector to an app.

### Step 1: View the new connector

1. Select the **Data policies** tab where all data policies are located.

2. Select **Enable connectors** in the toolbar.

3. New connectors (those that haven't been reviewed) have the status **Mark as reviewed**.

4. Connectors that have already been reviewed and authorized have the status **Reviewed**.

    :::image type="content" source="media/connector-off-by-default/enable-connectors.png" alt-text="Enabled connector":::

### Step 2: Enable the new connector or let it remain disabled

1. If you want to keep the connector disabled, select **Mark as reviewed**.

2. If you want to enable the connector, select the **Enable** toggle.

3. In both cases, the status is changed to **Reviewing**.

4. Select **Save**. The status of the connector is now set to **Reviewed**.

    :::image type="content" source="media/connector-off-by-default/connectors-marked-as-reviewed.png" alt-text="Disabled connector Mark as reviewed":::

### Step 3: View a disabled connector in a data policy

1. Select a data policy in the **Data policies** page.

2. Consult the **Prebuilt connectors** tab. Connectors that are disabled have the status **Disabled**.

    :::image type="content" source="media/connector-off-by-default/disabled-connectors.png" alt-text="Disabled connector":::

### Step 4: Attempt to add a disabled connector in a Power App

1. Open any Power App.

2. Add a disabled connector to a flow. An error message appears.

    :::image type="content" source="media/connector-off-by-default/flow-disabled-connector-error-message.png" alt-text="Disabled connector error message":::

    > [!NOTE]
    > This new tenant-level setting is also enforced on existing apps and flows that were built using connectors that are now disabled.

## PowerShell support

The new data control has the following structure in PowerShell. The **connectorSettings** object is an array of connectors specifying whether it's enabled or disabled (*behavior*) and whether it has been reviewed or not (*isReviewed*).

```powershell
$connectorBlockingDefinition = [pscustomobject] @{ 
  ConnectorSettings= @( 
    [pscustomobject] @{ 
             id  # connectorId -- string 
             behavior # connector behavior -- "Allow"/"Deny" 
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
Get-PowerAppDlpConnectorBlockingPolicies -TenantId "aaaabbbb-0000-cccc-1111-dddd2222eeee"
```

The above cmdlet outputs the connectors that are blocked/allowed for the evaluation and the policyId. 

**Create a new connector blocking policy for the tenant**

```powershell
New-PowerAppDlpConnectorBlockingPolicy –TenantId "aaaabbbb-0000-cccc-1111-dddd2222eeee" -ConnectorBlockingDefinition $connectorBlockingDefinition
  Where $connectorBlockingDefinition = [pscustomobject] @{
    ConnectorSettings= @
      [pscustomobject] @{
        id  = "/providers/Microsoft.PowerApps/apis/connector1"
        behavior = "Allow"
        isReviewed = $true
      },
      [pscustomobject] @{
        id = "/providers/Microsoft.PowerApps/apis/connector2"
        behavior="Deny"
        IsReviewed=$false
      }
    )
  }
```

**Update the connector blocking policy for the tenant**

```powershell
Set-PowerAppDlpConnectorBlockingPolicy -TenantId "aaaabbbb-0000-cccc-1111-dddd2222eeee" -PolicyId "1aaaaaa1-2bb2-3cc3-4dd4-5eeeeeeeeee5" -ConnectorBlockingDefinition $connectorBlockingDefinition
```

**Fetch the connector blocking policy using the policyId**

```powershell
Get-PowerAppDlpConnectorBlockingPolicy -TenantId "aaaabbbb-0000-cccc-1111-dddd2222eeee" -PolicyId "1aaaaaa1-2bb2-3cc3-4dd4-5eeeeeeeeee5"
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
