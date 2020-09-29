---
title: "Common Data Service capabilities with Microsoft 365 licenses   | MicrosoftDocs"
description: This topic covers Common Data Service capabilities with Microsoft 365 licenses. 
ms.date: 09/29/2020
ms.reviewer: 
ms.service: "power-platform"
ms.topic: "quickstart"
author: jimholtz
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Common Data Service capabilities with Microsoft 365 licenses

As Common Data Service continues to grow, more Microsoft applications like Microsoft Project are utilizing Common Data Service. To enable these Microsoft applications, limited Common Data Service functionalities are added to select Microsoft 365 licenses. This is achieved by adding a new service plan named "Common Data Service" within the Microsoft 365 licenses.  To see the new service plan in the Microsoft 365 admin center, select a user, select the **Licenses and Apps** tab, and then scroll down and expand the **Apps** section. 

> [!div class="mx-imgBorder"] 
> ![Common Data Service license](./media/common-data-service-license.png "Common Data Service license")

## Capabilities included 

Common Data Service functionality required by other Microsoft 365 applications appears as the "Common Data Service" service plan in the Apps section of the Microsoft 365 admin center.  

This new service plan allows select Microsoft/Office365 applications to leverage Common Data Service as a platform for storing application data and leverage the underlying business logic tier as part of extending application capabilities. This capability also helps these applications to use Common Data Service instances within [default environment](environments-overview.md#the-default-environment). However, if you need to create a Common Data Service instance within Production or Sandbox environments (other than Default environment) then you are still required to have a premium PowerApps or Power Automate license. 

These *limited* capabilities of Common Data Service are only available through select  Microsoft/Office 365 licenses  and cannot be used to run any Custom Power Apps applications or PowerAutomate flows or Power Virtual Agent bots or leverage any other data that doesn’t belong to the Microsoft/Office 365 applications that leverage these capabilities. 

These limited capabilities are not the same set but can be different based on the Microsoft/Office 365 applications that leverage these capabilities. For the complete list of various limited capabilities, customers are advised to refer to the service description of these Microsoft/Office 365 applications that contains these Common Data Service Plans. These limited capabilities of Common Data Service do not entitle the licensed user to run standalone Power Apps or Power Automate or any other Power Platform applications which leverage Common Data Service. 

Review the [Microsoft Project Service description](https://docs.microsoft.com/office365/servicedescriptions/project-online-service-description/project-online-service-description) for more details on the limited use of Common Data Service that comes with Microsoft Project. 

## Frequently asked questions

### What are the select Office applications where Common Data Service plans are included?  
For now, CDS service plan is included for Microsoft Project to begin with. And this list will evolve as more office applications leverage Common Data Service and Power Platform. 

### Does this addition of Common Data Service in Office 365 mean that customers don’t need a PowerApps license to use Common Data Service?  

No, the capabilities of Common Data Service included with select O365 licenses  does not allow customers to create custom apps with PowerApps or use the premium connectors with Power Automate. The capabilities included with this license entitles Office 365 applications to use Common Data Service for the purpose of enhancing the capabilities of the base Office 365 application where Common Data Service is included.

### If customers cannot use the Common Data Service, why is this being shown in the Microsoft 365 Admin center during the license assignment experience?  

The service plan for Common Data Service is included and visible to customers to provide visibility to customers that Common Data Service is being leveraged to store and manage customer data related to the Office 365 application using Common Data Service. Additionally, this was communicated to all customers so that customers can prepare for this change i.e. to update any internal training or user documentations that might be needed at customer’s end.  

### What will be the impact if the service plan for Common Data Service is turned off/unchecked?  

CDS functionality that appears as the **Common Data Service** plan in the Apps section of the Microsoft 365 admin center. Turning off the service plan will result in the Microsoft/Office365 features being disabled for the users of such license. For e.g. when this capability is turned off, any Office application reading the data from Common Data Service will fail to load for the user.  

### When can office licensed users be seen inside of Common Data Service?   

Users who have any Power Platform or Dynamics license, are always synced into the CDS environments. However, for above mentioned Office licenses where CDS service plans are included, users are not auto synced into Common Data Service until the Office application is accessed by the user. This user can now get access to Common Data Service entity and records based on the additional security roles and privileges that are assigned to this user, by the administrator. Such users with just the Office license is not auto-assigned any other security roles or privileges other than maker role privilege in [default environment](environments-overview.md#the-default-environment).  As a security best practice,  the administrator needs to ensure that security roles and privileges are assigned based on functional roles and needs only, and not auto-assigned based on the user being synced or present in Common Data Service.  