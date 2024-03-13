---
title: Get started with conversational language understanding integration
description: Create copilots that use Azure conversational language understanding in Microsoft Copilot Studio.
ms.date: 21/2/2024
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: peterswimm
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"

---

# Get started with conversational language understanding integration 

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This topic includes the step-by-step procedures you need to get started with [conversational language understanding (CLU) integration](advanced-clu-integration.md). Let’s get started.

Below are the steps to create a copilot using an existing CLU model:

1. [Prepare your environment](#prepare-your-environment).
2. [Prepare your conversational language understanding project](#prepare-your-conversational-language-understanding-project).
3. Map CLU intents and entities:
   - [Manually map intents](#manually-map-intents).
   - [Manually map entities](#manually-map-entities).
   - [Use the wizard to automatically map CLU intents and entities](#use-the-bulk-tool-wizard).
 
## Prepare your environment

Before you begin, make sure that you have your CLU model project name and deployment name.
1. Create a new [Microsoft Copilot Studio](authoring-first-bot.md) copilot.

   > [!NOTE]
   > Ensure the [environment for your copilot](environments-first-run-experience.md) has been created in a [region supported by Microsoft Copilot Studio](data-location.md?tabs=web#data-locations) and which has an [equivalent CLU region](/azure/cognitive-services/language-service/conversational-language-understanding/service-limits#regional-availability).
   >
   > Not all regions supported by Microsoft Copilot Studio have an equivalent CLU region.

2. With your bot open, expand the **Settings** tab on the side menu pane and select **Language understanding**.

   :::image type="content" source="media/advanced-clu-integration/clu-enable-language.png" alt-text="Screenshot of the Microsoft Copilot Studio web app with the Settings and Language understanding menu options highlighted." border="false":::

   >[!NOTE]
   > If you have already enabled a CLU connection, skip to step 8.

   > [!NOTE]
   > If you you see the following, then you are **not** connected to **Azure Cognitive Service for Language**. Follow steps 3-7 to connect.
   > 
   > :::image type="content" source="media/advanced-clu-integration/nlu-not-azure-connected.png" alt-text="Language understanding option menu when not connected to Azure Cognitive Service for Language." border="false":::

3. To create a new connection, from within Power Apps, open the **Connections** menu by selecting **...More** and then **Connections**. 

    :::image type="content" source="media/advanced-clu-integration/clu-image2.png" alt-text="Azure Cognitive Service for Language." border="false":::

4. Select **New connection** and search for **Azure Cognitive Service for Language**. This will take you to an authentication settings page.

5. Select API key for authentication type, enter account key and site URL, then select **Create**. 
    :::image type="content" source="media/advanced-clu-integration/clu-image3.png" alt-text="Enter display name, authentication type, account key, and Site URL." border="false":::

6. To view the connection in the **Connections** list, select the **Azure Cognitive Service for Language** connector and select **Edit** in the More commands menu. 
7. Change the display name to something else to distinguish it from other CLU connectors. The name you enter to change can be any name you choose. With the connector created and configured in Power Apps, you can return to your Microsoft Copilot Studio copilot.

8. In the **Language understanding** tab in Copilot Studio, choose **Microsoft Copilot Studio NLU** from the **NLU Resource** drop-down list.

    :::image type="content" source="media/advanced-clu-integration/clu-image1.png" alt-text="Language understanding option to select NLU resource." border="false":::

9. Choose the display name you chose earlier for the CLU connector, then select **Save**. A **Delete example trigger phrases?** window opens.
10. Select **Save snapshot**. This saves the copilot content, including trigger phrases and bot dialogues into a backlog file in YAML format. Select **Yes, delete my trigger phrase** and then select **Continue**.

    :::image type="content" source="media/advanced-clu-integration/clu-image4.png" alt-text="Select Save snapshot to delete example trigger phrases." border="false"::: 
 
11. Enter your project name and deployment information, and select **Save**.
    :::image type="content" source="media/advanced-clu-integration/clu-image5.png" alt-text="Choose a project and model in Azure Cognitive Service for Language." border="false"::: 

In Microsoft Copilot Studio, on the **Language understanding** tab, select **Save**. Changing the NLU configuration removes the **Analyze text** system topic. It also requires you to manually add example phrases for topics currently mapped to external intents.


:::image type="content" source="media/advanced-clu-integration/clu-image6.png" alt-text="Switch to Microsoft Copilot Studio NLU." border="false"::: 

Now that you’ve completed preparing your environment, you’re ready to map intents and entities to CLU model data. 

## Prepare your conversational language understanding project

1. If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.
2. Then create a language resource in [Language Studio](https://language.cognitive.azure.com/), with the [conversational language understanding](/azure/cognitive-services/language-service/conversational-language-understanding/quickstart?pivots=language-studio) feature enabled.
3. To ensure Copilot Studio functions correctly, you'll need to create intents for [Copilot Studio system topics](authoring-system-topics.md) and for [any custom topics](authoring-create-edit-topics.md) you want to create.

4. Author [any custom entities](/azure/cognitive-services/language-service/conversational-language-understanding/concepts/entity-components) you want to use in your Microsoft Copilot Studio project.
5. Train and deploy the project in the same region as your Microsoft Copilot Studio resource.

## Map CLU intents and entities to Microsoft Copilot Studio prebuilt data types

You create a new Microsoft Copilot Studio copilot by mapping existing topics to CLU intents. You can manually map intents and entities, or for bulk mapping, see [Use the Bulk tool wizard](#use-the-bulk-tool-wizard).

### Manually map intents

1.	Open your [Microsoft Copilot Studio](authoring-first-bot.md) copilot.

1. From the left navigation, select **Topics and plugins** and select an intent.

    :::image type="content" source="media/advanced-clu-integration/clu-menu-topics.png" alt-text="Select Topics from the left navigation." border="false"::: 

1. In the *Phrases* section of the Trigger node for the intent, select the **Edit** link.

    :::image type="content" source="media/advanced-clu-integration/map-intent-phrases.png" alt-text="Select the Edit link." border="false"::: 

1. In the *Add phrases* box, enter the name of the CLU intent that you want to map to.

    :::image type="content" source="media/advanced-clu-integration/type-intent-name.png" alt-text="Enter CLU intent name." border="false"::: 

    > [!NOTE]
    > The CLU intent name must be typed exactly as stored in the CLU model, including matching case as uppercase and lowercase characters. 

1. Click the + (plus) sign to the right of the *Add phrases* box to save the intent.
2. Repeat for the other intents.
 
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

You create a new copilot by bulk mapping existing topics to CLU intents using the **Map intents and entities** wizard. With the wizard, your copilot can automatically utilize existing intents from your CLU model rather than trigger phrases to determine which topic to map to. 

Begin by uploading your CLU model data file and automatically map CLU intents to your Microsoft Copilot Studio copilot.

1.	From the left navigation, select **Language**, then **Add topics and entities from model data**. 
1.	In the **File name** option, select **Choose file** to select the data file from which you want to upload your CLU model.
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

1.	Once all CLU intents and entities are mapped to Microsoft Copilot Studio topics, select **Done**.
    :::image type="content" source="media/advanced-clu-integration/clu-image8.png" alt-text="Add intents and entities and select Done to finish." border="false"::: 

Once you’ve competed this procedure, your copilot topics now appear in the Microsoft Copilot Studio **Topics** pane. For more information, see [Managing topics](authoring-topic-management.md).

## Related topics

- [Entity registration](advanced-clu-entity-registration.md)
