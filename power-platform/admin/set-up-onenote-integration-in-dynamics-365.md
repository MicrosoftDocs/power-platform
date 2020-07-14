---
title: "Set up OneNote integration  | MicrosoftDocs"
description: Learn how to integrate OneNote with model-driven apps in Dynamics 365
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set up OneNote integration

Gather your thoughts, ideas, plans and research in one single place with [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] in model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service.  
  
 When you turn on [!INCLUDE[pn_microsoft_onenote](../includes/pn-microsoft-onenote.md)] integration in model-driven apps in Dynamics 365, you have the benefits of using [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] to take or review customer notes from within your records.  
  
 You can configure [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] in model-driven apps in Dynamics 365 when you're also using [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. You must have a subscription to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] to use [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] in model-driven apps in Dynamics 365.  
  
<a name="BKMK_EnableSharePointInt"></a>   
## Step 1: Turn on server-based SharePoint integration  

 Before you can enable [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration, you need to [turn on server-based SharePoint integration](set-up-sharepoint-integration.md).  
  
 [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)] Or, make sure that you have Read and Write privileges on all record types that are customizable.  
  
#### Check your security role  
  
- [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
- [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
  ![Enable SharePoint Integration](../admin/media/enable-sharepoint-integration.png "Enable SharePoint Integration")  
  
<a name="BKMK_EnableOneNote"></a>   
## Step 2: Turn on OneNote integration  

 When server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration is turned on, **[!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration** is listed in **Document Management**.  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**.  
  
3. Select **OneNote Integration**.  
  
   ![Choose OneNote Integration](../admin/media/onenote-integration.png "Select OneNote Integration")  
  
4. Follow the instructions in the wizard to turn on [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration for selected entities. Choose entities that need a full notebook per record. Only entities that are already enabled for document management are listed. Select **Finish**.  
  
   ![Follow instructions in wizard](../admin/media/onenote-integration-wizard.png "Follow instructions in the wizard")  
  
5. You can also enable [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration for an entity from the customization form, as long as document management has been enabled for that entity.  
  
   ![Select OneNote integration for an entity](../admin/media/onenote-select-entity.png "Select OneNote integration for an entity")  
  
6. A [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] notebook is automatically created for a record the first time you select the **OneNote** tab in the activities area in model-driven apps in Dynamics 365. After the dedicated [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] notebook is created for that record, you can view and navigate to that notebook from any Dynamics 365 apps client.  
  
[!INCLUDE[proc-more-information](../includes/proc-more-information.md)]  [Use OneNote](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/basics/use-onenote)
  
## To turn off OneNote integration  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**.  
  
3. Select **OneNote Integration**.  
  
   ![Choose OneNote Integration](../admin/media/onenote-integration.png "Select OneNote Integration")  
  
4. In the **OneNote Integration Setting** dialog box, clear the check boxes for all entities, and then select **Finish**.  
  
### See also  
 [Use OneNote](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/basics/use-onenote)   
 [OneNote FAQs](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/basics/onenote-dynamics-365-faqs)   
 [Turn on server-based SharePoint integration](set-up-sharepoint-integration.md)   

