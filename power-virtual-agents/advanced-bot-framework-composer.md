---
title: "Extend your bot with Bot Framework Composer"
description: ""
keywords: ""
ms.date: 11/09/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Extend you bot with Bot Framework Composer

You can enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Power Virtual agents bot. 

Composer is integrated into Power Virtual Agents to allow developers and business users to build bots together. Composer lets you extend your bot with Bot Framework functionality, including:
- Adaptive gialogs
- Language generation (LG)
- Regular expressions (RegEx)
- Adaptive cards 

Composer with Power Virtual Agents lets you access conversational memory and context, including the variables defined in Power Virtual Agents. 

For example, you could create event-driven dynamic dialogs to handle interruptions, cancelations and context switching. You could also add adaptive cards to display interactive elements like images and videos, forms, and more in the bot. 

Bot Framework Composer lets you use a variety of pre-built functions and expressions and define multiple variations of a phrase for the bot to select at random at runtime.

Custom dialogs added with Bot Framework Composer are deployed, hosted, and executed together with the rest of Power Virtual Agents bot content, and do not require any additional Azure hosting.

>[!IMPORTANT]
>Bot Framework Composer integration is not available to users who only have the [Teams Power Virtual Agents license](requirements-licensing-subscriptions). You must have a [trial](sign-up-individual) or full Power Virtual Agents license.


## Prerequisites

- [Introduction to Bot Framework Composer](/composer/introduction)
- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Access Bot Framework Composer from within Power Virtual Agents 
1. Go to the **Topics** tab for the bot you want to edit.

2. Select **Open in Bot Framework Composer (Preview)**. 

    ![Open Composer from Topics page](media/Composer_OpeninBotFrameworkComposerButton_tooltip.png)

If you already have Composer installed, Power Virtual Agents will try to open your bot in Composer. 

>[!IMPORTANT]
>You should always open Bot Framework Composer from within Power Virtual Agents if you plan to create content for Power Virtual Agents bots. This will ensure that Composer has all the necessary plugins needed for integration with Power Virtual Agents. 



If you don't have it installed, you can download it from the **download Composer** link. This takes you to a **Download confirmation** window where you can also learn more about Composer.
    
![Screenshot of the Power Virtual Agents Composer window indicating that Composer is not installed.](media/composer/composer-not-present.png)
    
   
During installation, make sure to unselect the **Run Bot Framework Composer** checkbox, since you will need to open Composer application from within Power Virtual Agents to use it with your bot. 

![Bot Framework Composer Install Complete](media/Composer_InstallWizardFinish.png)

Go back to Power Virtual Agents **Topics** page. Select **Open in Bot Framework Composer (Preview)** and then **Open Composer** to open your bot in Composer.

![Open Bot Framework Composer](media/Composer_AfterDownload.png)


>[!NOTE]
> In some cases, a firewall might be blocking some features in Composer and you might need to explicitly allow access. Check with your admin for details.

If you are opening Composer from this Power Virtual Agents bot for the first time, you need to specify the **Name** (alphanumeric, no spaces or special characters) for your **Composer project**. You can skip this step if you already have a bot project for this bot my selecting **Cancel** in this step.
![Create Bot Framework Composer](media/ComposerUI_CreateProject.png)

Your Power Virtual Agents bot is now open in Composer and you are ready to start developing.
![Bot Framework Composer Project Initial View](media/ComposerUI_Open_initialView.png)

In some cases, Power Virtual Agenta might be unable to launch Composer automatically. However, you can always launch it manually from your browser.
Use the **Copy Link** feature to copy the link to the Composer and paste it as the URL in your web browser.
![Bot Framework Composer Copy Link](media/ComposerUI_CopyLinkComposer.png)


## Guildelines for creating bot content for Power Virtual Agents in Composer
When opened from a Power Virtual Agents bot, Composer launches a **Composer project** on you PC and loads your bot content into it.

The **main (root) dialog** in your **Composer project** is the same as the project name you gave it. It correspons to your Power Viurtal Agents bot content. In this example below, your **main (root) dialog** is **PVA_Composer_Bot**: 
![Bot Framework Composer main (root) dialog](media/Composer_Guidelines/Gd_mainDialog_initial.png)

