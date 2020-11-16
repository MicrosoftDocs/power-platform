---
title: "Enable Power Automate integration to automate processes  | MicrosoftDocs"
description: Enable Power Automate integration to automate processes
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable Power Automate integration to automate processes

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Microsoft Power Automate lets you create automated processes between your favorite apps and services. The ability to run flows from within customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), such as Dynamics 365 Sales and Customer Service, make it simple for users to combine a broad spectrum of services that can be initiated from within Dynamics 365 apps, such as messaging, social engagement, and document routing services.  

![Lead record with Power Automate integration](media/flow-integration.png)

Environments use the same environment in which the environment resides. For more information about Power Automate environments, see [Using environments within Power Automate](https://docs.microsoft.com/power-automate/environments-overview-admin)
  
The Power Automate integration feature is not available in the following service or geographic regions.
- Microsoft Power Apps US Government
- Germany

Once the Power Automate integration feature is enabled, the following privileges are added in the **Miscellaneous** section of the **Customization** tab for security roles.  
  
- Name: prvFlow  
  
- Name: prvFlow  
  
## Prerequisites  
  
- A Power Automate connection for customer engagement apps (recommended). [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Connectors](https://docs.microsoft.com/connectors/)  
  
- One or more flows created in the Power Automate environment to use with customer engagement apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a flow by using customer engagement apps](https://docs.microsoft.com/power-automate/connection-dynamics365)  
  
## Enable or disable Power Automate in your organization  
 By default, all security roles allow users to run flows on the records that they have access to.  
  
 To enable or disable Power Automate integration in your organization, follow these steps.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Product** > **Behavior**.   
  
3. Under **Display behavior**, select **Show Power Automate on forms and in the site map** to enable or disable Power Automate.

4. Select **Save**.

> [!TIP]
   >  The Power Automate menu only list flows that begin with the *When a record is selected* Microsoft Dataverse trigger and contain at least one trigger or action that references that entity.
   >  
 
### See also  
 [Create and edit web resources](https://docs.microsoft.com/powerapps/maker/model-driven-apps/create-edit-web-resources)
