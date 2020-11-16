---
title: "Quickstart: Create and deploy a bot in Microsoft Teams"
description: "Create and publish a Power Virtual Agents bot in Teams with this quickstart guide."
keywords: "PVA, teams, quickstart"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: fundamentals, teams
ms.collection: virtual-agent
---

# Quickstart: Create and deploy a human resources Power Virtual Agents bot in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../fundamentals-get-started.md)
> - [Power Virtual Agents app in Microsoft Teams](fundamentals-get-started-teams.md)



Power Virtual Agents empowers anyone in the organization to build chatbots with our built-in natural language processing and no-code graphical interface. With our latest Teams integration, you can create, author, test, and publish your bot into Teams all within the Microsoft Teams interface.

When you create chatbots, there are lots of things you need to think about, such as the sorts of questions someone might ask it, the different ways they might ask the question, and what the answer should be. You should also consider if the person has follow-up questions or concerns.

To help you get started making bots, we've created an end-to-end guide that takes you through all the steps needed to make a human resources bot. The guide covers:

- The scenario and how to map what your needs are to what a chatbot can do
- How to create a bot in the Power Virtual Agents app in Microsoft Teams
- How to build and enhance topics that answer commmon HR-style questions
- How to test, publish, and share the bot with the organization

In this guide, **HR Support bot** is a friendly question and answer bot that brings a support professional expert from the HR team into the loop when it is unable to help. An employee can ask the bot a question and the bot responds with an answer if the bot has content for it. 

If not, the bot allows the user to submit a query which then gets posted to a pre-configured team of experts who can provide support by acting upon the notifications from within their team itself. 

This is just one example of many use cases of Power Virtual Agents chatbots in Teams.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]




## Scenario

You are from Contoso HR and need to build a human resources (HR) support bot in Microsoft Teams. This bot will answer common HR questions, such as those related to time off, with relevant information from the company's internal knowledge base. The bot can also contact human HR experts and notify them that an employee needs help for uncommon scenarios.

Once this bot is published, Contoso employees can access HR information in Microsoft Teams without needing to search the company's intranet. 



## Steps in bot building