There are few key guidliens to follow when using Composer to create your bot content for Power Virtual Agents.

- You cannot edit Power Virtual Agents topics in Composer; this content is read-only in Composer. However, you can create and add content to Power Virtual Agents in Composer.

- You can add new **Bot Framework triggers** of any kind to your **main (root) dialog**. However, the structure of **triggers** added to the **main (root) dialog** should be kept as simple as possible. **Send a reponse**, **Ask a question** or any actions that contain **Langauge Generation** cannot be used in **triggers** added to **main (root) dialog**. Doing so will result in validation errors and prevent you from publishing your Composer content to Power Virtual Agents.
![Bot Framework Composer main (root) dialog](media/Composer_Guidelines/Gd_mainDialog_trigger.png)

- You can create new **Bot Framework dialogs** and add **events** and **triggers** of any kind to them. **Send a response**,**Ask a question**, and **Langauge Generation** can be used in **triggers** that belong to the new **dialogs**.

- On the **Bot Reponses** tab, the **main (root) dialog** section should be empty. Having any assets there will result in validation errors and prevent your from publishing your Composer content to Power Virtual Agents.

![Bot Framework Composer main (root) dialog](media/Composer_Guidelines/Gd_BotReponses_main.png)

- On the **Bot Responses** tab, the **All** section should be empty (that is, the **Common.lg** file should be empty). Having any assets there will result in validation errors and prevent your from publishing your Composer content to Power Virtual Agents.

![Bot Framework Composer main (root) dialog](media/Composer_Guidelines/Gd_BotReponses_all.png)

- All **Language Generation** (.lg) and **Language Understanding** (.lu) files should have the corresponding **dialogs**. For example, if you have only one **dialog** with name **dialog1**, then you can have **dialog1.en-us.lg** and **dialog1.en-us.lu**, but you cannot have **extra.en-us.lg**.

- The **main (root) dialog** in Composer should never be deleted, as it correspoonts to your Power Virtual Agents bot. The **main (root) dialog** can have 0 or more **triggers**.

For a deep-dive on Bot Framework Composer **dialogs**, **events**, **trigers** and how to create advanced bot content with Bot Framework, refer to the following resources:

- [Bot Framework Composer dialogs](/composer/concept-dialog)
- [Bot Framework Composer events and triggers](/composer/concept-events-and-trigger)
- [Language Generation](/composer/concept-language-generation)
- [Conversation flow and memory](/composer/concept-memory)


## Composer features not supported with Power Virtual Agents
The following Bot Framework Composer features are not supported with Power Virtual Agents:

- LUIS Recognizer  
Default Recognizer in Composer is set to Power Virtual Agents NLU

- Bot Skills  
Cannot invoke Bot Skills in Composer content meant for Power Virtual Agents

- QnA Maker  
This feature is not available in Composer for Power Virtual Agents

- OAuth Login and User Sign Off  
These types of actions are not supported in Composer for Power Virtual Agents

- Dialog Inputs and Outputs  
Dialog Inputs and outputs are not supported in Composer for Power Virtual Agents

- Entity detection in trigger phrases in Composer  
Cannot use `# getUserName  - my name is {username=userName}` in Composer

- Testing in Bot Framework emulator  
All Composer content should be published and then tested in Power Virtual Agents  

## Example 1 – showing an Adaptive Card in Power Virtual Agents 

Go to **Topics** in Power Virtual Agents and create a new topic called **Meal delivery options**. Add the following trigger phrases for this new topic:
- what meals can I order
- what meal options do you have
- what dishes do you deliver
- entrees available for delivery 

Click **Save** to save your new topic and then select **Go to authoring canvas** to create your dialog:
![Power Virtual Agents new topic](media/Composer_Example1/E1_MealsTopicDetails.png)

In the **Authoring canvas**, create a **Question** node to ask the user about their location and make sure to select entity **City** from the dropdown list in the **Identity** field:
![Power Virtual Agents Question node](media/Composer_Example1/E1_Dialog1.png)

Rename the output variable **Var** to **user_city**. Set the variable **Usage** to **Bot (any topic can access)** and **Save** the topic.
![Power Virtual Agents variable](media/Composer_Example1/E1_Dialog2.png)

