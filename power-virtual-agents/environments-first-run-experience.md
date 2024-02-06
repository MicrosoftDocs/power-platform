---
title: "Create and use Power Apps environments"
description: "Environments store all the data and resources associated with the copilots you create in Microsoft Copilot Studio."
keywords: "onboarding, environments, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: onboarding, ceX
ms.service: power-virtual-agents

---
# Working with environments in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

With Microsoft Copilot Studio, you can create copilots in different environments and easily switch between them.

An environment is a space to store, manage, and share your organization's business data. The copilots you create are stored in an environment (apps and flows are also stored in environments). Environments may also have different roles, security requirements and target audiences, and each environment is created in a separate location. See the following topics for more information:

- [Supported data locations](data-location.md)
- [Power Platform environments overview](/power-platform/admin/environments-overview)

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Leverage environments

There are many strategies for using multiple environments. For example, you can:

- Create separate environments that correspond to specific teams or departments in your company, each containing the relevant data and copilots for each audience.
- Create separate environments for different global branches of your company.
- Create separate environments to satisfy data residency requirements.

You can also build all your copilots in a single environment if you don't need or want to use different ones.

> [!NOTE]
> We recommend using a non-default production environment for copilots that you want to deploy to production.  
>
> [Learn more about types of environments](/power-platform/admin/environments-overview#types-of-environments).

## Create a new environment for your copilots

When you first sign in and create a new copilot, a default environment is created for you.

You can, however, create additional environments by using the [Power Platform Admin Center](/power-platform/admin/create-environment).

1. Go to [https://admin.powerplatform.com](https://admin.powerplatform.com) and sign in using your work account. Use the same tenant that you use for Microsoft Copilot Studio.

1. Go to the **Environments** tab and select **+ New** to open the **New environment** pane.

   :::image type="content" source="media/environments-first-run-experience/environments-create-1.png" alt-text="Create environment." border="false":::
  
   - For **Name**, specify a unique name for the environment.
   - For **Type** select the environment type.

      > [!NOTE]
      > A production environment is intended for production scenarios and won't be subject to the same restrictions as a [trial environment](#trial-environments).
      > If you are trying out Microsoft Copilot Studio for free, you'll need to make sure you set the environment to **Trial**. The standard limitations for [trial environments](#trial-environments) apply.

   - For **Region** select the [support data region](data-location.md) where you want the environment to be created.
   - Set **Add a Dataverse data store?** to **Yes**
   - Select **Next**.

      :::image type="content" source="media/environments-first-run-experience/environments-create-2.png" alt-text="Enter the environment details." border="false":::

      > [!NOTE]
      > The environment needs to be created in a supported region, otherwise you won't be able to use it when creating a copilot.
      > More information: [Supported data locations](./data-location.md).

1. Specify the details of the dataverse, such as the language, currency type, and security group and then select **Save**.

1. You'll be returned to the **Environments** tab. Select **Refresh** to see the environment. You'll also see a notice explaining that it may take a few minutes to fully create the environment.

1. After the environment is created, you can return to the [Microsoft Copilot Studio portal](https://go.microsoft.com/fwlink/?linkid=2093067) and use the environment to create a new copilot.

## Create a copilot in an existing environment

To create a copilot in an existing environment, select the environment in the  environment switcher near the right side of the header..

### Create a copilot in an existing environment where you don't have access

To create a copilot in an environment where you don't have access, you'll need to be a system administrator or contact the system administrator. You then need to complete the following:

1. Create a copilot in the environment (this step will install the necessary Microsoft Copilot Studio solutions).

1. Assign the security role of "copilot author" to you in the environment. More information: [Create users and assign security roles](/power-platform/admin/create-users-assign-online-security-roles#assign-a-security-role-to-a-user).

You can then return to the [Microsoft Copilot Studio portal](https://web.powerva.microsoft.com) and create a copilot in the environment.

More information:

- [Power Platform - Environments overview](/power-platform/admin/environments-overview)
- [Power Platform - Configure environment security](/power-platform/admin/database-security)

## Trial environments

When you trial Microsoft Copilot Studio, you can create trial environments that expire after 30 days. When the environment expires, all the copilots in the environment will be deleted. The data associated with the bot, including any flows and resources you have been using, will be lost.

If you have created your own environment and selected **Trial** as the environment type, you'll receive email messages shortly before it expires. In the Microsoft Copilot Studio portal, you'll also see a notification if you have copilots created in a trial environment that is going to expire in less than two weeks.

:::image type="content" source="media/environments-first-run-experience/ennvironemnt_expiration_notification.png" alt-text="Environment expiration notification.":::

> [!NOTE]
> Note that there is a difference between an expiring environment and an expiring license. If your license is expiring, you will be able to extend it without losing any data. More information: [Sign up for a Microsoft Copilot Studio trial](sign-up-individual.md#trial-expiration).

## Converting a trial environment to a production environment

When using a trial environment and you want to retain the copilots for longer than 30 days, you must [convert the trial environment to a production environment](/power-platform/admin/trial-environments#convert-a-trial-environment-to-production).

## Supported operations

Microsoft Copilot Studio supports the following environment lifecycle operations, as described in [Power Platform environments overview](/power-platform/admin/environments-overview):

- [Back up and restore](/power-platform/admin/backup-restore-environments)
- [Delete](/power-platform/admin/delete-environment)
- [Recover](/power-platform/admin/recover-environment)
- [Copy](/power-platform/admin/copy-environment)
- [Reset](/power-platform/admin/reset-environment)

The following operation is unsupported:

- [Move](/power-platform/admin/move-environment-tenant)

## Known issues with creating a copilot

When you are creating your copilot, you might encounter the following issues.

### Insufficient permissions for the selected environment

In this case, you see this error: "You do not have permissions to any environments. Please get access from an administrator."

You will need to [create a new environment](environments-first-run-experience.md). Use that environment to create your copilot.

### The environment doesn't show up in the drop-down menu of Microsoft Copilot Studio

Your environment might not show up in the drop-down menu due to one of the following:

- The environment doesn't have a database created. To resolve this issue, go to [admin.powerplatform.com](https://admin.powerplatform.com) to [create a database in your environment](/power-platform/admin/create-database).
- The environment is created in an unsupported region. More information: [Supported data locations](data-location.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
