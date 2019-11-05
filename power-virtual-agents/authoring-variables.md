---
title: "Work with variables in Power Virtual Agents"
description: "Use variables to utilize custom and prebuilt entities, to allow for customized conversations in your bot."
keywords: ""
ms.date: 11/4/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring
ms.collection: virtual-agent
---

# Work with variables

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

Variables let you save responses from your customers in a conversation with your bot so that you can reuse them later in the conversation. 

For example, you can save a customer's name in a variable called `UserName`. The bot can then address the customer by name as the conversation continues.

You can use variables to create logical expressions that dynamically route the customer down different conversation paths. You can also feed variables to [Power Automate](how-to-flow.md) and [Bot Framework Skills](/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0) as input parameters, and save the output results from those actions.  

## Entity and variable types
Power Virtual Agents uses *[entities](advanced-entities-greedy-slot-filling.md)* to understand and identify a specific type of information from a user's responses. When saving the identified information to a variable, a *variable type** will be associated with it. The variable type is essentially analogous with the *entity*. 

Each entity or variable type maps to a base type, these are listed in the following table. 

The base type defines the operators that can be used for the corresponding variable when constructing a logical expression. It also defines whether a variable can be used to feed to a [flow](how-to-flow.md) or Azure Bot Framework Skill action node as an input parameter. 

For example, a **boolean** base type maps to an operator "is equal to" with possible values being true or false, while a **number** base type will give you a series numeric operators such as "is equal to", "is greater than", or "is greater than or equal to", and so on.

 Entity | Variable Base Type
 ---|---
 Multiple choice options | text
 User's entire response | text
 Age | number
 Boolean | boolean
 City | text
 Color | text
 Continent | text
 Country or region | text
 Date and time | text
 Duration | text
 Email | text
 Event | text
 Language | text
 Money | text
 Number | text
 Ordinal | text
 Organization | text
 Percentage | number
 Person name | text
 Phone number | text
 Point of interest | text
 Speed | number
 State | text
 Street address | text
 Temperature | number
 URL | text
 Weight | number
 Zip code | text
 Custom entity | text

## Create a variable
In the bot authoring canvas, add a question node by choosing "Ask a question", then a variable will be automatically created. 

1. Go to the [**Topics page**](getting-started-create-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add a variable to.

1. Click the plus (+) icon and select **Ask a question**. 

    ![Screenshot of adding a node](media/handoff-add-node.png)

1. You'll notice a variable that contains the user's response is automatically created.

    ![Image.1 Create a variable](media/Automatically_created_variable_(draft).PNG)

## Pick an entity to use
By default the question node will be created using the *Multiple choice options* entity, but you can also pick a different prebuilt entity, or custom pick by choosing what to identify from the node. For example, you can choose **Person name** to use that entity. 

![Image.2 Select an entity](media/Pick_an_entity_(draft).PNG)

## Rename a variable
When a variable is automatically created, a default name will be given. You rename a variable by clicking on the variable name, entering a new name, and clicking **Done** to save the new name.

![Image.3 Rename a variable](media/Rename_a_variable_(draft).PNG)

## Use variables in action nodes
When using a variable in an action node, if a variable's base type matches with a parameter type specified for a flow or Azure Bot Framework Skill, it will show up as a candidate to be used to feed to this parameter. The output from the action nodes will generate new variables as well.  
![Image.4 Use entity in an Action node](media/User_a_variable_in_Skills(draft).PNG)