Next, you will enhance this topic **Meal delivery options** to show the images of the meal choices avaliable in your user’s city by extending your bot with Bot Framework Composer content. Go back to **Topics** page and click on **Open in Bot Framework Composer (Preview)** button to download and launch Bot Framework Composer.
![Power Virtual Agents Open Composer](media/Composer_Example1/E1_OpenComposer.png)

Your Power Virtual Agents bot will open in a Bot Framework Composer project. You will see that Power Virtual Agents topics from your bot are uploaded into Composer but are not editable. **Recognizer Type** field is set to **Default Recognizer** which is **Power Virtual Agents NLU**.
>[!TIP]
>The **LUIS** service is not supported as a Recognizer for Power Virtual Agents in Composer. The **Default Recognizer** is set to **Power Virtual Agents NLU** instead. You do not need to have an additional subscription to use **Power Virtual Agents NLU** because it is included in your Power Virtual Agents license.
![Bot Framework Composer main (root) dialog](media/Composer_Example1/E1_Contoso_meals_initial.png)

Go to the **Design** tab in Composer and select **+ Add** and then **Add new dialog** in the dropdown list:

![Composer Design tab](media/Composer_Example1/E1_Meals_creatNewDialog.png)

Name your new dialog **Meals**. Select **OK** to create a new dialog **Meals** in Composer. You will use this **Bot Framework dialog** to display an adaptive card.

![Composer Design tab](media/Composer_Example1/E1_Meals_newDialog.png)

Go to the **Bot Responses** tab in Composer and open the **Meals** section. Select **Show code**:

![Composer Bot Responses tab](media/Composer_Example1/E1_Meals_BotReponses_empty.png)

In the code window, copy and paste the following text strings and image URLs that you will use in your Adaptive Card:
```JSON
# Chicken()
-Chicken

# Steak()
-Steak

# Tofu()
-Tofu

# SteakImageURL()
-https://contososcubademo.azurewebsites.net/assets/steak.jpg
# ChickenImageURL()
-https://contososcubademo.azurewebsites.net/assets/chicken.jpg
# TofuImageURL()
-https://contososcubademo.azurewebsites.net/assets/tofu.jpg

```

![Composer Bot Responses tab](media/Composer_Example1/E1_Meals_BotResponse_data.png)

Next, add the adaptive card by adding the following JSON code to the same window. This adaptive card takes a parameter and displays a set of three images based on the image URLs.
```JSON
# adaptivecardjson_meals(location)
- ```
{
    "type": "AdaptiveCard",
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "version": "1.1",
    "body": [
            {
            "type": "TextBlock",
            "text": "Meal delivery options for ${location}:",
            "size": "Medium",
            "weight": "Bolder"
        },
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "Image",
                            "url": "${SteakImageURL()}",
                            "size": "Stretch",
                            "spacing": "Medium",
                            "horizontalAlignment": "Center"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "Image",
                            "url": "${ChickenImageURL()}",
                            "horizontalAlignment": "Center"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "Image",
                            "url": "${TofuImageURL()}",
                            "horizontalAlignment": "Center"
                        }
                    ]
                }
            ]
        },
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "${Steak()}",
                            "wrap": true,
                            "horizontalAlignment": "Center"                            
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "${Chicken()}",
                            "wrap": true,
                            "horizontalAlignment": "Center"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "${Tofu()}",
                            "wrap": true,
                            "horizontalAlignment": "Center"
                        }
                    ]
                }
            ]
        }
    ]
}
 ```
 
![Composer Bot Responses tab - Adaptive Card JSON](media/Composer_Example1/E1_Meals_BotReponse_JSON.png)

As the next step, you need to add the **Activity** that will display this adaptive card in the Bot Framework dialog to the same window in Composer:

```
# AdaptiveCardMeals(location)
[Activity
    Attachments = ${json(adaptivecardjson_meals(location))}
]

