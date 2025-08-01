---
title: "Set up customer engagement apps to use SharePoint Online  | MicrosoftDocs"
description: Set up customer engagement apps to use SharePoint Online
author: Mattp123
contributor: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/09/2025
ms.subservice: admin
ms.author: matp
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom:
  - NewPPAC
  - sfi-ga-nochange
---
# Set up customer engagement apps to use SharePoint Online

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

When you use SharePoint Online with customer engagement apps—including Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation, you can:  
  
- Create, upload, view, and delete documents stored in SharePoint from within customer engagement apps.  
  
- Use the SharePoint document management abilities within customer engagement apps, such as checking the document in and out and changing document properties.  
  
- Enable non-customer engagement apps users, such as customers who want to review a bid, to directly access the SharePoint documents, provided they have the appropriate permissions.  
  
> [!IMPORTANT]
>  This topic is for organizations who wish to deploy for the first time or upgrade to server-based SharePoint integration. After you enable server-based SharePoint integration, you can't revert to the previous client-based authentication method.  

To set up customer engagement apps to use SharePoint Online, complete the following steps.     

## Assign user permissions to the Team SharePoint site  
Your customer engagement apps and [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] users aren't automatically allowed access to your SharePoint sites. You must work within the SharePoint site to assign specific permission levels to individual users or groups.  
  
#### Assign users to the Team site  
  
1. [!INCLUDE[proc_office365_signin](../includes/proc-office365-signin.md)]  
  
2. Open the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] app launcher, and then select **SharePoint**.  
  
3. On the left-side menu, select **Team Site**.  
  
4. On the Home page, select **SHARE** (upper-right corner).  
  
   ![SharePoint Share Settings.](../admin/media/sharepoint-share-settings.png "SharePoint Share Settings")  
  
5. To view the default permissions for your team site, select **lots of people**.  
  
   ![Share Team site.](../admin/media/crm-itpro-crmo365tg2-shareteamsite.png "Share Team site")  
  
6. By default, all users in your [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] organization are able to add and edit documents on the Team SharePoint site. To invite others, choose **Invite people** and add people external to your organization to share documents.  
  
For more information about SharePoint permissions, see [Introduction: Control user access with permissions](https://support.office.com/Article/Introduction-Control-user-access-with-permissions-ab2d1ab1-07cf-4c69-bdd9-390bfd787b26)  
  
## Configure customer engagement apps for SharePoint document management  
If your organization is new and doesn't deploy document management, see [Configure a new organization](../admin/set-up-dynamics-365-online-to-use-sharepoint-online.md#BKMK_ConfigNewOrg).  
  
If your organization is already using document management with [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)], you must switch to server-based SharePoint integration. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Switching from the list component or changing the deployment](switching-list-component-changing-deployment.md)  
  
> [!IMPORTANT]
>  Server-based SharePoint integration uses the entity display name to build the SharePoint library. When you upgrade to server-based SharePoint integration, be sure to check that the display names in your document library on SharePoint match the entity display names. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] ["Validation Error" when you try to configure server-based SharePoint integration for Microsoft Dynamics CRM Online and SharePoint Online](https://go.microsoft.com/fwlink/p/?LinkID=402112).  
  
 ![SharePoint library name and entity display name.](../admin/media/crm-itpro-crmo365tg-sharepointname.png "SharePoint library name and entity display name")  
  
These names should match.   

### Configure a new organization  
If your organization doesn't deploy document management, an alert message appears when a System Administrator logs in, prompting them to enable server-based SharePoint integration.  
  
 ![Enable Server-Based SharePoint Integration alert.](../admin/media/crm-and-sharepoint-online-enable-now.png "Enable Server-Based SharePoint Integration alert")  
  
> [!NOTE]
> If you don't see the alert and haven't enabled server-based SharePoint integration, clear your browser cache or open customer engagement apps in an InPrivate browsing window to trigger the alert again. Once server-based integration is configured, the alert no longer appears.  

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Integration**, then select **Document management settings**.
1. On the **Document management** page, select **Enable server-based SharePoint integration**.
   
#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Integration**, then select **Document management settings**.
1. On the **Document management** page, select **Enable server-based SharePoint integration**.
---

In the **Enable Server-based SharePoint Integration** dialog:
1. Select **Next**.  
1. Choose **Online** for where your SharePoint sites are located, then select **Next**.  
1. Enter the SharePoint site URL to use with server-based integration, then select **Next**.   
  
   > [!TIP]
   >  To see your SharePoint site collections, in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], select **Admin centers** > **SharePoint**, and then select **site collections**. 
  
