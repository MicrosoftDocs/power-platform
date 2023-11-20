---
title: "Export and import bots using solutions (contains video)"
description: "Transfer bots between environments by adding them to Power Apps solutions."
keywords: "export, import, transfer, environment, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: digantak
manager: leeclontz
ms.custom: "customization, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Export and import bots using solutions

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can export and import bots using [solutions](/power-platform/alm/solution-concepts-alm) so you can move your bots across multiple [environments](/power-platform/admin/environments-overview).

This can be useful if you use different environments for different purposes, or you employ ring-deployment methodologies. For example, you might have a specific environment where you internally test and validate bots, another environment where you test bots for only a subset of users, and a final production environment where you share bots with customers and end users.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4CsHl]
>

> [!NOTE]
> You can't export [topic-level or node-level comments](authoring-comments.md) when you export a bot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- A maker will require the minimum System Customizer security roles to use this feature. Learn more about [configuring user security to resources in an environment](/power-platform/admin/database-security).

# [Web app](#tab/webApp)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Move your bots across [environments](/power-platform/admin/environments-overview) by exporting and importing them using [solutions](/power-platform/alm/solution-concepts-alm). Exporting and importing your bots can be useful if you use different environments for different purposes or if you employ ring-deployment methodologies. For example, you might have one environment where you internally test and validate bots, another where you test bots with a subset of users, and a production environment where you share your bots with customers.

### Things to know

- You can't export [topic-level or node-level comments](authoring-comments.md) when you export a bot.

- Removing a bot from a solution doesn't remove its components from the solution. You should remove the components separately.  

    > [!WARNING]
    >
    > Don't remove unmanaged bot components, such as bot topics, directly from the Power Apps portal unless you've removed the bot from the solution.  
    >
    > You should only make changes to topics from Microsoft Copilot Studio. Removing or changing a bot's components from Power Apps will cause the export and import to fail.

- You can't export managed solutions. When you create a solution, it's unmanaged by default. If you change it to a managed solution, you won't be able to export it. You'll need to create a new solution.

- If your bot has a large number of components (for example, more than 250 topics or more than 100 entities), export it using the classic Power Apps portal instead.

> [!NOTE]
> You'll need the minimum System Customizer security roles to export and import bots using solutions. Learn more about [configuring user security to resources in an environment](/power-platform/admin/database-security).

### Create a solution to manage export and import

You use solutions to export bots from one environment and import them into another. The solution acts as a "carrier" for the bots. You can export and import multiple bots in one solution.

1. In Microsoft Copilot Studio, open the bot you want to export.

> [!NOTE]
> If you are using a **Classic** bot, in the navigation menu select **Chatbots** to open the **Chatbots** page and view all the bots you have access to in this environment.

2. In the navigation menu, under **Settings**, select **Bot details**, and then select **Export**.

    :::image type="content" source="media/authoring-export-import-bots/export-settings.png" alt-text="Screenshot of the Bot details settings page in Microsoft Copilot Studio, with the Export button highlighted.":::

> [!NOTE]
> If you ar using a **Classic** bot, select the bot you want to export, then select **Export chatbot**.

:::image type="content" source="media/authoring-export-import-bots/export-chatbot-list.png" alt-text="Screenshot of the export button on teh general setting page.":::

3. Select **Go to Power Apps Solutions**.

    :::image type="content" source="media/authoring-export-import-bots/export-settings-powerapps.png" alt-text="Screenshot of the bot export prompt.":::

4. In Power Apps, on the **Solutions** tab, select **New solution**.

    :::image type="content" source="media/authoring-export-import-bots/export-new-solution.png" alt-text="Screenshot of the Power Apps Solutions page, with the New solution button highlighted.":::

5. Enter the following information for the new solution:

    | Field        | Description   |
    | ------------ | ------------- |
    | Display name | The name that's shown in the list of solutions. You can change it later. |
    | Name         | The unique name of the solution, generated from **Display name**. You can edit it before you save the solution, but after you save the solution, you can't change it. |
    | Publisher    | Select the default publisher or create a new one. We recommend that you create a publisher that you can use consistently across the environments where you'll use the solution. Learn more about [solution publishers](/powerapps/maker/common-data-service/change-solution-publisher-prefix). |
    | Version      | Enter a number for the version of your solution. The version number is included in the file name when you export the solution. |

6. Select **Create**.

### Add your bot to the solution

1. The solution you created should be open. If it isn't, select it in the list of solutions.

1. Select **Add existing**, and then select **Chatbot**.

1. In the **Add existing chatbots** list, select the bot or bots you want to export, and then select **Add**.

> [!NOTE]
> The following applies to **Classic** bots.

4. If you're using [skills](advanced-use-skills.md), remove the skill's environment variables **Current Value** by selecting **Remove from this solution**.

    :::image type="content" source="media/authoring-export-import-bots/EnvVariableRemoveCurrentValue.png" alt-text="Screenshot showing the Remove from this solution button.":::

> [!NOTE]
> Removing a bot from a solution doesn't remove its components from a solution. Removal of the components should be done separately.  

> [!WARNING]
> Don't remove any unmanaged chatbot subcomponents (such as bot topics) directly from the Power Apps portal, unless you have removed the bot itself from the solution.  
>
> You should only make changes to topics from within the Microsoft Copilot Studio portal.  
>
> Removing or changing the chatbot subcomponents from within Power Apps will cause the export and import to fail.


