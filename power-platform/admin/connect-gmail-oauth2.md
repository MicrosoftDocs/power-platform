---
title: "Connect Gmail accounts using OAuth 2.0| MicrosoftDocs"
description: "Connect Gmail accounts using OAuth 2.0 "
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/16/2025
author: DanaMartens
contributors:
ms.subservice: admin
ms.custom: NewPPAC
ms.author: dmartens
ms.reviewer: sericks
contributors:
- yingchin
- EllenWehrle
search.audienceType: 
  - admin
---

# Connect Gmail accounts by using OAuth 2.0

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Follow the steps in this article to set up server-side synchronization to send and receive email in customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)) from Gmail accounts by using OAuth 2.0 as the authorization mechanism.

> [!NOTE]
> The Gmail OAuth email server profile works for up to 100 users. Create multiple OAuth profiles (steps 1 through 4) if you want to associate the same profile with multiple users.

## Step 1. Enable IMAP or POP in Gmail

> [!NOTE]
> These steps should be done by the system administrator.

For IMAP, follow the steps in [Check Gmail through other email platforms](https://support.google.com/mail/answer/7126229).

For POP, follow the steps in [Read Gmail messages on other email clients using POP](https://support.google.com/mail/answer/7104828).

## Step 2. Create a project

> [!NOTE]
> These steps should be done by the system administrator.

Using a Google account (this can be the same one you'll use to send and retrieve email, or a different one), go to the Google Developers Console and create a new project.

Follow the steps for **Create a project** in [Create, shut down, and restore projects](https://support.google.com/googleapi/answer/6251787).

## Step 3. Configure OAuth consent

> [!NOTE]
> These steps should be done by the system administrator.

1. Select **OAuth consent screen**, and then select the user type:
   - Select **Internal** if you're using a GSuite admin tenant and will be creating the app exclusively for your organization.
   - Select **External** if you're testing by using a standalone Gmail account.

   > [!div class="mx-imgBorder"]
   > ![Screenshot of the OAuth consent screen.](media/gmail-oauth-consent-screen.png "OAuth consent screen")

2. Select **Create**.

3. Under **Application name**, enter the application name. Under **Authorized domains**, enter your environment's top private domain name (for example, `dynamics.com`). Select **Save**.

   > [!div class="mx-imgBorder"]
   > ![Screenshot of entering application name and domain.](media/gmail-oauth-consent-domain-name.png "Enter application name and domain")

4. Select **Credentials** > **Create credentials**.

   > [!div class="mx-imgBorder"]
   > ![Screenshot of the Create credentials command.](media/gmail-oauth-consent-create-credentials.png "Create credentials")

5. Select **OAuth client ID**.

6. Select **Configure consent screen**.

7. Enter the following settings:

   |Setting  |Use  |
   |---------|---------|
   |Application type     | Web application         |
   |Name     |  The name of your web client       |
   |Authorized JavaScript origins     | Your environment's  URL (for example, `https://contoso.crm.dynamics.com`)        |
   |Authorized redirect URIs     | Your environment's URL with `/_grid/cmds/dlg_gmailoauth.aspx` appended to it (for example, `https://contoso.crm.dynamics.com/_grid/cmds/dlg_gmailoauth.aspx`)        |

8. Select **Create**. In the screen that appears, make note of the client ID and client secret. You'll use this data in the next step.

## Step 4. Create an email server profile

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment. 
1. In the command bar, select **Settings**.
1. Expand **Email**, then select **Server profiles**.
1. In the command bar, select **New server profile**.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, click **Settings**.
1. Expand **Email**, then select **Server profiles**.
1. In the command bar, click **New server profile**.

---

In the **Set up server profile** panel:
1. For **Email Server Type**, select **Gmail**, then enter a meaningful **Name** for the profile.
2. To set this server profile as the default for new mailboxes, enable **Set as default profile for new mailboxes**.
3. For **Authentication Type**, select **Gmail OAuth**.
4. Enter the **Client ID** and **Client Secret** from step 8 of the previous procedure.

   > [!NOTE]
   > The **Locations and ports** fields are automatically populated.

5. Expand **Advanced**, and use the tooltips to configure your email processing options.
6. When finished, click **Save**.

## Step 5. Configure the mailbox

> [!NOTE]
> These steps should be done by the mailbox user.

1. In a Dynamics 365 app, click **Settings** in the top command bar, then select **Advanced Settings**.
2. Under the **System** group, select **Email configuration**, then click **Mailboxes**.
3. Select the mailbox for the user configured in previous steps.
4. In the **Synchronization Method** pane, enter the following settings:

   |Setting  |Use  |
   |---------|---------|
   |Server profile    | The profile created in step 4     |
   |Incoming email    | Server-Side Synchronization or Email Router       |
   |Outgoing email | Server-Side Synchronization or Email Router   |

5. Select **Save** to apply the changes.

6. Select **Signin to Gmail**.

7. Follow the Gmail sign-in and authorization pages.

## Step 6. Add test users

In the Google Cloud Platform (Developer Console), add users in the **Test Users** section when publishing the app. You can learn more about adding test users in [Google Cloud Platform Console Help](https://support.google.com/cloud/answer/7454865).

> [!div class="mx-imgBorder"]
> ![Screenshot of adding test users.](media/gmail-oauth-add-users.png "Add test users")

## Step 7. Test and enable

> [!NOTE]
> These steps should be done by the mailbox user.

Select **Test & Enable Mailbox** to test the mailbox configured in step 6.

> [!div class="mx-imgBorder"]
> ![Screenshot of the Test & Enable Mailbox command.](media/gmail-oauth-test-enable-mailbox.png "Test and enable mailbox")

[!INCLUDE[footer-include](../includes/footer-banner.md)]
