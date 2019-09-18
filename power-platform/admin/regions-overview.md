---
title: Regions overview | Microsoft Docs
description: Learn about regions in PowerApps
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/01/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Regions overview in PowerApps

## How do I find out where my app is deployed?

Your app is deployed in the region that hosts the environment. For example, if your environment is created in the Europe region, then your app is deployed in Europe data centers.

If you're an administrator, you can determine the region of each environment in the PowerApps Admin center.

- Go to the [admin center](https://admin.powerapps.com), and sign in with your work account.
  
    In the admin center, all existing environments are listed on the **Environments** tab. This list shows the **Region** where your app is deployed:
  
   ![Environments tab](./media/regions-overview/environment-list.png)

## What regions are available?

- Asia
- Australia
- Canada
- Europe
- France
- India
- Japan
- South America
- United Kingdom
- United States
- US Government (GCC)

## Who can create environments in these regions?

With PowerApps, you can create environments in various regions across the globe, which benefits your business in these ways:

- Store your data closer to your users
- Maintain the compliance requirement of your geography

You can create a database for an environment in one region (for example, United States) even if the Azure Active Directory (Azure AD) tenant is in another region (for example, Canada or Europe). Note the following:

- Tax laws prevent you from creating a database for an environment in India and Australia, if your Azure AD tenant is not in India and Australia respectively. You can get an exception for Australia.
- You can create an environment in the Preview (United States) region, regardless of where the Azure AD tenant is, but you can’t provision a database in that region.
- Only a US Government associated organization can create an environment in US Government (GCC).

|Your Azure AD tenant's home location  |Regions where you can create a database  |
|---------|---------|
|India     | Any region except Australia and Preview (United States)        |
|Australia     | Any region except India and Preview (United States)           |
|Any other location     | Any region except India, Australia, and Preview (United States)           |


## What features are specific to a given region?

Environments can be created in different regions, and are bound to that geographic location. When you create an app in an environment, that app is deployed in datacenters in that geographic location. This applies to any items you create in that environment, including  databases in the Common Data Service, apps, connections, gateways, and custom connectors.

For optimal performance, if your users are in Europe, create and use the environment in the Europe region. If your users are in the United States, create and use the environment in the U.S.

> [!NOTE]
> On-premises data gateways aren't available in the India region or in custom environments. You must create gateways in the default environment.

