---
title: "Power Virtual Agents Unified Authoring Customer/Migration Guidance"
description: "DESCRIPTION"
ms.date: 05/23/2023
ms.topic: how-to
author: doc-writer
manager: leeclontz
ms.author: doc-writer-alias
ms.reviewer: iawilt





---

# Considerations for the latest Power Virtual Agents Unified Authoring release 

The latest Power Virtual Agents release is now here and generally available (GA). This release brings a major update to the Power Virtual Agents product, introducing a significant number of updates and improvements so that organizations can build conversational experiences that are valuable and relevant to their customers and internal users.

As we have released our latest version, this is the time to be considering migrating from your classic experience in Power Virtual Agents to the latest version. At this time we have not released or set any dates when this is recommended to be completed by. This guide aims to help readers understand some of the significant improvements within this release and areas to consider when it comes to your organization migrating your classic Power Virtual Agent experience.

## Upgrading to Power Virtual Agents Unified Authoring

If you already have created one or more bots using Power Virtual Agents you might be wondering what the process is for upgrading to the latest release.

### Cloning an existing PVA Classic bot

To assist in the upgrade experience, at launch, there is a new Clone feature that is now available on bots built using Power Virtual Agents (Classic).

image type="content" source="media/clone-experience.png" alt-text="Screenshot of the window on the homepage to clone an existing PVA bot"

This feature will clone the selected PVA Classic Bot and create a new bot that uses the latest Unified Authoring version. There are some important considerations to be aware of in this cloning process, which are listed below:

