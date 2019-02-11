---
title: "About environments | MicrosoftDocs"
description: About environments.
ms.custom: ""
ms.date: 09/27/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# About environments

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Environments are containers that administrators can use to manage apps, flows, connections, and other assets; along with permissions to allow organization users to use the resources. Environments are tied to a geographic location that is configured at the time the environment is created. Environments can be used to target different audiences and/or for different purposes such as dev, test and production. The actual number and purpose of environments in your tenant is up to you as an administrator. In the ALM section of this paper we will cover some potential scenarios to help you choose what is best for you.

Common Data Service for Apps (CDS) databases are created in the context of environments. Each environment, if you are licensed for CDS, can have at most one database. If your organization signs up one of the Dynamics 365 Customer Engagement apps an environment with a CDS database will be created to support that application.

![Environments](media/Environments780.png "Environments")

## Environment security roles

Environments use security roles to determine what a user is able to do in the scope of that environment. The default roles that are available differ depending on if a CDS database has been created in the environment.

Environments without a CDS database have two built-in security roles: Environment Administrator and Environment Maker. Environment Makers can create and share apps, connectors, gateways etc. in the environment. Users in the Environment Maker, or Office 365 tenant Global Administrator role can all manage the environment which includes adding/removing users, creating the CDS instance, viewing and managing all resources created and setting Data Loss Prevention policies.

Once a CDS database has been created in an environment all users of the Environment Admin role will now be members of the System Administrator role instead. The CDS security roles will now take over for controlling security in the environment. Users or groups previously assigned Environment Maker role will need to be re-assigned manually one of the CDS security roles. The following are the initial CDS security roles that exist prior to you creating any custom roles.


|Role  |Description  |
|---------|---------|
|System Administrator     |This role takes over for the Environment Admin and has complete ability to customize and administer the environment. Users of the role also have full read-write access to data in the database. The role cannot be updated to change the privileges granted. Care should be taken in assigning this to the right people.         |
|System Customizer     |This role has full permission to customize the environment. The role’s data access is focused only on data owned by the user. This role can be modified but it is not recommended to modify.         |
|Environment Maker     |Can create new resources associated with the environment including apps, connections, gateways and flows. There is no default privileges to data included. This role can be modified but it is not recommended to modify.         |
|Common Data Service User     |This is a basic user role, with ability to run apps and perform common tasks but no ability to customize the system. The data access is focused on Read access to most Common Data Model core entities with full access to records owned by the user. This is a good role to consider copying to make a custom security role for users.         |
|Delegate     |This is a special role really design to give a user permission to Act on behalf of another user. For more information, see [Impersonate another user](https://docs.microsoft.com/dynamics365/customer-engagement/developer/org-service/impersonate-another-user).        |

In addition to these default roles, you can also create custom security roles. Custom security roles should be created to support applications built in your organization. Custom security roles can also come with applications you install from App Source or if your users sign up for Dynamics 365.

## Types of environments

There are multiple types of environments. The type of environment indicates the purpose and determines the environment characteristics. The following table summarizes the current types of environments that you might encounter.


|Type  |Description  |
|---------|---------|
|Production     |This is intended to be used for permanent work in an organization. It can be created and owned by an administrator or anyone licensed with a PowerApps P2 license. These environments are also created for each existing Dynamics 365 CDS database when it is upgraded to version 9.0 or later. Production environments are what you should use for any environments on which you depend.         |
|Default     | These are a special type of production environments. Each tenant will have a default environment created automatically and it has special characteristics described below in further detail.        |
|Sandbox     | These are non-production environments and when associated with a CDS database instance offer features like reset.        |
|Trial     | Trial environments are intended to support short term testing needs and are automatically cleaned up after a short period of time.        |
|Developer     | Developer environments are created by users with the Community Plan license. They are special environments intended only for use by the owner. Sharing with other users is not possible in these environments.        |

## Default environment

Each tenant will have a default environment created automatically in the region nearest the Azure Active Directory (Azure AD) tenant. This environment has a few unique characteristics from other environments that you create. This environment can’t be disabled or deleted. All tenant users are added automatically to the maker role for the default environment and you can’t remove them from that role. They are not however added automatically to the environment administrator role. This makes the default environment the perfect place for people to build personal productivity apps and flows.

The default environment is also the only place you can currently create gateways to connect to on-premises resources. So, if you have an application that needs on-premise resources the app, its connector and the gateway must be created and run from your organization’s default environment. It is planned to allow creation of gateways in the non-default environments in the future.

Another unique consideration of the default environment is you can’t create a Common Data Service for Apps database in the default environment. This however will be supported in the future.

## Environment regions

When you create an environment, you will pick a geographic location. Application components, including the CDS database will reside in that region. Generally, you will want to choose a location closest to the majority of your users that will be using applications in the particular environment. If you are connecting to other existing external resources, you should consider their location as well. You should also consider any data residency issues when choosing a location.

![Regions](media/regions.png "Regions")

## Who can create environments

As a global administrator in the admin portal you will be able to see a list of all environments created by users in your tenant. Administrators and users that have paid P2 or trial P2 licenses will be able to create new environments. Also users with the Community plan license can also create one Developer environment.

## Impact of multiple environments on users

While it might be tempting to have users partitioned off into smaller environments it is important to consider the impact on the users in that decision. When users access the PowerApps Canvas App Player or the Flow application from the Web Browser or Windows Store the user will select and work within a single environment. By default, that environment will be set to the tenant default environment. Users can change their environment in the players and portals using the environment selector.

![Default environment](media/DefaultEnvironment780.png "Default environment")

Having users’ applications and other assets spread across multiple environments will result in the user frequently having to adjust their environment setting. The best user experience is when the user stays within a single environment for most of their daily use.

In the mobile applications the user is presented with a consolidated list of applications across the environments they have access to. Each application indicates the environment. This reduces the need to switch, however it introduces the need for the user to choose the correct application. For example, imagine if you had an application Device Ordering and it was deployed to environment Test and environment Production. If the user had access to both environments it would show up twice on the list. The user would have to differentiate between the two. Some of this can be minimized by only granting access as needed and then only temporarily to the Test environment.

## Impact of multiple environments on Connectors

When an application uses a public connector (available for all tenants), the connector is configured for use within the context of an environment. Custom connectors are also configured in the context of an environment. If an app is moved to another environment the public connector references will be recreated upon import. Custom connectors must be re-configured manually in that target environment.

Applications that use the Common Data Service connector currently only can communicate with CDS databases in the same environment. This works well for apps that need to move between a dev, test and production instance because it adjusts automatically when imported into the next environment. Where this can be challenging is if you have two environments; one named Team Apps and another named CRM Data (which held your Dynamics 365 instance) an application using the CDS connector in the Team Apps environment would not be able to access data in the CRM Data instance. A current work around for this is to use the Dynamics 365 connector instead of the CDS connector since it can connect to multiple instances. That flexibility does result in more complexity if the application is moved from a dev, test to production and the instance needs to change as it is promoted, this must be done manually in the app once imported.

## Impact of multiple environments on CDS

When thinking about how to organize your environments you should consider where your data lives. Having a single production environment with your CDS is the simplest configuration as it makes accessing data from apps the easiest. Having multiple environments, each with their own CDS database, might make sense in a few different scenarios. First, users have data that is geographically separated, and they don’t share across those boundaries. Second, data from different applications that have conflicting incompatible use of CDS. Third, where users are building personal or team productivity applications that need CDS data but as an organization you aren’t ready to mix that with the rest of your enterprise data.