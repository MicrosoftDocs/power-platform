---
title: "TITLE"
description: "DESCRIPTION"
keywords: ""
ms.date: 11/5/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring
ms.collection: virtual-agent
---

# Use entities to streamline bot conversations

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

A big part of bot conversations in Power Virtual Agents is around natural language understanding, which is the ability for the AI to understand a user's intent. For example, natural language understanding is involved when a user might say 'I tried to use my gift card but it doesn't work' and the bot is able to route the user to the topic related to gift cards not working - even if that exact phrase isn't listed as a trigger phrase.

One fundamental part of natural language understanding is to identify *entities* in a user dialog. An entity can be viewed as an information unit that represents a certain type of a real world subject, like a phone number, zip code, city, or even a person's name. 

## Prebuilt entities
Out of the box, Power Virtual Agents comes with a set of pre-built entities, which represents the most commonly used stereotype information in real world dialogs, such as age, colors, numbers, and names. 

With the knowledge granted by entities, a bot can smartly recognize the relevant information from a user input and save it for later use. 

To help understand that notion, the money entity can be used as an example. 

1. In Power Virtual Agents, go to the **Entities** tab on the side navigation

    ![](media/entities-menu.png)

1. You'll see a list of the pre-built entities available. 

    ![Image.1 Entities pane](media/entities-1(draft).png)

1. Select the **Money** entity, which will open the details panel for the entity.

![Image.2 Money entity description](media/entities-2(draft).png)

Here you can an explanation of this entity and the ways it can be used to look for information related to money or currency from a user's input.

For example, when a user inputs "It costs 1000 dollars", using this money entity the bot knows the "1000 dollars" represents the **money type** of information. When the bot extracts this entity and saves it to a variable, it will save "1000" as a number even though the surrounding information was text.



## Custom Entities
The pre-built entities cover commonly used information types, but in some occasions, such as when building a bot that serves a specific purpose, you’ll need to teach the bot's language understanding model some domain-specific knowledge. 

For instance, let's say you want to build a bot for an outdoor store. In this case, you’ll need to teach the bot to acknowledge the "outdoor gears product" category in a dialog. 
 
To do this, you need to create a custom entity. In this case, you can create an entity that gives the bot the knowledge of all outdoor product categories. 

1. In Power Virtual Agents, go to the **Entities** tab on the side navigation

    ![](media/entities-menu.png)

2. Select **New entity** on the main menu.

    ![](media/entities-new.png)

![Image.3 Outdoor Store Categories entity](media/entities-3(draft).png)

3. This opens the entity creation window. Enter a name for the entity.

4. Provide the items that you want to be included in the entity; in this example this is a list of outdoor product categories names. You can do this by entering one item at a time in the **Enter item** input box to build out the full list. 

This pane also gives you a few other options. 

### Smart match

This option is part of the intelligence supported by the bot's language understanding model. It provides the flexibility to let the bot take in user input in a fuzzy way based on the list items given to the entity. 

Specifically, when this toggle is on, it lets the bot autocorrect misspellings and expands the matching logic semantically, such as automatically matching "softball" to "baseball". 

![Image.4 Smart match](media/entities-4(draft).png)


### Synonyms
This option allows you to manually expand the matching logic by adding synonyms.  

For example, for the "hiking" product category, you can add "trekking" and "mountaineering" as synonyms. For "Yoga", you can add "Pilates" as a synonym.

![Image.5 Synonyms](media/entities-5(draft).png)

## Use enities in a dialog
Now that you’ve done the work giving the bot the knowledge about outdoor gears by creating that product category entity and a few other custom entities, you can start to use them when constructing a dialog. 


![Image.6 Question node with entity selection](media/entities-6(draft).png)

![Image.7 Variable renaming](media/entities-7(draft).png)

1. Go to the [**Topics page**](getting-started-create-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add an entity to.

1. Click the plus (+) icon and select **Ask a question**. 

    ![Screenshot of adding a node](media/handoff-add-node.png)

1. Under **Identify**, select the entity you created in [Custom entities](#custom-entities).

    ![Image.1 Create a variable](media/Automatically_created_variable_(draft).PNG)

1. You can also optionally select items to show as buttons. For example, if you’d like to show some categories as buttons for users to conveniently choose from as their input, you can simply select **Select user options** and then pick them from the list that contains the items you added when you created the custom entity.

![Image.8 Add condition nodes](media/entities-8(draft).png)
![Image.9 More condition nodes](media/entities-9(draft).png)

1. Name the variable for the output of the user's response, if necessary.

## Slot filling
Slot filling is a natural language understanding concept that means saving an extracted entity to an object. In Virtual Agents, slot filling essentially means landing the extracted entity value into a variable. Let’s continue using the above dialog as an example to explain how this works in the Virtual Agents. 

Let’s bring up the testing bot. You can trigger this topic by typing “I want to buy something” and hit enter. Then you’ll see the topic has been successfully triggered and the bot comes back asking you for the product category with a few button choices you just specified. In the dialog tree, the tracing also shows the bot is running to the question node you just edited. 

![Image.10 Tracing](media/entities-10(draft).png)

You can totally test the button choices by clicking on one of them. Alternatively, you can also type in something like "trekking" and see what will happen. If you remember, when you defined the product category entity, you’ve added "trekking" as a synonym to "hiking", so theoretically, the bot should be able to understand this user input and translate "trekking" to "hiking" when proceeding the dialog. 

![Image.11 Tracing 2](media/entities-11(draft).png)

In tracing, it shows the dialog is correctly routed to the path in which the product category value is "Hiking". You can inspect the variable value from the variable watch window here. In the watch window, it shows the variable value is indeed "hiking". Essentially, slot filling has happened by landing the extracted entity “Hiking” to the variable VarProductCategory. 

![Image.12 Variable watch window](media/entities-12(draft).png)

Let's restart and try another scenario.  Instead of triggering the topic by saying "I want to buy something", this time you can give it a little bit more information all together from the beginning, saying something like "I want to buy some trekking gears". Notice that I not only tell the bot my intent of buying something, but also include the type of outdoor gear I want. This is a natural way a customer would communicate with a human agent. If a human agent can understand this phrase, we would expect the virtual agent to be able to handle it as well. 

![Image.13 Variable watch window](media/entities-13(draft).png)

In tracing, you can see the bot takes in this user input, intelligently skipped the question node asking for product category. **The bot is always actively listening to the user input and try to remember the information upfront and skip the unnecessary steps as appropriate. **

Let’s restart the testing again and try another case. In this round you can add a couple of more question nodes asking for things like type of hiking gear, as well as the price range (using the Money entity). This time when the product category question is presented, instead of telling the bot only the product category, you can say "I want to buy a pair of hiking boots under $100". As you can see from tracing, the bot is not only able to route to the correct hiking product category path, but also actively fill the slots asking for the type of hiking gear and the target price range information accordingly. 

![Image.14 Tracing 3](media/entities-14(draft).png)

To recap:  

To identify entities in a user dialog is an important part of Natural language understanding. Microsoft power virtual agents comes with a set of prebuilt entities which help the bot to understand most commonly used information types from a user input. You can also create custom entities to grant the bot domain specific knowledges. 

By specifying what type of entity to identify in a question node, the bot can extract and remember a specific type of information and save it to a variable.  