```

![Composer Bot Responses tab - Activity](media/Composer_Example1/E1_Meals_BotResponse_Activity.png)

Go back to **Design View** in Composer and select **Meals** dialog. Select **BeginDialog** and add **Send a response** to your dialog. We will use this node to display the adaptive card we have just created in the **Bot Reponses** tab.

![Composer Begin Dialog - add Send a response action](media/Composer_Example1/E1_Meals_AddResponse.png)

For the new **Send a response** action, the **Language Generation** panel will open on the side in Composer. Add the following to this window to show the adaptive card and pass a Power Virtual Agents global variable `user_city` as a parameter: 

```
- ${AdaptiveCardMeals(virtualagent.user_city)}
```

>[!TIP]
>You can access Power Virtual Agents global variables in Composer by referencing scope **virtualagent**. For example, **virtualagent.user_city** will refer to the value of a variable that was created and set in the Power Virtual Agents bot.


You are now ready to upload the **Meals** dialog to your Power Virtual Agents bot. Select the **Publish** tab and then the **Publish profile** of your bot, and choose **Publish to selected profile**. Add an optional comment and select **Okay** in the confirmation window to start uploading.

![Composer Publish Example 1](media/Composer_Example1/E1_Meals_Publish.png)

The Composer content will be validated by Power Virtual Agents and a successful publish will be reported in Composer.

![Composer Publish Example 1](media/Composer_Example1/E1_Meals_Publish_Success.png)

Go to  thePower Virtual Agents **Topics** page to see your new Bot Framework content. Your new **Meals** Bot Framework dialog is now shown on the **Topics** page as part of your Power Virtual Agents bot.

![Power Virtual Agents Topics page - new Bot Framework dialog](media/Composer_Example1/E1_Meals_in_PVA_Topics.png)

Open the **Meal delivery options** topic in **Authoring canvas** in Power Virtual Agents. Under a **Question** node, add a new **Go to another topic** node, and choose the Bot Framework dialog **Meals** from the list of available topics: 

![Power Virtual Agents - Authoring canvas](media/Composer_Example1/E1_MealsDelivery_redirect.png)

Your Power Virtual Agents topic **Meal delivery options** will call the Bot Framework dialog **Meals** to display an adaptive card. Select **Save** to save the chamges to your topic.

![Power Virtual Agents - redirect to Bot Framework dialog](media/Composer_Example1/E1_MealsDelivery_RedirectToMeals.png)

To test you changes in Power Virtual Agents, open **Test pane** and make sure **Track between topics** is set on. Type in the following to start your conversation:
- What meals do you deliver?

![Power Virtual Agents Example 1 test](media/Composer_Example1/Example1_cropped.gif)


## Example 2 – displaying multi-select options list in Power Virtual Agents 
Open the Power Virtual Agents bot used in the previous example and use **Open in Bot Framework Composer (Preview)** button in **Topics** page to open this bot in Composer. While in **Design View** in Composer and select **+ Add button** and choose to add another Bot Framework dialog.
![Composer Create new Bot Framework dialog](media/Composer_Example2/E2_DailySpecials_create.png)

In your new **DailySpecials** dialog in Composer, go to **Manage properties** and choose **Set a property** menu option to create a new Composer property in this dialog:
![Composer Create new Bot Framework dialog](media/Composer_Example2/E2_DailySpecials_set_a_property.png)

Give this property the following name in Composer **Set a property** panel on the right:


```C#
conversation.days_array
```
In **Value** field in **Set a property** panel, change the type to **[]** to indicate that this property is going to be an **array**. Enter the following data into the **Value** field to create an array populated with days of the week:

```C#
["Sunday",  "Monday",  "Tuesday",   "Wednesday",  "Thursday",  "Friday",  "Saturday"]
```

![Composer Create property](media/Composer_Example2/E2_DailySpecials_setArray.png)

Next, go to **Bot Responses** tab in Composer and select **DailySpecials**. Click on **Show code** button.
![Composer Bot Responses tab](media/Composer_Example2/E2_DialySpecials_BotReponse_initial.png)

Add the following into the **Bot Reponses** tab for **DailySpecials** to create daily offers for all the days on the week:
```C#
# DailySpecials(day)
- SWITCH: ${day}
- CASE: ${0}
    - All tofu meals are 10% off on Sundays!
    - Every Sunday, all tofu entrees are 10% off.
