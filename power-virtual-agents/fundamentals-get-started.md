---
title: "Quickstart: Create and deploy a copilot on the portal (contains video)"
description: "Create and publish a Microsoft Copilot Studio copilot on the online portal in minutes."
keywords: "PVA, online, web, portal, quickstart"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: fundamentals, portal, ceX
ms.service: power-virtual-agents
ms.collection:
    - virtual-agent
    - get-started
searchScope:
  - "Power Virtual Agents"
---

# Quickstart: Create and deploy a Microsoft Copilot Studio copilot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio empowers teams to quickly and easily create powerful copilots using a guided, no-code graphical experience without needing data scientists or developers.

This quickstart article helps you create a copilot for the first time. You learn how to add topics to your copilot, test content changes in real-time, and deploy your copilot to a test page. Once deployed, you can analyze the performance of your copilot.

## Prerequisites

[Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-copilot-studio.md).

# [Web app](#tab/web)

### Explore the home page

Microsoft Copilot Studio has an app-level home page, listing all your copilots. On this page you can create a new copilot, view recent copilots, and access learning resources like videos, documentation, and learning paths.

:::image type="content" source="media/fundamentals-get-started/new-bot1.png" alt-text="Screenshot of the app-level home page." lightbox="media/fundamentals-get-started/new-bot1.png":::

In the navigation menu, select **Copilots** to open the **Copilots** page. All copilots you create in a given environment appear here. In your list of copilots, you can see metadata such as owner, when it was last published, and who last modified the copilot.

### Create a copilot