-   [Bot Author experience](#detailed-steps-bot-author-experience)
    -   [Install the Power Virtual Agents app in Microsoft Teams](#install-the-power-virtual-agents-app-in-microsoft-teams)
    -   [Create a new bot in a team](#create-a-new-bot-in-a-team)
    -   [Build an employee time-off topic for common time-off queries](#build-an-employee-time-off-topic-for-common-time-off-queries)
    -   [Test bot for expected behavior](#test-bot-for-expected-behavior)
    -   [Enhance topic to handle more complex queries by escalating to HR experts](#enhance-topic-to-handle-more-complex-queries-by-escalating-to-hr-experts)
    -   [Publish the bot](#publish-the-bot)
    -   [Open the bot in Teams to chat with it like any employee would](#open-the-bot-in-teams-to-chat-with-it-like-any-employee-would)
    -   [Make the bot available to other employees](#make-the-bot-available-to-other-employees)
-   [End user experience](#detailed-steps-end-user-experience)
    -   [Finding the bot in the Teams app store](#finding-the-bot-in-the-teams-app-store)
    -   [Employee chats with the bot to ask about time off](#employee-chats-with-the-bot-to-ask-about-time-off)


## Detailed steps: Bot author experience

This section of the guide looks at how you - as the bot author - can create and publish a bot.

### Install the Power Virtual Agents app in Microsoft Teams 

Start by launching the Power Virtual Agents app in Microsoft Teams:

1. Go to the Microsoft Teams app store and search for *power virtual agents*. You'll see the Power Virtual Agents app from Microsoft Corporation in the search results. 
2. Select the Power Virtual Agents app and then **Add for me**.

:::image type="content" source="media/get-started-install-app.png" alt-text="Add the Power Virtual Agents app.":::


The app is added and visible in the side navigation bar in Teams, and the app opens to the Power Virtual Agents Home page. This is where Teams users can come and build bots without needing to leave the Microsoft Teams interface.

>[!TIP]
>To make it easier to get back to, select and hold (or right-click) the Power Virtual Agents icon and select **Pin**.
>  
>:::image type="content" source="media/first-bot-pin.png" alt-text="A menu pops up with options to learn about the app, Pin it or uninstall it":::

### Create a new bot in a team 

1. Select **Start now** on the Home page.

2. Pick which team you want the bot to be managed by. Let's create the bot in the Contoso HR Team since you are part of Contoso HR. You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team) if necessary, before you add a bot to it. 

3. Fill in the bot name and language in the bot creation window. Let's use **HR Support Bot** for the name. The [default language is based on the Teams client language which you can change if you want](authoring-language-support-teams.md). 

4. Select **Create**.

    :::image type="content" source="media/get-started-create.png" alt-text="Create a new bot.":::

Now that the bot is created, we can go ahead and start adding content to the bot.

### Build an employee time-off topic for common time-off queries

Go to the topic list by selecting **Topics** in the side navigation pane.

A bot comes with a collection of topics that defines the bot's interaction with end users. The core of building a bot in Power Virtual Agents is to build topics that can respond to different user inquiries. Let's build a topic to answer employee questions about taking time off.

1. Select **+ New topic** on the top menu bar to create a new topic.

2. Name the topic **Employee time off** and give it an appropriate description.

3. Create trigger phrases. Trigger phrases for each topic define the sorts of ways that users will ask questions about that topic. Let's go ahead and add a few common ways that we expect employees to ask about time off. Enter these trigger phrases:

   - Need information on time off
  
   - I need help with time off
  
   - How many days of paid vacation do I have
  
   - What are the national holidays
  
   - I need extended leave

    Power Virtual Agents comes with built-in natural language capabilities. You only need to define a few trigger phrases about time off - phrases that you expect employees to use - and the bot can accurately trigger the topic based on the employee's input.

4. Select **Save** topic.

5. Select **Go to authoring canvas** to start building the conversation flow for this topic.

Now that the trigger phrases are defined, you can proceed to define the bot's interaction with the user when this topic is engaged. The graphical interface in Power Virtual Agents lets you build the topic without needing to write a single line of code.

First, let's give the employee a message that the bot is here to help with time-off questions using a message node.

Enter the text in the existing message node *I can help with questions related to time off*.

As an HR employee, you know that the most common time-off questions that employees have are around paid vacation time and national holidays. So add a question node for the bot to ask employees what type of time-off they are looking for, so you can provide better guidance. When a question node with user response options is added, the topic automatically gets a forked branch for each response.

1. Select the **+** below the message node, then select **Ask a question** to add a question node to the topic.

2. Enter *What information are you looking for?* in the **Ask a question** text box. This is the question the employee will be asked.

3. Add in two options for paid time-off and national holidays: under **Options for user**, add *Paid vacation* and *National Holidays*.

    :::image type="content" source="media/get-started-save.png" alt-text="Add options for paid vacation and national holidays":::

As you can see, user choices are stored in a variable and the topic will be branched off, based on the option the user chooses. Let's rename the variable to track it better in the topic.

1. On the variable, under **Save response as**, select the pencil icon to edit the variable properties.

2. The **Variable properties** pane opens, where you can rename the variable to *TimeoffType*. Close the **Variable properties** pane and you'll see the changes reflected in the authoring canvas.

    :::image type="content" source="media/get-started-options.png" alt-text="Multiple options are shown after a question node.":::

Now you can add different responses for each option. For *paid vacation*, we can have the bot point employees to an internal HR website to look up paid time-off policies.

1. Add a message node specifically for the *Paid vacation* branch with this message to the user: *For paid vacation time off, go to www.contoso.com/HR/PaidTimeOff to learn more on how to submit time-off requests.*

2. Add a node by selecting the **+** to end the conversation with a survey. Select **End the conversation**, then **End with survey**. This is the [customer satisfaction survey](analytics-csat-teams.md) pre-built in the bot for everyone to use in their topics.

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

4. End this path in the topic with a survey as well: add a node by selecting the **+** then **End the conversation** and **End with survey**. 

This is what your topic should look like now:


:::image type="content" source="media/get-started-options-filled.png" alt-text="The topic has an introductory message, followed by a question node with two options. Each option ends with a message and then a survey.":::

### Test bot for expected behavior

Power Virtual Agents comes with a built-in test bot that lets you test the bot in real time. Let's test the bot by launching the test bot canvas and providing the employee's input. When you save the topic, the test bot will be refreshed with the latest content. You can now test the bot with the latest content changes.

1. Select the purple bot icon at the bottom of the screen to launch the test bot canvas. 
2. Type in *I need time off information*.

    Even though *I need time off information* does not match the trigger phrases directly, Power Virtual Agents is able to process the user's input and triggers the employee time off topic. 

    As you chat with the bot in the test bot canvas, you can see where the bot is in the conversation in real-time in the authoring canvas by following the green highlights.

3. Select **Paid vacation**.

    As you can see now, the topic branches off based on the user's response. You can also open the variable to show the *TimeoffType* variable is set to **Paid time off** by the user. However, what happens if the user has already made it clear that they are looking for national holidays in their inquiry? The user may feel annoyed if the bot asks them to repeat themselves. Let's give it a try.

4. Reset the test bot canvas by selecting **Reset** above the test bot pane.

5. Type in *Need information on national holidays*

    As you can see, the bot is able to bypass the question on vacation type and directly provide information on national holidays. This is because Power Virtual Agents supports [entity extraction](advanced-entities-slot-filling-teams.md) and was able to determine the user is asking about national holidays.


    :::image type="content" source="media/get-started-test-bot.png" alt-text="The test bot shows how the AI knew what the user was asking":::

### Enhance topic to handle more complex queries by escalating to HR experts

Now that we have the basics out of the way, let's add a more complex option to the topic - extended leave.

1. Go back into the topic you created and go to the authoring canvas. 
2. In the **Ask a question node** add an option for the user named *Extended leave*.

    :::image type="content" source="media/get-started-add-option.png" alt-text="Add an option to the question node.":::

    Given that each employee's personal situation is different, questions about extended leave require a discussion with an HR expert. You'll need to build the bot so it can connect HR experts with the employees.

3. Add a message node that says *Extended leave needs HR expert approval. Let me connect you with them.*.

Power Virtual Agents bots can take actions by [adding Power Automate flows into a topic](advanced-flow-teams.md). In this instance, you could add a flow that you've previously created that notifies a HR expert. This flow sends an adaptive card to the HR expert channel in Teams to let experts know a user needs them to reach out. 

First, let's create the flow to send a message to a Teams channel and then call it with the appropriate input.

1. Add a question node asking for a description for the issue with the text *How would you describe the issue?* Save the description in a variable named *Description*.

    :::image type="content" source="media/get-started-variable-description.png" alt-text="Add a question node with the answer as a variable called Description":::

2. Add a node under the question and select **Call an action**.
3. Select **Create a flow**. This launches Power Automate within the Power Virtual Agents app in Teams. We will use a built-in template to send a message to a channel, which makes it very easy to get started.

4. Choose the template **Send a message to a Teams channel**, then select **Continue**.  
    The flow template takes in two inputs from the bot, the **Subject** (title for the message) and **Message text** (actual message) to post to the channel. 
    1. Under the **Post a message (v3)** flow definition, select the **Team ID** and the **Team channel ID** where the message should be posted. 
    2. You can add some text to the message in addition to the description entered by the user, and complete the **Message** field as appropriate. 
    3. Give the flow a name and save it. 
    4. Close the flow authoring canvas.

    This will take you back to the authoring canvas. You can now add an action and call this newly created flow.  
    
    Pass in the variable you created earlier called *TimeOffType* for the **Subject** and the **Description** gathered in the chat.  
    
    This way, when the flow posts a message on the Expert channel, it will state **Extended leave** as the title and the message defined in the flow.

    >[!TIP]
    >Power Virtual Agents is now directly integrated with Microsoft Teams so the bot knows which user from Teams it is chatting with it. This allows bot makers to use the information to build personal and customized bot responses.
    >To use the name of the person chatting with the bot, there is a pre-defined variable named *bot.UserDisplayName* that be used [like any other variable](authoring-variables-teams.md).

Now you can let the employee know the experts have been notified of their request and will be reaching out to them.

1. Add a message node with the message *We have notified the expert. They will be reaching out shortly.*  

2. End the conversation with a survey.  

3. Save the topic.

Now that Bob has the time-off topic created, he can save the topic and add other topics that match the need for his HR bot to answer questions that Contoso employees might have.

>[!TIP]
> Don't forget to test your bot and ensure it is working as expected for the best employee experience. 
>You will see the message posted to the Teams channel when the flow is executed in the test canvas.

### Publish the bot 

Once the topics are constructed and the bot is tested, you are ready to publish the bot. Publishing the bot will make the latest bot content updates available to end users.

1. Select the **Publish** icon in the side navigation pane.

1. Select **Publish**.

You will need to follow a few additional actions to actually make the bot available to employees.

>[!TIP]
> If you are already in a conversation with the bot, you can type *start over* to the bot after publishing the latest bot content. This will restart the conversation with the bot, with the latest content published.

### Open the bot in Teams to chat with it like any employee would 

Before making the bot available to employees in your organization, there is an option to add the bot in Teams for yourself to chat with and experience it like any employee would.

On the **Publish** tab in the side navigation pane, there is an option to **Open the bot**.

This will give you the chance to add your bot in Teams and chat with it.

### Make the bot available to other employees

Now you're ready to make the bot discoverable for other employees in the Teams app store, so they can install and chat with it.

1. Go to the **Publish** page from the side navigation pane.

1. Select **Share the bot** which will open a pane with some customization options.

#### Edit bot details

In this pane, you can edit the bot icon that shows in Teams, and change the short and long descriptions for your bot. These are pre-populated with starter content, but it's easy to customize for your bot.

:::image type="content" source="media/get-started-edit.png" alt-text="Edit the bot.":::

#### Share the bot with your team

This will add the bot to the **Built by your colleagues** section in the Teams app store.

Select **Add to Teams** and you will see a check mark indicating that the bot was added to Teams. With this, anyone in your team [can find the bot in the **Built by your colleagues**](publication-add-bot-to-microsoft-teams-teams.md#share-the-bot-with-your-team) section in the Teams app store and add the bot to chat with it.

This is a workaround to see the bot in action since it does not require any admin involvement and avoids any spam to the admin. Once you are fully satisfied, you can follow the steps to share the bot with your organization which requires admin approval.


:::image type="content" source="media/get-started-edited.png" alt-text="The bot's icon is now a briefcase with a pink background.":::

#### Share the bot with your organization 

Sharing your bot with the entire organization will feature your bot [in the **Built by your org** section in the Teams app store](publication-add-bot-to-microsoft-teams-teams.md#share-the-bot-with-your-organization). This requires admin approval.

1. Select **Submit for admin approval** and follow the steps.

2. First, confirm the bot icon, short description, and long description.

3. Then confirm that you want to share the bot with everyone in the organization.

4. Lastly, submit for admin approval. This part of the process cannot be completed right away and requires follow up with the admin for approval.


## Detailed steps: End User Experience

This section of the guide looks at how the experience might be for a team member who is wanting to use the bot.

### Finding the bot in the Teams app store

Melissa can easily find the bot you built in the Teams app store to install and chat with it in Teams. 

Depending on where the bot was shared, she can find the bot in the **Built by your colleagues** section or the **Built by your org** section. To find the bot in the **Built by your org** section, it's a pre-requisite that the bot has been approved by an admin. 

Melissa selects the chatbot's app tile, and then selects **Add for me**, as in the following screenshot:

:::image type="content" source="media/get-started-add-bot.png" alt-text="Teams opens the HR Support Bot with an option to Add for me so the user can start talking with it.":::

This will add the bot in the Teams side navigation bar and open it for her to chat.

The **Greeting** topic which is available as a [default or "system" topic](authoring-create-edit-topics-teams.md) triggers automatically to welcome Melissa.

>[!TIP]
>You can [edit the **Greeting** topic](configure-bot-greeting-teams.md) to have an appropriate welcome message.

### Employee chats with the bot to ask about time off

Melissa needs time-off in the summer for personal reasons.

She types in *Need time off information*.

She sees an option for **Paid vacation** and begins there to get some initial information, so she selects **Paid vacation**.

She is presented the website to get more information on paid time-off.

The bot then gathers customer satisfaction data and ends the conversation.

:::image type="content" source="media/get-started-chat.png" alt-text="The user can talk with the bot just like a normal Teams chat.":::

After reviewing the HR site for paid time-off, she understands that she needs extended leave since she will be gone for more than 3 months. She returns to the bot and types *I need extended leave*.

The bot lets Melissa know that an HR expert is needed for the extended leave request and asks Melissa for a description of her issue.

The bot then informs Melissa that an expert has been notified, who will be reaching out shortly.

***Now that the request has been made, let's go back to the bot author's (that's you) view and go to the HR team's experts channel.***

Here we see that the bot ran the flow you added earlier and posted Melissa's request to the channel. HR experts in the channel can now reach out to Melissa to understand more on her extended leave request.

:::image type="content" source="media/get-started-channel.png" alt-text="The bot output a message into the Teams channel about Extended leave":::

## Conclusion

By following these steps, you now have an HR bot up and running!

You've seen how to create a chatbot that addresses employee time-off questions without being a developer or data scientist. 

The chatbot was not only able to provide answers, but also took action to notify HR experts for the employee's extended leave request. 

Then we showed how you could make the chatbot available to employees. 

You created, authored, and made the chatbot available to employees all from within Microsoft Teams.

As next steps, you can continue working on their bot, adding more topics and refining existing topics.

See the [Power Virtual Agents app in Microsoft Teams](fundamentals-what-is-power-virtual-agents-teams.md) overview topic for more ideas on what to do with Power Virtual Agents.

For additional help, or to post and vote on ideas, check out the [Power Virtual Agents community forum](https://aka.ms/pva_forum) and [Community help and support](../fundamentals-support.md).
