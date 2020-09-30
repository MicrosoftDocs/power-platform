---
title: Licensing overview | Microsoft Docs
description: Overview of licensing in Power Apps.
author: dileepsinghmicrosoft
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2020
ms.author: dileeps
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Licensing overview for Power Platform

The topics in this section provide detailed information about Power Apps and Microsoft Power Automate licensing.

For information about Power BI licensing, see [Power BI Pricing](https://powerbi.microsoft.com/pricing/).

## Power Apps/Power Automate for Microsoft 365

Power Apps/Power Automate capabilities for Microsoft 365 enable users to extend and customize the Office experience with Power Apps and Power Automate. Users can create applications and flows based on Microsoft 365 data. These productivity apps can also utilize data outside of Microsoft 365 by connecting to common services including Box.com, Facebook, and many more via the use of standard connectors.

Here is a brief overview of capabilities included with Power Apps for Microsoft 365 plan. More details around which Microsoft 365 plans include these capabilities can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)


| Functionalities                                                   | Power Apps for Microsoft 365 |
|-----------------------------------------------------------------------|------------------------------|
| Create, run and share apps                                            | Yes                          |
| Run canvas apps in context of Microsoft 365                              | Yes                          |
| Connect to Microsoft 365 data                                            | Yes                          |
| Connect to cloud services using standard connectors                   | Yes                          |
| Run apps in a browser or Power Apps mobile for iOS and Android         | Yes                          |
| Run Canvas apps offline                                               | Yes                          |
| Support for data policies established by the Microsoft 365 administrator | Yes                          |
| Access on-premises data or use premium or custom connectors           | \-                           |
| Access to Common Data Service                    | Yes* (see note below)                |

> [!NOTE]
> <sup>*</sup>A limited set of Common Data Service capabilities are included with Microsoft 365 licenses to support some Microsoft 365 products. However, a Power Apps or Power Automate Standalone plan is still needed to run apps with Common Data Service.
>
> Users with Common Data Service service plan in a Microsoft 365 license, can: 
> 1. Access the Project App if a project is shared with them
> 2. Access Common Data Service in the default environment with Maker privileges
> 
> Users with Common Data Service service plan in a Microsoft 365 license, cannot:
> 1. Run any custom apps or Power Apps for Microsoft 365
>
> These users should only get added to an environment once they access the environment or the app. We do not auto-sync these users to any environment.
> 
> **Known issues**
> - If you are an existing customer and a user with this license that comes directly to Common Data Service, you might get an error message that states “You are not a member of the organization”. We are addressing this problem in the coming weeks. 
> - We currently sync some of these Microsoft Common Data Service licensed users to all Common Data Service environments. We are addressing this right now. Currently, these users will not be able to launch Power Apps for Microsoft 365 with this license. 

## Common Data Service capabilities with Microsoft 365 licenses

As Common Data Service continues to grow, more Microsoft applications like Microsoft Project are utilizing Common Data Service. To enable these Microsoft applications, limited Common Data Service functionalities are added to select Microsoft 365 licenses. This is achieved by adding a new service plan named "Common Data Service" to the Microsoft 365 licenses.  To see the new service plan in the Microsoft 365 admin center, select a user, select the **Licenses and Apps** tab, and then scroll down and expand the **Apps** section. 

> [!div class="mx-imgBorder"] 
> ![Common Data Service license](./media/common-data-service-license.png "Common Data Service license")

### Capabilities included 

Common Data Service functionality required by other Microsoft 365 applications appears as the "Common Data Service" service plan in the **Apps** section of the Microsoft 365 admin center.  

