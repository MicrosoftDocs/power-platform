---
title: "Choose the region when setting up an environment"
description: "Learn about the factors in selecting a region when creating a new environment in Microsoft Power Platform admin center."
author: sericks007

ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/28/2024
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
---
# Regions overview 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

For multinational companies with employees and customers distributed around the world, you can create and manage environments specific to your global regions. You can create an environment in a different region than where your tenant resides. Local environments can provide quicker data access for users in that region. Be sure to read [A multi-environment deployment](multiple-online-environments-tenants.md#a-multi-environment-deployment) to understand the features of multiple environments.  

## How do I find out where my app is deployed?

Your app is deployed in the region that hosts the environment. For example, if your environment is created in the Europe region, then your app is deployed in Europe data centers.

### Using Power Platform admin center
If you're an administrator, you can determine the region of each environment in the Power Platform admin center.

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, locate the **Region** column.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, locate the **Region** column.
---

## What regions are available?

Select the **View Report** button in [Dynamics 365 and Microsoft Power Platform availability](https://dynamics.microsoft.com/geographic-availability/).

## Who can create environments in these regions?

With Power Apps, you can create environments in various regions across the globe, which benefits your business in these ways:

- Store your data closer to your users
- Maintain the compliance requirement of your geography

You can create a database for an environment in one region (for example, United States) even if the Microsoft Entra tenant is in another region (for example, Canada or Europe). Note the following:

- Tax laws prevent you from creating a database for an environment in India and Australia, if your Microsoft Entra tenant is not in India and Australia respectively. You can get an exception for Australia.
- Only a US Government associated organization can create an environment in US Government (GCC).

|Your Microsoft Entra tenant's home location  |Regions where you can create a database  |
|---------|---------|
|India     | Any region except Australia        |
|Australia     | Any region except India           |
|Any other location     | Any region except India and Australia           |


## What features are specific to a given region?

Environments can be created in different regions, and are bound to that geographic location. When you create an app in an environment, that app is deployed in datacenters in that geographic location. This applies to any items you create in that environment, including  databases in the Microsoft Dataverse, apps, connections, gateways, and custom connectors.

For optimal performance, if your users are in Europe, create and use the environment in the Europe region. If your users are in the United States, create and use the environment in the U.S.

> [!NOTE]
> On-premises data gateways aren't available in the India region.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
