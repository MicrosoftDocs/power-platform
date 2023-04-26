---
title: "Get started with language understanding with CLU integration"
description: "Get started creating bots in Power Virtual Agents bots with CLU integration"
keywords: "Cognitive language understanding, PVA, CLU, CLU models"
ms.date: 4/03/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent

---

# Get started with language understanding

This topic includes the step-by-step procedures you need to get started with [cognitive language understanding (CLU) integration](advanced-clu-integration.md). Let’s get started.

Below are the steps to create a bot using an existing CLU model:

1. [Prepare your environment](#prepare-your-environment)
1. Map CLU intents and entities using one of the following options:
    1. [Use the wizard to automatically map CLU intents and entities](#map-clu-intents-and-entities-to-power-virtual-agents-topics)
    1. [Manually map intents and entities](#manually-map-clu-intents-and-entities-to-power-virtual-agents-pre-built-data-types)

## Prepare your environment

1. Before you begin, make sure that you have your CLU model project name and deployment name.
1. Create a new Power Virtual Agents bot. For more information, see [Authoring your first bot](authoring-first-bot.md).
1. From the left navigation, choose **Language**.
1. From the **NLU Resource** drop-down list, choose **Power Virtual Agent NLU**.
    :::image type="content" source="media/advanced-clu-integration/clu-image1.png" alt-text="Language option to select NLU resource." border="false":::

1. In Power Apps, choose the **Connections** menu, select **…More**, and then search for **Azure Cognitive Service for Language**.

    :::image type="content" source="media/advanced-clu-integration/clu-image2.png" alt-text="Azure Cognitive Service for Language." border="false":::

1. Select the **+ (plus sign)** on the to the right of the connector name, to display the authentication settings page. 
1. Enter the  display name, API key, account key, site URL, then select **Save**. Once Power Apps creates the connector, return to your PVA bot.
    :::image type="content" source="media/advanced-clu-integration/clu-image3.png" alt-text="Type display name, authentication type, account key, and Site URL." border="false"::: 

1. To view it in the **Connections** list, right click the **Azure Cognitive Service for Language** connector and select **Edit**. 
1. Change the display name to something else to distinguish it from other CLU connectors. The name you type to change can be any name you choose.
1. From the left navigation in Power Virtual Agents, choose **Language**, then in the **NLU Resource** drop-down list, choose [*the name you typed in step 9*] then select **Save**.
1. In the **Delete example trigger phrases?** option, select **Save snapshot**. This saves the bot content, including trigger phrases, bot dialogues into a backlogs file in YAML format.
    :::image type="content" source="media/advanced-clu-integration/clu-image4.png" alt-text="Click Save snapshot to delete example trigger phrases." border="false"::: 
 
1. Enter your project name and deployment information, and then select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image5.png" alt-text="Choose a project and model in Azure Cognitive Service for Language." border="false"::: 

1. Switch back to Power Virtual Agents. Changing back to the NLU environment removes the **Analyze text** system topic. It also requires you to manually add example phrases for topics currently mapped to external intents.
    :::image type="content" source="media/advanced-clu-integration/clu-image6.png" alt-text="Switch to Power Virtual Agents NLU." border="false"::: 

Now that you’ve completed preparing your environment, you’re ready to create a new bot and map intents and entities to CLU model data. 
## Map CLU intents and entities to Power Virtual Agents pre-built data types

You create a new Power Virtual Agents bot by mapping existing topics to CLU intents. You can manually map intents and entities, or for bulk mapping, see [Use the Bulk tool wizard](#use-the-bulk-tool-wizard).
### Manually map intents:

1.	Create a new Power Virtual Agents bot.

1. From the left navigation, select **Topics**.

    :::image type="content" source="media/advanced-clu-integration/clu-menu-topics.png" alt-text="Select Topics from the left navigation." border="false"::: 

1. In the *Phrases* section of the Trigger node, click the **Edit** link.

    :::image type="content" source="media/advanced-clu-integration/map_intent-phrases.png" alt-text="Select the Edit link." border="false"::: 

1. In the *Add phrases* box, type the name of the CLU intent that you want to map to.

    :::image type="content" source="media/advanced-clu-integration/type-intent-name.png" alt-text="Type CLU intent name." border="false"::: 

    > [!NOTE]
    > The CLU intent name must be typed exactly as is in the CLU model including matching case as uppercase and lowercase characters. 

1. Click the + (plus) sign to the right of the *Add phrases* box to save the intent.
 
### Manually map entities:

1. Open your Power Virtual Agents bot.	

1. From the left navigation, select **Entities**.

    :::image type="content" source="media/advanced-clu-integration/clu-image13.png" alt-text="Select Entities from the left navigation." border="false"::: 

1. Select **New entity** on the **Entities** page.
    :::image type="content" source="media/advanced-clu-integration/clu-image11.png" alt-text="Select + New entity to create a new entity." border="false"::: 

1.	In the **New entity** pane, Add a *name, description* (optional), and *Data Type* for your entity.
    :::image type="content" source="media/advanced-clu-integration/clu-image12.png" alt-text="Type in name, description, and data type for your new entity." border="false"::: 
 
1.	To access CLU pre-built entities, from the Data Type drop-down menu, select **From sample data**, and choose one of the CLU pre-built JSON code snippets.  
1.	(Optional) If you want to import JSON schema from a sample file, choose **Get schema from sample JSON** to access the external file. 

##  Use the Bulk tool wizard

You create a new bot by bulk mapping existing topics to CLU intents using the **Map intents and entities** wizard. With the wizard, your bot can automatically utilize existing intents from your CLU model rather than trigger phrases to determine which topic to map to. 

Begin by uploading your CLU model data file and automatically map CLU intents to your Power Virtual Agents bot.

1.	From the left navigation, select **Language**, then **Add topics and entities from model data**. 
1.	In the **File name** option, select **Choose file** to select the data file that you want to upload your CLU model from.
1.	You then see your model data file in the **Preview** window. Select **Next** to continue.
1.	select **Add intents and entities**.
1.	In the **Map existing topics to CLU intents** screen, choose a CLU intent to map to the corresponding PVA topic. 
    :::image type="content" source="media/advanced-clu-integration/clu-image7.png" alt-text="Map existing topics to CLU intents." border="false"::: 
1.	Review your selections, then select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image9.png" alt-text="Review your selection and then select Save." border="false"::: 

1.	(Optional) For those intents that are not mapped to an existing PVA topic, you can create new topics for each intent. 
    In the wizard, you’ll see a list of CLU intents that haven’t been mapped to a PVA topic. In the field **Create a new topic**, type a name for each of the topics that you want to create, and then select **Next**.  
    :::image type="content" source="media/advanced-clu-integration/clu-image10.png" alt-text="Create new topics for CLU intents." border="false"::: 

    > [!NOTE]
    > Any fields that you leave blank are ignored by the wizard.

1.	Once all CLU intents and entities are mapped to PVA topics, select **Done**.
    :::image type="content" source="media/advanced-clu-integration/clu-image8.png" alt-text="Add intents and entities and click Done to finish." border="false"::: 

Once you’ve competed this procedure, your bot topics now appear in the Power Virtual Agents **Topics** pane. For more information, see [Managing topics](authoring-topic-management.md).


For more information, see [Entity registration](advanced-clu-entity-registration.md).
