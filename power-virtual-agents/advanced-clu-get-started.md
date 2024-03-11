---
title: Get started with conversational language understanding integration
description: Create copilots that use Azure conversational language understanding in Microsoft Copilot Studio.
keywords: "Azure, conversational language understanding, PVA, CLU, CLU models"
ms.date: 7/11/2023
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: peterswimm
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"

---

# Get started with conversational language understanding integration 

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This article includes the step-by-step procedures you need to get started with [conversational language understanding (CLU) integration](advanced-clu-integration.md). Let’s get started.

Create a copilot using an existing CLU model:

1. [Prepare your environment](#prepare-your-environment).
2. [Prepare your conversational language understanding project](#prepare-your-conversational-language-understanding-project).
3. Map CLU intents and entities.
   - [Manually map intents](#manually-map-intents).
   - [Manually map entities](#manually-map-entities).
   - [Use the wizard to automatically map CLU intents and entities](#use-the-bulk-tool-wizard).
 
## Prepare your environment

Before you begin, make sure that you have your CLU model project name, deployment name, Cognitive Services account key, and site URL for Azure Cognitive Service for Language.
1. Create a new [Microsoft Copilot Studio](authoring-first-bot.md) copilot.

   > [!NOTE]
   > Ensure the [environment for your copilot](environments-first-run-experience.md) has been created in a [region supported by Microsoft Copilot Studio](data-location.md?tabs=web#data-locations) and which has an [equivalent CLU region](/azure/cognitive-services/language-service/conversational-language-understanding/service-limits#regional-availability).
   >
   > Not all regions supported by Microsoft Copilot Studio have an equivalent CLU region.


1. With your copilot open, expand the **Settings** tab on the side menu pane, select **Language understanding**, and then select **Manage connections in Power Apps** to open Power Apps.

   :::image type="content" source="media/advanced-clu-integration/clu-enable-language.png" alt-text="Screenshot of the Microsoft Copilot Studio web app with the Settings and Language menu options highlighted." border="false":::

   >[!NOTE]
   > If you have already enabled a CLU connection, skip to step 4.

1. In Power Apps, if the **Connections** menu is pinned to the navigation pane, select **Connections**. If the **Connections** menu isn't pinned, select **... More**, and then select **Connections**. 

    :::image type="content" source="media/advanced-clu-integration/clu-image2.png" alt-text="Language option to select NLU resource." border="false":::


1. Search for **Azure Cognitive Service for Language** and then select the **+** next to this connection.

    :::image type="content" source="media/advanced-clu-integration/clu-image14.png" alt-text="Selection of Azure Cognitive Service for Language to make instance of this connection type." border="false":::

1. In the **Azure Cognitive Service for Language configuration** window, choose `Api Key` as authentication type, enter your account key and site URL, and select **Create**.

    :::image type="content" source="media/advanced-clu-integration/clu-image15.png" alt-text="Configuration window of instance of Azure Cognitive Service for Language connection." border="false":::

1. Once Power Apps creates the connector, return to the **Connections in <environment>** page, search for and select your new connection and then select **Edit** at the top of the page.

1. In the **Azure Cognitive Service for Language configuration** window, enter a display name to distinguish it from other CLU connectors and reenter the account key, and then select **Create**.

    :::image type="content" source="media/advanced-clu-integration/clu-image19.png" alt-text="Revisit config window for Azure Cognitive Service for Language connection instance." border="false":::

1. In Copilot Studio, select **Refresh**, then under **Natural language understanding**, select **Azure Cognitive Service for Language** from the **NLU Resource** list.

    :::image type="content" source="media/advanced-clu-integration/clu-image16.png" alt-text="New connection visible in Copilot Studio under NLU Resource." border="false":::

    > [!NOTE]
    > If you you see the following, then you are not connected to **Azure Cognitive Service for Language**. Follow step 3 to connect.
    > 
    > :::image type="content" source="media/advanced-clu-integration/nlu-not-azure-connected-27Jun23.png" alt-text="Language option menu when not connected to Azure Congintive Service for Language." border="false":::

1. Select **Save** at the top of the page and select **Yes, continue** in the confirmation message.

1. To save copilot content, in the **Delete example trigger phrases?** option, select **Save snapshot**. This action saves copilot content including trigger phrases and copilot dialogues into a backlog file in YAML format.

1. Enter your project name and deployment information, and select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image5.png" alt-text="Choose a project and model in Azure Cognitive Service for Language." border="false"::: 

   > [!NOTE]
   > Changing back to the NLU environment removes the **Analyze text** system topic. It also requires you to manually add example phrases for topics currently mapped to external intents.
   >

You’re ready to map intents and entities to CLU model data. 

## Prepare your conversational language understanding project

1. If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.
2. Create a language resource in [Language Studio](https://language.cognitive.azure.com/), with the [conversational language understanding](/azure/cognitive-services/language-service/conversational-language-understanding/quickstart?pivots=language-studio) feature enabled.

   > [!NOTE]
   > To ensure PVA functions correctly, create intents for [Power Virtual Agent's system topics](authoring-system-topics.md) and [any custom topics](authoring-create-edit-topics.md) you want to author.
   >
3. Author [any custom entities](/azure/cognitive-services/language-service/conversational-language-understanding/concepts/entity-components) you want to use in your Microsoft Copilot Studio project.
4. Train and deploy the project in the same region as your Microsoft Copilot Studio resource.

## Map CLU intents and entities to Microsoft Copilot Studio prebuilt data types

You create a new Microsoft Copilot Studio copilot by mapping existing topics to CLU intents. You can manually map intents and entities, or for bulk mapping, see [Use the Bulk tool wizard](#use-the-bulk-tool-wizard).
### Manually map intents:

1.	Open your [Microsoft Copilot Studio](authoring-first-bot.md) copilot.

1. From the left navigation, select **Topics**.

    :::image type="content" source="media/advanced-clu-integration/clu-menu-topics.png" alt-text="Select Topics from the left navigation." border="false"::: 

1. In the *Phrases* section of the Trigger node, select the **Edit** link.

    :::image type="content" source="media/advanced-clu-integration/map-intent-phrases.png" alt-text="Select the Edit link." border="false"::: 

1. In the *Add phrases* box, enter the name of the CLU intent that you want to map to.

    :::image type="content" source="media/advanced-clu-integration/type-intent-name.png" alt-text="Enter CLU intent name." border="false"::: 

    > [!NOTE]
    > The CLU intent name must be typed exactly as stored in the CLU model, including matching case as uppercase and lowercase characters. 

1. To save the intent, select the + (plus) sign to the right of the *Add phrases* box.
 
### Manually map entities:

1. Open your [Microsoft Copilot Studio](authoring-first-bot.md) copilot.

1. From the left navigation, select **Entities**.

    :::image type="content" source="media/advanced-clu-integration/clu-image13.png" alt-text="Select Entities from the left navigation." border="false"::: 

1. Select **New entity** on the **Entities** page.
    :::image type="content" source="media/advanced-clu-integration/clu-image11.png" alt-text="Select + New entity to create a new entity." border="false"::: 

1.	In the **New entity** pane, Add a *name, description* (optional), and *Data Type* for your entity.
    :::image type="content" source="media/advanced-clu-integration/clu-image12.png" alt-text="Enter the name, description, and data type for your new entity." border="false"::: 
 
1.	To access CLU prebuilt entities, from the Data Type drop-down menu, select **From sample data**, and choose one of the CLU prebuilt JSON code snippets.  
1.	(Optional) If you want to import JSON schema from a sample file, choose **Get schema from sample JSON** to access the external file. 

##  Use the Bulk tool wizard

You create a new copilot by bulk mapping existing topics to CLU intents using the **Map intents and entities** wizard. With the wizard, your copilot can automatically utilize existing intents from your CLU model rather than trigger phrases to determine which article to map to. 

Begin by uploading your CLU model data file and automatically map CLU intents to your Microsoft Copilot Studio copilot.

1.	From the left navigation, select **Language**, then **Add topics and entities from model data**. 
1.	In the **File name** option, select **Choose file** to select the data file that you want to upload your CLU model from.
1.	You then see your model data file in the **Preview** window. Select **Next** to continue.
1.	select **Add intents and entities**.
1.	In the **Map existing topics to CLU intents** screen, choose a CLU intent to map to the corresponding  article. 
    :::image type="content" source="media/advanced-clu-integration/clu-image7.png" alt-text="Map existing topics to CLU intents." border="false"::: 
1.	Review your selections, then select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image9.png" alt-text="Review your selection and then select Save." border="false"::: 

1.	(Optional) For those intents that aren't mapped to an existing article, you can create new topics for each intent. 
    In the wizard, you see a list of CLU intents that aren't mapped to an article. In the field **Create a new topic**, enter a name for each of the topics that you want to create, and then select **Next**.  
    :::image type="content" source="media/advanced-clu-integration/clu-image10.png" alt-text="Create new topics for CLU intents." border="false"::: 

    > [!NOTE]
    > Any fields that you leave blank are ignored by the wizard.

1.	Once all CLU intents and entities are mapped to Microsoft Copilot Studio topics, select **Done**.
    :::image type="content" source="media/advanced-clu-integration/clu-image8.png" alt-text="Add intents and entities and select Done to finish." border="false"::: 

Your copilot topics now appear in the Microsoft Copilot Studio **Topics** pane. For more information, see [Managing topics](authoring-topic-management.md).

## Related topics

- [Entity registration](advanced-clu-entity-registration.md)
