---
title: "Plan and manage license and capacity allocations - Microsoft Power Platform | MicrosoftDocs"
description: "Find answers to questions around how to plan licensing and capacity for your organization's or team's applications or processes."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Plan and manage license and capacity allocations

[!INCLUDE[cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

Do you have questions about how to plan licensing and capacity for your organization's or team's applications or processes? Watch the following session to learn about the current and incoming capabilities of the platform and how you can take advantage and choose the right plans for your organization.
>
> [!VIDEO https://medius.studios.ms/video/asset/HIGHMP4/IG19-BRK2223]
>
Full Power Apps and Power Automate capabilities are licensed on a standalone basis. Additionally, limited Power Apps and Power Automate capabilities are included within various Office 365 and Dynamics 365 licenses—that means users with those licenses already have access to Power Apps and Power Automate. The [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=2085130) provides more details.

As an administrator, you aren't required to have a standalone Power Apps or Power Automate license to manage environments.

Some questions to consider as you plan your per-app or per-user capacity:

- Is a per-user or per-app license more cost effective?
- What add-on capacity do I need? For example, Portal Page Views, AI Builder credits.
- How much storage capacity do I need? Such as for database, files, and logs.

Review capacity entitlements and usage from the [Power Platform admin center](https://aka.ms/ppac).

## Self-service purchase

Microsoft launched [self-service purchase](https://docs.microsoft.com/microsoft-365/commerce/subscriptions/self-service-purchase-faq) for Microsoft Power Platform (Power BI, Power Apps, and Power Automate). This capability currently isn't available to government, non-profit, or education tenants in the United States.

Customers can make a self-service purchase online from the Microsoft Power BI, Power Apps, and Power Automate websites. Customers will first be asked to enter an email address to ensure they are a user in an existing Azure Active Directory (Azure AD) tenant. Then they'll be directed to log in by using their Azure AD credentials. After signing in, the customer will be asked to select how many subscriptions they want to purchase and provide credit card payment. When the purchase is complete, they'll be able to start using their subscription. The purchaser will also be able to access a limited view of the Microsoft 365 admin center where they can enable other people in their organization to use the product.

Admins are provided with a way to turn off self-service purchasing on a per product basis via the [MSCommerce PowerShell module](https://docs.microsoft.com/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell). Here's an example script to disable self-service purchase for Power Automate:

```powershell
Import-Module -Name MSCommerce
Connect-MSCommerce #sign-in with your global or billing administrator account
when prompted
$product = Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase |
where {$_.ProductName -match 'Power Automate'}
Update-MSCommerceProductPolicy -Policy
```

More details can be found in the [self-service purchasing FAQ](https://docs.microsoft.com/microsoft-365/commerce/subscriptions/self-service-purchase-faq).

## API capacity

Another key licensing concept to be aware of is the request limits and allocation. On a daily per user basis, API usage is tracked across Power Apps and Power Automate workflows, in addition to direct developer API usage. The usage is expected to stay below the API request allocation that is provided based on the type of usage. The allocation and usage are tracked at the user level and not at the tenant level. The allocations have been designed so that most users will never exceed the limits. You can monitor basic usage metrics in the admin portal and more detailed usage will be provided in the future. Administrators should work with app makers to help them design their solutions to stay within the limits. If usage for a user continuously exceeds the limit, consider an add-on to increase the individual user's limit. For more details about request limits and allocations, see [Microsoft Power Platform limits](https://aka.ms/platformlimits).

## Storage capacity

Microsoft Dataverse capacity (database, file, log, and add-ons) is pooled across the tenant and shared among all environments and workloads. The first subscription of Power Apps or Power Automate provides a one-time default capacity entitlement for the tenant. For example, a Power Apps per-user plan would set the tenant capacity initially as 10 GB of Dataverse database, 20 GB of Dataverse file, and 2 GB of Dataverse log capacity. Each additional licensed user provides an additional per-user capacity grant that increases the overall tenant available capacity. There are also capacity add-ons available to purchase additional database, file, and log capacity.

Every environment can have zero or one Dataverse database, which provides storage for your apps. To create a database, there must be at least 1 GB of Dataverse database capacity remaining. Capacity is also consumed by normal Dataverse storage consumption by storing data, files, and logs.

As an administrator, you can monitor your capacity usage in the admin portal.

![Microsoft Power Platform storage capacity](media/resource-usage2.png "Microsoft Power Platform storage capacity")
