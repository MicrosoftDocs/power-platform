---
title: Connect to Exchange Online
description: Learn what you need to do to get Exchange ready and connect to Exchange Online.
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/27/2025
author: rahulmital 
ms.subservice: admin
ms.custom: NewPPAC
ms.author: rahulmital
ms.contributors:
  - yingchin
  - sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Connect to Exchange Online

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

With both [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] and customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)) hosted as online services, connecting the two is a simpler, more straightforward configuration.  
  
> [!IMPORTANT]
> [!INCLUDE[cc_feature_requires_office_365](../includes/cc-feature-requires-office-365.md)]  

## Get Exchange ready

 To use [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] with customer engagement apps, you must have an [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] subscription that either comes as part of a [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscription or can be subscribed to separately. For information about [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], go to:  
  
- [Exchange Online](/exchange/exchange-online)
- [Exchange Online service description](/office365/servicedescriptions/exchange-online-service-description/exchange-online-service-description)
- [Microsoft 365 and Office 365 service descriptions](/office365/servicedescriptions/office-365-service-descriptions-technet-library)  
  
> [!TIP]
>
> To make sure you've got a good connection to [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], run the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com/). For information about which tests to run, see [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx).
>
> For ports required, see [Network ports for clients and mail flow in Exchange](/exchange/plan-and-deploy/deployment-ref/network-ports?view=exchserver-2019&preserve-view=true).

## Create an email server profile for Exchange Online

Make sure you have the System Administrator security role or equivalent permissions in Microsoft Dynamics 365. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don't have the correct permissions, contact your system administrator.

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Server profiles**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Server profiles**.

---

6. On the command bar, select **New server profile**.
7. For **Email Server Type**, select **Exchange Online**, and then enter a meaningful **Name** for the profile.

:::image type="content" source="media/connect-exchange-online/set-up-server-profile.png" alt-text="Set up the server profile.":::

8. If you want to use this server profile as the default profile for new mailboxes, turn on **Set as default profile for new mailboxes**.

9. For **Authentication Type**, choose one of the following:

    - **Server-to-Server Authentication (Same Tenant)**: Use this option when Exchange resides in the same tenant as Dynamics 365. More information: [Build web applications using server-to-server (S2S) authentication](/powerapps/developer/data-platform/build-web-applications-server-server-s2s-authentication)

    - **Oauth (Cross Tenant)**: Use this option when Exchange resides in a different tenant than Dynamics 365. To get the information for this option, follow the steps in [Exchange Online cross-tenant authentication](connect-exchange-online-server-profile-oauth.md). The **Locations and ports** fields are automatically populated.

10. Expand the **Advanced** section, and then use the tooltips to choose your email processing options.

11. When you're done, select **Save** to apply the changes.

## Verify that you have the profile Microsoft Exchange Online

If you have an [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] subscription in the same tenant as your subscription, customer engagement apps create a default profile named **Microsoft Exchange Online** for the email connection.

To verify you have this profile:  

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Server profiles**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Server profiles**.

---
  
6. Verify that the **Microsoft Exchange Online** profile is in the list. If the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] profile is missing, verify that you have an [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] subscription and that it exists in the same tenant as your subscription.  
  
7. If there are multiple profiles, select the **Microsoft Exchange Online** profile and set it as default.  

## Configure default email processing and synchronization

Set server-side synchronization to be the default configuration method for newly created users.  

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Email settings**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Email settings**.

---

6. Set the **Synchronization methods** columns as follows:  
  
   - **Server Profile**: [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)]  
   - **Incoming Email**: Server-Side Synchronization or Email Router  
   - **Outgoing Email**: Server-Side Synchronization or Email Router  
   - **Appointments, Contacts, and Tasks**: Server-Side Synchronization
  
7. Select **Save** to apply the changes.  
  
All new users have these settings applied to their mailbox.  

## Configure mailboxes

New users have their mailboxes configured automatically with the settings you made in the prior section. For existing users who were added before you made these above settings, you must set the server profile and the delivery method for email, appointments, contacts, and tasks.  
  
In addition to administrator permissions, you must have Read and Write privileges on the Mailbox table to set the delivery method for the mailbox.  
  
