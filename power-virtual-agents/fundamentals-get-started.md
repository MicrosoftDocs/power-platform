---
title: "Quickstart: Create and deploy a bot on the portal (contains video)"
description: "Create and publish a Power Virtual Agents bot on the online portal in minutes."
keywords: "PVA, online, web, portal, quickstart"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: fundamentals, portal, ceX, intro-internal
ms.service: power-virtual-agents
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Quickstart: Create and deploy a Power Virtual Agents bot

Power Virtual Agents empowers teams to quickly and easily create powerful bots using a guided no-code graphical experience - all without the need for data scientists or developers.

This quickstart guide takes you through the end-to-end experience of creating a bot for the first time, adding topics to your bot, testing content changes in real time, deploying your bot to a test page, and analyzing the performance of your bot after it's been deployed.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

# [Web app](#tab/web)

### Explore the home page

Power Virtual Agents has an app-level home page that isn't specific to any bot. On this page you can create a new bot, view recent bots, and access learning resources like videos, documentation, and learning paths.

:::image type="content" source="media/fundamentals-get-started/new-bot1.png" alt-text="Screenshot of the app-level home page.":::

  <<----IMAGE NEEDS UPDATE------>>

In the navigation menu, select **Chatbots** to open the **Chatbots** page and view all the bots you have access to in this environment. On the page, you can see metadata about these bots, including the owner, when it was last published, and when it was last modified. Use this page to navigate to another bot that you have access to.

:::image type="content" source="media/fundamentals-get-started/chatbot-list.png" alt-text="Screenshot of the list of chatbots.":::

  <<----IMAGE NEEDS UPDATE------>>

### Create a bot

