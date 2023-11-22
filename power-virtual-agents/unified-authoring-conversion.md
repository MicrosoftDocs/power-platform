---
title: "Unified authoring canvas migration guidance"
description: "Guidance to migrate your Microsoft Copilot Studio bots to the updated unified authoring canvas. "
ms.date: 05/23/2023
ms.topic: how-to
author: sarahc916
manager: leeclontz
ms.author: scritchley
ms.reviewer: iawilt
---

# Considerations for the latest Microsoft Copilot Studio unified authoring release 

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The latest Microsoft Copilot Studio release is now here and generally available (GA). This release brings a major update to the Microsoft Copilot Studio product, introducing a significant number of updates and improvements so that organizations can build conversational experiences that are valuable and relevant to their customers and internal users.

As we have released our latest version, this is the time to be considering migrating from your classic experience in Microsoft Copilot Studio to the latest version. This guide aims to help readers understand some of the significant improvements within this release and areas to consider when it comes to your organization migrating your classic Power Virtual Agent experience.

## Upgrading to Microsoft Copilot Studio unified authoring

If you already have created one or more bots using Microsoft Copilot Studio you might be wondering what the process is for upgrading to the latest release.

### Cloning an existing Microsoft Copilot Studio classic bot

To assist in the upgrade experience, at launch, there's a new clone feature that is now available on bots built using Microsoft Copilot Studio (classic).

:::image type="content" source="media/unified-authoring-conversion/clone-experience.png" alt-text="Screenshot of the window on the homepage to clone an existing Microsoft Copilot Studio bot.":::

This feature will clone the selected Microsoft Copilot Studio classic bot and create a new bot that uses the latest unified authoring version. There are some important considerations to be aware of in this cloning process, which are listed below:

