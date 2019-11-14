---
title: "Create a Power Apps environment"
description: "Learn how to create a Power Apps environment for Power Virtual Agents."
ms.date: 07/01/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Create a Power Apps environment

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

When you create a bot, you must select a Power Apps environment for the bot. You can use an existing environment or create one.

<iframe width="560" height="315" src="https://www.youtube.com/embed/YL14y3jQbBE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## To create a new Power Apps environment

1. Go to [https://admin.powerapps.com](https://admin.powerapps.com) and sign in using your work or school account.

2. Select **New environment** to open the **New environment** dialog box.

    Specify a unique name for the environment, select a supported region, and the environment type. Then select **Create environment**.

    > [!NOTE]
    > The environment needs to be created with a region listed in the [supported data locations](data-location.md) topic, otherwise you won't be able to use it when creating a bot.
    > Trial environments expire after 30 days. You'll lose all bots created in the trial environment when it expires.

   ![Create environment](media/create-environment-2.png)

   Power Apps creates the environment and displays a prompt asking if you want to create a database.

3. Select **Create database** to display the **Create a database for this environment** screen.

   ![Create database](media/create-database.png)

4. Select your currency, language, and clear the checkbox for **Include sample apps and data** and then select **Create database**.

   > [!NOTE]
   > Clearing "Include sample apps and data" will speed up the process of environment creation.

   ![Create database](media/create-database-2-1.png)


5. You will know that the environment is ready when you see an its ID in parenthesis after the environment name. It might take up to 5 minutes before you are ready to use the environment when [creating a new bot](getting-started-create-bot.md).

    ![Environment is ready when string id is appended](media/environment-ready.png)
    

## Trial environments

Trial environments expire after 30 days. When the environment expires, all the bots in the environment will be deleted and the data associated with it, the flows, and resources you have been using will be lost.

If you have created your own environment and selected Trial as the environment type, you'll receive emails shortly before it expires.  In the Power Virtual Agents Designer, you'll see a message if you have bots created in a trial environment that is going to expire in 14 days or less. The message will show the name of the environment that is going to expire, the days remaining to expiration, and the names of the bots affected. This pertains only to trial environments that you have created yourself or been granted access to.

When using a trial environment and you want to retain the bots longer than 30 days, convert the trial environment to a production environment. [Learn how to convert a trial environment to a production environment](https://go.microsoft.com/fwlink/?linkid=2048531).

To convert to a production environment, the following criteria must be met:

1. You are eligible to use a suitable Power Apps plan that enables you to create production environments.
2. You need to have available production quota. There is a fixed number of production environments you can create with your plan.
