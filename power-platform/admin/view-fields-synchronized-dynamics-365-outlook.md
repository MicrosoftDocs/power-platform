---
title: "View the fields that are synchronized between customer engagement apps and Outlook  | MicrosoftDocs"
description: View the fields that are synchronized between customer engagement apps and Outlook
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# View the fields that are synchronized between customer engagement apps and Outlook

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

In [!INCLUDE[pn_crm_2015_outlook](../includes/pn-crm-2015-outlook.md)] or later, you can view the appointments, contacts, and tasks fields that are synchronized between customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] so you can see where the data is coming from. You can also determine whether the fields:  

- Are synchronized one way (from [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] to customer engagement apps **or** from customer engagement apps to [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)])  

- Are synchronized two way (from [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] to customer engagement apps **and** from customer engagement apps to [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)])  

- Aren't synchronized  

  For example, if the fields are synchronized one way, from customer engagement apps to [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)], you can update the field in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] and save the change, but your changes won't be synced with customer engagement apps, and will be overwritten if the same field value is changed in customer engagement apps. So if fields are synced one way, there's no need to change the value in the synchronized field.  

## View the synchronized fields  

1. In the web app, in the upper-right corner of the screen, click the **Settings** button ![User profile Settings button](media/privileges-user.png "User profile Settings button") > **Options**.  

2. In the **Set Personal Options** dialog box, choose the **Synchronization** tab.    

3. Choose **synchronized fields**.  

4. In the **Synchronization Settings for [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]** dialog box, click the **Synchronization Fields** tab.  

   ![Field-level Sync tab](media/field-level-sync-tab.png "Field-level Sync tab")  

5. In the **Entity Type** list, select the record type you want to view.  

   [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] fields are displayed on the left and the corresponding customer engagement apps fields are displayed on the right. The blue arrows show the sync direction:  


   |This indicator  |Shows that the fields   |
   |----|---|
      | ![One-way sync arrow (right)](media/one-way-sync-arrow-right.png "One-way sync arrow (right)") | Are synced one way from [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] to customer engagement apps |
   |  ![One-way sync arrow (left)](media/one-way-sync-arrow-left.png "One-way sync arrow (left)")   | Are synced one way from customer engagement apps to [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] |
   |            ![Two-way sync arrow](media/two-way-sync-arrow.png "Two-way sync arrow")            |                                                                  Are synced two way                                                                  |
   |       ![No synchronization arrow](media/no-sync-arrow.png "No synchronization arrow")        |                                                                    Aren't synced                                                                     |

   > [!NOTE]
   >  Field synchronization direction can be impacted by security settings configured by your system administrator. For example, if you don't have read privileges for a field, it won't be synchronized in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] even if the field is configured for two-way synchronization. To determine whether you have read privileges for a field, click the **View in Dynamics 365 apps** button to open the record. If you see the **Lock** icon, you can't access the field.  

### See also  
 [Frequently asked questions about synchronizing records between customer engagement apps and Microsoft Outlook](frequently-asked-questions-synchronizing-records-dynamics-365-and-outlook.md)   
 [What fields can be synchronized between customer engagement apps and Outlook or Exchange?](what-fields-synchronized-outlook.md)   
 [Control field synchronization between customer engagement apps and Outlook or Exchange (admins)](control-field-synchronization-outlook.md)   
 [How security affects synchronization between customer engagement apps and Outlook or Exchange](how-field-security-affects-synchronization-between-outlook.md)
