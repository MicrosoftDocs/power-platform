---
title: Get started with conversational language understanding integration
description: Create bots that use Azure conversational language understanding in Power Virtual Agents.
keywords: "Azure, conversational language understanding, PVA, CLU, CLU models"
ms.date: 7/11/2023
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: peterswimm
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Get started with conversational language understanding integration 

This topic includes the step-by-step procedures you need to get started with [conversational language understanding (CLU) integration](advanced-clu-integration.md). Let’s get started.

Below are the steps to create a bot using an existing CLU model:

1. [Prepare your environment](#prepare-your-environment).
2. [Prepare your conversational language understanding project](#prepare-your-conversational-language-understanding-project).
3. Map CLU intents and entities:
   - [Manually map intents](#manually-map-intents).
   - [Manually map entities](#manually-map-entities).
   - [Use the wizard to automatically map CLU intents and entities](#use-the-bulk-tool-wizard).
 
## Prepare your environment

Before you begin, make sure that you have your CLU model project name and deployment name.
1. Create a new [Power Virtual Agents](authoring-first-bot.md) bot.

> [!NOTE]
> Ensure the [environment for your bot](environments-first-run-experience.md) has been created in a [region supported by Power Virtual Agents](data-location.md?tabs=web#data-locations) and which has an [equivalent CLU region](/azure/cognitive-services/language-service/conversational-language-understanding/service-limits#regional-availability).
>
> Not all regions supported by Power Virtual Agents have an equivalent CLU region.

2. With your bot open, expand the **Settings** tab on the side menu pane and select **Language**.

   :::image type="content" source="media/advanced-clu-integration/clu-enable-language.png" alt-text="Screenshot of the Power Virtual Agents web app with the Settings and Language menu options highlighted." border="false":::

   >[!NOTE]
   > If you have already enabled a CLU connection, skip to step 4.

3. To create a new connection, from within Power Apps, choose the **Connections** menu, select **…More**, and then search for **Azure Cognitive Service for Language**.

    :::image type="content" source="media/advanced-clu-integration/clu-image2.png" alt-text="Azure Cognitive Service for Language." border="false":::

4. From the **NLU Resource** drop-down list, choose **Power Virtual Agent NLU**.

    :::image type="content" source="media/advanced-clu-integration/clu-image1.png" alt-text="Language option to select NLU resource." border="false":::

> [!NOTE]
> If you you see the following, then you are not connected to **Azure Congnitive Service for Language**. Follow step 3 to connect.
> 
> :::image type="content" source="media/advanced-clu-integration/nlu-not-azure-connected-27Jun23.png" alt-text="Language option menu when not connected to Azure Congintive Service for Language." border="false":::

5. Select the **+ (plus sign)** on the to the right of the connector name, to display the authentication settings page. 
6. Enter the display name, API key, account key, site URL, then select **Save**. Once Power Apps creates the connector, return to your Power Virtual Agents bot.
    :::image type="content" source="media/advanced-clu-integration/clu-image3.png" alt-text="Enter display name, authentication type, account key, and Site URL." border="false"::: 

7. To view it in the **Connections** list, right click the **Azure Cognitive Service for Language** connector and select **Edit**. 
9. Change the display name to something else to distinguish it from other CLU connectors. The name you enter to change can be any name you choose.
8. From the left navigation in Power Virtual Agents, choose **Language**, then in the **NLU Resource** drop-down list, choose [*the name you typed in the last step*], then select **Save**.
9. In the **Delete example trigger phrases?** option, select **Save snapshot**. This saves the bot content, including trigger phrases and bot dialogues into a backlog file in YAML format.

    :::image type="content" source="media/advanced-clu-integration/clu-image4.png" alt-text="Select Save snapshot to delete example trigger phrases." border="false"::: 
 
10. Enter your project name and deployment information, and select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image5.png" alt-text="Choose a project and model in Azure Cognitive Service for Language." border="false"::: 

Next, switch back to Power Virtual Agents. Changing back to the NLU environment removes the **Analyze text** system topic. It also requires you to manually add example phrases for topics currently mapped to external intents.

:::image type="content" source="media/advanced-clu-integration/clu-image6.png" alt-text="Switch to Power Virtual Agents NLU." border="false"::: 

Now that you’ve completed preparing your environment, you’re ready to map intents and entities to CLU model data. 

## Prepare your conversational language understanding project

1. If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.
2. Then create a language resource in [Language Studio](https://language.cognitive.azure.com/), with the [conversational language understanding](/azure/cognitive-services/language-service/conversational-language-understanding/quickstart?pivots=language-studio) feature enabled.
3. Note, to ensure PVA functions correctly, you will need to create intents for [Power Virtual Agent's system topics](authoring-system-topics.md) and for [any custom topics](authoring-create-edit-topics.md) you may want to author.
4. Author [any custom entities](/azure/cognitive-services/language-service/conversational-language-understanding/concepts/entity-components) you want to use in your Power Virtual Agents project.
5. Train and deploy the project in the same region as your Power Virtual Agents resource.

## Map CLU intents and entities to Power Virtual Agents prebuilt data types

You create a new Power Virtual Agents bot by mapping existing topics to CLU intents. You can manually map intents and entities, or for bulk mapping, see [Use the Bulk tool wizard](#use-the-bulk-tool-wizard).
### Manually map intents:

1.	Open your [Power Virtual Agents](authoring-first-bot.md) bot.

1. From the left navigation, select **Topics**.

    :::image type="content" source="media/advanced-clu-integration/clu-menu-topics.png" alt-text="Select Topics from the left navigation." border="false"::: 

1. In the *Phrases* section of the Trigger node, select the **Edit** link.

    :::image type="content" source="media/advanced-clu-integration/map-intent-phrases.png" alt-text="Select the Edit link." border="false"::: 

1. In the *Add phrases* box, enter the name of the CLU intent that you want to map to.

    :::image type="content" source="media/advanced-clu-integration/type-intent-name.png" alt-text="Enter CLU intent name." border="false"::: 

    > [!NOTE]
    > The CLU intent name must be typed exactly as stored in the CLU model, including matching case as uppercase and lowercase characters. 

1. Click the + (plus) sign to the right of the *Add phrases* box to save the intent.
 
### Manually map entities:

1. Open your [Power Virtual Agents](authoring-first-bot.md) bot.	

1. From the left navigation, select **Entities**.

    :::image type="content" source="media/advanced-clu-integration/clu-image13.png" alt-text="Select Entities from the left navigation." border="false"::: 

1. Select **New entity** on the **Entities** page.
    :::image type="content" source="media/advanced-clu-integration/clu-image11.png" alt-text="Select + New entity to create a new entity." border="false"::: 

1.	In the **New entity** pane, Add a *name, description* (optional), and *Data Type* for your entity.
    :::image type="content" source="media/advanced-clu-integration/clu-image12.png" alt-text="Enter the name, description, and data type for your new entity." border="false"::: 
 
1.	To access CLU prebuilt entities, from the Data Type drop-down menu, select **From sample data**, and choose one of the CLU prebuilt JSON code snippets.  
1.	(Optional) If you want to import JSON schema from a sample file, choose **Get schema from sample JSON** to access the external file. 

##  Use the Bulk tool wizard

You create a new bot by bulk mapping existing topics to CLU intents using the **Map intents and entities** wizard. With the wizard, your bot can automatically utilize existing intents from your CLU model rather than trigger phrases to determine which topic to map to. 

Begin by uploading your CLU model data file and automatically map CLU intents to your Power Virtual Agents bot.

1.	From the left navigation, select **Language**, then **Add topics and entities from model data**. 
1.	In the **File name** option, select **Choose file** to select the data file that you want to upload your CLU model from.
1.	You then see your model data file in the **Preview** window. Select **Next** to continue.
1.	select **Add intents and entities**.
1.	In the **Map existing topics to CLU intents** screen, choose a CLU intent to map to the corresponding  topic. 
    :::image type="content" source="media/advanced-clu-integration/clu-image7.png" alt-text="Map existing topics to CLU intents." border="false"::: 
1.	Review your selections, then select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image9.png" alt-text="Review your selection and then select Save." border="false"::: 

1.	(Optional) For those intents that are not mapped to an existing topic, you can create new topics for each intent. 
    In the wizard, you’ll see a list of CLU intents that haven’t been mapped to a topic. In the field **Create a new topic**, enter a name for each of the topics that you want to create, and then select **Next**.  
    :::image type="content" source="media/advanced-clu-integration/clu-image10.png" alt-text="Create new topics for CLU intents." border="false"::: 

    > [!NOTE]
    > Any fields that you leave blank are ignored by the wizard.

1.	Once all CLU intents and entities are mapped to Power Virtual Agents topics, select **Done**.
    :::image type="content" source="media/advanced-clu-integration/clu-image8.png" alt-text="Add intents and entities and select Done to finish." border="false"::: 

Once you’ve competed this procedure, your bot topics now appear in the Power Virtual Agents **Topics** pane. For more information, see [Managing topics](authoring-topic-management.md).

## Related topics

- [Entity registration](advanced-clu-entity-registration.md)
