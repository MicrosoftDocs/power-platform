---
title: Auto-claim policies for Power Apps licenses
description: Learn how to assign Power Apps licenses through auto-claim policies.
author: amiyapatr-zz
ms.date: 02/21/2025
ms.reviewer: sericks
ms.topic: concept-article
ms.subservice: admin
ms.author: ampatra
search.audienceType: 
 - admin
ms.custom:
  - bap-template
  - sfi-ga-nochange
---

# Auto-claim policies for Power Apps licenses

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

As an administrator, you traditionally assign licenses to users _manually_. [Auto-claim for Power Apps licenses](/microsoft-365/commerce/licenses/manage-auto-claim-policies?view=o365-worldwide&WT.mc_id=365AdminCSH_inproduct#auto-claim-policies-for-microsoft-power-apps&preserve-view=true) enables administrators to easily establish policies within the Microsoft 365 admin center, much like they can for other Microsoft products and services. Once a policy is configured, any user in the organization who requires an individual Power Apps license is automatically granted one under the following circumstances:

- If a user lacks a standalone Power Apps license and launches an app that demands a premium license, the system automatically assigns a Power Apps per user license to that user.
- If a user without a standalone Power Apps license launches an app within a Managed Environment, the user is automatically granted a Power Apps per user license.

You can create and manage these auto-claim policies in the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339).

## Create an auto-claim policy for Power Apps licenses

Use the following information to establish an auto-claim policy for Power Apps.

For more information on managing auto-claim policies in the Microsoft 365 admin center, go to [Manage auto-claim policies in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-auto-claim-policies?view=o365-worldwide&preserve-view=true).

### Who can create and manage auto-claim policies?
To create and manage auto-claim policies, you must have global admin privileges. For more information, go to [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true).

### Turn on the auto-claim policy feature
Before you can create an auto-claim policy, you must first turn on the feature in the Microsoft 365 admin center.  

1.	Go to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339).
2.	In the **Navigation menu**, select **Billing** > **Licenses**.
3.	Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
4.	Click the **Turn on setting** button.

After you turn on the feature, you can create an auto-claim policy.

### Create an auto-claim policy for Power Apps
The [auto-claim policy](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab displays the policies that you created. You can view the policy's name, the associated app, the assigned product, the available licenses, and the policy's status. 

To create a new policy, complete the following steps.

1.	In the Microsoft 365 admin center, click **Billing** > **Licenses**.
2.	Click the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
3.	Click **Add a policy**.
4.	On the **Name this auto-claim policy** page, enter a name for the policy and click **Next**.
5.	On the **Set an auto-claim app and product** page, select **Power Apps Per User Plan** in the dropdown list. You can assign the product license on a per user basis or select the **Add user to a security group** option and choose the appropriate group.
6.	On the **Select apps** page, select or clear the checkboxes for the apps to include or exclude with the license.	Click **Next**.
8.	On the **Review and finish** page, verify the new policy information, make any necessary changes, and click **Create policy**.

## Auto-claim policy enabled by default 
To simplify license management for administrators, in tenants with Managed Environments, auto-claim policies don't require manual activation by admins. Auto-claim policies are automatically created. Starting in December 2023, a license auto-claim policy for Power Apps per-user licenses, titled **Auto-Created Policy for Power Apps**, is generated in the Microsoft 365 admin center for tenants with Managed Environments. Under this policy, if a user without a Power Apps per user license launches an app in a Managed Environment, the user automatically receives a Power Apps per user license if one is available in your tenant.

By default, this policy is applied when users open Power Apps in Managed Environments. Administrators can choose to extend this policy to cover Power Apps opened in standard environments, as well, through a setting in the Power Platform admin center.

Starting February 2024, tenants that have a new Power Apps premium license automatically have the auto-created policy for Power Apps set up in the Microsoft 365 admin center. The auto-created policy ensures that any user that doesn't have a license and launches a Power Apps that requires a premium license, is automatically granted a Power Apps premium license from the tenant's available licenses. This process facilitates smoother access and makes managing licenses more straightforward. By default, this policy is applied across all environments.

### Can administrators update the policy?
Yes, administrators can manage the policy in the Microsoft 365 admin center just like any other auto-claim policy. Administrators can disable the policy, delete it, and view reports on which users were assigned licenses.

In the Power Platform admin center, administrators can decide whether the policy should apply to Managed Environments only or all environments.

1.	In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), go to **Settings** and click the **Auto-claim policies** option.
2.	In the **Auto-claim policies** pane, select whether the policy should be applicable to **All Environments** or **Only Managed Environments**.

