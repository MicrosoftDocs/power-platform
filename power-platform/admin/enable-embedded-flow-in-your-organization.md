---
title: "Enable Power Automate integration to automate processes  | MicrosoftDocs"
description: Enable Power Automate integration to automate processes
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/17/2021
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Enable Power Automate integration to automate processes

Microsoft Power Automate lets you create automated processes between your favorite apps and services. The ability to run flows from within customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), such as Dynamics 365 Sales and Customer Service, make it simple for users to combine a broad spectrum of services that can be initiated from within Dynamics 365 apps, such as messaging, social engagement, and document routing services.  

![Lead record with Power Automate integration.](media/flow-integration.png)

Environments use the same environment in which the environment resides. For more information about Power Automate environments, see [Using environments within Power Automate](/power-automate/environments-overview-admin)
  
The Power Automate integration feature is not available in the following service or geographic regions.
- Microsoft Power Apps US Government
- Germany

Once the Power Automate integration feature is enabled, the following privileges are added in the **Miscellaneous** section of the **Customization** tab for security roles.  
  
- Name: prvFlow  
  
- Name: prvFlow  
  
## Prerequisites  
  
- A Power Automate connection for customer engagement apps (recommended). [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Connectors](/connectors/)  
  
- One or more flows created in the Power Automate environment to use with customer engagement apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a flow by using customer engagement apps](/power-automate/connection-dynamics365)  
  
## Enable Power Automate in your organization  
By default, all security roles allow users to run flows on the records that they have access to.  
  
To enable Power Automate integration in your organization, follow these steps.  

> [!IMPORTANT]
> Once the Power Automate integration option has been enabled, it cannot be disabled.
>  
> If you’re using Conditional Access polices to limit access to Power Automate and it’s features, the following apps must be included in **Cloud apps** policy application:
> 
> - Microsoft PowerApps
> - Microsoft Flow
> 
> Currently, **having conditional access to only Microsoft Flow is not enough**. To learn how to set up Conditional Access policies, see [Plan a Conditional Access deployment](/azure/active-directory/conditional-access/plan-conditional-access) and [Control Access to Power Apps and Power Automate with Microsoft Entra Conditional Access Policies](https://devblogs.microsoft.com/premier-developer/control-access-to-power-apps-and-power-automate-with-azure-ad-conditional-access-policies/#:~:text=Control%20Access%20to%20Power%20Apps%20and%20Power%20Automate,a%20Conditional%20Access%20Policy.%20...%204%20Summary.%20).

1. In the Microsoft Power Platform admin center, select an environment. 

2. Select **Settings** > **Product** > **Behavior**.   
  
3. Under **Display behavior**, select **Show Power Automate on forms and in the site map** to enable Power Automate. Once enabled, this setting cannot be disabled.

4. Select **Save**.

   > [!TIP]
   >  The Power Automate menu only lists flows that begin with the *When a record is selected* Microsoft Dataverse trigger and contain at least one trigger or action that references that record.
   >  
 
### See also  
 [Create and edit web resources](/powerapps/maker/model-driven-apps/create-edit-web-resources)


[!INCLUDE[footer-include](../includes/footer-banner.md)]