---
title: "Unified authoring canvas migration guidance"
description: "Guidance to migrate your Microsoft Copilot Studio copilots to the updated unified authoring canvas. "
ms.date: 05/23/2023
ms.topic: how-to
author: iaanw
manager: leeclontz
ms.author: scritchley
ms.reviewer: iawilt
---

# Considerations for the latest Microsoft Copilot Studio unified authoring release

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The latest Microsoft Copilot Studio release is now here and generally available (GA). This release brings a major update to the Copilot Studio product. The release introduces a significant number of updates and improvements, empowering organizations to build conversational experiences that are valuable and relevant to their customers and internal users.

With the release of our latest version of Copilot Studio, now is the time to consider migrating from your classic Power Virtual Agents experience to the latest version of Copilot Studio. This guide aims to help readers understand some of the significant improvements within this release, and areas to consider when it comes to your organization migrating your classic Power Virtual Agents experience.

## Upgrading to Copilot Studio unified authoring

If you already created one or more classic bots using Power Virtual Agents, you might be wondering what the process is for upgrading to the latest release of Copilot Studio.

### Cloning an existing Power Virtual Agents classic bot to a Copilot Studio copilot

To help the upgrade experience, at launch, there's a new clone feature that's now available on classic bots built using Power Virtual Agents.

:::image type="content" source="media/unified-authoring-conversion/clone-experience.png" alt-text="Screenshot of the window on the homepage to clone an existing Power Virtual Agents bot.":::

This feature clones the selected Power Virtual Agents classic bot, and creates a new copilot that uses the latest unified authoring version. There are some important considerations to be aware of in this cloning process, such as the following considerations:

- The cloning process is only available in the same language from the source classic bot to target the copilot experience.
- The cloning process only clones topics built using the Microsoft Copilot Studio web canvas (not topics built using Bot Composer).
- The cloning process clones entities and associated synonyms and custom entities.
- A copilot administrator needs to reconfigure authorization, channels, and security settings in the cloned unified authoring copilot.
- Any Bot Framework Skills from the Power Virtual Agents classic bot would need to be reconnected with the cloned unified authoring copilot.
- The connection to Power Automate Flows, built using the Copilot Studio web canvas, are cloned and associated within the topic within the cloned unified authoring topic. However, we strongly recommend that the connections are tested.
- Consideration should be given for any custom canvas and other custom architecture components you might have previously connected to your Power Virtual Agents classic bot. These custom components would need to be reconnected or reconfigured to your new cloned unified authoring copilot and tested. In addition, wider consideration should be given to your entire architecture. This consideration includes any effect within that architecture that might have been updated since the updating of your classic bot (and it's bot ID).
- Any automated deployment pipelines would need to be updated if utilizing the Power Virtual Agents classic bot ID or any reference to the classic bot.
- Any custom reporting to your new copilot deployment should be updated. Examples include if the custom data pipeline solution is being used or alternative reporting solutions.

> [!IMPORTANT]
> This may not be an exhaustive list based on your current implementation and architecture. Ensure you complete the required testing for your copilot before deploying to production, even if you're using the clone feature to migrate your copilot between versions.

> [!NOTE]
> In the future there may be other tools available to assist with migration of classic bots and we would appreciate your feedback on the topic of feature migration. [Please submit feature requests](https://portal.productboard.com/fdeco3ykgkwvchtg4qbdowug/tabs/1-under-consideration)

By migrating your classic bot from Power Virtual Agents to Copilot Studio unified authoring, you can access the latest features within Copilot Studio unified authoring. These Copilot Studio features include GPT-enabled features, variable management and Power FX, code view, events, and so much more. You can take the opportunity to add extra value to your copilot and, as a result, an improved experience for your customers.

## What's new or updated in the latest Copilot Studio

The following overview isn't an exhaustive list of new features or updates in Copilot Studio unified authoring. It aims to highlight the significant new capabilities now available within the authoring experience of Copilot Studio, or significant changes that should be brought to the attention of readers.

> [!IMPORTANT]
> To review more detail about the core capabilities and features of Copilot Studio, check out the [Getting Started Guide](fundamentals-get-started.md)

### Creating a new copilot

When creating a brand new copilot by selecting **New copilot** under the **Copilots** item in the main navigation, there's a new copilot creation process where copilot makers can name the copilot, specify the copilot's language, and also get started with boosted conversations (public preview feature)

Additionally, you can configure **Advanced Information** including the icon, choose to include (or not include) lesson topics, and also select the default solution and default schema name for new topics. When you select the schema name, it directly utilizes the prefix from the selected solution.

> [!TIP]
> For more information on Boosted Conversations, see the following subsections, as well as the feature documentation included in this article.

:::image type="content" source="media/unified-authoring-conversion/new-bot.png" alt-text="Screenshot of the new copilot wizard screen":::

### User Interface Changes

Many user interface updates were made with the aim to make the copilot maker and administration experience easier and more intuitive. The updates begin with the copilot creation experience, but don't end there. The following improvements also include:

- *Creating a New Topic*: Users are no longer able to create topics using Bot Composer. Copilot makers can create a new topic manually or use Copilot Studio.
- *Trigger tags*: You now see all types of triggers within the topic view, and different triggers due to the events feature, such as *Message Received*.
- *Connectors within a topic*: Previously the connectors between nodes were curved.
- *Topic User Interface*: More nodes are now available on the creation menu within the authoring canvas, new productivity panel and extended menu to include copilot and variables. 
- *Variable Watch Window*: Specific call out where the variable watch window is no longer in the mini map, and instead on the variable panel at the top area of the authoring canvas.
- *Flyout Menus*: Microsoft Copilot Studio now utilizes the full window within the authoring experience. Other properties, based on selections within the authoring canvas, were traditionally held within a flyout panel on the side of the screen.

:::image type="content" source="media/unified-authoring-conversion/authoring-canvas.png" alt-text="Screenshot of the Microsoft Copilot Studio Authoring Canvas with updated user interface":::

### System Topics

If you're new and inexperienced to copilot building with Copilot Studio, we don't recommend that [System topics](authoring-system-topics.md) are changed. If you're familiar with Copilot Studio, you might notice that new and updated system topics are now available in the latest unified authoring release.

*Conversation Start*: Previously, classic bot makers had to customize the classic bot with extra code to automatically begin a conversation with Copilot Studio. This code is no longer required, and the Conversation Start system topic begins the conversation automatically and is turned on by default. You can see the conversation automatically begin working by using the 'Test your copilot' panel within Copilot Studio when your copilot automatically starts using the Conversation Start topic data.

*Multiple Topics Matched*: When you build conversational experiences, when a user asks a question, there can be more than one topic matched with high confidence. The multiple matches causes a disambiguation experience to occur, normally referred to as a 'Did You Mean' experience within Copilot Studio. The disambiguation experience is when the copilot asks the user, "Did You Mean X, or Did you Mean Y?" This experience helps to disambiguate between two or more high ranking topics matched by the user's original question. In the latest Copilot Studio release, you can edit the disambiguation experience using the 'Multiple Topics Matched' system topic, for example, by not displaying specific topics when disambiguation is triggered.

:::image type="content" source="media/unified-authoring-conversion/system-topics.png" alt-text="Screenshot of the topics page, highlighting the system topics in Microsoft Copilot Studio maker experience":::

### Pass entire Objects back to Microsoft Copilot Studio using Power Automate

Copilot Studio is seamlessly integrated with Power Automate to allow copilot makers to connect to many different connectors to help retrieve and access data in other systems. In the previous version of Microsoft Copilot Studio, only text, number, or Boolean (yes/no) type objects could be passed between Copilot Studio and Power Automate.

In the Copilot Studio unified authoring release, you can now send an entire object. Whether that object is a Dataverse record, or a collection of Dataverse records, the Object is sent back using the text output of the Copilot Studio return statement.

With these new authoring capabilities in Copilot Studio, a copilot author/maker can then retrieve that object from Power Automate. Then, the author/maker uses the parse node feature and the new variable features to extract the information from that object. Once retrieved, they format it as required (for example, within a custom Adaptive Card).

### Variables, Variable Watch Window Improvements and Testing

In the latest release, variables were updated. These updates include a selection of variable nodes to create new variables and update them, and utilize system data and variables. Also, copilot makers can include Power FX formulas to manipulate data and perform calculations within the runtime of Copilot Studio.

When testing, it's critical to be able to test variables within the topic process flow when creating conversational experiences. To test, the variable watch window was previously in the topic mini-map where a copilot maker/author could use the testing panel within Copilot Studio to test topics and the data between them. Testing variables are now available in the variable panel, on the side panel within the authoring canvas, under **Test**. Together with the testing panel window, copilot makers/authors can now watch the variables and their data within this panel for both topic and global level variables. Additionally, as this panel has a large amount of space, this testing experience is improved for topics that have a large number of variables within them.

[Learn more about the latest features around Variables and PowerFX in Copilot Studio](advanced-power-fx.md)

:::image type="content" source="media/unified-authoring-conversion/variables.png" alt-text="Screenshot of the variable node in Copilot Studio":::

### Write your copilot in YAML

Fusion teams are enabled in Copilot Studio. These teams have the capabilities to author conversational experiences that use both the graphical user interface (GUI) authoring tool and code view. The GUI uses rich responses, adaptive cards, and more for use by everyone. Developers can switch to the code view within a topic, in real-time, to directly build or edit the YAML referenced by the interface.

:::image type="content" source="media/unified-authoring-conversion/codeview.png" alt-text="Screenshot of the code view of YAML in Copilot Studio":::

### Events

Events introduce extra capabilities within the Copilot Studio web interface to create and manage the conversational experience. Traditionally, trigger phrases are used to detect the intent from a spoken sentence or word and the best matched topic, if found. Events are an alternative way to manage events that are either sent to or received from the user or alternative systems.

### GPT Enabled Features

*Conversation Booster (Preview) Boosted Conversations*: Copilot Makers/Authors are empowered to create a useful copilot in seconds by connecting it to a datastore, such as a public facing website, allowing the copilot to be able to generate answers to questions using that datastore. You can use this feature at copilot creation or within the 'AI Capabilities' section in the copilot's settings.

*Copilot (Preview)*: Creating copilots with AI is simplified by using Copilot in Copilot Studio. In the latest release, Copilot Makers can now utilize Copilot on the topic screen when creating a new topic, entering a name and an initial prompt to build the topic directly within Copilot Studio. Copilot Makers/Authors can also use Copilot, using the Copilot button within the topic, to open the Copilot panel on the side of the authoring screen to update the topic using natural language, including select specific nodes.

:::image type="content" source="media/unified-authoring-conversion/boosted-c.png" alt-text="Screenshot of Conversation Booster feature in Copilot Studio":::

### Application Insights Integration by default

By default, Application Insights is now integrated within Copilot Studio. Application Insights allows administrators to monitor the performance of applications. Copilot Studio allows administrators to both proactively understand how the application is performing, and reactively to review root cause analysis and determine the cause of an incident. Within Copilot Studio, administrators can connect their copilot to an instance of Application Insights within the settings area using a connection string. Then the administrator specifies whether to log incoming and outgoing messages, log sensitive activity properties, and node actions, by default. Additionally, copilot authors can log custom events with properties using the new 'Log custom telemetry event' node.

## How to get started with structured learning for Copilot Studio unified authoring

We're launching a brand new Copilot Studio in a Day training on Microsoft Learn, to help get you started with structured learning of Copilot Studio. The Copilot Studio in a Day training also contains specific material for instructors. At this time, we have preview lab materials that can be accessed here, which provide readers with a selection of labs they can use to get started. Additionally, our Microsoft Partners are training on our latest release of Copilot Studio, transitioning within June, so check out their [Events on the Microsoft Events page](https://events.microsoft.com/en-us/allevents/?search=Power%20Virtual%20Agents%20in%20a%20Day&view=list&clientTimeZone=1&startTime=07:00&endTime=11:00). (Note: When booking, ensure which version the event is targeting.)

## Migrating your Power Virtual Agents classic bots

See [Cloning an existing Power Virtual Agents classic bot to a Copilot Studio copilot](#cloning-an-existing-power-virtual-agents-classic-bot-to-a-copilot-studio-copilot).

## Testing guidance in Copilot Studio unified authoring

With any application, it's vital that companies ensure there's enough time within the migration process to complete adequate testing. Adequate testing is dependent on the type of copilot and conversational experience a company builds, together with any other or connected infrastructure and technology. As you consider migrating to unified authoring, ensure the testing framework and processes in your organization allow for copilot testing, even for simple copilots.

### Testing and deployment practices

There are a range of resources available to assist with business application technology deployments, and best practices around conversational projects using Copilot Studio. Check out the following links to learn more:

- [Success By Design](/dynamics365/guidance/implementation-guide/success-by-design)

- [PowerCAT Microsoft Copilot Studio Playbook](https://powervirtualagents.microsoft.com/en-us/blog/announcing-power-virtual-agents-customer-playbook/)

- [Microsoft Copilot Studio Copilot Testing Framework by PowerCAT](https://github.com/microsoft/CopilotStudioSamples/tree/master/PVATestFramework)

>[!WARNING]
>Ensure you have completed all your testing, and complied with your organizational policies, before deploying your migrated classic bot to production.

### Recommendations when working with Microsoft Support

Raising any issues to Microsoft should include the snapshot of the copilot, found in the testing pane and the metadata of the copilot, found in the **Copilot details** section of the copilot management area, under **Advanced**, such as *Environment ID*, *Tenant ID*, *Bot App ID*.