- CASE: ${1}
    - All steak options are 10% off on Mondays!
    - Enjoy your Monday with a special offer of 10% off on all steak dishes!
- CASE: ${2}
    - All the chicken meal options are 10% off on Tuesdays!
    - Tuesday special is 10% off on all the chicken dishes!
  - CASE: ${3}
    - All the chicken and tofu meal options are 10% off on Wednesdays!
    - Wednesday special is 10% off on all the chicken and tofu dishes!
  - CASE: ${4}
    - On Thursdays, get a free delivery in Seattle, Bellevue, and Redmond on all orders over $80!
    - Thursday special is a free delivery on orders over $80 in Seattle, Bellevue, and Redmond.
- CASE: ${5} 
    - Friday special - get a 10% discount on all dishes and delivery is free on all orders over $80!
    - Every Friday, we offer 10% off on all meals and a free delivery on orders over $80!
- CASE: ${6}
    - On Saturdays, we have a free delivery on all orders over $50.
    - Free delivery on all orders over $50 on Saturdays!
- DEFAULT:
    - Holiday special - free delivery anywhere in Seattle, Bellevue and Redmond on orders over $70 today!
    - Holiday Delivery is on us if you are in Seattle, Bellevue and Redmond and your order is over $70 total!
```
![Composer Bot Responses tab - Language Generation code](media/Composer_Example2/E2_DailySpecials_BotResponse.png)

Go back to the **Design View** in Composer and select **BeginDialog** under **DailySecials**. Add new prompt for user input to this dialog by selecting **Multi-choice** under **Ask a question** menu option.
![Composer Design View - ask a multi choice questions](media/Composer_Example2/E2_DailySpecials_aska question.png)

Enter the following text for the prompt:
-	Please select a day:
![Composer Design View - add propmt language generation](media/Composer_Example2/E2_DailySpecials_prompt.png)

Select **User Input (Choice)** action. In **Prompt with multi-choice** panel, under **User Input**, set **Property** to **conversation.day_choice**. 
Set **Output format** to **index** to return the index of the selected option instead of value.
![Composer Design View - set up choice output property](media/Composer_Example2/E2_DailySpecials_input_variable.png)

Next, scroll down the **Prompt with multi-choice** panel and set **List style** to **HeroCard** to display our options list vertically. 
Select **Write an expression** for **Array of choices** field and set it to use **conversation.days_array** property we have created in this dialog.
![Composer Design View - set up array of choices](media/Composer_Example2/E2_DailySpecials_array_multi_option.png)

You have created a multi-choice option list that is based on **conversation.days_array** and stores user selection into **conversation.day_choice** property.
You can now use this **conversation.day_choice** property to display the daily special for the selected day. Add **Send a response** action to your **DailySpecials** dialog under **User Input** action and add the following in the **Language Generation** panel on the right:

```C#
- ${DailySpecials(conversation.day_choice)}
```
![Composer Design View - display Daily Special for the selected day](media/Composer_Example2/E2_DailySpecials_addResponse.png)

Go to **Design View** tab in Composer and navigate to the Power Virtual Agents **main (root) dialog**; the is the top level read-only dialog in Composer that you have created when you opened Power Virtual Agents bot in Bot Framework Composer. Select **+ Add** button and choose **Add new trigger** option.

![Composer Design View - add new trigger](media/Composer_Example2/E2_main_addNewTrigger.png)

Set type of trigger to **Intent recognized** and name it **Specials**. Click **Submit** button.
![Composer Design View - add new Intent Recorgized trigger](media/Composer_Example2/E2_main_nameNewTrigger.png)

A new Bot Framework **intent trigger** will be created in Composer. On the right-hand side panel **Trigger Phrases**, please add the following trigger phrases for your intent:

```C#
-what specials do you have
-any special deals
-do you have discounts
```
![Composer Design View - Trigger Phrases](media/Composer_Example2/E2_main_addTriggerPhrases.png)

Select **Begin a new dialog** menu option under **Dialog management** menu to create a node that can call another dialog:
![Composer Design View - begin new dialog](media/Composer_Example2/E2_main_DialogManagement.png)

In the new action, select to call **DailySpecials** in **Begin a new dialog** panel on the right:
![Composer Design View - call a new dialog](media/Composer_Example2/E2_main_callDialog.png)

You are now ready to add you Composer content to your Power Virtual Agents bot. Go to **Publish** tab and publish it to your Power Virtual Agents bot.
![Composer Publish to Power Virtual Agents bot](media/Composer_Example2/E2_main_publishSuccess.png)

Once your new Composer content is successfully published, go to Power Virtual Agents **Topics** page to verify that your new Composer content has been uploaded correctly. In your **Topics** list, you now can see the new **Specials** and **DailySpecials** content that you have created in Bot Framework Composer.

>[!NOTE]
>You might need to refresh your **Topics** page in Power Virtual Agents to see the new content that has been uploaded from Composer. 

![Power Virtual Agents Topics page](media/Composer_Example2/E2_DailySpecials_inPVA.png)

Make sure **Track between topics** is turned on, and test your new bot content by entering the following in **test pane** in Power Virtual Agents to start a conversation:

- Do you have any specials?

![Power Virtual Agents Test pane](media/Composer_Example2/Example2._cropped.gif)

## Example 3 – using Bing Search as a fallback in Power Virtual Agents 
Open the Power Virtual Agents bot used in the earlier exampls. Go to **Topics** page and click on **Open in Bot Framework Composer (Preview)** button to open Composer. Select **+ Add** button in Composer to add another Bot Framework dialog. Name your new dialog **BingSearch** in Composer.
![Composer add dialog](media/Composer_Example3/E3_BingSearch_addDialog.png)

Once **BingSearch** dialog is added, go to **Bot Responses** tab for this dialog, switch to **Show code** view and insert the following Adaptive Card JSON:
```JSON

