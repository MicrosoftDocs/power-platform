---
title: "ALM Accelerator for Power Platform user set-up | MicrosoftDocs"
description: "Configuring user permissions to access the ALM Accelerator for Power Platform app and pipelines."
author: mikefactorial
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# ALM Accelerator for Power Platform User Setup (Preview)

The AA4PP App is intended to be used by makers to increase productivity while developing solutions in Power Platform. Below are instructions for the set-up of a maker's user account in Microsoft Dataverse and DevOps.

> [!NOTE]
> ALM Accelerator for Power Platform (AA4PP) is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Dataverse user set-up

So users can access resources in Dataverse when running the AA4PP app they need to be assigned the appropriate roles. The recommended way to assign roles is to create a group team in Dataverse to which all of your makers will be added and assign the appropriate roles to the team. Set-up a group team as follows and you'll be able to manage your makers using Azure AD by adding and removing them from a group.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select the environment in which the user exists.
1. Select **See all** under **Teams** in the **Access** section.
1. Select **Create team**.
1. Enter a **Team name**, **Business unit**, and **Administrator**. 
1. Select **AAD Security Group** as the **Team type**, select a **Membership type**, and then select **Next**.
1. On the **Manage security roles** page, select the **ALM Power App Access** and **Basic User** roles, and then select **Save**.

## DevOps user set-up

For users to use the service connection from the ALM Accelerator app the service connections must provide user privileges to all users who should have access to the service connections. Update privileges as follows for environments that user's should be able to access from the app, for example, development environments:

1. Go to Azure DevOps.

1. Open your project, and then select **Organization settings** in the bottom left corner to access project settings.

1. Select **Service connections**, and then select the service connection to be shared with users from the **Service Connections** list.

1. Select the **...** in the top-right corner, and then select **Security**.

1. Select the group or user you want to provide user permissions to in the **User or group** list.

1. Select the **User** for the **Role**, and then select **Add**.

   ![Select the group, user, and role](media/setup-almacceleratorpowerplatform-users/SetServiceConnectionPermissions.png)

1. Repeat the steps above for each of the service connections you want to share.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
