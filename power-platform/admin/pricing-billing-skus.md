---
title: Licensing overview | Microsoft Docs
description: Overview of licensing in Power Apps.
author: dileepsinghmicrosoft
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/01/2020
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

# Licensing overview for Microsoft Power Platform

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
| Access to Microsoft Dataverse                    | Yes (see the next section for details)                |

## Dataverse capabilities with Microsoft 365 licenses

As Dataverse continues to grow, more Microsoft applications like Microsoft Project are using Dataverse. To enable these Microsoft applications, limited Dataverse functionality is added to select Microsoft 365 licenses. This is achieved by adding a new service plan named "Dataverse" to the Microsoft 365 licenses. To see the new service plan in the Microsoft 365 admin center, select a user, select the **Licenses and Apps** tab, and then scroll down and expand the **Apps** section. 

> [!div class="mx-imgBorder"] 
> ![Dataverse license](./media/common-data-service-license.png "Dataverse license")

### Capabilities included 

Dataverse functionality required by other Microsoft 365 applications appears as the "Dataverse" service plan in the **Apps** section of the Microsoft 365 admin center.  

This new service plan allows select Microsoft 365 applications to take advantage of Dataverse as a platform for storing application data and use the underlying business logic tier as part of extending application capabilities. This extension also helps these applications to use Dataverse instances within the [default environment](environments-overview.md#the-default-environment). However, if you need to create a Dataverse instance within production or sandbox environments (other than the default environment), you're still required to have a premium Power Apps or Power Automate license. 

These limited capabilities of Dataverse are only available through select Microsoft 365 licenses and can't be used to run any custom Power Apps applications or Power Automate flows, or run any Power Virtual Agent bots, or use any other data that doesn't belong to the Microsoft 365 applications that take advantage of these capabilities. 

These limited capabilities aren't the common set included with every Office application. They can be different based on the Microsoft 365 applications that use these capabilities. For the complete list of various limited capabilities, customers should refer to the service description of these Microsoft 365 applications that contain these Dataverse plans. These limited capabilities of Dataverse don't entitle the licensed user to run standalone Power Apps or Power Automate, or any other Microsoft Power Platform applications that use Dataverse. 

Review the [Microsoft Project Service description](https://docs.microsoft.com/office365/servicedescriptions/project-online-service-description/project-online-service-description) for more details on the limited use of Dataverse that comes with Project. 

### Frequently asked questions

#### What are the select Office applications where Dataverse plans are included?

For now, the Dataverse service plan is included for Project. This list will evolve as more Office applications take advantage of Dataverse and Microsoft Power Platform.

#### Does this addition of Dataverse in Microsoft 365 mean that customers don't need a Power Apps license to use Dataverse?  

No, the capabilities of Dataverse included with select Microsoft 365 licenses don't allow customers to create custom apps with Power Apps or use the premium connectors with Power Automate. The capabilities included with this license entitle Microsoft 365 applications to use Dataverse for the purpose of enhancing the capabilities of the base Microsoft 365 application where Dataverse is included.

#### If customers can't use Dataverse, why is this being shown in the Microsoft 365 admin center during the license assignment experience?  

The service plan for Dataverse is shown to provide visibility to customers that Dataverse is being used to store and manage customer data related to the Microsoft 365 application that's using Dataverse. Additionally, this was communicated to all customers so that customers can prepare for this change and update any internal training or user documentation that they might need.

#### What will be the impact if the service plan for Dataverse is turned off (unselected)?  

Dataverse functionality appears as the **Common Data Service** plan in the **Apps** section of the Microsoft 365 admin center. Turning off the service plan will result in the Microsoft 365 features being disabled for the users of such a license. For example, when this capability is turned off, any Office application reading data from Dataverse will fail to load for the user.  

#### When can Office-licensed users be seen inside of Dataverse?

Users who have any Microsoft Power Platform or Dynamics 365 license are always synced into the Dataverse environments. However, for Office licenses where Dataverse service plans are included, users aren't automatically synced into Dataverse until the Office application is accessed by the user. After this occurs, the user can get access to Dataverse entities and records based on the additional security roles and privileges that the administrator assigned to this user. Such users, who just have the Office license, aren't automatically assigned any other security roles or privileges, other than the Maker role privilege in the [default environment](environments-overview.md#the-default-environment). As a security best practice, the administrator needs to ensure that security roles and privileges are assigned based on functional roles and needs only, and not automatically assigned based on the user being synced or present in Dataverse. 

### Known issues

- If you're an existing customer and a user with this license who comes directly to Dataverse, you might get an error message that states "You are not a member of the organization." We're addressing this problem in the coming weeks.
- We currently sync some of these Microsoft Dataverse licensed users to all Dataverse environments. We're addressing this right now. Currently, these users won't be able to open Power Apps for Microsoft 365 with this license.

## Power Apps and Power Automate Standalone plans

Standalone Power Apps and Microsoft flow plans provide users the ability to create and run apps across data sources that extend beyond Microsoft 365, such as Salesforce, on-premises and custom data sources. These plans also include access to Dataverse to store and manage data. Learn more: [What is Dataverse?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)

More details around pricing and capabilities of standalone plans can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Community Plan

If you want to build skills and learn more about Power Apps, Power Automate, and Dataverse, the Power Apps Community Plan is the right plan for you. The Power Apps Community Plan gives you a free development environment for individual use to learn with full functionality of Power Apps. More information: [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/).

## Power Apps and Power Automate for Dynamics 365

Power Apps is the platform to customize and extend applications in Dynamics 365, such as Dynamics 365 Sales and Customer Service, in context of the use rights.

Dynamics 365 Applications can be customized using Power Apps and Power Automate capabilities.

More information: [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544).

