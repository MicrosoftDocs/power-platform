---
title: Custom connector parity
description: About allowing makers to create and share custom connectors.
ms.topic: concept-article
ms.date: 9/2/2025
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
  - sericks007
  - syalandur24
ms.contributors:
  - miferlan
  - mihaelab
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Data policies for custom connectors

Power Platform allows makers to create and share [custom connectors](/connectors/custom-connectors/). You can manage custom connectors for tenant and environment-level data policies. Specifically:

- Environment admins can use the Power Platform admin center to classify individual, custom connectors by name for environment-level data policies.

- Tenant admins can use the Power Platform admin center and PowerShell to classify custom connector by their Host URL endpoints using a pattern matching construct for tenant-level data policies.

> [!NOTE]
> **Data policies for custom connectors** is now generally available.

## Custom connector classification

### Environment-level data policies

Environment admins can find all the custom connectors in their environments, alongside prebuilt connectors, on the **Connectors** page in **Data Policies**. Similar to prebuilt connectors, you can classify custom connectors into **Blocked**, **Business**, or **Non-Business** categories. Custom connectors that aren't explicitly classified are put under the default group (or **Non-Business**, if no default group setting is explicitly chosen by admins).

:::image type="content" source="media/policy-environment-level-connector.png" alt-text="Environment admins can see all custom connectors in their environments, alongside prebuilt connectors, on the **Connectors** page in data policies.":::

You can use data policy, PowerShell commands to set custom connectors into **Business**, **Non-Business**, and **Blocked** groups. More information: [Data policy commands](powerapps-powershell.md#data-policy-commands)

### Tenant-level data policies

The Power Platform admin center has support for tenant admins to classify custom connectors by their Host URL endpoints by using a pattern-matching construct for tenant-level data policies. Because the scope of custom connectors is environment-specific, these connectors don't show up on the **Connectors** page for you to classify. Instead, you see a new page in **Data Policies** named **Custom connectors**, which you can use to specify an ordered list of **Allow** and **Deny** URL patterns for custom connectors.  

The rule for the wildcard character (*) is that it's always the last entry in the list, which applies to all custom connectors. Admins can tag the `*` pattern to **Blocked**, **Business**, **Non-business**, or **Ignore**. By default, the pattern is set as **Ignore** for new data policies. 

**Ignore** ignores data policies classification for all connectors in this tenant-level policy, and defers evaluation of a pattern to other environments or tenant-level policies to attribute them into the **Business**, **Non-Business**, or **Blocked** grouping as appropriate. If no specific rule exists for the custom connectors, an **Ignore \*** rule allows custom connectors to be used with both **Business** and **Non-Business** connector groupings. Except for the last entry in the list, **Ignore** as an action isn't supported for any other URL pattern added to the custom connector pattern rules.

:::image type="content" source="media/policy-tenant-level-connector-ignore-rule.png" alt-text="The Ignore rule in a list of rules.":::

You can further add new rules by selecting **Add connector pattern** on the **Custom Connectors** page.  

:::image type="content" source="media/policy-select-add-connector-pattern.png" alt-text="Select Add connector pattern.":::

This opens a side panel where you can add custom connector URL patterns and classify them. New rules are added to the end of the pattern list (as the second-to-the-last rule, because `*` is always the last entry in the list). However, you can update the order while adding a new pattern.

:::image type="content" source="media/dlp-add-custom-connector-url-patterns.png" alt-text="Add custom connector URL patterns and classify them.":::

You can also update the order of the patterns by using the **Order** dropdown list or selecting **Move up** or **Move down**.

:::image type="content" source="media/policy-update-pattern-order.png" alt-text="Update the order of the patterns by using the Order dropdown list or Move up and Move down.":::

After a pattern has been added, you can edit or delete these patterns by selecting a specific row and selecting **Edit** or **Delete**.

:::image type="content" source="media/policy-edit-delete-pattern.png" alt-text="Edit or delete custom patterns.":::

## Powershell support for Custom Connector URL Patterns

The object that contains custom connector URL pattern rules for a policy has the following structure: 

```powershell
$UrlPatterns = @{ 
  rules = @(
    @{  
      order # integer (starting at 1)
      customConnectorRuleClassification # supported values: General | Confidential | Blocked | Ignore
      pattern # string
    } 
  )
} 
```

> [!NOTE]
> In the following cmdlets, *PolicyName* refers to the unique GUID. You can retrieve the data policies GUID by running the **Get-DlpPolicy** cmdlet.

### Retrieve existing custom connector URL patterns for a policy
```powershell
Get-PowerAppPolicyUrlPatterns -TenantId -PolicyName
```

### Create custom connector URL patterns for a policy
```powershell
New-PowerAppPolicyUrlPatterns -TenantId -PolicyName -NewUrlPatterns
```

### Remove custom connector URL patterns from a policy
```powershell
Remove-PowerAppPolicyUrlPatterns -TenantId -PolicyName
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

## Known limitations
- The use of custom connectors isn't enforced by data policies in apps that were last published before October 2020.
- When an environment admin creates or updates an environment-level data policy, they can only view custom connectors for which they're an owner or that have been shared with them.
- If a custom connector has been added by name to a tenant-level policy (by using PowerShell cmdlets), the custom connector URL pattern rules is superseded by the existing classification for the connector by name. Use the Remove-DlpPolicy cmdlet to remove the custom connectors from the policy for these rules to take effect. We recommend that tenant-level policies only use custom connector host URL patterns. Don't manage custom connectors by name in tenant-level policies because individual custom connector scope is limited to the environment boundary and a custom connector's name has no significance at the tenant level.
