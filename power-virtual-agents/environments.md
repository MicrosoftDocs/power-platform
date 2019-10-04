---
title: "Environments in Power Virtual Agents"
description: "How Power Virtual Agents use Environments"
keywords: "onboarding, environments"
ms.date: 12/02/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: mivakoc
ms.author: mivakoc
manager: mahesha
ms.custom: "VA"
ms.collection: virtualagent
---
# Environments and Power Virtual Agents

With Power Virtual Agents, you can create bots in different environments and easily switch among them.

An environment is a space to store, manage and share your organization's business data. The bots you create are stored in an environment (apps and flows are also stored in environments). Environments may also have different roles, security requirements and target audiences. Each environment is created in a separate location. Learn more about region support LINK to MULTIGEO

## How to leverage environments
- You may choose to build all your bots in a single environment
- You might create separate environments that correspond to specific teams or departments in your company, each containing the relevant data and bots for each audience.
- You might also create separate environments for different global branches of your company.

## How to create an environment

1. Go to [https://admin.powerplatform.com](https://admin.powerplatform.com) and sign in using your work or school account.

2. Select **+ New** to open the **New environment** creation experience.

   ![Create environment](media/environment-create-1.png)
  
   - Specify a unique name for the environment
   - Select the environment type
   - Select a region where you want the environment to be created
   - Set Create a new database to Yes
   - Then select **Next**.
   
   ![Create environment](media/environment-create-2.png)
   
   > [!NOTE]
   > The environment needs to be created in a supported region, otherwise you won't be able to use it when creating a bot.
   > See the list of supported regions [here](requirements-geographic-virtual-agent.md)

3. Specify the details of the database **Create database** and click **Save**


## Trial environments

Trial environments expire after 30 days. When the environment expires, all the bots in the environment will be deleted and the data associated with it, the flows, and resources you have been using will be lost.

If you have created your own environment and selected Trial as the environment type, you'll receive emails shortly before it expires.  In Power Virtual Agents, you'll see a notification if you have bots created in a trial environment that is going to expire in less than two weeks.

## Converting trial environment to production environment

When using a trial environment and you want to retain the bots longer than 30 days, convert the trial environment to a production environment. [Learn how to convert a trial environment to a production environment](https://go.microsoft.com/fwlink/?linkid=2048531).
