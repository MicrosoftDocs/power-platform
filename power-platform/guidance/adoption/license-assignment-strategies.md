---
title: "License assignment strategies | MicrosoftDocs"
description: "Guidance for license assignment."
author: stjeffer
ms.topic: concept-article
ms.date: 06/20/2023
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: sericks
---

# License assignment strategies

Premium licensing provides advanced features, greater flexibility, scalability, and enhanced security and compliance features for organizations.

Establishing a license assignment strategy is important for:

- **Return on investment**: Assigning any licenses that your organization has purchased ensures that users have access to the advanced features of Power Platform.
- **User adoption**: By assigning the right licenses to the right users, organizations can ensure that users have access to the tools they need to do their jobs effectively.
- **Governance**: Helps to ensure that Power Platform is being used in accordance with governance policies.
- **Optimizing costs**: One of the main reasons to develop a license assignment strategy is to optimize costs.

> [!IMPORTANT]
> This document describes common license assignment strategies for:
>
> - **Power Apps per user license**
> - **Power Automate per user license**
>
> The guidance does not apply to:
>
> - Power Apps per app licenses
> - Pay-as-you-go
> - Power Pages
> - Microsoft Copilot Studio
> - Add-ons such as AI Builder

## Common license assignment strategies

The following are the most common license assignment strategies.

| Approach | Description | Pro | Con | License |
|----------|-------------|-----|-----|---------|
| Assigning licenses manually | This approach is the most straightforward method, but it's labor intensive. | This approach works well in smaller organizations with limited number of users. | This approach can be time consuming. There's a higher risk of human error, and it can overwhelm administrators. License assignment also needs to keep pace with new apps and sharing to ensure all users have access. | Power Apps per user & Power Automate per user |
| Bulk license assignment | For larger organizations, it may be more efficient to assign in bulk. | This method allows administrators to quickly assign licenses to multiple users at once, which can save time and reduce the risk of error. | Depending on the approach taken, this can require expertise and can be difficult to customize or maintain for more complex licensing scenarios.  | Power Apps per user & Power Automate per user |
| Group-based licensing | With group-based licensing, administrators can assign licenses to groups of users based on their roles or responsibilities within the organization. | This method allows for more granular control over license assignment, and can simplify the process of adding or removing licenses as users' roles change. | This approach requires careful planning to ensure that licenses are assigned appropriately. There's also more limited control over assignment when compared with manual assignment. | Power Apps per user & Power Automate per user |
| By request (and approval) | With this approach, licenses are assigned to individuals or groups only upon request. Usually some form of business justification is required and must be approved by line managers or licensing authority within an organization. | This approach can help with more efficient use of licenses without the need for reassigning. | This approach can be time-consuming and may require additional resources. | Power Apps per user & Power Automate per user |
| On-demand | On-demand licensing is a model that allows organizations to assign licenses to users as needed, rather that assigning licenses to specific users in advance. | This approach is cost effective and flexible. It helps organizations to optimize their license usage and reduce unnecessary costs. | On-demand licensing can limit the organization's control over license assignment. | Power Apps per user & Power Automate per user |

### Assigning licenses manually

Assigning licenses manually is the most straightforward method of assigning licenses where your administrator assigns licenses to individual users. This works well with smaller organizations. However, it can be time consuming, and there's a higher risk of human error or delays causing the organization to not be able to use the apps or resources it needs.

Licenses are assigned in the following ways:

- The [Licenses](/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide#use-the-licenses-page-to-assign-licenses-to-users&preserve-view=true) page in the Microsoft 365 admin portal.
- The [Active users](/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide#use-the-active-users-page-to-assign-licenses&preserve-view=true) page in the Microsoft 365 admin portal.
- [PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell?view=o365-worldwide&preserve-view=true) scripts.

### Bulk user assignments in the Microsoft 365 admin portal

Bulk licensing commonly occurs in the following scenarios:

- **New employee onboarding**: When a company hires a large number of new employees at one time, it may be necessary to assign licenses in bulk.
- **Department or team changes or project initiation**: When a department or team changes or when a new project initiates, it may be necessary to assign licenses to accommodate new users.

#### Assign licenses to user accounts with PowerShell

You can assign licenses to multiple user accounts using the Microsoft Graph PowerShell SDK to assign licenses from a CSV file.

```powershell
# Connect to Microsoft 365 tenant.
Connect-MgGraph -Scopes User.ReadWrite.All, Organization.Read.All

# Get the Power Apps per user license object.
$pAppsPerUser = Get-MgSubscribedSku | Where-Object {$_.SkuPartNumber -eq "POWERAPPS_PER_USER"}

# Import list of users and assign license to each.
$usersToAssign = Import-Csv "C:\UserImport\userEmail.csv" -Encoding ASCII

# Assign Power Apps per user license
foreach ($user in $usersToAssign) {
    $userCurrent = Get-MgUser -UserId $user.UserEmail
    Set-MgUserLicense -UserId $userCurrent.Mail -AddLicenses @{SkuId = $pAppsPerUser.SkuId} -RemoveLicenses @()  
    Write-Host $userCurrent
}
```

Learn more about the Microsoft Graph SDK:

- [Install the Microsoft Graph SDK](/powershell/microsoftgraph/installation?view=graph-powershell-1.0&preserve-view=true)
- [Assigning licenses using the Microsoft Graph SDK](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell?view=o365-worldwide#use-the-microsoft-graph-powershell-sdk&preserve-view=true)

### Group-based licensing

[Group-based licensing](/azure/active-directory/enterprise-users/licensing-groups-assign) is most useful for administrators who need to assign licenses to groups of users based on roles or responsibilities within the organization. For example, suppose an administrator is required to assign Power Apps per-user licenses to all users within the human resources department. Group-based licensing allows for more granular control over license assignment and simplifies the process of adding or removing licenses as users and their roles change. It requires careful planning to ensure that licenses are assigned appropriately.

Learn more about group-based licensing:

- [Assign licenses to users by group membership in Microsoft Entra ID](/azure/active-directory/enterprise-users/licensing-groups-assign)

### By request using access packages

Commonly used in enterprise environments, access packages are a collection of permissions and privileges assigned to a group of users. They simplify the process of managing user access to various resources. In the context of Power Platform, this could represent access to environments, apps, and other solutions.

Learn more about access packages:

- [Power CAT architecture series](https://youtu.be/qd8o154HlUY)
- [Create an access package](/azure/active-directory/governance/entitlement-management-access-package-create)

### On-demand

#### Licensing auto-claim for Power Apps

The license auto-claim feature for Power Apps simplifies license assignment for administrators. The feature enables their Power Apps users to automatically claim Power Apps per user licenses when they're needed, instead of requiring an administrator to identify users who need licenses in advance. For example, when a user without a standalone license opens an app that requires a premium license, the user will automatically be assigned a Power Apps per-user license.

Administrators can create an _auto-claim policy_ for Power Apps per-user licenses in the Microsoft 365 admin center, just like they can for other Microsoft licenses.

Learn more about on-demand license assignment:

- [Licensing auto-claim for Power Apps](/power-platform/release-plan/2023wave1/power-platform-governance-administration/license-autoclaim-power-apps-licenses)
- [Auto-claim policies](/microsoft-365/commerce/licenses/manage-auto-claim-policies)

#### Request a license

Power Apps users can request a license, which streamlines the process of assigning licenses for both users and administrators. Whenever a user tries to use Power Apps without a license, they can easily request one directly from the product.

Administrators can approve or reject numerous requests simultaneously, and add a personalized message for their users.

Administrators also have the option to use their organization's request process for custom licenses, and adjust the relevant settings in the Microsoft 365 admin center.

Learn more about requesting a license:

- [Request a license (blog)](https://powerapps.microsoft.com/blog/powerapps-request-license/)
- [Manage self-service license requests](/microsoft-365/commerce/licenses/manage-license-requests?view=o365-worldwide&preserve-view=true)
- [Request a Power Apps premium license](/power-apps/user/request-license)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