# adaptivecardjson_BingSearch(user_utterance)
- ```
{    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.2",
    "fallbackText": "This card requires Media to be viewed. Ask your platform to update to Adaptive Cards v1.1 for this and more!",
    "actions": [
        {
            "type": "Action.OpenUrl",
            "title": "Search with Bing",
            "url": "https://www.bing.com/search?q=${user_utterance}",
            "style": "positive"
        }
    ],
    "body": [
        {
            "type": "Image",
            "url": "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWe65Z?ver=2d4e&q=90&m=6&h=201&w=358&b=%23FFFFFFFF&l=f&o=t&aim=true"
        },
        {
            "type": "TextBlock",
            "text": "${user_utterance}",
            "wrap": true,
            "separator": true,
            "horizontalAlignment": "Center",
            "size": "Medium"
            
        }
    ]
}
```

![Composer Bot Responses - add JSON](media/Composer_Example3/E3_BingSearch_BotResponses_AdaptiveCard.png)



Next, add this **Activity** to the same **Bot Reponses** window in Composer:
```
 # AdaptiveCardBingSearch(user_utterance)
[Activity
    Attachments = ${json(adaptivecardjson_BingSearch(user_utterance))}
]

```
![Composer Bot Responses - add Activity](media/Composer_Example3/E3_BingSearch_BotResponses_Activity.png)


Go to **Design** tab in Composer and select **BeginDialog** under **BingSearch** dialog. Add **Send a response** action and set the following in **Language Generation** panel:

```C#
-${AdaptiveCardBingSearch(turn.activity.text)}
```
![Composer BeginDialog - Send a response](media/Composer_Example3/E3_BingSearch_addBotReponse_BingSearch.png)

Next, go to the **main (root) dialog** in Composer. Select **+ Add** button and choose **Add new trigger**.
![Composer - Add new trigger](media/Composer_Example3/E3_BingSearch_addNewTrigger.png)

Make sure the type of trigger is set to **Unknown Intent** and click **Submit** button.
![Composer - unknown intent](media/Composer_Example3/E3_BingSearch_createUnknownIntent.png)

Once **Unknown trigger** is created and open in **Design** view, select **Begin a new dialog** under **Dialog management menu**.
![Composer Unknown Intent triger - Dialog management](media/Composer_Example3/E3_BingSearch_callDialog.png)

In **Begin a new dialog** panel on the right, select dialog **BingSearch**.
![Composer Unknown Intent triger - call BingSearch dialog](media/Composer_Example3/E3_BingSearch_callBingSearch.png)