#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Mailboxes**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Mailboxes**.

---

6. Select **Active Mailboxes** from the grid view selection list.
7. Select all the mailboxes that you want to associate with the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] profile.
8. Select **Apply Default Email Settings** in the top command bar, verify the settings, then select **OK**.  
  
By default, the mailbox configuration is tested and the mailboxes enabled when you select **OK**.  
  
**To edit mailboxes to set the profile and delivery methods:**
  
#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Mailboxes**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Mailboxes**.

---

6. Select **Active Mailboxes** from the grid view selection list.  
7. Select the mailboxes that you want to configure, then select **Edit** in the top command bar.  
8. Under the **General** tab, set the **Synchronization methods** columns as follows:  
   - **Server Profile**: [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)]  
   - **Incoming Email**: Server-Side Synchronization or Email Router  
   - **Outgoing Email**: Server-Side Synchronization or Email Router
   - **Appointments, Contacts, and Tasks**: Server-Side Synchronization
9. Select **Save** in the command bar to apply your changes.
  
## Approve email  

To approve emails for customer engagement apps, a user requires:

- The **Approve Email Addresses for Users or Queues** privilege.
- The permissions as described in the **Permissions model** table later in this topic.

### Approve your own user mailbox

You can approve your own user mailbox if all of these conditions are met:

- Your User Principal Name (UPN) matches the email address in your mailbox record.

