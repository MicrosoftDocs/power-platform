---
title: "System Settings Service tab | MicrosoftDocs"
description: System Settings Service tab 
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 03/12/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
ms.contributors:
- v-fanwar
---
# System Settings Service tab

Use this tab to set preferences for the customer service area, such as service level agreements and entitlements in model-driven apps in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  

<!-- legacy procedure -->
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role.  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.
  
4. Select the **System Settings** > **Service** tab.  
  
> [!NOTE]
> In the Customer Service Admin Center app, select **Service Teams** > **Other SLA Settings** in the sitemap to access the Service configuration settings. 
  
| Settings |Description|
|-------------------------|--------------------------|
| **Disable SLAs**<br>Disable Service Level Agreements (SLAs) on SLA-enabled entity records. | ​SLAs are enabled by default. You can enable or disable them for SLA-enabled entity records in your organization. For example, you might want to disable SLAs during maintenance activities or when you're importing records and you don't want the SLAs to apply to the records. <br><br>- To disable, select **Yes**. <br><br>- To enable, select **No**. <br><br>**Note:** When SLAs are disabled, SLA records can still be created or modified. SLAs aren't applied to records, however. |
| **Recalculate SLA on terminal status**</br>Recalculate SLAs for SLA-enabled entities.</br>​  |  ​This setting determines if an SLA should be recalculated when it reaches the terminal status. <br><br>For more information, see [Recalculate SLAs in terminal status in Dynamics 365 Customer Service](/dynamics365/customer-service/administer/enable-sla-recalculation?wt.mc_id=d365cs_inproduct_csac_pages&amp;tabs=customerserviceadmincenter). |
| **Apply SLA after manual override**</br>Automatically apply SLA on entity record update after SLA was manually applied.<br><br>**Important:** For organizations, this feature is available only if your organization has installed Dynamics CRM Online 2016 Update. For more information, see [Find your administrator or support person](/powerapps/user/find-admin).  |  This setting determines if an SLA should automatically be applied to a record when an SLA is manually selected in the record's SLA field. The automatic SLA application can either be through the entitlement applied to the case (for the Case entity) or with the default SLA. Either way, the manual SLA takes precedence over any other way of SLA application. <br><br>When set to **No**, SLAs aren't applied automatically to records after an SLA is manually applied. <br><br>**Note:** For Case entity records, when both entitlement and customer, and manual SLA are changing, the manual SLA is used regardless of this setting. |
| **Select SLA Pause Status**</br>For the selected entity, choose the status values that SLA calculation should pause for. |  ​Select the SLA-enabled entity you want to choose the pause status for. <br><br>**Important:** This feature of enabling other entities for SLA was introduced in CRM Online 2016 Update 1 and CRM 2016 SP1. For more information, see [Find your administrator or support person](/powerapps/user/find-admin). <br><br>Select the statuses for which the SLA calculation should be paused. Double-click the statuses in the **Available Values** column. When the user sets a record to one of the _pause_ status values you set here, customer engagement apps pauses the SLA calculation. When the user changes the status of the case back to a status other than a _pause_ status, customer engagement apps update the failure and warning time in the enhanced SLA KPIs. It also tracks the total time for which a record is in the _pause_ status.<br><br>**Important:** This feature of enabling other entities for SLA was introduced in CRM Online 2016 Update 1 and CRM 2016 SP1. For more information, see [Find your administrator or support person](/powerapps/user/find-admin) and [Configure pause conditions for SLA-enabled entities](/dynamics365/customer-service/administer/set-pause-conditions-sla?branch=main). |
| **Automatically apply entitlement** |   - Select whether to automatically apply the default customer entitlement when case is created.<br /></br>- Select whether to automatically apply the default customer entitlement when a case is updated and the customer, contact, or product field has changed. |
| **Calendar Export and Import**</br>Enable calendar export and import. |  If this setting is enabled, exporting an SLA through a solution includes exporting the attached Holiday Schedule and Customer Service schedule. Similarly, enabling this setting means that importing an SLA through a solution also imports the attached calendar.</br>​  |

  
### See also  
[Learn the basics of the Customer Service Hub](/dynamics365/customer-service/customer-service-hub-user-guide-basics) 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