This new service plan allows select Microsoft 365 applications to leverage Common Data Service as a platform for storing application data and leverage the underlying business logic tier as part of extending application capabilities. This extension also helps these applications to use Common Data Service instances within the [default environment](environments-overview.md#the-default-environment). However, if you need to create a Common Data Service instance within production or sandbox environments (other than the default environment), you are still required to have a premium Power Apps or Power Automate license. 

These limited capabilities of Common Data Service are only available through select Microsoft 365 licenses and cannot be used to run any custom Power Apps applications or Power Automate flows or Power Virtual Agent bots or leverage any other data that doesn’t belong to the Microsoft 365 applications that leverage these capabilities. 

These limited capabilities are not the common set included with every Office application. They can be different based on the Microsoft 365 applications that leverage these capabilities. For the complete list of various limited capabilities, customers should refer to the service description of these Microsoft 365 applications that contain these Common Data Service plans. These limited capabilities of Common Data Service do not entitle the licensed user to run standalone Power Apps or Power Automate or any other Power Platform applications which leverage Common Data Service. 

Review the [Microsoft Project Service description](https://docs.microsoft.com/office365/servicedescriptions/project-online-service-description/project-online-service-description) for more details on the limited use of Common Data Service that comes with Microsoft Project. 

### Frequently asked questions

#### What are the select Office applications where Common Data Service plans are included?  
For now, the Common Data Service service plan is included for Microsoft Project. This list will evolve as more office applications leverage Common Data Service and Power Platform. 

#### Does this addition of Common Data Service in Microsoft 365 mean that customers don’t need a Power Apps license to use Common Data Service?  

No, the capabilities of Common Data Service included with select Microsoft 365 licenses do not allow customers to create custom apps with Power Apps or use the premium connectors with Power Automate. The capabilities included with this license entitles Microsoft 365 applications to use Common Data Service for the purpose of enhancing the capabilities of the base Microsoft 365 application where Common Data Service is included.

#### If customers cannot use the Common Data Service, why is this being shown in the Microsoft 365 Admin center during the license assignment experience?  

The service plan for Common Data Service is included and visible to customers to provide visibility to customers that Common Data Service is being leveraged to store and manage customer data related to the Microsoft 365 application using Common Data Service. Additionally, this was communicated to all customers so that customers can prepare for this change and to update any internal training or user documentation that might be needed for customers.  

#### What will be the impact if the service plan for Common Data Service is turned off/unchecked?  

Common Data Service functionality appears as the **Common Data Service** plan in the **Apps** section of the Microsoft 365 admin center. Turning off the service plan will result in the Microsoft 365 features being disabled for the users of such license. For example, when this capability is turned off, any Office application reading the data from Common Data Service will fail to load for the user.  

#### When can office licensed users be seen inside of Common Data Service?   

Users who have any Power Platform or Dynamics license are always synced into the Common Data Service environments. However, for Office licenses where Common Data Service service plans are included, users are not auto-synced into Common Data Service until the Office application is accessed by the user. This user can now get access to Common Data Service entity and records based on the additional security roles and privileges that are assigned to this user, by the administrator. Such users, with just the Office license, are not auto-assigned any other security roles or privileges other than Maker role privilege in [default environment](environments-overview.md#the-default-environment).  As a security best practice,  the administrator needs to ensure that security roles and privileges are assigned based on functional roles and needs only, and not auto-assigned based on the user being synced or present in Common Data Service.  

## Power Apps and Power Automate Standalone plans

Standalone Power Apps and Microsoft flow plans provide users the ability to create and run apps across data sources that extend beyond Microsoft 365, such as Salesforce, on-premises and custom data sources. These plans also include access to Common Data Service to store and manage data. Learn more: [What is Common Data Service?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)

More details around pricing and capabilities of standalone plans can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Community Plan

If you want to build skills and learn more about Power Apps, Power Automate, and Common Data Service, the Power Apps Community Plan is the right plan for you. The Power Apps Community Plan gives you a free development environment for individual use to learn with full functionality of Power Apps. More information: [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/).

## Power Apps and Power Automate for Dynamics 365

Power Apps is the platform to customize and extend applications in Dynamics 365, such as Dynamics 365 Sales and Customer Service, in context of the use rights.

Dynamics 365 Applications can be customized using Power Apps and Power Automate capabilities.

More information: [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544).

