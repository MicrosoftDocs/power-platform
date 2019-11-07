---
title: "Work with variables"
description: "Learn how to work with Power Virtual Agents variables."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Work with variables

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

Variables let you save responses from your customers in a conversation with a bot so that you can reuse them later in the conversation. For example, you can save a customer's name in a variable called *UserName*. The bot can then address the customer by name as the conversation continues.

You can use variables to create logical expressions that dynamically route the customer down different conversation paths.

Power Virtual Agents supports four types of variables:

* String – A string of text that the customer enters.
* Age – A positive number within the range of standard age.
* Currency – A numeric currency value.
* Number – A single positive or negative integer.

## To create a variable

1. In the bot conversation editor, select **Add Variable** at the bottom of the **User Responses** node where you want to add the variable.

   ![Add variable](media/add-variable.png)

2. In the **Properties** pane, select **Create variable**.

   ![Create variable](media/create-new-variable.png)

3. Specify a name and type for the variable, and then select **Save**.

   ![Save variable](media/save-variable.png)

Power Virtual Agents adds the variable to a customer's response and uses expressions to dynamically route the conversation path, letting you tailor the bot's response.