- The cloning process will only be available in the same language from source bot in the classic experience to target bot experience.
- The cloning process will only clone Topics built using the PVA Web Canvas (not topics built using Bot Composer)
- The cloning process will clone Entities and associated Synonyms and Custom Entities
- A bot administratior would be required to reconfigure Authorization, Channels and Security settings in the cloned Unified Authoring bot
- Any Bot Framework Skills from the PVA Classic bot would need to be reconnected with the cloned Unified Authoring bot
- The connection to Power Automate Flows, built using the PVA Web Canvas, will be cloned and associted within the topic within the cloned Unified Authoring topic, however it is strongly recommended that the connections are tested 
- Consideration should be given for any custom canvas and additional custom architecture components you may have connected to your PVA Classic bot as they would need to be reconnected or recongfigued to your new cloned Unified Authoring bot and tested. Wider consideration should be given to your entire architecture and any impact within that architecture that could have been updated since the updating of your Bot (and it's Bot ID).
- Any Automated Deployent Pipelines would need to be updated if utilizing the PVA Classic Bot ID or any reference to the classic bot
- Any custom reporting to your new bot deployment should be updated. Examples include if the Custom Data Pipeline solution is being used or alternative reporting solutions

> [!IMPORTANT]
> This may not be an exhaustive list based on your current implementation and architecture. Ensure you complete the required testing for your bot before deploying to production, even if you are using the clone feature to migrate your bot between versions.

> [!NOTE]
> In the future there may be additional tools available to assist with migration of bots and we would appreciate your feedback on this topic. Please submit feature requests at Link to a topic outside of docs: [here](https://portal.productboard.com/fdeco3ykgkwvchtg4qbdowug/tabs/1-under-consideration)

It should not be understated that whilst today there is a process of a migration, by migrating your bot from PVA Classic to Unified Authoring companies are then able to leverage all of the latest features within Power Virtual Agents Unified Authoring. This includes GPT Enabled Features, Variable management and Power FX, Code View, Events and so much more. Companies will be able to take this opportunity to add additional value to your bot and as a result, an improved experience for your customers.

## What is new or has been updated in the latest Power Virtual Agents 

Below is an overview, and not an exhausive list, of what has changed in Power Virtual Agents Unified Authoring. It aims to highlight the significant new capabilities now available within the authoring experience of Power Virtual Agents, or significant changes that should be brought to the attention of readers. 

> [!IMPORTANT]
> To review more detail about the core capabilities and features of Power Virtual Agents, check out the Getting Started Guide [here](https://learn.microsoft.com/en-us/power-virtual-agents/fundamentals-get-started)

### Creating a new Bot

When creating a brand new Bot using the 'New chatbot' button under the 'Chatbots' item in the main navigation, there is a new bot creation process where bot makers can name the bot, specify the bot's language and also get started with boosted conversations (public preview feature)

Additionally you can configure 'Advanced Information' including the Icon, choose to include (or not include) lesson topics, and also select the default solution and default schema name for new topics. Note for selecting the schema name, this directly utilizes the prefix from the selected Solution. 

> [!TIP]
> For more information on Boosted Conversations, see below and also the feature documentation here.

:::image type="content" source="media/new-bot.png" alt-text="Screenshot of the new bot wizard screen":::

### User Interface Changes

There has been a number of User Interface updates with the aim to make the Bot Maker / Administration experience easier and more intuitive. This begins at the bot creation experience highlighted above, although it doesn't end there. The improvements also include:

- *Creating a New Topic*: Users will no longer be able to create topics using Bot Composer. Bot makers can create a new topic manually or using Co-Pilot (in public preview)
- *Trigger tags*: You will now see all types of Triggers within the Topic view, and also these can appear as different Triggers due to the Events feature e.g. 'Message Recieved'
- *Connectors within a topic*: Previously the connectors between nodes were curved. They are no longer curved.
- *Topic User Interface*: Additional Nodes are now available on the creation menu within the Authoring Canvas, New Productivity Panel and extended menu to include Co-Pilot and Variables. 
- *Variable Watch Window*: Specific call out where the Variable watch window is no longer in the Mini Map, and instead on the Variable Panel at the top right area of the Authoring Canvas
- *Flyout Menus*: PVA now utilizes the full window within the authoring experience and additional properties based on selections within the authoring canvas is traditionally held within a flyout panel on the right hand side of the screen e.g. Question Properties and Variable Panel

:::image type="content" source="media/authoring-canvas.png" alt-text="Screenshot of the PVA Authoring Canvas with updated user interface":::

### System Topics

System Topics are not recommended to changed if you are new and not experienced to Bot Building in Power Virtual Agents. For those familar with Power Virtual Agents you may notice that there are additional and updated system topics now available in the latest Unified Authoring release. For full information on System Topics, see the documentation [here](https://learn.microsoft.com/en-us/power-virtual-agents/preview/authoring-system-topics)

*Conversation Start*: Previously, Bot makers had to customize the bot with additional code to automatically begin a conversation with Power Virtual Agents. This is no longer required, and the Conversation Start system topic begins the conversation automatically and is turned on by default today. You can see this working for yourself by using the 'Test your bot' panel within PVA and your bot will automatically start using the Conversation Start topic data

*Multiple Topics Matched*: When building conversational experiences, when a user asks a question, there can be more than one topics matched with high confidence. This causes a disambiguation experience to occur, normally referred to as 'Did You Mean' experiences within Power Virtual Agents. This is where the bot will ask the user, Did You Mean X, or Did you Mean Y? This experience helps to then disambiguate between two or more high ranking topics that were matched by the user's original question. In the latest Power Virtual Agent release, now you can edit the out of the box disambiguation experience using the 'Multiple Topics Matched' system topic e.g. not displaying specific topics when disambiguation is triggered.

:::image type="content" source="media/system-topics.png" alt-text="Screenshot of the topics page, highlighting the system topics in Power Virtual Agents makex experience":::

### Pass entire Objects back to PVA using Power Automate

Power Virtual Agents has been seamlessly integrated with Power Automate to allow bot makers to connect to many different connectors to help retrieve and access data in other systems. In the previous version of Power Virtual Agents, only text, number or boolean (yes/no) type objects could be passed between Power Virtual Agent and Power Automate.

In Power Virtual Agents Unified Authoring release, you can now send an entire Object, whether that be a dataverse record or a collection of dataverse records, to send back using the text output of the Power Virtual Agents return statement.

As a result of the new authoring capabilities in Power Virtual Agent, a Bot Author/Maker can then retrieve that object from Power Automate, use the Parse Node feature and using the new variable features to extract the information from that object and format it as required (e.g. withn a custom Adaptive Card)

### Variables, Variable Watch Window Improvements and Testing

Today in the latest release, variables have been significantly updated to not only include a selection of Variable nodes to create new variables and update them, utilize system data and variables but also bot makers can also include PowerFX formulas to be able to manipulate data and perform calculations within the runtime of Power Virtual Agents. 

When testing, it is critical to be able to test variables within the topic process flow when creating conversational experiences. To do this, the variable watch window was previously in the topic mini-map where a Bot Maker/Author could use the testing panel within Power Virtual Agents to test topics and the data between them. Testing variables is now available in the Variable Panel on the right hand side panel within the Authoring Canvas, under the subheading 'Test'. Together with the Testing Panel window, Bot Makers/Authors can now watch the variables and their data within this panel for both Topic and Global level variables. Additionally, as this panel has a large amount of space, this testing experience is improved for topics that have a large number of variables within them.

Learn more about the latest features around Variables and PowerFX in Power Virtual Agents [here](https://learn.microsoft.com/en-us/power-virtual-agents/preview/advanced-power-fx)

:::image type="content" source="media/variables.png" alt-text="Screenshot of the variable node in Power Virtual Agents":::

### Write your bot in YAML

Fusion teams are enabled in Power Virtual Agents with the capabilities to author conversational experiences that use both the Graphical User Interface (GUI) authoring tool, leveraging rich responses, adaptive cards and more that can be utilized by everyone, together with developers who can choose to switch to the code view within a topic to directly build or edit the YAML that is referenced by the interface in real time. 

:::image type="content" source="media/codeview.png" alt-text="Screenshot of the code view of YAML in Power Virtual Agents":::

### Events 

Events introduces additional capabilities within the Power Virtual Agents web interface to create and manage the conversational experience. Traditionally, Trigger Phrases are used to detect the intent from a spoken sentence or word and the best matched topic if found. Events are an alternative way to specifically manage events that are either sent to or recieved from the user or alternative systems.

### GPT Enabled Features

*Conversation Booster (Preview) Boosted Conversations*: Bot Makers/Authors are empowered to create a useful bot in seconds by connecting it to a datastore, such as a public facing website, allowing the bot to be able to generate answers to questions using that datastore. You can leverage this feature at bot creation or within the 'AI Capabilities' section on the sitemap.

*Co-Pilot (Preview)*: Co-creating Bots with AI has never been easier using Co-Pilot in Power Virtual Agents. In our latest release, Bot Makers can now utilize Co-Pilot on the topic screen when creating a new topic, entering a name and an initial prompt to build the topic directly within Power Virtual Agents. Bot Makers/Authors can also use Co-pilot, using the Co-pilot button within the topic, to open the Co-pilot panel on the right hand side of the authoring screen to update the Topic using natural language, including select specific nodes.

:::image type="content" source="media/boosted-c.png" alt-text="Screenshot of Conversation Booster feature in Power Virtual Agent":::

### Application Insights Integration by default

Application Insights is now integrated by default within Power Virtual Agents. Application insights allows for administrators to monitor the performance of applications, in this case, Power Virtual Agents, both proactively to understand how that applicatin is performing and reactively to review root cause analysis and determine the cause of an incident. Within Power Virtual Agents, administrators can connect their Power Virtual Agent bot to an instance of Application Insights within the settngs area using a connection string, and specify to log incoming and outgoing messages, whether or not to log sensitive activity properties and node actions by defaukt. Addtionally, bot authors can choose to directly within a topic, log custom events with properties using the new 'Log custom telemetry event' node. 

## How to get started with structured learning for Power Virtual Agents Unified Authoring

To get started with structured learning of Power Virtual Agents, we are in the process of launching our brand new Power Virtual Agents in a Day training directly on Microsoft Learn with additional material for instructors. At this time, we do have our preview lab materials that can be accessed here, which will provide readers with a selection of labs they can use to get started. Additionally, our Microsoft Partners will be training on our latest release of Power Virtual Agents, transitioning within June, so check out their Events on the Microsoft Events page Link to a topic outside of docs: [here](https://events.microsoft.com/en-us/allevents/?search=Power%20Virtual%20Agents%20in%20a%20Day&view=list&clientTimeZone=1&startTime=07:00&endTime=11:00). (Note: ensure when booking which version the event is targeting)

## H2 - Migrating your PVA Classic Bots

See the heading 'Cloning an existing PVA Classic Bot' section within this document 

## Testing Guidance in Power Virtual Agents Unified Authoring

With any application, it is vital that companies ensure there is enough time within the migration process to complete adequate testing. What is adequate testing is dependent on the type of bot and conversational experience a company builds, together with any additional or connected infrastucture and technology. As many organizations will consider migrating their bots to Unified Authoring, you should consider the testing framework and the company process to ensure that, even if you have a simple bot, you have embedded testing into your migration checklist.

### Testing and Deployment Practices

There are a range of resources available to assist with business application technology deployments, and specifically best practices around conversational projects using Power Virual Agents. Check out the links below to learn more:

- Link to a topic outside of docs: [Success By Design](https://learn.microsoft.com/en-us/dynamics365/fasttrack/success-by-design-overview)

- Link to a topic outside of docs: [PowerCAT PVA Playbook](https://powervirtualagents.microsoft.com/en-us/blog/announcing-power-virtual-agents-customer-playbook/)

- Link to a topic outside of docs: [PVA Bot Testing Framework by PowerCAT](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BotTestFramework)

>[!WARNING]
>Ensure you have completed all of your testing and complied with your organizational policies before deploying your migrated bot to production.

### Recommendations when working with Microsoft Support

Raising any issues to Microsoft should include the snapshot of the bot, found in the testing pane and the metadata of the bot, found in the 'Bot details' section of the bot management area, under 'Advanced' such as Environment ID, Tenant ID, Bot App ID.
