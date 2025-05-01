---
title: "Migrate default and Dataverse for Teams environments  | MicrosoftDocs"
description: The article provides information about how to migrate the default environment within a tenant.
ms.topic: conceptual
ms.date: 11/28/2022
ms.subservice: admin
author: sericks007
ms.author: iyanni
ms.reviewer: sericks007
---

# Migrate default and Dataverse for Teams environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The [default](environments-overview.md#default-environment) and [Dataverse for Teams](about-teams-environment.md) environments are special types of environments that are created by the system. In most cases, system administrators can't decide the geographical region for these types of environments. This choice is made for them based on the country or region selected during the account creation.

In some cases, the geographical region selected by the system isn't the ideal choice for the customer and their Power Platform users. This article describes your options to address such situation.

## Environment region

You can find the geographical region of your environments by selecting **Environments** in the left pane of the Power Platform admin center, and then view the information under the **Region** column.

:::image type="content" source="media/view-env-region.png" alt-text="View your environment's region":::

## Migrate the default environment

You must contact Microsoft support for this operation.

### Before you migrate

Migrating the default environment can impact certain types of applications installed in the old environment. Make sure that you've assessed the impact and prepare a strategy for post migration in terms of exporting apps and flows or other mitigation. It's also recommended that you communicate the impact and expectations to users of the default environment. Here's a list of known Microsoft applications impacted by this operation and possible mitigations:

- **Power Automate**: Instant flows will be inaccessible after the migration. All other types of Power Automate flows won't be affected.

- **SharePoint embedded forms apps**: These won't be affected. Existing forms will continue to run in the old default environment. New forms will be created in the new default environment. You'll need to delete and recreate the old app from the old environment if it's important that it runs in the new default environment.

- **Microsoft Project Roadmap**: all roadmap data will be unavailable after the migration. The app will behave like a new deployment.  

- **Microsoft Project for the Web**: All Project for the Web data will be unavailable after the migration. The app will behave like a new deployment

Microsoft support may be able to assist you in identifying which applications are installed and used in the Default environment.

### How to migrate the default environment

Working with Microsoft support, you'll identify a new or existing environment in another geographical region of your choice to become the new default environment for the tenant.

> [!NOTE]
> The new or existing environment in another region that you want to designate as the new default environment must not have a Dataverse database. More information: [Create an environment without a database](create-environment.md#create-an-environment-without-a-database)<br/><br/>You can determine if an environment has a database from the environment details page in the Power Platform admin center. An environment without a database will have an option to add a database.

You must understand that the existing default environment isn't moved to the target geographical region. Instead, a new or existing environment in a region of your choice is set as the new default environment for the tenant with the help of Microsoft support.

After you've identified an environment to be, set as the new default environment, Microsoft support will run a command to do the same and change the old default environment to Production environment.

> [!IMPORTANT]
> After this change, the old environment will follow the Production-type environment cycle and security procedure. For example, any new users added to the old environment won't be automatically assigned a Maker security role.

### Post migration

After the default environment migration, you may add a Dataverse database to the new default environment and if necessary export apps, flows, and other data from the old (Production) environment and import to the new default environment.

## Migrate Dataverse for Teams environment

Migrating Dataverse for Teams type environments between geographical regions is typically not supported. There are certain conditions that Microsoft support would make an exception and help moving Dataverse for Teams to a different geographical region. Although some of the considerations described above for the default environment also applies to Dataverse for Teams environment, the process is different. For Teams a geo-to-geo move is performed by Microsoft support. More information: [Geo to geo migrations](geo-to-geo-migrations.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