The URL is checked for being a valid SharePoint online site and for existing in the same [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] tenant as your organization. Once server-based SharePoint integration is enabled, you can't go back to the previous client-side integration.
   
1. Select **Finish** to apply the changes.

### Next steps  
Once server-based SharePoint integration is enabled, you need to enable the entities you want available for document management integration. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Enable document management on entities](enable-sharepoint-document-management-specific-entities.md)    

Once server-based SharePoint integration is enabled, you can also enable integration with OneNote and OneDrive. More information: [Set up OneNote integration](set-up-onenote-integration-in-dynamics-365.md) and [Enable OneDrive for Business (online)](enable-onedrive-for-business.md)   

## Using Document Management  
 You're now ready to add document storage locations to the entities you enabled and start managing documents. Begin by opening a document management-enabled record (for example, Contact).  
  
1. Browse to your web application.  
  
2. Choose an account, such as the **Adventure Works** sample account.  
  
3. On the nav bar, select the down arrow next to the account name, and then select **Documents**.  
  
   ![Select Documents for an account.](../admin/media/crm-itpro-crmo365tg-seldoc.png "Select Documents for an account")  
  
4. Select **Upload**, and then browse to a document to upload to the new folder in your [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] SharePoint Online Team site.  
  
   ![Add a document.](../admin/media/crm-itpro-crmo365tg-crmadddoc.png "Add a document")  
  
5. Select a folder location, and then select **Ok**.  
  
6. To see the document in your [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] SharePoint Online Team site, select to the left of the document name (you see a check mark), and then select **Open Location**.  
  
![Microsoft 365 Team Site shared document.](../admin/media/crm-itpro-crmo365tg-teamdocshare.png "Microsoft 365 Team Site shared document")  
  
7. Select **Site Contents** to see all the document libraries created for the managed entities you selected.  
  
    The entities you selected to be managed by Document Management appear as document libraries (for example: Account, Article, Case, Lead, Opportunity, Product, Quote, and Sales Literature).  
  
   ![Microsoft 365 Team Site all libraries.](../admin/media/crm-itpro-crmo365tg-teamalllib.png "Microsoft 365 Team Site all libraries")  
 
## Known issue

SharePoint Online introduced a new feature that enables a SharePoint or global administrator in Microsoft 365 to block or limit access to SharePoint and OneDrive content from unmanaged devices. For more information, see [Control access from unmanaged devices](/sharepoint/control-access-from-unmanaged-devices).

You can set access at three levels:
1. Allow full access  from desktop apps, mobile apps, and the web
2. Allow limited, web-only access
3. Block access

For "Block Access" level, only devices that satisfy the AD trust policy defined by the SharePoint or global admin can open SharePoint site and perform operations.

### Impact on customer engagement apps and SharePoint Online integration

When SharePoint Online is configured for "Block Access", customer engagement apps receive a 401 UnAuthorized response from SharePoint Online for all operations triggered using server-to-server integration. This is because SharePoint Online rejects the AppAssertedUser token (the claims-based token which is used for server-to-server authentication between customer engagement apps and SharePoint Online).

### Work around

As a workaround, you can set the unmanaged devices policy to "Allow full access from desktop apps, mobile apps, and the web" on SharePoint Online.

1. Sign in to [https://admin.microsoft.com](https://admin.microsoft.com) as a global or SharePoint admin. If you see a message that you don't have permission to access the page, you don't have Microsoft 365 administrator permissions in your organization.
2. In the left pane, select **Admin centers** > **SharePoint**.
3. In the SharePoint admin center, select **access control** in the left pane.

   > [!div class="mx-imgBorder"] 
   > ![SharePoint access control.](media/sharepoint-admin-center-access-control.png "SharePoint access control")

4. Under **Unmanaged devices**, select **Allow full access from desktop apps, mobile apps, and the web**.

   > [!div class="mx-imgBorder"] 
   > ![SharePoint unmanaged devices allow full accessl.](media/sharepoint-unmanaged-devices-allow-full-access.png "SharePoint unmanaged devices allow full access")

5. Select **Ok**.   

## Information transmitted between customer engagement apps and SharePoint when you use server-based SharePoint integration  
 When you use the document management feature in customer engagement apps by using server-based SharePoint integration, the following information is transmitted between customer engagement apps and SharePoint:  
  
- Entity name for the entity that is used to create folders in SharePoint, such as Account, Article, or Lead. To configure the entities that are integrated, go to **Settings** > **Document Management** > **Document Management Settings**.

### See also  
 [Manage your documents using SharePoint](manage-documents-using-sharepoint.md)   

[!INCLUDE[footer-include](../includes/footer-banner.md)]
