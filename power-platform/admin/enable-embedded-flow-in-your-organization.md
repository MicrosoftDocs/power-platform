---
title: "Enable Flow integration to automate processes  | MicrosoftDocs"
description: Enable Flow integration to automate processes
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/26/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Enable Flow integration to automate processes

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

Microsoft Flow lets you create automated processes between your favorite apps and services. The ability to run flows from within model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, make it simple for users to combine a broad spectrum of services that can be initiated from within Dynamics 365 apps, such as messaging, social engagement, and document routing services.  

![Lead record with Flow integration](media/flow-integration.png)

Environments use the same environment in which the environment resides. For more information about Flow environments, see [Using environments within Microsoft Flow](https://flow.microsoft.com/documentation/environments-overview-admin/)
  
The Flow integration feature is not available in the following service or geographic regions.
- Microsoft PowerApps US Government
- Germany

Once the Flow integration feature is enabled, the following privileges are added in the **Miscellaneous** section of the **Customization** tab for security roles.  
  
- Name: prvFlow  
  
- Name: prvFlow  
  
## Prerequisites  
  
- A Flow connection for model-driven apps in Dynamics 365 (recommended). [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Connectors](https://docs.microsoft.com/connectors/)  
  
- One or more flows created in the Flow environment to use with model-driven apps in Dynamics 365. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a flow by using model-driven apps in Dynamics 365](https://flow.microsoft.com/documentation/connection-dynamics365/)  
  
## Enable or disable Flow in your organization  
 By default, all security roles allow users to run flows on the records that they have access to.  
  
 To enable or disable Flow integration in your organization, follow these steps.  
  
1.  Go to the **Settings** > **Administration** > **System Settings** > **Customization** tab.  
  
2.  Enable or disable Flow in your organization.  
  
    -   To enable, under **Enable Microsoft Flow** click **Yes**.  
    
    -   To disable, under **Enable Microsoft Flow** click **No**.  
  
        ![Enable Flow integration](../admin/media/embed-flow-enable.png "Enable Flow integration")  
  
3.  Click **OK** to close System Settings. 

> [!TIP]
   >  The Flows menu only list flows that begin with the *When a record is selected* Common Data Service trigger and contain at least one trigger or action that references that entity.
   >  
 
### See also  
 [Create and edit web resources](/dynamics365/customer-engagement/customize/create-edit-web-resources.md)