### Export the solution with your bot

You export and import bots by exporting and importing the solutions that contain them from one environment to another.

> [!IMPORTANT]
> If your bot has a large number of components (for example, more than 250 topics or more than 100 entities), see [Export using the classic experience](/power-apps/maker/data-platform/export-solutions#export-using-the-classic-experience).

1. In the Power Apps **Solutions** page, select the solution that contains your bot, and then select **Export solution**.

    :::image type="content" source="media/authoring-export-import-bots/export-solution.png" alt-text="Screenshot of the Export solution button in Power Apps.":::

1. In the **Before you export** pane, select **Next**.

1. Enter or select the following options:

    | Option         | Description  |
    | -------------- | ------------ |
    | Version number | Microsoft Copilot Studio automatically increments your solution version. You can accept the default or enter your own. |
    | Export as      | Select the package type, either **Managed** or **Unmanaged**. Learn more about [managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions). |

1. Select **Export**.

The export can take several minutes to complete. Watch the status message at the top of the **Solutions** page. When the export is finished, your browser downloads a .zip file. The file name is in the format `SolutionName_Version_ManagementType.zip`; for example, MyBotPublisher_1.0.0.0.1_Unmanaged.zip.

## Import the solution with your bot

1. In Power Apps, select the environment where you want to import your bot.

    :::image type="content" source="media/authoring-export-import-bots/export-power-apps-environment.png" alt-text="Screenshot of selecting a Power Apps environment.":::

1. In the **Solutions** page, make sure that no solutions are selected, and select **Import solution**.

    :::image type="content" source="media/authoring-export-import-bots/export-import.png" alt-text="Screenshot of the Power Apps Solutions page, with the Import solutions button highlighted.":::

1. In the **Import a solution** pane, select **Browse**, select the .zip file that contains the solution with your bot, and then select **Next**.

1. Select **Import**.

1. Wait a few moments while the import completes. View the results, and then select **Close**.

    If the import isn't successful, select **Download Log File** to download an XML file that contains details about what caused the import to fail. The most common reason an import fails is that the solution didn't contain some required components.

1. If your bot has [user authentication](configuration-end-user-authentication.md) enabled, you'll need to configure it again.

1. In the **Objects** pane select **Chatbot**. Then select the bot's name to open the bot in the Microsoft Copilot Studio portal.

    :::image type="content" source="media/authoring-export-import-bots/select-bot.png" alt-text="Screenshot of a list of bots and environments in Microsoft Copilot Studio.":::

    You can also open Microsoft Copilot Studio directly and then open your bot in the environment you imported it to.

> [!IMPORTANT]
>
> - You must [publish your imported bot](publication-fundamentals-publish-channels.md) before it can be shared.
> - It may take up to 24 hours for your bot's icon to appear everywhere.

### Add components to a chatbot in a custom solution

If you add components, such as topics or flows, to your bot in Microsoft Copilot Studio, you'll also need to add them to the bot in your unmanaged solution.

1. Open your solution in the Power Apps portal.

1. Select **Chatbots**, and then select your bot in the list.

1. Select **Commands** (**&vellip;**), select **Advanced**, and then select **+Add required objects**.

    :::image type="content" source="media/authoring-export-import-bots/export-add-required-components.png" alt-text="Screenshot highlighting the Add required components option under the Commands menu in Power Apps.":::

### Upgrade or update a solution with a chatbot

Learn how to [upgrade or update a solution](/powerapps/maker/common-data-service/update-solutions).

### Remove an unmanaged layer from a managed chatbot

Managed and unmanaged solutions exist at different levels in a Microsoft Dataverse environment. To learn more, go to [Solution layers](/powerapps/maker/common-data-service/solution-layers).

When you edit a managed component, such as a topic or a flow, it gets an unmanaged "Active" layer. To show the latest updates after you deploy the solution, you'll need to remove that layer.

Use the **See solution layers** option to see all solutions that a component is a part of. You can also see one "Active" solution on top of all other solutions if you've changed something directly.

1. Open your solution in the Power Apps portal.

1. Select **Chatbots**, and then select your bot in the list.

1. Select **Commands** (**&vellip;**), select **Advanced**, and then select **See solution layers**.

   :::image type="content" source="media/authoring-export-import-bots/export-solution-layers.png" alt-text="Screenshot highlighting the See solution layers option under the Commands menu in Power Apps.":::

1. In the **Solution Layers** page, select the unmanaged layer, and then select **Remove unmanaged layer**.

# [Teams](#tab/teams)
 
In Microsoft Teams, you can export and import chatbots between individual teams using the Power Apps Teams app.

You might want to do this to copy a working chatbot into a new team so you don't have to build it from scratch.

### Export your bot in Teams

Follow the instructions in the section titled **Export customizations from Dataverse for Teams** in the [Move customizations between environments](/powerapps/teams/import-solution-in-teams#export-customizations-from-dataverse-for-teams) topic.

When selecting the customizations to export, select the bot you want to export. You can use the filter on the side pane to only show bots within that team.

The chatbot will be saved into the **Downloads** folder on your PC.

### Import your bot in Teams

Follow the instructions in the section titled **Import customizations into Dataverse for Teams** in the [Move customizations between environments](/powerapps/teams/import-solution-in-teams#import-customizations-into-dataverse-for-teams) topic.

Your imported bot will now appear in the Microsoft Copilot Studio app in Teams, under the team you imported it into.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