1. Go to the [Microsoft Copilot Studio introduction website](https://aka.ms/TryPVA). Supported browsers include Microsoft Edge, Chrome, and Firefox.

1. On the website, select **Try free** and sign in with your work email address.

   > [!NOTE]
   > Personal Microsoft accounts are currently not supported.

   :::image type="content" source="media/fundamentals-get-started/try-free-copilot-studio.png" alt-text="Screenshot of the try free button location on the Microsoft Copilot Studio introduction website.":::

1. After you sign up, a default [Power Apps environment](environments-first-run-experience.md) is made for you. For most users, this default is sufficient. However, to specify a custom Power Apps environment, select another one, using the environment picker.

   :::image type="content" source="media/fundamentals-get-started/environment-picker.png" alt-text="Screenshot of the environment picker." lightbox="media/fundamentals-get-started/environment-picker.png":::

   > [!NOTE]
   > Microsoft Copilot Studio is only [supported in these data locations](data-location.md). Outside of these locations, create a custom environment with **Region** set to a supported data location before you create your copilot.  
   >
   > For more information on creating a custom Power Apps environment, see [Working with environments](environments-first-run-experience.md).

1. Once signed up, you land on the **Home** page. Select **Create a copilot**.
1. A wizard starts. Give your copilot a name.
1. In the **What language do you want your copilot to speak?** field, select a language. The language dropdown is prepopulated with the browser locale.

   :::image type="content" source="media/fundamentals-get-started/create-new-copilot-screen.png" alt-text="Screenshot of the Create a copilot page with name and language fields." lightbox="media/fundamentals-get-started/create-new-copilot-screen.png":::

1. (Optional) To boost conversations with AI-generated responses, add a URL to the **Boost your conversations with generative answers** field.

1. (Optional) You can make customizations and enhancements before finalizing your copilot.

   Choose **Edit advanced options** at the bottom of the page.
  
   1. Select a copilot icon to give your copilot a personality and represent your business scenario. You can select from the prepopulated list of icons or upload a custom icon. This icon gets displayed in the chat window when the copilot responds.
  
   1. Choose prepopulated **Lesson topics** to provide starter content and familiarize yourself with copilot topics.
  
   1. Select the solution for your copilot and the schema name.

   These options are all advanced options, which can be changed later.

1. Select **Create**.

   Creating your first copilot in a new environment can take up to 15 minutes. Additional copilots get created faster.

1. You're redirected to the copilot's **Overview** page.

   > [!NOTE]
   > Copilot operations like publish and authentication configurations might take a few more minutes to be ready for use.

#### Familiarize yourself with Copilot Studio

While waiting for processing, you might want to:

- Explore the overall user interface for Copilot Studio.
- Explore topics and start creating and editing topics.
- Experiment with the preloaded user topics and system topics.
- Interact with your copilot using the **Test copilot** chat pane.
- Review [Key concepts - Authoring Microsoft Copilot Studio copilots](authoring-fundamentals.md) to better understand authoring.

> [!TIP]
> Select **Home**, in the navigation menu, to go back to the app-level home page from your copilot.
>
>:::image type="content" source="media/fundamentals-get-started/go-home.png" alt-text="Screenshot of Home button in the navigation menu.":::

### Create a topic

With a new copilot, you can start creating topics. A topic is a dialog tree that describes how your copilot responds to a user's question.

1. In the navigation menu, select **Topics**, then select **Add** at the top of the page. From **Add**, select **Topic**, and then **From blank**.

    :::image type="content" source="media/fundamentals-get-started/topics-new.png" alt-text="Screenshot that shows you how to add a topic to your copilot." lightbox="media/fundamentals-get-started/topics-new.png":::

1. Here you build a topic by giving it a name and configuring a trigger. Trigger phrases are examples of user questions or utterances that teach the copilot to respond when the questions or utterances are detected.

    1. Name your topic 'Personal Hello World' at the top.
    1. In the **Trigger** box under **Phrases**, select **Edit**. The **On Recognized Intent** pane appears.
    1. Add 'hello world' text, also called an utterance, under **Add phrases**.
    1. Select the **+** icon next to the phrase box to add it to your trigger.
    1. Select the **Save** icon at the top to save your trigger.

    :::image type="content" source="media/fundamentals-get-started/hello-world-topic.png" alt-text="Screenshot that shows how to name a topic and add a trigger phrase." lightbox="media/fundamentals-get-started/hello-world-topic.png":::

1. Select the (**+**) icon below your trigger node and select **Send a message**.

   1. Enter 'Hello! I'll create a personalized greeting for you.' into the newly added **Message** node.

      :::image type="content" source="media/fundamentals-get-started/quickstart-add-node.png" alt-text="Screenshot that shows how to add a message node and create message text.":::

   1. Select the **Save** icon at the top to save your trigger.

1. Select the (**+**) icon below your new message node and add an **Ask a question** node.

    Enter the question text, 'Where do you live?', in the **Ask a message** box. Select **Multiple choice options** under **Identify** to give the customer a choice in responses.

    :::image type="content" source="media/fundamentals-get-started/quickstart-create-topic-02.png" alt-text="Screenshot that shows how to add a question to a question node.":::

   With **Multiple choice options** selected, you need to add more options.

1. Add two options for the user, by selecting **+ New option** under **Options for user** in the **Question** node, then enter 'Seattle' as the text. Add another option and enter 'Bellevue' as the text.

    Each option is presented in the copilot chat as a multiple choice button to the user.

1. View the whole dialog tree in the authoring canvas to understand the conversation flow.

   The dialog tree creates separate paths in the conversation, depending on the customer's response. This path leads the customer to the best resolution for each user response.

   :::image type="content" source="media/fundamentals-get-started/quickstart-options.png" alt-text="Screenshot showing the whole dialog tree. The branching options are created automatically." lightbox="media/fundamentals-get-started/quickstart-options.png":::

   In the forked conversation path, the nodes automatically check for 'Seattle' in one path and 'Bellevue' in the other path to take the best next step.

1. Finally, select the (**+**) icon below each of the **Condition** nodes to add a **Message** node in each branch.

    Add a small message like 'Hello Seattle!' in the Seattle branch and 'Hello Bellevue!' in the Bellevue branch.

    :::image type="content" source="media/fundamentals-get-started/quickstart-create-topic-03.png" alt-text="Complete conversation." border="false":::

1. Select the **Save** icon at the top to save your trigger.

You now have a basic branching dialog tree, congratulations! You can begin to create more complex versions of this tree by incorporating [variables](authoring-variables.md), [entities](advanced-entities-slot-filling.md), and [Power Automate flows](advanced-flow.md).

### Test your content in real time

With content authored into a dialog tree, test the conversation in real time to see if it's working as you expected. You can test, using the **Test your copilot** pane.

:::image type="content" source="media/fundamentals-get-started/test-bot-panel.png" alt-text="Start copilot with latest content." border="false":::

1. If the test copilot pane isn't showing on your screen, select **Test your copilot** at the bottom of the navigation menu.

    :::image type="content" source="media/fundamentals-get-started/test-bot-menu.png" alt-text="Test copilot control." border="false":::

1. Try out your newly authored dialog tree by typing into the test copilot pane.

1. Turn on **Track between topics** at the top, which enables you to follow along with the copilot as it executes your dialog. You see parts of your dialog tree highlighted as the copilot gets to that portion of the dialog.

    :::image type="content" source="media/fundamentals-get-started/test-bot-track.png" alt-text="Start conversation." border="false":::

1. Type "hello world" in the chat window, and send the message to the copilot. You see the top portion of your dialog tree highlighted in green, and **Seattle** and **Bellevue** presented as user options in the test copilot pane.

    The copilot is now waiting for you to respond, displaying suggestions on how to respond. These suggestion buttons reflect what you authored within your dialog tree in the **Ask a question** node.

    In the test copilot, you can either select these suggestion buttons to continue, or you can enter your response into the chat window.

    :::image type="content" source="media/fundamentals-get-started/quickstart-test-bot-03.png" alt-text="Tracing conversation." border="false":::

1. Continue the dialog by selecting the Seattle branch.

    You see the chat stop once you reach the bottom of this branch. If you author more content, the dialog continues, but since we only created a small dialog tree, we reach the end of the content quickly.

This test experience empowers you to quickly create and test a conversation to ensure that the conversation flows as anticipated. If the dialog doesn't reflect your intention, you can change the dialog, and save it. The latest content is pushed into the test copilot, and you can try it out again. The published version of the copilot doesn't change, so feel free to play around with your content until you're happy with it.

### Publish your copilot - web app

Once you're fine with the content authored in your copilot, you can publish your copilot to a website.

1. In the navigation menu, select the **Publish**.

1. Select **Publish** to activate your copilot. If the publish is successful, you see a green banner on the top of the page.

    :::image type="content" source="media/fundamentals-get-started/channel-publish-latest-content.png" alt-text="Deploy copilot to demo website." border="false":::

1. Select the demo website link under **Share your copilot** to see it in action on a demo website.

    A new window opens in your browser. If you don't see a new window, check if a pop-up blocker is active and, if so, allow the window to be opened. Usually, you can allow pop-ups from the URL field directly.

    The webpage demonstrates what your copilot looks like to an end-user who comes to your webpage. The copilot canvas is at the bottom. You can interact with it by typing into the window or by selecting a starter phrase from the provided options.

   For more information on publishing your copilot to other channels, see the documentation under [Publication key concepts](publication-fundamentals-publish-channels.md).

### Analyze the performance of your copilot

When your copilot completes interactions with users, the statistics are recorded in your copilot's analytics. To view analytics select **Analytics** from the navigation menu.

Here, you can find key performance indicators (KPIs) showing:

- The volume of sessions your copilot handled.
- how effectively your copilot was able to engage end-users and resolve issues
- escalation rates to human agents
- abandonment rates during conversations

You find customer satisfaction information at the KPI level and in the **Customer Satisfaction** tab.

> [!NOTE]
> There is up to a 1-hour delay between when the conversations occur and when the statistics for those conversations appear in the analytics views. Also, all interactions with the copilot are logged in analytics, including interactions from your demo website, custom website, or test copilot.

You can also view detailed session history and transcripts by selecting **Analytics** > **Sessions**. Here, you can download a CSV file with the full session transcript. You can tune the performance of your copilot and change the content in your topics to improve your copilot's efficiency.

:::image type="content" source="media/fundamentals-get-started/analytics-sessions.png" alt-text="Download sessions." border="false":::

For more information, see [Analytics key concepts](analytics-overview.md).

# [Teams](#tab/teams)

Microsoft Copilot Studio empowers anyone in the organization to build copilots in Microsoft Teams with our built-in natural language processing (NLP) and no-code graphical interface. With our latest Teams integration, you can create, author, test, and publish your copilot into Teams all within the Microsoft Teams interface.

When you create a copilot, consider:

- The types of questions someone might ask.
- The different ways a question is asked.
- The expected answers.
. Whether or not a user has follow-up questions or concerns.

To help you get started making human resource (HR) copilots, this quickstart guides you through:

- Your scenario and how to map your needs to align with what a copilot can do.
- How to create a copilot in the Microsoft Copilot Studio app in Microsoft Teams.
- How to build and enhance topics that answer common HR-style questions.
- How to test, publish, and share the copilot with your organization.

In this guide, **HR Support copilot** is a friendly question and answer copilot that brings a support professional expert from the HR team into the loop when it's unable to help. An employee can ask the copilot a question and the copilot responds with an answer if the copilot has content for it.

If not, the copilot allows the user to submit a query, which gets posted to a preconfigured team of experts who can provide support by acting upon the notifications from within their team itself.

### Scenario

You work in human resources (HR) at Contoso and need to build an HR support copilot in Microsoft Teams. This copilot answers common HR questions, like those related to time-off, with relevant information from the company's internal knowledge base. The copilot can also contact human HR experts and notify them that an employee needs help for uncommon scenarios.

Once this copilot is published, Contoso employees can access HR information in Microsoft Teams without needing to search the company's intranet.

### Copilot building steps

See the [Quickstart: Create and deploy a human resources Microsoft Copilot Studio copilot in Teams](quickstart-preview.md).

The next section of this quickstart looks at how you can create and publish a copilot.

### Install the Power Virtual Agents app in Microsoft Teams

Start by launching the Microsoft Copilot Studio app in Microsoft Teams:

1. Go to the Microsoft Teams app store and search for _power virtual agents_. You see the Microsoft Copilot Studio app from Microsoft Corporation in the search results.
1. Select the Microsoft Copilot Studio app and then **Add for me**.

    :::image type="content" source="media/fundamentals-get-started/get-started-install-app.png" alt-text="Add the Microsoft Copilot Studio app.":::

The app is added and visible in the side pane in Teams, and the app opens to the Microsoft Copilot Studio Home page. Teams users can build copilots here without leaving the Microsoft Teams interface.

> [!TIP]
> To make it easier to get back to, select and hold (or right-click) the Microsoft Copilot Studio icon and select **Pin**.
>  
> :::image type="content" source="media/fundamentals-get-started/first-bot-pin.png" alt-text="A menu pops up with options to learn about the app, Pin it or uninstall it":::

### Create a new copilot in a team

1. Select **Start now** on the Home page.

1. Pick which team manages the copilot. Create the copilot in the Contoso HR Team since you're part of Contoso HR. You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team) if necessary, before you add a copilot to it.

1. Fill in the bcopilot name and language in the copilot creation window. Let's use **HR Support Copilot** for the name. The [default language is based on the Teams client language, which you can change if needed](authoring-language-support.md).

1. Select **Create**.

    :::image type="content" source="media/fundamentals-get-started/get-started-create.png" alt-text="Create a new copilot.":::

Now that the copilot is created, we can go ahead and start adding content to the copilot.

### Build an employee time-off topic for common time-off queries

Go to the topic list by selecting **Topics** in the navigation menu.

A copilot comes with a collection of topics that defines the copilot's interaction with end users. The core of building a copilot in Microsoft Copilot Studio is to build topics that can respond to different user inquiries. Let's build a topic to answer employee questions about taking time-off.

1. Select **+ New topic** on the top menu bar to create a new topic.

1. Name the topic **Employee time off** and give it an appropriate description.

1. Create trigger phrases. Trigger phrases for each topic define the ways users ask questions about that topic. Add a few common ways that we expect employees to ask about time off.

   Enter these trigger phrases:

   - Need information on time off
   - I need help with time off
   - How many days of paid vacation do I have
   - What are the national holidays
   - I need extended leave

    Microsoft Copilot Studio comes with built-in natural language capabilities. You only need to define a few trigger phrases about time-off - phrases that you expect employees to use - and the copilot can accurately trigger the topic based on the employee's input.

1. Select **Save** to add it to the topic list.

Now that the trigger phrases are defined, you can proceed to define the copilot's interaction with the user when this topic is engaged. The graphical interface in Microsoft Copilot Studio lets you build the topic without needing to write a single line of code.

First, let's give the employee a message that the copilot is here to help with time-off questions using a message node.

Enter the text in the existing message node _I can help with questions related to time-off_.

As an HR employee, you know that the most common time-off questions that employees have are around paid vacation time and national holidays. So add a question node for the copilot to ask employees what type of time-off they're looking for, so you can provide better guidance. When a question node with user response options is added, the topic automatically gets a forked branch for each response.

1. Select **Add node** (**+**) below the message node, then select **Ask a question** to add a question node to the topic.

1. Enter _What information are you looking for?_ in the **Ask a question** text box. The employee asks this question.

1. Add two options for paid time-off and national holidays: under **Options for user**, add _Paid vacation_ and _National Holidays_.

   :::image type="content" source="media/fundamentals-get-started/get-started-save.png" alt-text="Add options for paid vacation and national holidays.":::

As you can see, user choices are stored in a variable and the topic branches off, based on the option the user chooses. Let's rename the variable to track it better in the topic.

1. On the variable, under **Save response as**, select the pencil icon to edit the variable properties.

1. The **Variable properties** pane opens, where you can rename the variable to _TimeoffType_. Close the **Variable properties** pane and you see the changes reflected in the authoring canvas.

    :::image type="content" source="media/fundamentals-get-started/get-started-options.png" alt-text="Multiple options are shown after a question node.":::

Now you can add different responses for each option. For _paid vacation_, we can have the copilot point employees to an internal HR website to look up paid time-off policies.

1. Add a message node for the _Paid vacation_ branch with this message to the user: _For paid vacation time-off, go to www.contoso.com/HR/PaidTimeOff to learn more on how to submit time-off requests._

1. Add a node by selecting the (**+**) icon to end the conversation with a survey. Select **End the conversation**, then **End with survey**. This survey is the [customer satisfaction survey](analytics-csat.md) prebuilt in the copilot for everyone to use in their topics.

1. In the _National Holidays_ path, add a message node with the following text:

    ```text
    National holidays for 2020:
    -   New Year's Day: January 1st
    -   Memorial Day: May 25th
    -   Independence day: July 4th
    -   Labor Day: September 7th
    -   Thanksgiving: November 26th - 27th
    -   Christmas Eve and Christmas Day: December 24th - 25th
    ```

1. End this path in the topic with a survey as well: add a node by selecting the (**+**) icon then **End the conversation** and **End with survey**.

:::image type="content" source="media/fundamentals-get-started/get-started-options-filled.png" alt-text="The topic has an introductory message, followed by a question node with two options. Each option ends with a message and then a survey.":::

### Test copilot for expected behavior

Microsoft Copilot Studio comes with a built-in test copilot that lets you test the copilot in real time. Let's test the copilot by launching the test copilot canvas and providing the employee's input. When you save the topic, the test copilot is refreshed with the latest content. You can now test the copilot with the latest content changes.

1. Select the purple copilot icon at the bottom of the screen to launch the test copilot canvas.

1. Type in _I need time off information_.

   Even though _I need time off information_ doesn't match the trigger phrases directly, Microsoft Copilot Studio is able to process the user's input and triggers the employee time off topic.

   As you chat with the copilot in the test copilotcanvas, you can see where the copilot is in the conversation in real-time in the authoring canvas by following the green highlights.

1. Select **Paid vacation**.

Now the topic branches off based on the user's response. You can also open the variable to show the _TimeoffType_ variable is set to **Paid time-off** by the user. However, what happens if the user is looking for national holidays in their inquiry? The user might feel annoyed if the copilot asks them to repeat themselves. Let's give it a try.

1. Above the test copilot pane, select **Reset**.

1. Enter _Need information on national holidays_.

   The copilot bypasses the question on vacation type and directly provides information on national holidays. This choice is because Microsoft Copilot Studio supports [entity extraction](advanced-entities-slot-filling.md) and was able to determine that the user ask about national holidays.

   :::image type="content" source="media/fundamentals-get-started/get-started-test-bot.png" alt-text="The test copilot shows how the AI knew what the user was asking.":::

### Enhance topic to handle more complex queries by escalating to HR experts

Now that we have the basics out of the way, let's add a more complex option to the topic - extended leave.

1. Go back into the topic you created and go to the authoring canvas.
1. In the **Ask a question node**, add an option for the user named _Extended leave_.

    :::image type="content" source="media/fundamentals-get-started/get-started-add-option.png" alt-text="Add an option to the question node.":::

    Given that each employee's personal situation is different, questions about extended leave require a discussion with an HR expert. Build the copilot so it can connect HR experts with the employees.

1. Add a message node that says 'Extended leave needs HR expert approval. Let me connect you with them.'.

Microsoft Copilot Studio copilots can take actions by [adding Power Automate flows into a topic](advanced-flow.md). In this instance, you can add a previous flow that notifies an HR expert. This flow sends an adaptive card to the HR expert channel in Teams to let experts know a user needs them to reach out.

First, let's create the flow to send a message to a Teams channel and then call it with the appropriate input.

1. Add a question node asking for a description for the issue with the text 'How would you describe the issue?'

1. Save the description in a variable named _Description_.

   :::image type="content" source="media/fundamentals-get-started/get-started-variable-description.png" alt-text="Add a question node with the answer as a variable called Description.":::

1. Add a node under the question and select **Call an action**.

1. Select **Create a flow**, which launches Power Automate within the Microsoft Copilot Studio app in Teams. We use a built-in template to send a message to a channel, which makes it easy to get started.

1. Choose the template **Send a message to a Teams channel**, then select **Continue**.  
    The flow template takes in two inputs from the copilot, the **Subject** (title for the message) and **Message text** (actual message) to post to the channel.

   1. Under the **Post a message (v3)** flow definition, select the **Team ID** and the **Team channel ID** where the message should be posted.

   1. You can add some text to the message in addition to the description entered by the user, and complete the **Message** field as appropriate.

   1. Give the flow a name and save it.

   1. Close the flow authoring canvas.

   You return to the authoring canvas. You can now add an action and call this newly created flow.  

1. Pass in the variable you created earlier called _TimeOffType_ for the **Subject** and the **Description** gathered in the chat. This way, when the flow posts a message on the Expert channel, it states **Extended leave** as the title and the message defined in the flow.

    > [!TIP]
    > Microsoft Copilot Studio is now directly integrated with Microsoft Teams so the copilot knows which user from Teams it is chatting with it. This allows copilot makers to use the information to build personal and customized copilot responses.
    >
    > To use the name of the person chatting with the copilot, there is a pre-defined variable named _bot.UserDisplayName_ that be used [like any other variable](authoring-variables.md).

Let the employee know their request notified the experts, who will reach out to them.

1. Add a message node with the message _We notified the expert. They'll reach out shortly._  

1. End the conversation with a survey.
1. Save the topic.

Now that the time-off topic is created, Bob can save the topic and add other topics that match the need for the HR copilot to answer questions that Contoso employees might have.

> [!TIP]
> Don't forget to test your copilot and ensure it is working as expected for the best employee experience.
> You will see the message posted to the Teams channel when the flow is executed in the test canvas.

### Publish your copilot - Teams

Once the topics are constructed and the copilot is tested, you're ready to publish the copilot. Publishing the copilot makes the latest copilot content updates available to end users.

1. In the navigation menu, select **Publish**.

1. Select **Publish**.

You need to do a few more actions to make the copilot available to employees.

> [!TIP]
> If you are already in a conversation with the copilot, you can type _start over_ to the copilot after publishing the latest copilot content. This will restart the conversation with the copilot, with the latest content published.

### Open your copilot in Teams to chat

On the **Publish** page, there's an option to **Open the copilot**. You can add your copilot in Teams and chat with it before your sharing it with your employees.

### Make your copilot available to other employees

Now you're ready to make the copilot discoverable for other employees in the Teams app store, so they can install and chat with it.

1. In the navigation menu, select **Publish**.

1. Select **Share the bot**, which opens a pane of customization options.

#### Edit copilot details

In this pane, you can edit the copilot icon that shows in Teams, and change the short and long descriptions for your copilot. These settings are prepopulated with starter content, but it's easy to customize for your copilot.

:::image type="content" source="media/fundamentals-get-started/get-started-edit.png" alt-text="Edit the copilot.":::

#### Share your copilot with your team

You can add your copilot to the **Built by your colleagues** section in the Teams app store.

Select **Add to Teams** and you see a checkmark indicating the copilot was added to Teams. Anyone in your team [can find the copilot in the **Built by your colleagues**](publication-add-bot-to-microsoft-teams.md#show-the-bot-in-microsoft-teams-app-store) section of the Teams app store and add the copilot.

Viewing the copilot in the app store is a workaround to test it, since admin approval isn't required and avoids any spam to the admin. Once you're fully satisfied, follow the steps to share the copilot with your organization, which requires admin approval.

:::image type="content" source="media/fundamentals-get-started/get-started-edited.png" alt-text="The copilot's icon is now a briefcase with a pink background.":::

#### Share your copilot with your organization

Sharing your copilot with the entire organization feaures your copilot [in the **Built by your org** section in the Teams app store](publication-add-bot-to-microsoft-teams.md#show-the-bot-in-microsoft-teams-app-store). Access requires admin approval.

1. Select **Submit for admin approval** and follow the steps.

1. First, confirm the copilot icon, short description, and long description.

1. Then confirm that you want to share the copilot with everyone in the organization.

1. Lastly, submit for admin approval. This part of the process can't be completed right away and requires follow up with the admin for approval.

This next section of the guide looks at how the experience might be for a team member who is wanting to use the copilot.

### Finding your copilot in the Teams app store

Melissa can easily find the copilot you built in the Teams app store to install and chat with it in Teams.

Depending on where the copilot was shared, Melissa can find the copilot in the **Built by your colleagues** section or the **Built by your org** section. To find the copilot in the **Built by your org** section, it's a prerequisite that the copilot gets approved by an admin.

Melissa selects the copilot's app tile, and then selects **Add for me**. The copilot appears in the Teams side bar.

:::image type="content" source="media/fundamentals-get-started/get-started-add-bot.png" alt-text="Teams opens the HR Support copilot with an option to Add for me so the user can start talking with it.":::

The **Greeting** topic is available as a [default or "system" topic](authoring-create-edit-topics.md) and triggers automatically to welcome Melissa.

> [!TIP]
> You can [edit the **Greeting** topic](configure-bot-greeting.md) to have an appropriate welcome message.

### Employee chats with the copilot to ask about time-off

Melissa needs time-off in July and August for personal reasons and enters _Need time-off information_.

An option for **Paid vacation** appears and Melissa begins to get some initial information by selecting **Paid vacation**.

A website is presented to get more information on paid time-off.

The copilot then gathers customer satisfaction data and ends the conversation.

:::image type="content" source="media/fundamentals-get-started/get-started-chat.png" alt-text="The user can talk with the copilot just like a normal Teams chat.":::

Melissa reviews the HR site for paid time-off and understands she needs an extended leave. Melissa returns to the copilot and types _I need extended leave_.

The copilot lets Melissa know that an HR expert is needed for the extended leave request and asks Melissa for a description of the issue.

The copilot notifies an expert, who will reach out to Melissa shortly.

***Now that the request is made, return to the author's view and go to the HR team's experts channel.***

Here we see that the copilot ran the flow you added earlier and posted Melissa's request to the channel. HR experts in the channel can now reach out to Melissa to understand more on the extended leave request.

:::image type="content" source="media/fundamentals-get-started/get-started-channel.png" alt-text="The copilot output a message into the Teams channel about Extended leave.":::

---

## Conclusion

You created a copilot, created your own topic, tested it out, published it to a demo website, and learned how to analyze your copilot's performance. Congratulations! Your copilot has many more capabilities, so try it out and play with the advanced features.

For questions not covered in the documentation or for feature ideas, [visit our community](https://aka.ms/PowerVirtualAgentsForum) and post questions.

We'd love to hear your ideas on Microsoft Copilot Studio.[Visit our Ideas board](https://aka.ms/PowerVirtualAgentsIdeas) and post your ideas.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
