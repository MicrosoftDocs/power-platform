---
title: "Create and use Power Apps environments in Power Virtual Agents"
description: "Environments store all the data and resources associated with the bots you create in Power Virtual Agents."
keywords: "onboarding, environments"
ms.date: 11/13/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: onboarding
ms.collection: virtual-agent
---
# Working with environments in Power Virtual Agents

With Power Virtual Agents, you can create bots in different environments and easily switch among them.

An environment is a space to store, manage and share your organization's business data. The bots you create are stored in an environment (apps and flows are also stored in environments). Environments may also have different roles, security requirements and target audiences. Each environment is created in a separate location. Learn more about [supported data locations](data-location.md).

## Leverage environments

You can use environments for a number of different scenarios, such as :

  - You can build all your bots in a single environment.
  - You might create separate environments that correspond to specific teams or departments in your company, each containing the relevant data and bots for each audience.
  - You might also create separate environments for different global branches of your company.

## Create a new environment for your bots

1. Go to [https://admin.powerplatform.com](https://admin.powerplatform.com) and sign in using your work account.

2. Go to the **Environments** tab and select **+ New** to open the **New environment** panel.

   ![Create environment](media/environments-create-1.png)
  
   - Specify a unique name for the environment
   - Select the environment type
   - Select a region where you want the environment to be created
   - Set **Create a new database** to **Yes**
   - Select **Next**.
   
   ![Create environment](media/environments-create-2.png)
   
   > [!NOTE]
   > The environment needs to be created in a supported region, otherwise you won't be able to use it when creating a bot.
   > Learn more about [supported data locations](https://go.microsoft.com/fwlink/?linkid=2106441).

3. Specify the details of the database, such as the language and currency type, then select **Save**.

4. You'll be returned to the Environments tab. Click **Refresh** to see the environment you just created. You'll also see a notice explaining that it may take a few minutes to fully create the environment.

5. Once the environment is created you can now return to the [Power Virtual Agents portal](https://go.microsoft.com/fwlink/?linkid=2093067) and use the environment to create a new bot.

## Create a bot in an existing environment
To create a bot in an existing environments, select the environment in the [bot creation window](authoring-first-bot.md).

![Select environment](media/select_environment_onboarding.png)

### Create a bot in an existing environment to which the user doesn't have access

In order to create a bot in an existing environment to which you don't have access. You will need to be a **system administrator** or contact your **system administrator** of the environment to complete the following.

1. Create a bot in the environment (this will install the necessary Power Virtual Agents solutions).

2. [Assign a Common Data Services (CDS) role of "bot author" to you in the environment](/power-platform/admin/create-users-assign-online-security-roles#assign-a-security-role-to-a-user).

You can then return to the [Power Virtual Agents portal](https://powerva.microsoft.com) and create a bot in the environment.

Resources to learn more:
- [Environments overview](https://docs.microsoft.com/en-us/power-platform/admin/environments-overview)
- [Configure environment securiy](https://docs.microsoft.com/en-us/power-platform/admin/database-security)

## Trial environments

Trial environments expire after 30 days. When the environment expires, all the bots in the environment will be deleted and the data associated with it, including the flows and resources you have been using, will be lost.

If you have created your own environment and selected **Trial** as the environment type, you'll receive emails shortly before it expires. In the Power Virtual Agents portal, you'll also see a notification if you have bots created in a trial environment that is going to expire in less than two weeks.

## Converting a trial environment to a production environment

When using a trial environment and you want to retain the bots for longer than 30 days, you must [convert the trial environment to a production environment](/power-platform/admin/trial-environments#convert-a-trial-environment-to-production).
