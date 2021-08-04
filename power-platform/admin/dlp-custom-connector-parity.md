---
title: "Custom connector parity | MicrosoftDocs"
description: About allowing makers to create and share custom connectors.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Custom connector parity

Power Platform allows makers to create and share [custom connectors](/connectors/custom-connectors/). You can manage custom connectors for tenant and environment level DLP policies. Specifically:

1.	Environment admins can use the Power Platform Admin Center UI to classify individual custom connectors by name for environment level DLP policies.
2.	Tenant admins can use Power Platform Admin Center UI and PowerShell to classify custom connector by their Host URL endpoints using a pattern matching construct for tenant level DLP policies.

## User interface

### Environment-level DLP policies

Environment admins can now see all custom connectors in their environments alongside of pre-built connectors in the Connectors tab of the Data Policies wizard. Similar to pre-built connectors, admins can classify custom connectors into Blocked/Business/Non-Business categories. Custom connectors that are not explicitly classified will be put under the default group (or ‘Non-business’ if no default group setting is chosen by admins explicitly).

:::image type="content" source="media/dlp-environment-level-policy.png" alt-text="Environment-level DLP policies":::

### Tenant-level DLP policies

Tenant admins will see a new tab in the Data Policies wizard called ‘Custom connectors’, which will allow them to specify an ordered list of Allow and Deny URL patterns for custom connectors. 

The rule for ‘*’ will always be the last entry in the list which applies to all custom connectors. 

Admins can tag the ‘*’ pattern to ‘Blocked’/’Business’/’Non-business’/’Ignore’. By default, the pattern is set up as ‘Ignore’ for new DLP policies.

‘Ignore’ essentially means ignore DLP classification for all connectors in this tenant level policy and defer evaluation of a pattern to other environment or tenant-level policies to attribute them into ‘business’/’non-business’/’blocked’ grouping as appropriate. If no specific rule exists for the custom connectors, then an “Ignore *” rule will allow custom connectors to be used with both business and non-business connector groupings. ‘Ignore’ as an action is not supported for any other URL pattern added to the custom connector pattern rules except the last entry in the list.

:::image type="content" source="media/dlp-tenant-level-policy.png" alt-text="Tenant-level DLP policies.":::

Admins can further add new rules by using the ‘Add connector pattern’ on the Custom Connectors tab. 

:::image type="content" source="media/dlp-add-connector-pattern.png" alt-text="Use Add connector pattern to add new DLP rules":::

This would launch a side panel where admins can add custom connector URL patterns and classify them. New rules are added to the end of the pattern list (second last to be more specific since ‘*’ will always be the last entry in the list). However, admins can update the order while adding a new pattern.

:::image type="content" source="media/dlp-new-pattern.png" alt-text="New pattern dialog to add customer connector URL patterns.":::

Admins can also update the order of the patterns by using the order dropdown or **Move up** and **Move down** buttons.

:::image type="content" source="media/dlp-order-patterns.png" alt-text="Update the order of the DLP patterns.":::

Once a pattern has been added, admins can edit or delete these patterns by clicking on a specific row and using the ‘Edit’ or ‘Delete’ button.

:::image type="content" source="media/dlp-edit-pattern.png" alt-text="Edit a DLP pattern.":::

## Powershell support for Custom Connector URL Patterns

The object that contains custom connector URL pattern rules for a policy has the following structure: 

```powershell
$UrlPatterns = @{ 
  rules = @(
    @{  
      order # integer (starting at 1)
      customConnectorRuleClassification $ supported values: General | Confidential | Blocked | Ignore
      pattern # string
    } 
  )
} 
```

### Retrieve existing custom connector URL patterns for a policy
```powershell
Get-PowerAppPolicyUrlPatterns -TenantId -PolicyName
```

### Create custom connector URL patterns for a policy
```powershell
New-PowerAppPolicyUrlPatterns -TenantId -PolicyName -NewUrlPatterns
```

**Example**

Goal:
- Classify https://www.mycompany.com as Business
- Classify https://www.bing.com as Non-business
- Block all other URLs

```powershell
$UrlPatterns = @{
  rules = @(
    @{  
      order = 1
      customConnectorRuleClassification = “Confidential”
      pattern = “https://www.mycompany.com*”
    },
    @{  
      order = 2
      customConnectorRuleClassification = “General”
      pattern = “https://www.bing.com*”
    },
    @{  
      order = 3
      customConnectorRuleClassification = “Blocked”
      pattern = “*”
    }
  )
}
New-PowerAppPolicyUrlPatterns -TenantId $TenantId -PolicyName $PolicyId -NewUrlPatterns $UrlPatterns
```