- The cloning process will only be available in the same language from source bot in the classic experience to target bot experience.
- The cloning process will only clone topics built using the Microsoft Copilot Studio web canvas (not topics built using Bot Composer).
- The cloning process will clone entities and associated synonyms and custom entities.
- A bot administrator needs to reconfigure authorization, channels and security settings in the cloned unified authoring bot.
- Any Bot Framework Skills from the Microsoft Copilot Studio classic bot would need to be reconnected with the cloned unified authoring bot.
- The connection to Power Automate Flows, built using the Microsoft Copilot Studio web canvas, will be cloned and associated within the topic within the cloned unified authoring topic, however it's strongly recommended that the connections are tested.
- Consideration should be given for any custom canvas and other custom architecture components you may have connected to your Microsoft Copilot Studio classic bot as they would need to be reconnected or reconfigured to your new cloned unified authoring bot and tested. Wider consideration should be given to your entire architecture and any impact within that architecture that could have been updated since the updating of your bot (and it's bot ID).
- Any automated deployment pipelines would need to be updated if utilizing the Microsoft Copilot Studio classic bot ID or any reference to the classic bot.
- Any custom reporting to your new bot deployment should be updated. Examples include if the custom data pipeline solution is being used or alternative reporting solutions.

> [!IMPORTANT]
> This may not be an exhaustive list based on your current implementation and architecture. Ensure you complete the required testing for your bot before deploying to production, even if you're using the clone feature to migrate your bot between versions.

> [!NOTE]
> In the future there may be other tools available to assist with migration of bots and we would appreciate your feedback on this topic. [Please submit feature requests](https://portal.productboard.com/fdeco3ykgkwvchtg4qbdowug/tabs/1-under-consideration)

By migrating your bot from Microsoft Copilot Studio classic to unified authoring, you can access the latest features within Microsoft Copilot Studio unified authoring. This includes GPT-enabled features, variable management and Power FX, code view, events and so much more. Companies can take this opportunity to add additional value to your bot and, as a result, an improved experience for your customers.

## What is new or has been updated in the latest Microsoft Copilot Studio 

The following overview isn't an exhaustive list of what's changed in Microsoft Copilot Studio unified authoring. It aims to highlight the significant new capabilities now available within the authoring experience of Microsoft Copilot Studio, or significant changes that should be brought to the attention of readers. 

> [!IMPORTANT]
> To review more detail about the core capabilities and features of Microsoft Copilot Studio, check out the [Getting Started Guide](fundamentals-get-started.md)

### Creating a new bot

When creating a brand new by selecting **New chatbot**  under the **Chatbots** item in the main navigation, there's a new bot creation process where bot makers can name the bot, specify the bot's language and also get started with boosted conversations (public preview feature)

Additionally you can configure **Advanced Information** including the icon, choose to include (or not include) lesson topics, and also select the default solution and default schema name for new topics. When you select the schema name, this directly utilizes the prefix from the selected solution. 

> [!TIP]
> For more information on Boosted Conversations, see below and also the feature documentation here.

:::image type="content" source="media/unified-authoring-conversion/new-bot.png" alt-text="Screenshot of the new bot wizard screen":::

### User Interface Changes

There have been a number of user interface updates with the aim to make the bot maker and administration experience easier and more intuitive. This begins at the bot creation experience, although it doesn't end there. The improvements also include:

- *Creating a New Topic*: Users will no longer be able to create topics using Bot Composer. Bot makers can create a new topic manually or using Copilot.
- *Trigger tags*: You'll now see all types of triggers within the topic view, and also these can appear as different triggers due to the events feature, such as *Message Received*.
- *Connectors within a topic*: Previously the connectors between nodes were curved. 
- *Topic User Interface*: Additional nodes are now available on the creation menu within the authoring canvas, new productivity panel and extended menu to include copilot and variables. 
- *Variable Watch Window*: Specific call out where the variable watch window is no longer in the mini map, and instead on the variable panel at the top area of the authoring canvas.
- *Flyout Menus*: Microsoft Copilot Studio now utilizes the full window within the authoring experience and other properties based on selections within the authoring canvas is traditionally held within a flyout panel on the side of the screen.

:::image type="content" source="media/unified-authoring-conversion/authoring-canvas.png" alt-text="Screenshot of the Microsoft Copilot Studio Authoring Canvas with updated user interface":::

### System Topics

[System topics](authoring-system-topics.md) aren't recommended to changed if you're new and not experienced to bot building in Microsoft Copilot Studio. For those familiar with Microsoft Copilot Studio you may notice that there are additional and updated system topics now available in the latest unified authoring release. 

*Conversation Start*: Previously, Bot makers had to customize the bot with additional code to automatically begin a conversation with Microsoft Copilot Studio. This is no longer required, and the Conversation Start system topic begins the conversation automatically and is turned on by default today. You can see this working for yourself by using the 'Test your bot' panel within Microsoft Copilot Studio and your bot will automatically start using the Conversation Start topic data
e
*Multiple Topics Matched*: When you build conversational experiences, when a user asks a question, there can be more than one topic matched with high confidence. This causes a disambiguation experience to occur, normally referred to as 'Did You Mean' experiences within Microsoft Copilot Studio. This is where the bot will ask the user, Did You Mean X, or Did you Mean Y? This experience helps to then disambiguate between two or more high ranking topics that were matched by the user's original question. In the latest Power Virtual Agent release, now you can edit the out of the box disambiguation experience using the 'Multiple Topics Matched' system topic e.g. not displaying specific topics when disambiguation is triggered.

:::image type="content" source="media/unified-authoring-conversion/system-topics.png" alt-text="Screenshot of the topics page, highlighting the system topics in Microsoft Copilot Studio maker experience":::

### Pass entire Objects back to Microsoft Copilot Studio using Power Automate

Microsoft Copilot Studio has been seamlessly integrated with Power Automate to allow bot makers to connect to many different connectors to help retrieve and access data in other systems. In the previous version of Microsoft Copilot Studio, only text, number or boolean (yes/no) type objects could be passed between Power Virtual Agent and Power Automate.

In Microsoft Copilot Studio unified authoring release, you can now send an entire Object, whether that be a Dataverse record or a collection of Dataverse records, to send back using the text output of the Microsoft Copilot Studio return statement.

As a result of the new authoring capabilities in Power Virtual Agent, a bot author/maker can then retrieve that object from Power Automate, use the parse node feature and using the new variable features to extract the information from that object and format it as required (for example, within a custom Adaptive Card)

### Variables, Variable Watch Window Improvements and Testing

Today in the latest release, variables have been significantly updated to not only include a selection of variable nodes to create new variables and update them, utilize system data and variables but also bot makers can also include Power FX formulas to be able to manipulate data and perform calculations within the runtime of Microsoft Copilot Studio. 

When testing, it's critical to be able to test variables within the topic process flow when creating conversational experiences. To do this, the variable watch window was previously in the topic mini-map where a bot maker/author could use the testing panel within Microsoft Copilot Studio to test topics and the data between them. Testing variables is now available in the variable panel on the side panel within the authoring canvas, under **Test**. Together with the testing panel window, bot makers/authors can now watch the variables and their data within this panel for both topic and global level variables. Additionally, as this panel has a large amount of space, this testing experience is improved for topics that have a large number of variables within them.

[Learn more about the latest features around Variables and PowerFX in Microsoft Copilot Studio](advanced-power-fx.md)

:::image type="content" source="media/unified-authoring-conversion/variables.png" alt-text="Screenshot of the variable node in Microsoft Copilot Studio":::

### Write your bot in YAML

Fusion teams are enabled in Microsoft Copilot Studio with the capabilities to author conversational experiences that use both the graphical user interface (GUI) authoring tool, leveraging rich responses, adaptive cards and more that can be utilized by everyone, together with developers who can choose to switch to the code view within a topic to directly build or edit the YAML that is referenced by the interface in real time. 

:::image type="content" source="media/unified-authoring-conversion/codeview.png" alt-text="Screenshot of the code view of YAML in Microsoft Copilot Studio":::

### Events 

Events introduce additional capabilities within the Microsoft Copilot Studio web interface to create and manage the conversational experience. Traditionally, trigger phrases are used to detect the intent from a spoken sentence or word and the best matched topic if found. Events are an alternative way to manage events that are either sent to or received from the user or alternative systems.

### GPT Enabled Features

*Conversation Booster (Preview) Boosted Conversations*: Bot Makers/Authors are empowered to create a useful bot in seconds by connecting it to a datastore, such as a public facing website, allowing the bot to be able to generate answers to questions using that datastore. You can leverage this feature at bot creation or within the 'AI Capabilities' section in the bot's settings.

*Copilot (Preview)*: Creating Bots with AI has never been easier using Copilot in Microsoft Copilot Studio. In our latest release, Bot Makers can now utilize Copilot on the topic screen when creating a new topic, entering a name and an initial prompt to build the topic directly within Microsoft Copilot Studio. Bot Makers/Authors can also use Copilot, using the Copilot button within the topic, to open the Copilot panel on the side of the authoring screen to update the topic using natural language, including select specific nodes.

:::image type="content" source="media/unified-authoring-conversion/boosted-c.png" alt-text="Screenshot of Conversation Booster feature in Power Virtual Agent":::

### Application Insights Integration by default

Application Insights is now integrated by default within Microsoft Copilot Studio.This feature allows for administrators to monitor the performance of applications, in this case, Microsoft Copilot Studio, both proactively to understand how that application is performing and reactively to review root cause analysis and determine the cause of an incident. Within Microsoft Copilot Studio, administrators can connect their Power Virtual Agent bot to an instance of Application Insights within the settings area using a connection string, and specify to log incoming and outgoing messages, whether or not to log sensitive activity properties and node actions by default. Additionally, bot authors can log custom events with properties using the new 'Log custom telemetry event' node. 

## How to get started with structured learning for Microsoft Copilot Studio unified authoring

To get started with structured learning of Microsoft Copilot Studio, we are in the process of launching our brand new Microsoft Copilot Studio in a Day training directly on Microsoft Learn with additional material for instructors. At this time, we do have our preview lab materials that can be accessed here, which will provide readers with a selection of labs they can use to get started. Additionally, our Microsoft Partners are training on our latest release of Microsoft Copilot Studio, transitioning within June, so check out their [Events on the Microsoft Events page](https://events.microsoft.com/en-us/allevents/?search=Power%20Virtual%20Agents%20in%20a%20Day&view=list&clientTimeZone=1&startTime=07:00&endTime=11:00). (Note: ensure when booking which version the event is targeting)

## Migrating your Microsoft Copilot Studio classic Bots

See the heading 'Cloning an existing Microsoft Copilot Studio classic Bot' section within this document 

## Testing Guidance in Microsoft Copilot Studio unified authoring

With any application, it's vital that companies ensure there's enough time within the migration process to complete adequate testing. What is adequate testing is dependent on the type of bot and conversational experience a company builds, together with any additional or connected infrastructure and technology. As you consider migrating to unified authoring, ensure the testing framework and processes in your organization allow for bot testing, even for simple bots.

### Testing and Deployment Practices

There are a range of resources available to assist with business application technology deployments, and best practices around conversational projects using Microsoft Copilot Studio. Check out the links below to learn more:

- [Success By Design](dynamics365/guidance/implementation-guide/success-by-design)

- [PowerCAT Microsoft Copilot Studio Playbook](https://powervirtualagents.microsoft.com/en-us/blog/announcing-power-virtual-agents-customer-playbook/)

- [Microsoft Copilot Studio Bot Testing Framework by PowerCAT](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BotTestFramework)

>[!WARNING]
>Ensure you have completed all of your testing and complied with your organizational policies before deploying your migrated bot to production.

### Recommendations when working with Microsoft Support

Raising any issues to Microsoft should include the snapshot of the bot, found in the testing pane and the metadata of the bot, found in the **Bot details** section of the bot management area, under **Advanced** such as *Environment ID*, *Tenant ID*, *Bot App ID*.