1. Go to the [Power Virtual Agents introduction website](https://aka.ms/TryPVA). Supported browsers include Microsoft Edge, Chrome, and Firefox.

2. On the website, select **Start free**, and then sign in with your work email address. Note that personal Microsoft accounts are currently not supported.

3. When you first sign up, a default [Power Apps environment](environments-first-run-experience.md) is made for you. For most users, this is sufficient. However, if you want to specify a custom Power Apps environment, select a different environment from the environment picker.

    :::image type="content" source="media/fundamentals-get-started/environment-picker.png" alt-text="Screenshot of the environment picker.":::
    
    <<----IMAGE NEEDS UPDATE------>>

    > [!NOTE]
    > Power Virtual Agents is supported only in the locations listed in the [supported data locations](data-location.md) article, with data stored in respective data centers. If your company is located outside of the supported data locations, you'll need to create a custom environment with **Region** set to a supported data location before you create your bot.  
    > For more information on how to create a custom Power Apps environment, see [Working with environments](environments-first-run-experience.md).

4. Once signed up, you will land on the App Homepage. In the left navigation menu, select **Home** then select **Create a bot**.
5. A whole page wizard will start with a couple steps to get your bot created very quickly. A default bot name is there. You can change this to be something generic to your company or specific to the scenario you are tailoring your bot to.
6. For **What language do you want your bot to speak?**, select the language you want your bot to speak. The langugage dropdown is prepopulated with the browser locale.

    :::image type="content" source="media/fundamentals-get-started/create-new-bot-screen.png" alt-text="Name the new bot." border="false":::
    
    <<----IMAGE NEEDS UPDATE------>>
  
7. You can choose to Boost Conversations be providing a URL to generate AI answers from. <<LET'S ADD POINTERS AND TEXT FROM THE GPT ANSWERS FEATURE HERE>. This is optional. 
  With a bot name and langauge selected, you can select Create and create your bot.

  
There are optional customizations and enhancements you can make before getting your bot created.
  
  a. Choose **Edit advanced options** on the bottom left to see and edit advanced options. You can continue with bot creation without going into these advanced options.
  
  b. Here you can choose a bot icon to give your bot a personality and represent your business scenarios better. You can select from the pre-populated list if icons or upload a custom icon for your bot. This is the icon used in the chat window when the bot responds.
  
  c. You can also choose whether to include the pre-populated lesson topics which provide starter content to familiarize yourself with bot topics. <<---link to lesson topics docs page --->>
  
  d. There are a couple more advanced options to select the solution your bot will be in and the schema name. These are advanced options which can be changed later, but provided upfront for specific customization.
 
8. Select **Create**. The process of creating your first bot in a new environment can take up to 15 minutes; subsequent bots will be created much faster.

  
  
1. After a few minutes, you'll be redirected to the bot's overview page. Certain operations like Publish and Authentication configuration may take a few more minutes to be ready for your bot, but you can go ahead and:
    - explore the overall user interface
    - explore topics and start creating and editing topics
    - experiment with the preloaded user topics and system topics
    - interact with your bot using the Test Canvas
    - review [additional documentation on authoring topics](authoring-fundamentals.md) in your bot


> [!TIP]
> To navigate back to the app-level home page from your bot, in the navigation menu, select **Chatbots**.
>
>:::image type="content" source="media/fundamentals-get-started/go-home.png" alt-text="Screenshot of Chatbots button in the navigation menu.":::

### Create a topic

Now that you have full functionality within your bot, you can create your own topic, which is a dialog tree that describes how your bot responds to a user's question.

1. In the navigation menu, select **Topics**, then select **New topic** at the top of the page.

    :::image type="content" source="media/fundamentals-get-started/topics-new.png" alt-text="New topic." border="false":::

1. Name your topic and include some trigger phrases for this topic. Trigger phrases are examples of the type of user questions or utterances that help teach the bot when to respond with this dialog.

    As an example, let's create a topic called 'Personal Hello World' and add 'hello world' as a trigger phrase.

    :::image type="content" source="media/fundamentals-get-started/hello-world-topic.png" alt-text="Name topic and add trigger phrase.":::

1. Select **Save topic** to add the topic to the topics list.

1. Select **Go to authoring canvas**. This is the graphical dialog tree editor that allows you to define bot responses and the overall bot conversation.

    Enter 'Hello! I'll create a personalized greeting for you.' into the first **Message** node.

    :::image type="content" source="media/fundamentals-get-started/quickstart-add-node.png" alt-text="Add node." border="false":::

1. Select **Add node** (**+**) below the node, and add an **Ask a question** node.

    Enter the question text, 'Where do you live?', in the **Ask a question** box. To give the customer a choice between different responses, select **Multiple choice options** under **Identify**.

    :::image type="content" source="media/fundamentals-get-started/quickstart-create-topic-02.png" alt-text="Bot answer." border="false":::

1. Add two options for the user, by selecting **+ New option**.

    Enter 'Seattle' and 'Bellevue' in the text boxes called 'Options for user'. Each option is presented as a multiple choice button to the user.

    The authoring canvas creates separate paths in the conversation, depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each user response.

    :::image type="content" source="media/fundamentals-get-started/quickstart-options.png" alt-text="Branching options are created automatically." border="false":::

1. In the forked conversation path, each node automatically checks for 'Seattle' in one path, and 'Bellevue' in the other to take the appropriate next step.

1. Finally, select **Add node** (**+**) below each of the Condition nodes to add a **Message** node in each branch.

    Add a simple message like 'Hello Seattle!' in the Seattle branch, and 'Hello Bellevue!' in the Bellevue branch.

    :::image type="content" source="media/fundamentals-get-started/quickstart-create-topic-03.png" alt-text="Complete conversation." border="false":::

1. Select **Save** at the top.

You now have a very simple branching dialog tree, congratulations! You can begin to create more complex versions of this tree by incorporating [variables](authoring-variables.md), [entities](advanced-entities-slot-filling.md), and [Power Automate flows](advanced-flow.md).

### Test your content in real time

Now that you have some content authored into a dialog tree, it's time to test this out in real time to see if it's working as you expected. For this, you'll use the test bot pane.

:::image type="content" source="media/fundamentals-get-started/test-bot-panel.png" alt-text="Start bot with latest content." border="false":::

1. If the test bot pane is not showing on your screen, in the navigation menu, select **Test your bot**.

    :::image type="content" source="media/fundamentals-get-started/test-bot-menu.png" alt-text="Test bot control." border="false":::

1. Try out your newly authored dialog tree by typing into the test bot pane.

1. Turn on **Track between topics** at the top, which enables you to follow along with the bot as it executes your dialog. You'll start to see parts of your dialog tree highlighted as the bot gets to that portion of the dialog.

    :::image type="content" source="media/fundamentals-get-started/test-bot-track.png" alt-text="Start conversation." border="false":::

1. Type "hello world" in the chat window, and send the message to the bot. You'll see the top portion of your dialog tree highlighted in green, and you'll see **Seattle** and **Bellevue** presented as user options in the test bot pane.

    The bot is now waiting for you to respond and has provided suggestions on how to respond. These suggestion buttons reflect what you authored within your dialog tree in the 'Ask a question' node.

    In the test bot, you can either select these suggestion buttons to continue, or you can enter your response into the chat window.

    :::image type="content" source="media/fundamentals-get-started/quickstart-test-bot-03.png" alt-text="Tracing conversation." border="false":::

1. Continue the dialog by selecting the Seattle branch.

    You'll see the chat stop once you've reached the bottom of this branch. If you author more content, the dialog will continue, but since we've only created a very simple and small dialog tree, we can reach the end of the content very quickly.

This test experience empowers you to quickly create and test a conversation to ensure that the conversation will flow as anticipated. If the dialog does not reflect your intention, you can change the dialog, and save it. The latest content will be pushed into the test bot, and you can try it out again. None of this changes the published version of the bot, so feel free to play around with your content until you are happy with it.

### Publish your bot

Once you're fine with the content authored in your bot, you can publish your bot to a website.

1. In the navigation menu, select the **Publish**.

1. Select **Publish** to activate your bot with a single click. If the publish is successful, you'll see a green banner on the top of the page.

    :::image type="content" source="media/fundamentals-get-started/channel-publish-latest-content.png" alt-text="Deploy bot to demo website." border="false":::

1. Select the demo website link under **Share your bot** to see it in action on a demo website.

    This will open a new window in your browser. If this doesn't happen automatically, check if a pop-up blocker has been activated and, if so, allow the window to be opened. Usually, you can allow pop-ups from the URL field directly.

    The webpage demonstrates what your bot looks like to an end-user who comes to your webpage. The bot canvas is at the bottom. You can interact with it by typing into the window or by selecting a starter phrase from the provided options.

    :::image type="content" source="media/fundamentals-get-started/channel-go-to-demo-website.png" alt-text="Share your bot." border="false":::

For more information on publishing your bot to other channels, see the documentation under [Publication key concepts](publication-fundamentals-publish-channels.md).

### Analyze the performance of your bot

When your bot completes interactions with users, the statistics are recorded in your bot's analytics. To view analytics, in the navigation menu select **Analytics**. Here, you can find key performance indicators (KPIs) showing:

- the volume of sessions your bot has handled
- how effectively your bot was able to engage end-users and resolve issues
- escalation rates to human agents
- abandonment rates during conversations

You'll also find customer satisfaction information at the KPI level as well as in the **Customer Satisfaction** tab.

> [!NOTE]
> There is up to a 1-hour delay between when the conversations occur and when the statistics for those conversations appear in the analytics views. Also, all interactions with the bot are logged in analytics, including interactions from your demo website, custom website, or test bot.

You can also view detailed session history and transcripts by selecting **Analytics** > **Sessions**. Here, you can download a CSV file with the full session transcript. This can be a helpful way for you to tune the performance of your bot and change the content in your topics to improve your bot's efficiency.

:::image type="content" source="media/fundamentals-get-started/analytics-sessions.png" alt-text="Download sessions." border="false":::

For more information, see [Analytics key concepts](analytics-overview.md).

# [Teams](#tab/teams)

Power Virtual Agents empowers anyone in the organization to build chatbots in Microsoft Teams with our built-in natural language processing (NLP) and no-code graphical interface. With our latest Teams integration, you can create, author, test, and publish your bot into Teams all within the Microsoft Teams interface.

When you create chatbots, there are lots of things you need to think about, such as the sorts of questions someone might ask it, the different ways they might ask the question, and what the answer should be. You should also consider if the person has follow-up questions or concerns.

To help you get started making bots, we've created an end-to-end guide that takes you through all the steps needed to make a human resources bot. The guide covers:

- The scenario and how to map what your needs are to what a chatbot can do
- How to create a bot in the Power Virtual Agents app in Microsoft Teams
- How to build and enhance topics that answer common HR-style questions
- How to test, publish, and share the bot with the organization

In this guide, **HR Support bot** is a friendly question and answer bot that brings a support professional expert from the HR team into the loop when it is unable to help. An employee can ask the bot a question and the bot responds with an answer if the bot has content for it.

If not, the bot allows the user to submit a query which then gets posted to a pre-configured team of experts who can provide support by acting upon the notifications from within their team itself.

### Scenario

You work in human resources (HR) at Contoso and need to build a HR support bot in Microsoft Teams. This bot will answer common HR questions, like those related to time-off, with relevant information from the company's internal knowledge base. The bot can also contact human HR experts and notify them that an employee needs help for uncommon scenarios.

Once this bot is published, Contoso employees can access HR information in Microsoft Teams without needing to search the company's intranet.

### Bot building steps

See the [Quickstart: Create and deploy a human resources Power Virtual Agents bot in Teams](quickstart-preview.md).

This next section of the guide looks at how you - as the bot author - can create and publish a bot.

### Install the Power Virtual Agents app in Microsoft Teams

Start by launching the Power Virtual Agents app in Microsoft Teams:

1. Go to the Microsoft Teams app store and search for *power virtual agents*. You'll see the Power Virtual Agents app from Microsoft Corporation in the search results.
1. Select the Power Virtual Agents app and then **Add for me**.

    :::image type="content" source="media/fundamentals-get-started/get-started-install-app.png" alt-text="Add the Power Virtual Agents app.":::

The app is added and visible in the side pane in Teams, and the app opens to the Power Virtual Agents Home page. This is where Teams users can come and build bots without needing to leave the Microsoft Teams interface.

> [!TIP]
> To make it easier to get back to, select and hold (or right-click) the Power Virtual Agents icon and select **Pin**.
>  
> :::image type="content" source="media/fundamentals-get-started/first-bot-pin.png" alt-text="A menu pops up with options to learn about the app, Pin it or uninstall it":::

### Create a new bot in a team

1. Select **Start now** on the Home page.

1. Pick which team you want the bot to be managed by. Let's create the bot in the Contoso HR Team since you are part of Contoso HR. You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team) if necessary, before you add a bot to it.

1. Fill in the bot name and language in the bot creation window. Let's use **HR Support Bot** for the name. The [default language is based on the Teams client language which you can change if you want](authoring-language-support.md).

1. Select **Create**.

    :::image type="content" source="media/fundamentals-get-started/get-started-create.png" alt-text="Create a new bot.":::

Now that the bot is created, we can go ahead and start adding content to the bot.

### Build an employee time-off topic for common time-off queries

Go to the topic list by selecting **Topics** in the navigation menu.

A bot comes with a collection of topics that defines the bot's interaction with end users. The core of building a bot in Power Virtual Agents is to build topics that can respond to different user inquiries. Let's build a topic to answer employee questions about taking time-off.

1. Select **+ New topic** on the top menu bar to create a new topic.

1. Name the topic **Employee time off** and give it an appropriate description.

1. Create trigger phrases. Trigger phrases for each topic define the sorts of ways that users will ask questions about that topic. Let's go ahead and add a few common ways that we expect employees to ask about time off. Enter these trigger phrases:

   - Need information on time off
   - I need help with time off
   - How many days of paid vacation do I have
   - What are the national holidays
   - I need extended leave

    Power Virtual Agents comes with built-in natural language capabilities. You only need to define a few trigger phrases about time-off - phrases that you expect employees to use - and the bot can accurately trigger the topic based on the employee's input.

1. Select **Save** to add it to the topic list.

Now that the trigger phrases are defined, you can proceed to define the bot's interaction with the user when this topic is engaged. The graphical interface in Power Virtual Agents lets you build the topic without needing to write a single line of code.

First, let's give the employee a message that the bot is here to help with time-off questions using a message node.

Enter the text in the existing message node *I can help with questions related to time-off*.

As an HR employee, you know that the most common time-off questions that employees have are around paid vacation time and national holidays. So add a question node for the bot to ask employees what type of time-off they are looking for, so you can provide better guidance. When a question node with user response options is added, the topic automatically gets a forked branch for each response.

1. Select **Add node** (**+**) below the message node, then select **Ask a question** to add a question node to the topic.

1. Enter *What information are you looking for?* in the **Ask a question** text box. This is the question the employee will be asked.

1. Add in two options for paid time-off and national holidays: under **Options for user**, add *Paid vacation* and *National Holidays*.

    :::image type="content" source="media/fundamentals-get-started/get-started-save.png" alt-text="Add options for paid vacation and national holidays.":::

As you can see, user choices are stored in a variable and the topic will be branched off, based on the option the user chooses. Let's rename the variable to track it better in the topic.

1. On the variable, under **Save response as**, select the pencil icon to edit the variable properties.

2. The **Variable properties** pane opens, where you can rename the variable to *TimeoffType*. Close the **Variable properties** pane and you'll see the changes reflected in the authoring canvas.

    :::image type="content" source="media/fundamentals-get-started/get-started-options.png" alt-text="Multiple options are shown after a question node.":::

Now you can add different responses for each option. For *paid vacation*, we can have the bot point employees to an internal HR website to look up paid time-off policies.

1. Add a message node specifically for the *Paid vacation* branch with this message to the user: *For paid vacation time-off, go to www.contoso.com/HR/PaidTimeOff to learn more on how to submit time-off requests.*

2. Add a node by selecting **Add node** (**+**) to end the conversation with a survey. Select **End the conversation**, then **End with survey**. This is the [customer satisfaction survey](analytics-csat.md) prebuilt in the bot for everyone to use in their topics.

3. In the *National Holidays* path, add a message node with the following text:

    ```text
    National holidays for 2020:
    -   New Year's Day: January 1st
    -   Memorial Day: May 25th
    -   Independence day: July 4th
    -   Labor Day: September 7th
    -   Thanksgiving: November 26th - 27th
    -   Christmas Eve and Christmas Day: December 24th - 25th
    ```

4. End this path in the topic with a survey as well: add a node by selecting **Add node** (**+**) then **End the conversation** and **End with survey**.

This is what your topic should look like now:

:::image type="content" source="media/fundamentals-get-started/get-started-options-filled.png" alt-text="The topic has an introductory message, followed by a question node with two options. Each option ends with a message and then a survey.":::

### Test bot for expected behavior

Power Virtual Agents comes with a built-in test bot that lets you test the bot in real time. Let's test the bot by launching the test bot canvas and providing the employee's input. When you save the topic, the test bot will be refreshed with the latest content. You can now test the bot with the latest content changes.

1. Select the purple bot icon at the bottom of the screen to launch the test bot canvas.

1. Type in *I need time off information*.

    Even though *I need time off information* does not match the trigger phrases directly, Power Virtual Agents is able to process the user's input and triggers the employee time off topic.

    As you chat with the bot in the test bot canvas, you can see where the bot is in the conversation in real-time in the authoring canvas by following the green highlights.

1. Select **Paid vacation**.

Now the topic branches off based on the user's response. You can also open the variable to show the *TimeoffType* variable is set to **Paid time-off** by the user. However, what happens if the user has already made it clear that they are looking for national holidays in their inquiry? The user may feel annoyed if the bot asks them to repeat themselves. Let's give it a try.

1. Above the test bot pane, select **Reset** .

1. Type in *Need information on national holidays*

    As you can see, the bot is able to bypass the question on vacation type and directly provide information on national holidays. This is because Power Virtual Agents supports [entity extraction](advanced-entities-slot-filling.md) and was able to determine the user is asking about national holidays.

    :::image type="content" source="media/fundamentals-get-started/get-started-test-bot.png" alt-text="The test bot shows how the AI knew what the user was asking.":::

### Enhance topic to handle more complex queries by escalating to HR experts

Now that we have the basics out of the way, let's add a more complex option to the topic - extended leave.

1. Go back into the topic you created and go to the authoring canvas.
1. In the **Ask a question node** add an option for the user named *Extended leave*.

    :::image type="content" source="media/fundamentals-get-started/get-started-add-option.png" alt-text="Add an option to the question node.":::

    Given that each employee's personal situation is different, questions about extended leave require a discussion with an HR expert. You'll need to build the bot so it can connect HR experts with the employees.

2. Add a message node that says *Extended leave needs HR expert approval. Let me connect you with them.*.

Power Virtual Agents bots can take actions by [adding Power Automate flows into a topic](advanced-flow.md). In this instance, you could add a flow that you've previously created that notifies a HR expert. This flow sends an adaptive card to the HR expert channel in Teams to let experts know a user needs them to reach out.

First, let's create the flow to send a message to a Teams channel and then call it with the appropriate input.

1. Add a question node asking for a description for the issue with the text *How would you describe the issue?* Save the description in a variable named *Description*.

    :::image type="content" source="media/fundamentals-get-started/get-started-variable-description.png" alt-text="Add a question node with the answer as a variable called Description.":::

2. Add a node under the question and select **Call an action**.

3. Select **Create a flow**. This launches Power Automate within the Power Virtual Agents app in Teams. We will use a built-in template to send a message to a channel, which makes it very easy to get started.

4. Choose the template **Send a message to a Teams channel**, then select **Continue**.  
    The flow template takes in two inputs from the bot, the **Subject** (title for the message) and **Message text** (actual message) to post to the channel.

    1. Under the **Post a message (v3)** flow definition, select the **Team ID** and the **Team channel ID** where the message should be posted.

    2. You can add some text to the message in addition to the description entered by the user, and complete the **Message** field as appropriate.

    3. Give the flow a name and save it.

    4. Close the flow authoring canvas.

5. This will take you back to the authoring canvas. You can now add an action and call this newly created flow.  

6. Pass in the variable you created earlier called *TimeOffType* for the **Subject** and the **Description** gathered in the chat. This way, when the flow posts a message on the Expert channel, it will state **Extended leave** as the title and the message defined in the flow.

    > [!TIP]
    > Power Virtual Agents is now directly integrated with Microsoft Teams so the bot knows which user from Teams it is chatting with it. This allows bot makers to use the information to build personal and customized bot responses.
    >
    > To use the name of the person chatting with the bot, there is a pre-defined variable named *bot.UserDisplayName* that be used [like any other variable](authoring-variables.md).

Now you can let the employee know the experts have been notified of their request and will be reaching out to them.

1. Add a message node with the message *We have notified the expert. They will be reaching out shortly.*  

1. End the conversation with a survey.  

1. Save the topic.

Now that the time-off topic has been created, Bob can save the topic and add other topics that match the need for the HR bot to answer questions that Contoso employees might have.

> [!TIP]
> Don't forget to test your bot and ensure it is working as expected for the best employee experience.
> You will see the message posted to the Teams channel when the flow is executed in the test canvas.

### Publish the bot

Once the topics are constructed and the bot is tested, you are ready to publish the bot. Publishing the bot will make the latest bot content updates available to end users.

1. In the navigation menu, select **Publish**.

1. Select **Publish**.

You'll need to follow a few more actions to actually make the bot available to employees.

> [!TIP]
> If you are already in a conversation with the bot, you can type *start over* to the bot after publishing the latest bot content. This will restart the conversation with the bot, with the latest content published.

### Open the bot in Teams to chat with it like any employee would

Before making the bot available to employees in your organization, there is an option to add the bot in Teams for yourself to chat with and experience it like any employee would.

On the **Publish** page, there is an option to **Open the bot**.

This will give you the chance to add your bot in Teams and chat with it.

### Make the bot available to other employees

Now you're ready to make the bot discoverable for other employees in the Teams app store, so they can install and chat with it.

1. In the navigation menu, select **Publish**.

1. Select **Share the bot** which will open a pane with some customization options.

#### Edit bot details

In this pane, you can edit the bot icon that shows in Teams, and change the short and long descriptions for your bot. These settings are pre-populated with starter content, but it's easy to customize for your bot.

:::image type="content" source="media/fundamentals-get-started/get-started-edit.png" alt-text="Edit the bot.":::

#### Share the bot with your team

This will add the bot to the **Built by your colleagues** section in the Teams app store.

Select **Add to Teams** and you will see a check mark indicating that the bot was added to Teams. With this, anyone in your team [can find the bot in the **Built by your colleagues**](publication-add-bot-to-microsoft-teams.md#show-the-bot-in-microsoft-teams-app-store) section in the Teams app store and add the bot to chat with it.

This is a workaround to see the bot in action since it does not require any admin involvement and avoids any spam to the admin. Once you are fully satisfied, you can follow the steps to share the bot with your organization which requires admin approval.

:::image type="content" source="media/fundamentals-get-started/get-started-edited.png" alt-text="The bot's icon is now a briefcase with a pink background.":::

#### Share the bot with your organization

Sharing your bot with the entire organization will feature your bot [in the **Built by your org** section in the Teams app store](publication-add-bot-to-microsoft-teams.md#show-the-bot-in-microsoft-teams-app-store). This requires admin approval.

1. Select **Submit for admin approval** and follow the steps.

1. First, confirm the bot icon, short description, and long description.

1. Then confirm that you want to share the bot with everyone in the organization.

1. Lastly, submit for admin approval. This part of the process cannot be completed right away and requires follow up with the admin for approval.


This next section of the guide looks at how the experience might be for a team member who is wanting to use the bot.

### Finding the bot in the Teams app store

Melissa can easily find the bot you built in the Teams app store to install and chat with it in Teams.

Depending on where the bot was shared, Melissa can find the bot in the **Built by your colleagues** section or the **Built by your org** section. To find the bot in the **Built by your org** section, it's a pre-requisite that the bot has been approved by an admin.

Melissa selects the chatbot's app tile, and then selects **Add for me**, as in the following screenshot:

:::image type="content" source="media/fundamentals-get-started/get-started-add-bot.png" alt-text="Teams opens the HR Support Bot with an option to Add for me so the user can start talking with it.":::

This will add the bot in the Teams side bar and open it for Melissa to chat.

The **Greeting** topic which is available as a [default or "system" topic](authoring-create-edit-topics.md) triggers automatically to welcome Melissa.

> [!TIP]
> You can [edit the **Greeting** topic](configure-bot-greeting.md) to have an appropriate welcome message.

### Employee chats with the bot to ask about time-off

Melissa needs time-off in the summer for personal reasons and enters *Need time-off information*.

An option for **Paid vacation** appears and Melissa begins to get some initial information by selecting **Paid vacation**.

A website is presented to get more information on paid time-off.

The bot then gathers customer satisfaction data and ends the conversation.

:::image type="content" source="media/fundamentals-get-started/get-started-chat.png" alt-text="The user can talk with the bot just like a normal Teams chat.":::

After reviewing the HR site for paid time-off, Melissa understands the need for extended leave after being gone for more than three months. Melissa returns to the bot and types *I need extended leave*.

The bot lets Melissa know that an HR expert is needed for the extended leave request and asks Melissa for a description of the issue.

The bot then informs Melissa that an expert has been notified, who will be reaching out shortly.

***Now that the request has been made, let's go back to the bot author's (that's you) view and go to the HR team's experts channel.***

Here we see that the bot ran the flow you added earlier and posted Melissa's request to the channel. HR experts in the channel can now reach out to Melissa to understand more on the extended leave request.

:::image type="content" source="media/fundamentals-get-started/get-started-channel.png" alt-text="The bot output a message into the Teams channel about Extended leave.":::

---

## Conclusion

You've now created a bot, created your own topic, tested it out, published it to a demo website, and learned how to analyze your bot's performance. Congratulations! Your bot has many capabilities beyond this, so please try it out and play with the advanced features.

For questions not covered in the product documentation or for feature ideas, please [visit our community](https://aka.ms/PowerVirtualAgentsForum) and post questions.

We would also like to hear your ideas on Power Virtual Agents. Please [visit our Ideas board](https://aka.ms/PowerVirtualAgentsIdeas) and post your ideas.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
