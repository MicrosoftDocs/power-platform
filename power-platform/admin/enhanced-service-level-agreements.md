---
title: "Enhanced service level agreements  | MicrosoftDocs"
description: Enhanced service level agreements
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enhanced service level agreements

<!-- legacy procedure -->

Service level agreements (SLAs) are a formalized method to help organizations meet service levels when they provide customer service and support. For example, an organization can have an SLA to complete the first customer response within 48 business hours after a case is created. Another example is to escalate an unresolved case after a specified duration, such as five business days. SLAs are used to define these different aspects of service.  
  
The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), include two kinds of SLAs, standard and enhanced. Enhanced SLAs include the following features not available in standard SLAs:  
  
-   Case-on-hold support  
  
-   Auto-pause and resume of time calculation  
  
-   Support for success actions  
  
-   Creation of dashboards or reports based on the SLA KPI environment table  
  
## Case-on-hold support  
 One feature of SLA tracking is the ability to control the case-on-hold status. For example, this functionality lets you pause a case for a time when the case is on hold waiting for a response from the customer. Once the response is received, the case is resumed.  
  
 System administrators turn on SLAs and select case hold functionality in the web app using **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings** > **Settings** > **Service Management** > **Service Configuration Settings**. Afterwards, CSR Managers can create SLAs using the enhanced SLA type that allows pause and resume functionality. SLAs are created in **Settings** > **Service Management**.  
  
 [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Define service level agreements (SLAs)](/dynamics365/customer-service/define-service-level-agreements)  
  
## Considerations when you choose a SLA type  
 Because there are two types of SLAs that have different functionality, consider the following features before you choose an SLA type. We recommend that you use only one type of SLA for an organization.  
  
-   After you select an SLA type, either standard or enhanced, you cannot change the SLA type for any record associated with the SLA.  
  
-   Because standard and enhanced SLAs exist as separate tables with separate forms, views, and fields, the following behaviors exist.  
  
    -   Case views cannot be sorted by enhanced SLA fields. To display enhanced SLA fields in Case views, you can modify any of the Case views to display the fields from the enhanced SLA (which has the table name SLA KPI environment).  Although you can sort on the fields that are part of the Case table, because the enhanced SLA fields are on a related table, you cannot sort on columns that are associated with the enhanced SLA fields.  
  
    -   Queue Item views do not display enhanced SLA fields. Although, Queue Item views display the standard fields SLA (First Response By and Resolve By), because the enhanced SLA (SLA KPI environment table) is not directly related to the Queue Item table, the columns associated with enhanced SLAs cannot be displayed.  
  
> [!TIP]
>  To monitor enhanced SLA details, consider creating custom dashboards based on the SLA KPI environment table or custom views using the Regarding (Case) relationship.  
  
### See also  
 [Video: SLA Enhancements in Microsoft Dynamics CRM 2015](https://youtu.be/rgmPqLsG8WI)   
 [Enable languages](../admin/enable-languages.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]