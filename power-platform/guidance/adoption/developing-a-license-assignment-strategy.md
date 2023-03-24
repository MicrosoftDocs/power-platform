---
title: "License assignment strategies  - Microsoft Power Platform | MicrosoftDocs"
description: "Guidance for license assignment."
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Introduction to license assignment

Premium licensing provides advanced features, greater flexibility, scalability, and enhanced security and compliance features for organizations.

Establishing a license assignment strategy is therefore important to:

- Getting a return on investment: by assigning any licenses that your organization has purchased ensures that users have access to the advanced features of the Power Platform.
- User adoption: By assigning the right licenses to the right users, organizations can ensure that users have access to the tools they need to do their jobs effectively.
- Governance: Helping to ensure that the Power Platform is being used in accordance with their governance policies
- Optimizing costs: One of the main reasons to develop a license assignment strategy is to optimize costs.

## Common license assignment strategies

The following are the most common license assignment strategies

| Approach | Description | Pro | Con |
|----------|-------------|-----|-----|
| Assigning licenses manually | The most straightforward method but labor intensive, where an administrator assigns licenses to individual users. | Works well in smaller organizations with limited number of users | This approach can be time consuming, there is a higher risk of human error and can overwhelm administrators. License assignment also needs to keep pace with new apps and sharing to ensure all users have access. |
| Bulk license assignment | For larger organizations, it may be more efficient to assign in bulk. | This method allows administrators to quickly assign licenses to multiple users at once, which can save time and reduce the risk of error. | Depending on the approach taken, this can require expertise and can be difficult to customize or maintain for more complex licensing scenarios  |
| Group-based licensing | With group-based licensing, administrators can assign licenses to groups of users based on their roles or responsibilities within the organization. | This method allows for more granular control over license assignment, and can simplify the process of adding or removing licenses as users' roles change. | Requires careful planning to ensure that licenses are assigned appropriately. There is also more limited control over assignment when compared with manual assignment. |
| By request (and approval) | Where licenses are assigned to individuals, or groups only upon request. Usually some form of business justification is required and must be approved by line managers or licensing authority within an organization. |
| On-demand | On-demand licensing is a model that allows organizations to assign licenses to users as needed, rather that assigning licenses to specific users in advance. | Cost effective and flexible, it helps organizations to optimize their license usage and reduce unnecessary costs | Limited control: On-demand licensing can limit the organizations control over license assignment. |

### Assigning licenses manually

This is the most straight-forward method of assigning licenses where your administrator assigns licenses to individual users. This works well with smaller organizations, however it can be time consuming, and there is a higher risk of human error, or delays causing the organization to not be able to use the apps or resources it needs.

Licenses are assigned either through the M365 admin portals [Licenses](/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide#use-the-licenses-page-to-assign-licenses-to-users) page, the [Active users](/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide#use-the-active-users-page-to-assign-licenses) page, or through [PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell?view=o365-worldwide) scripts.

### Bulk user assignment

Bulk licensing commonly occurs in the following scenarios:

- _New employee onboarding_: Where a company hires a large number of new employees at once, it may be necessary to assign license in bulk.
- _Departmental or team changes, project initiation_: When a department or team change (grows or changes), or a new project initiates, it may be necessary to assign licenses to accommodate new users.

#### Assign licenses to user accounts via PowerShell

Assign licenses to multiple user accounts, using the Microsoft Graph PowerShell SDK to assign licenses from a CSV file:

```powershell
# Connect to Microsoft 365 tenant.
Connect-MgGraph -Scopes User.ReadWrite.All, Organization.Read.All

# Get the Power Apps per user license object.
$pAppsPerUser = Get-MgSubscribedSku | Where-Object {$_.SkuPartNumber -eq "POWERAPPS_PER_USER"}

# Import list of users and assign license to each.
$usersToAssign = Import-Csv "C:\UserImport\userEmail.csv" -Encoding ASCII

# Assign Power Apps Per User license
foreach ($user in $usersToAssign) {
    $userCurrent = Get-MgUser -UserId $user.UserEmail
    Set-MgUserLicense -UserId $userCurrent.Mail -AddLicenses @{SkuId = $pAppsPerUser.SkuId} -RemoveLicenses @()  
    Write-Host $userCurrent
}
```
Learn more about the Microsoft Graph SDK:

- [Install the Microsoft Graph SDK](/powershell/microsoftgraph/installation?view=graph-powershell-1.0)
- [Assigning licenses using the Microsoft Graph SDK](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell?view=o365-worldwide#use-the-microsoft-graph-powershell-sdk)

### Group based licensing

[Group based licensing](/azure/active-directory/enterprise-users/licensing-groups-assign) is most useful for administrators that need to assign licenses to groups of users based on roles or responsibilities within the organization. For example, the administrators is required to assign Power Apps Per User licenses to all users within the HR department.  This method allows for more granular control over license assignment and simplifies the process of adding or removing licenses as users and their roles change. It requires careful planning to ensure that licenses are assigned appropriately.

![Screenshot of admin portal page](/azure/active-directory/enterprise-users/media/licensing-groups-assign/licenses-all-products-assign.png)

Learn more about group based licensing:

- [Assign licenses to users by group membership in Azure Active Directory](/azure/active-directory/enterprise-users/licensing-groups-assign)

### By request using access packages

Commonly used in enterprise environments, _access packages_ are a collection of permissions and privileges assigned to a group of users.  They simplify the process of managing user access to various resources. In the context of Microsoft Power Platform this could represent access to environments, apps and other solutions.

Learn more about access packages:

- [Power CAT architecture series](https://youtu.be/qd8o154HlUY)
- [Create an access package](/azure/active-directory/governance/entitlement-management-access-package-create)

### On demand

_Licensing auto-claim for Power Apps_ simplifies license assignment for administrators.  The feature enables their Power Apps users to automatically claim Power Apps per user licenses when they're needed instead of requiring an administrator to identify users who need licenses in advance. For example, when a user without a standalone license opens an app that requires a premium license, the user will automatically be assigned a Power Apps per user license.

Administrators can create an _auto-claim policy_ for Power Apps per user licenses in the Microsoft 365 admin center just like they can for other Microsoft licenses.

Learn more about on demand license assignment

- [Licensing auto-claim for Power Apps](/power-platform/release-plan/2023wave1/power-platform-governance-administration/license-autoclaim-power-apps-licenses)
- [Auto-claim policies](/microsoft-365/commerce/licenses/manage-auto-claim-policies)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]