You are now ready to add you Composer content to your Power Virtual Agents bot. Go to **Publish** tab in Composer and publish it to your Power Virtual Agents bot.
![Composer Publish tab](media/Composer_Example3/E3_BingSearch_uploadSuccess.png)

Once your new Composer content is successfully published, you can now see that **OnUnknownIntent** was added to the **Topics** page in Power Virtual Agents.

>[!NOTE]
>You might need to refresh your **Topics** page to see the new bot content that has been added from Composer.
![Power Virtual Agents Topics page](media/Composer_Example3/E3_BingSearch_inTopicsList.png)

Make sure **Track between topics** is turned on, and test your new bot content by entering the following in **test pane** in Power Virtual Agents to start a bot conversation:
- Is tofu vegan?

![Power Virtual Agents test](media/Composer_Example3/Example3_cropped.gif)

## Using Power Virtual Agents variables in Bot Framework Composer

You can have read-only access to Power Virtual Agents global variables by referencing the following scope in Bot Framework Composer:
- virtualagent

For example, you create a variable called **user_city** in Power Virtual Agents bot. Make it a global variable by setting its **Usage** to **Bot (any topic can access)** in Power Virtual Agents.
![Power Virtual Agents - variable](media/Composer_Example1/E1_Dialog2.png)

This setting makes Power Virtual Agents variable **user_city** available in Bot Framework Composer. Use the following notation to refer to it in Composer:

 ```C#
virtualagent.user_city 
```
![Composer - refer to Power Virtual Agents variables](media/Composer_Example1/E1_Meals_ResponseAdded.png)

## Testing Bot Framework content with Power Virtual Agents
You can test the content you have created in Bot Framework Composer by publishing it to Power Virtual Agents and using the Test pane in Power Virtual Agents.
Publish your Bot Framework content to a Power Virtual Agents bot by selecting its **Publish profile** in **Publish tab** in Composer.
![Composer Publish tab](media/Composer_Test/Test_Publish_Success.png)

After your successfully publish your Bot Framework content, you can use Power Virtual Agents **test pane** to test it. Start a conversation with the bot by typing in a trigger phrase in Power Virtual Agents **test pane**:

![Composer Publish tab](media/Composer_Test/Test_image.png)


>[!NOTE]
>Bot Framework Emulator cannot be used to test Composer content created for Power Virtual Agents bots. 

## Troubleshooting
If you having trouble publishing your Bot Framework Composer content to Power Virtual Agents, you can use **See Log** feature in **Publish** tab in Composer. The loog will provide a detailed description of the errors encountered during validation. Please select the Publish attempt in the **Publish history** and click on **See Log** button.
![Composer Publish - See Log](media/Composer_Troubleshooting/TL_PublishHistory.png)

This will bring up the list of warnings and errors that were encourered during the Publish process in Composer, along with suggestions on how to fix:
![Composer Publish - warnings and errors](media/Composer_Troubleshooting/Tl_PublishError.png)

If a problem persists or you encounter issues developing in Bot Framework Composer, please got to [GitHub](https://github.com/microsoft/BotFramework-Composer/issues) to see the list of known issues in Composer or to log a new issue. <br>

For troubleshooting your bot in Power Virtual Agents, please refer to [Troubleshoot your bot](https://docs.microsoft.com/en-us/power-virtual-agents/advanced-flow#troubleshoot-your-bot) section in Power Virtual Agents documentation.

## Learn More

To learn more about developing in Bot Framework Composer, you can refer to these resources:
[Bot Framework Composer documentation](https://docs.microsoft.com/en-us/composer/) 
[Tour of Composer](https://docs.microsoft.com/en-us/composer/quickstart-tour-of-composer)
[Tutorial: Create a new bot](https://docs.microsoft.com/en-us/composer/tutorial/tutorial-create-bot)
[Tutorial: Add cards and buttons to your bot](https://docs.microsoft.com/en-us/composer/tutorial/tutorial-cards)
[Tutorial: Add language generation to your bot](https://docs.microsoft.com/en-us/composer/tutorial/tutorial-language-generation)
[Bot Framework Composer on GitHub](https://github.com/Microsoft/BotFramework-Composer)