- The OrgDBOrgSetting [RequirePrivilegeToSelfApproveEmailAddress](../admin/OrgDbOrgSettings.md) setting is disabled (default) or you have the [Approve Email Addresses for Users or Queues](connect-exchange-online.md#add-the-approve-email-addresses-for-users-or-queues-privilege) privilege.

- You have a minimum of User-level Write privileges on the Mailbox table.

- The mailbox isn't a queue mailbox.

If **RequirePrivilegeToSelfApproveEmailAddress** is disabled (default) and you don't have the **Approve Email Addresses for Users or Queues** privilege, the **Approve Email** button doesn't appear. However, if you select **Test & Enable Mailbox** and the conditions mentioned are met, the email address in your mailbox is approved as part of the test and enable process.

### Delegate mailbox approval

A user with the Global or Exchange admin role can delegate the mailbox approval process to another user by assigning the **Delegated Mailbox Approver** security role in Dynamics 365. A user with the **Delegated Mailbox Approver** role can approve mailboxes in the environment without being a Global or Exchange admin. As mentioned in the [permission model](connect-exchange-online.md#permissions-model) section, the user also needs to have the **System Administrator** security role. This new role is available in Dynamics 365 online version 9.2.22104.00170 or later.

> [!IMPORTANT]
> You can't assign the **Delegated Mailbox Approver** role unless you have the Global or Exchange admin role. If you try to assign this role but aren't a Global or Exchange admin, you receive an error: "You must be an Office 365 Global Administrator or an Exchange Administrator to assign the Delegated Mailbox Approver role." You may also see the error code 0x80090904.
>
> The **Delegated Mailbox Approver** role isn't currently supported for assigning to a team. If you try to assign this role to a team, you receive an error: "The Delegated Mailbox Approver role can'tbe assigned to a team." You may also see error code 0x80090905 or the message "Failed to add role Delegated Mailbox Approver: CannotAssignDelegatedMailboxApproverRoleToTeam".
>
> Because this is a Dynamics 365 security role, the role is assigned per environment. The role can be assigned to one or more users per environment.

> [!NOTE]
> For more information about assigning security roles in Dynamics 365 or Power Apps, see [Assign a security role to a user](/power-platform/admin/assign-security-roles).
>
> For more information about the Global and Exchange admin roles, see [Commonly used Microsoft 365 admin center roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#commonly-used-microsoft-365-admin-center-roles).

### Require admin approval?

Decide which approach you want your organization to follow for mailbox approval.

:::image type="complex" source="media/approval-flow-chart.png" alt-text="Flowchart for deciding on your mailbox approval approach.":::
   Flowchart with the starting condition "You must be an Office 365 Global admin + Dynamics 365 System admin OR an Exchange admin + Dynamics 365 System admin OR a Dynamics 365 Delegated Mailbox Approver + Dynamics 365 System admin." The first decision point is "Do you want to require mailbox approval?" The "No" path leads to "See 'Remove requirement to approve mailboxes'." The "Yes" path leads to "See Permissions model."
:::image-end:::

### Permissions model

The table describes the permissions required to approve emails.

**Terminology**

- **Yes**: Can approve email
- **No**: Can't approve email
- **n/a**: Not applicable

- **Global admin**: Tenant level administrator role
- **Exchange admin**: Exchange administrator role

> [!NOTE]
> For more information about the Global and Exchange admin roles, see [Commonly used Microsoft 365 admin center roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#commonly-used-microsoft-365-admin-center-roles)

- **Delegated Mailbox Approver**: Dynamics 365 security role that is assigned by a Global admin or Exchange admin. A user with this role can approve mailboxes without being a Global or Exchange admin. For more information, see to the section titled **Delegate mailbox approval**.

> [!NOTE]
> This permissions model is rolling out gradually and becomes available once deployed in your region. Check the version number provided in the table for when the changes are available.

<table>
  <tr>
    <th colspan="2">Security roles /<br />Applications in use</th>
    <th colspan="2">Both roles required:<br />Global admin<br />and <br />System admin</th>
    <th colspan="2">Both roles required:<br />Exchange admin<br />and <br />System admin</th>
    <th colspan="2">Both roles required:<br />Delegated Mailbox Approver<br />and <br />System admin</th>
    <th>System admin</th>
    <th>Service admin</th>
    <th>Exchange admin</th>
    <th>Global admin</th>
  </tr>
  <tr>
    <td rowspan="2">Customer engagement apps</td>
    <td>Exchange Online</td>
    <td colspan="2">Yes</td>
    <td colspan="2">Yes</td>
    <td colspan="2">Yes<sup>1</sup></td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td>Exchange (on-premises)</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td>Yes<sup>2</sup></td>
    <td>No</td>
    <td>n/a</td>
    <td>n/a</td>
  </tr>
  <tr>
  <tr>
    <td rowspan="2">Customer Engagement (on-premises)</td>
    <td>Exchange Online</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td>Yes<sup>2</sup></td>
    <td>n/a</td>
    <td>n/a</td>
    <td>n/a</td>
  </tr>
  <tr>
    <td>Exchange (on-premises)</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td colspan="2">n/a</td>
    <td>Yes<sup>2</sup></td>
    <td>n/a</td>
    <td>n/a</td>
    <td>n/a</td>
  </tr>
</table>

<sup>1</sup> We're updating for customer engagement apps and Exchange Online, for version 9.2.22104.00170 or later.  <br />
<sup>2</sup> We recommend that you include your Exchange admin in the custom business processes your organization follows for this configuration.

To determine your version, sign in, and in the upper-right corner of the screen, then select **Settings** ![User profile Settings button.](media/user-profile-settings-button.png) > **About**.  

### Require and configure mailbox approval

Follow these steps to approve email addresses for users and queues. By default, admins as described in the preceding permissions model table are required to approve emails.

#### Add the Approve Email Addresses for Users or Queues privilege

To approve emails, a Dynamics 365 user requires the **Approve Email Addresses for Users or Queues** privilege. A system admin can assign the **Approve Email Addresses for Users or Queues** privilege to any security role and assign the security role to any user.

**To manually assign the Approve Email Addresses for Users or Queues privilege to a security role:**

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Users + permissions**, then select **Security roles**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Security roles**.

---

6. Select a security role, then go to the **Miscellaneous Privileges** tab.
7. Select the **Show only unassigned privileges** view.
8. Select **Approve Email Addresses for Users or Queues** and set the **privilege** level.

:::image type="content" source="media/connect-exchange-online/approve-email-address-for-user-queues.png" alt-text="Approve email address for user or queues.":::

#### Approve mailboxes

You can use a manual or programmatic processes to approve a mailbox.

##### Approve a mailbox manually

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Mailboxes**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Mailboxes**.

---

6. Select the **Active Mailboxes** grid view to show the list of mailboxes.  
7. Select the mailboxes that you want to approve, then select **Approve Email** from the command bar.  
8. Select **OK** to apply the changes.

##### Approve a mailbox programmatically
  
Email addresses can't be approved using plug-ins or workflows. External applications can programmatically invoke email address approval by including the _emailrouteraccessapproval_ attribute in the SDK request, provided the record isn't already approved and the caller meets the required authorization criteria.

### Remove the requirement to approve mailboxes

Admins, as described in the preceding permissions model table, can change the settings so that mailbox approval isn't required.

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Email settings**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Email settings**.

---

6. Under **Security and permissions**, turn off **Process emails only for approved users** and **Process emails only for approved queues**. (These settings are enabled by default.)

7. Select **Save** to apply the changes

## Test the configuration of mailboxes  

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Mailboxes**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Mailboxes**.

---

6. Select the **Active Mailboxes** grid view to show the list of mailboxes.  
7. Select the mailboxes you want to test, then select **Test & Enable Mailbox** from the command bar. You also have the option to select a _mailbox link_, then select **Test & Enable Mailbox** from the command bar.

:::image type="content" source="media/connect-exchange-online/test-email-configuration.png" alt-text="Test email configuration, select start date, and view configuration details." lightbox="media/connect-exchange-online/test-email-configuration.png":::

This process tests the incoming and outgoing email configuration of the selected mailboxes and enables them for email processing. If an error occurs in a mailbox, an alert is shown on the **Alerts** wall of the mailbox and the profile owner. Depending on the nature of the error, customer engagement apps try to process the email again after some time or disable the mailbox for email processing.  
  
To see alerts for an individual mailbox, open the mailbox, and then under **Common**, select **Alerts**.  
  
The result of the email configuration test is displayed in the **Incoming Email Status**, **Outgoing Email Status**, and **Appointments, Contacts, and Tasks Status** columns of a mailbox record. An alert is also generated when the configuration is successfully completed for a mailbox. This alert is shown to the mailbox owner.  
  
You can find information about recurring issues and other troubleshooting information in [Blog: Test and Enable Mailboxes in Microsoft Dynamics CRM 2015](https://cloudblogs.microsoft.com/dynamics365/no-audience/2015/08/31/test-and-enable-mailboxes-in-microsoft-dynamics-crm-2015/) and [Troubleshooting and monitoring server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md).  
  
Make sure you've got a good connection to [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] by running the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com/). For information about what tests to run, see [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx).
  
> [!TIP]
> If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you might want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** checkbox. More information: [When would I want to use this check box?](when-would-want-use-check-box.md)
  
## Enable server-side synchronization functionality for Exchange Online in China

To connect Dynamics 365 with your Exchange Online tenant in China and use server-side synchronization functionality, follow these steps:

1. If your org was provisioned before October 17, 2020, contact 21Vianet support to allow your org to connect to Exchange Online. If your org was provisioned after October 17, 2020, this step isn't required.
2. Run the following PowerShell script to point your Exchange Online email server profile to the required Exchange Web Services (EWS) endpoint.
3. Configure the mailbox, and then test and enable the mailbox.

Use the following PowerShell script to change the EWS endpoint:

```powershell
#Specify email server profile Id and orgUrl
param ( 
    [string]$emailServerProfileId = "<profile id>", 
    [string]$orgUrl = "<org url>", 
    [string]$defaultserverlocation = "https://partner.outlook.cn/EWS/Exchange.asmx" 
) 
Install-Module Microsoft.Xrm.Data.PowerShell -Force
$conn = Connect-CrmOnline -Credential $cred -ServerUrl $orgUrl 
$emailserverprofile = Get-CrmRecord -conn $conn -EntityLogicalName emailserverprofile -Id $emailServerProfileId -Fields defaultserverlocation
$emailserverprofile.defaultserverlocation = $defaultserverlocation; 
Set-CrmRecord -conn $conn -CrmRecord $emailserverprofile  
```

### See also

[Troubleshooting and monitoring server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md) <br />
[Test mail flow by validating your connectors](/exchange/mail-flow-best-practices/test-mail-flow)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
