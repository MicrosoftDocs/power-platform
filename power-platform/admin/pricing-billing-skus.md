---
title: Licensing overview | Microsoft Docs
description: Overview of licensing in Power Apps.
author: dileepsinghmicrosoft
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/24/2020
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
> 1. access the Project App if a project is shared with them
> 2. access Common Data Service in the default environment with Maker privileges
> 
> Users with Common Data Service service plan in a Microsoft 365 license, cannot:
> 1. run any custom apps or Power Apps for Microsoft 365
>
> These users should only get added to an environment once they access the environment or the app. We do not auto-sync these users to any environment.
> 
> **Known issues**
> - If you are an existing customer and a user with this license that comes directly to Common Data Service, you will get an error message that states “You are not a member of the organization”. We are addressing this problem in the coming weeks. 
> - We currently sync some of these Microsoft Common Data Service licensed users to all Common Data Service environments. We are addressing this right now. Currently, these users will not be able to launch Power Apps for Microsoft 365 with this license. 

## Power Apps and Power Automate Standalone plans

Standalone Power Apps and Microsoft flow plans provide users the ability to create and run apps across data sources that extend beyond Microsoft 365, such as Salesforce, on-premises and custom data sources. These plans also include access to Common Data Service to store and manage data. Learn more: [What is Common Data Service?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)

More details around pricing and capabilities of standalone plans can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Community Plan

If you want to build skills and learn more about Power Apps, Power Automate, and Common Data Service, the Power Apps Community Plan is the right plan for you. The Power Apps Community Plan gives you a free development environment for individual use to learn with full functionality of Power Apps. More information: [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/).

## Power Apps and Power Automate for Dynamics 365

Power Apps is the platform to customize and extend applications in Dynamics 365, such as Dynamics 365 Sales and Customer Service, in context of the use rights.

Dynamics 365 Applications can be customized using Power Apps and Power Automate capabilities.

More information: [Dynamics 365 Licensing
Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544).

