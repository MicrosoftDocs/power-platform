---
title: "Configuring the ALM Accelerator for Power Platform app user permissions | MicrosoftDocs"
description: "Configuring user permissions to access the ALM Accelerator for Power Platform app and pipelines."
author: jenschristianschroder
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Configuring user permissions for ALM Accelerator for Power Platform user setup (preview)

The ALM Accelerator for Power Platform app is intended to be used by makers to increase productivity while developing solutions in Microsoft Power Platform. The following instructions are for setting up a maker's user account in Microsoft Dataverse and Azure DevOps.

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. While in preview we will be prioritizing feedback and bugs via GitHub [New issue](https://github.com/microsoft/coe-starter-kit/labels/alm-accelerator). If the issue is something in the platform all we can do is funnel feedback to the responsible product teams. For more information on the current preview status of the ALM Accelerator for Power Platform see [follow this link](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md).

## Dataverse user setup

For users to be able to access resources in Dataverse when running the ALM Accelerator for Power Platform app, they need to be assigned the appropriate roles. To assign roles, we recommend that you create a group team in Dataverse to which all of your makers will be added and assign the appropriate roles to the team. Set up a group team as described in the following steps, and you'll be able to manage your makers with Azure Active Directory by adding and removing them from a group.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select the environment in which the user exists.

1. In the **Access** section under **Teams**, select **See all**.

1. Select **Create team**.

1. Enter a **Team name**, **Business unit**, and **Administrator**. 

1. Select **AAD Security Group** as the **Team type**, select a **Membership type**, and then select **Next**.

1. On the **Manage security roles** page, select the **ALM Power App Access** and **Basic User** roles, and then select **Save**.

## Azure DevOps user setup

For users to use the service connection from the ALM Accelerator for Power Platform app, the service connections must provide user privileges to all users who need access to the service connections. Update privileges as follows for environments that users need to access from the app (for example, development environments):

1. Go to Azure DevOps.

1. Open your project, and then in the lower-left corner, select **Organization settings** to access project settings.

1. Select **Service connections**, and then select the service connection to be shared with users from the **Service Connections** list.

1. Select **More (...)** in the upper-right corner, and then select **Security**.

1. Select the group or user you want to provide user permissions to in the **User or group** list.

1. Select the **User** for the **Role**, and then select **Add**.

   ![Select the group, user, and role.](media/setup-almacceleratorpowerplatform-users/SetServiceConnectionPermissions.png)

Repeat the preceding steps for each of the service connections you want to share.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