### Support for group-based license assignment

Instead of assigning licenses directly to individual users when they launch Power Apps, administrators can configure policies to add users to predefined groups for license assignment. 

When creating an auto-claim policy, during the **Set an auto-claim app and product** step&mdash;in the [Create an auto-claim policy for Power Apps](#create-an-auto-claim-policy-for-power-apps) procedure&mdash;admins can assign a product license on a per user basis or choose the **Add user to a security group** option and select the appropriate group. This option is currently used for Power Apps and Power Automate. 

> [!Note]
> Assigning licenses by security group can take up to 24 hours for licenses to be assigned. 

If your organization already has an existing process for license assignment, administrators can still make use of the auto-claim policy while maintaining their current workflow. 

Administrators can review the list of users to whom licenses were assigned through the auto-claim policy in the Microsoft 365 admin center. Then, they can make changes, as needed, such as unassigning auto-claim-assigned licenses and moving users to designated groups to use Microsoft Entra group-based licensing. For more information about group based licensing, go to [Group-based licensing additional scenarios](/entra/identity/users/licensing-group-advanced).

Here are some commands that can help unassigning licenses and adding users to the required Microsoft Entra group.

```PowerShell
##
#Install and import AzureAD PowerShell module prior to running these commands
##
##You may be able to get a list of users, that have been auto-assigned a 
##license directly, via Microsoft Admin Center. Follow instructions at 
##https://learn.microsoft.com/en-us/microsoft-365/commerce/licenses/manage-auto-claim-policies?view=o365-worldwide#view-an-auto-claim-policy-report
##
##Once you have a list of users, you can use the following commands to remove 
##the direct license assignment and add the user to a licensed group, or 
##you may tweak the script to iterate through a list of users and 
##perform this in bulk
##
##Please note that adding a user to a licensed group may not result in an 
##immediate license assignment. Refer to https://learn.microsoft.com/en-us/entra/identity/users/licensing-group-advanced for more information
#############################################>

$Credential = Get-Credential

# Connect to Azure AD
Connect-AzureAD -Credential $Credential

#The user that will get a group based license
$LicensedUser = Get-AzureADUser -SearchString "<UPN, display name or object ID of the user for which you want to assign a license>"

#The group that has the license assigned
$LicensedGroup = Get-AzureADGroup -SearchString "<Object ID or name of the group that has a relevant license assigned>"

#SKU part number of the sku that needs to be unassigned (Power Apps Premium)
$SkuPartName = "POWERAPPS_PER_USER"

#Get the SkuID of the license that needs to be unassigned from the user
$LicenseSku = Get-AzureADSubscribedSku | Where-Object {$_.SkuPartNumber -eq $SkuPartName}

#Create the AssignedLicenses Object, used for removing direct license assignment from the user
$LicensesToRemove = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$LicensesToRemove.RemoveLicenses = $LicenseSku.SkuId

#Remove directly assigned license from the user
#Note that this command will result in an error if the user does not have the relevant license assigned directly
Set-AzureADUserLicense -ObjectId $LicensedUser.ObjectId -AssignedLicenses $LicensesToRemove

#Add user to a licensed group
Add-AzureADGroupMember -ObjectId $LicensedGroup.ObjectId -RefObjectId $LicensedUser.ObjectId

```



