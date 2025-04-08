---
title: Configure user permissions
description: Learn how to configure user permissions to access the ALM Accelerator for Power Platform app and pipelines.
ms.topic: how-to
ms.date: 05/22/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# Configure user permissions

Makers can use the ALM Accelerator app to increase their productivity when they're developing solutions in Power Platform. Before your makers can use the app, you need to set up their user accounts in Microsoft Dataverse and Azure DevOps.

## Dataverse user setup

Users need to have the appropriate roles to access resources in Dataverse when they run the ALM Accelerator app. We recommend you create a [group team in Dataverse](/power-platform/admin/manage-teams), add your makers to it, and assign the appropriate roles to the team. Then you can add makers to and remove them from the group in Microsoft Entra to manage their access.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), and then select the environment in which the maker accounts exist.

1. In the **Access** section under **Teams**, select **See all**.

1. Select **Create team**.

1. Enter a **Team name**, and then select a **Business unit** and **Administrator**.

1. Select **Microsoft Entra ID Security Group** as the **Team type**.

1. Search for and select the name of the **Microsoft Entra ID Security Group** that you want to have access to the ALM Accelerator app.

1. Select members for **Membership type**.

1. Select **Next**.

1. Select the **ALM Power App Access** and **Basic User** roles, and then select **Save**.

> [!TIP]
> Create a group team to assign permissions to the ALM Accelerator admin app. Include the **ALM Power App Deployment Configuration** security role as a role on the group team. [Learn more about managing Dataverse teams](/power-platform/admin/manage-teams).

## Azure DevOps user setup

The service connections in the ALM Accelerator must provide user privileges to all makers who need access to them in all the environments they work in.

1. Sign in to Azure DevOps.

1. Open your project, and then in the lower-left corner, select **Project settings** to access project settings.

1. Select **Service connections**, and then in the **Service Connections** list, select the service connection to be shared with users.

1. Select **More** (**&hellip;**) in the upper-right corner, and then select **Security**.

1. In the **User or group** list, select the group or user you want to provide user permissions to.

1. Select the **User** for the **Role**, and then select **Add**.

  :::image type="content" source="media/setup-almacceleratorpowerplatform-users/SetServiceConnectionPermissions.png" alt-text="Screenshot of adding a user to a role in Azure DevOps.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

Repeat these steps for each service connection you want to share.

## Permissions for downstream environments

The ALM Accelerator has different scenarios that need to list the environments it can deploy solutions to. The signed-in user needs different roles in each environment.

The ALM Accelerator uses the Power Apps for Makers connector to list the environments users have access to either because they have the Environment Maker role or because they are owner or co-owner of an app in the environment and have permission to edit any app. When you change a user's role in an environment, a sync process takes place. It might take some time to propagate the changes. To test whether the changes have been synced, create a test canvas app that calls the Power Apps for Maker connector and validate the list of environments it retrieves.

The following table describes the permissions needed for each scenario in the ALM Accelerator.

| Scenario | Dataverse role | Description |
| -------- | -------------- | ----------- |
| Select a maker environment | Environment Maker or permission to edit any app | The signed-in user can list all the environments where they can import solutions or list solutions to commit. |
| Create a deployment profile | Environment Maker or permission to edit any app | The signed-in user can list all environments a solution can be deployed to. If you provide only the URL, you might have limited functionality with respect to connection references in the deployment settings. |
| Configure the deployment settings | Basic User | If the signed-in user needs to create or list connections, list teams for sharing in flows, and list teams to share in the custom connector, the user needs only the Basic User role in the environment. |

Deployment of solutions to downstream environments isn't based on the signed-in user. Instead, the deployment pipelines use the service principle. [Learn more about app registration strategies](/power-platform/guidance/coe/almaccelerator-app-registrations).

[Learn more about security roles and permissions in a Dataverse environment](/power-platform/admin/database-security#environments-with-a-dataverse-database).

## Next steps
>
> [!div class="nextstepaction"]
> [Configure pipelines](./configure-azuredevops-pipelines.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
