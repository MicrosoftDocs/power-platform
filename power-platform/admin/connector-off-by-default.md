---
title: "Connectors off by default | MicrosoftDocs"
description: Describes how the connectors are off by default for GCC High and DoD.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/08/2021
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Disable new connectors by default in GCC High and DoD

Effective September 30, 2021, new connectors that are introduced by Microsoft and partners to the Power Platform will be disabled by default for customers operating in the following US government clouds: GCC High and DoD. Administrators will be able to review these new connectors before explicitly authorizing their use across the organization. Connectors that have been published before September 30, 2021, will remain enabled by default, but admins can leverage the new tenant-level setting to disable them.

> [!NOTE]
> Custom connectors are excluded from this new configuration setting.

When new connectors are introduced to the Power Platform, they can be used immediately by all makers. This requires admins to constantly monitor the connector ecosystem and reactively update the organization's Data Loss Prevention (DLP) policies to prevent makers from inadvertently exfiltrating data. Such occurrences must be avoided in US government clouds where strict Federal compliance is mandated. Administrators can now rely on this safeguard mechanism in GCC High and DoD to better control the use of connectors.

> [!NOTE]
> When a connector is disabled in this new tenant-level setting, the admins can still classify and configure the connector in the DLP policies, but its use will be blocked in Power Apps and Power Automate either when creating an app/flow or when executing an app/flow.

## Availability

This feature is exclusively available in GCC High and DoD for all customers. Sign-up is not required.

## Workflow

### Step one: View the new connector

1. Select the **Data policies** tab where all DLP policies are located.

2. Select **Enable connectors** in the toolbar.

3. New connectors (those that have not been reviewed) have the status "Mark as reviewed".

4. Connectors that have already been reviewed and authorized have the status "Reviewed".

![Slide1](https://user-images.githubusercontent.com/90638770/136602763-ff86a4d7-73bf-42bb-a465-cf64294f1c99.PNG)

### Step two: Enable or disable the new connector

1. If you want to keep the connector disabled, select **Mark as reviewed**.

2. If you want to enable the connector, select the **Enable** toggle.

3. In both cases, the status is changed to "Reviewing".

4. Select **Save**. The status of the connector is now set to "Reviewed".

![Slide2](https://user-images.githubusercontent.com/90638770/136602779-b4cf642b-51b9-43f0-b64c-ef90185e2bac.PNG)

### Step three: View a disabled connector in a DLP policy

1. Select a data policy in the **Data policies** page.

2. Consult the **Prebuilt connectors** tab. Connectors that are disabled have the status "Disabled".

![Slide3](https://user-images.githubusercontent.com/90638770/136602796-430642ef-5842-4837-8b7f-166c9026f43d.PNG)

### Step four: Attempt to add a disabled connector in a Power App

1. Open any Power App.

2. Add a connector that has been disabled. An error message appears.

![Slide4](https://user-images.githubusercontent.com/90638770/136602820-caed9536-52a5-4930-add4-945647a08641.PNG)

   > [!NOTE]
   > This new tenant-level setting is also enforced on existing apps/flows that were built using connectors that are now disabled.

## PowerShell support

The connector blocking policy has the following structure. The **connectorSettings** object is an array containing each connector with its behavior and whether its been reviewed.

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

Retrieve the existing connector blocking policy for the tenant
```powershell
`Get-PowerAppDlpConnectorBlockingPolicies` 
``` 

Example: 
```powershell
`Get-PowerAppDlpConnectorBlockingPolicies -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531” 
```

The above cmdlet outputs the connectors that are blocked/allowed for the evaluation and the policyId. 

**Create a new connector blocking policy for the tenant**

```powershell
`New-PowerAppDlpConnectorBlockingPolicy –TenantId “8dfd3b6e-2fd1-42ac-a874-b1edc2db1531” -ConnectorBlockingDefinition $connectorBlockingDefinition
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
`Set-PowerAppDlpConnectorBlockingPolicy -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531” -PolicyId “235d9cd9-edb1-4fe4-9a5a-e6eb2ba4ed80” -ConnectorBlockingDefinition $connectorBlockingDefinition` 
```

**Fetch the connector blocking policy using the policyId**

```powershell
`Get-PowerAppDlpConnectorBlockingPolicy -TenantId “8dfd3b6e-2fd1-42aC-a874-b1edc2db1531” -PolicyId “235d9cd9-edb1-4fe4-9a5a-e6eb2ba4ed80” ` 
```




[!INCLUDE[footer-include](../includes/footer-banner.md)]