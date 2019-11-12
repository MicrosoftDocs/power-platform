---
title: "Power Virtual Agents Topic Checker"
description: "Learn how to validate Power Virtual Agents topics with Topic Checker."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Validate a topic with Topic Checker

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

Topic Checker is available in the conversation editor for any topic defined for your bot. It allows you to see the health of a topic and shows the errors and warnings that have failed validation. You can select the listed errors or warnings to go to the node or field that has failed validation. As you fix the errors, they will disappear from Topic Checker, either automatically or after saving the topic.

![Topic Checker control](media/topic-checker-control.png)

> [!IMPORTANT]
> You can save topics with errors. The errors will persist until they are addressed in the topic. Topics with errors can also be deployed to production. However, this could result in unexpected behavior.

## Topic errors

The topic editor canvas validates topics and shows errors and warnings. Warnings will not prevent the bot from functioning and will be overlooked while processing. Errors should be addressed to avoid unexpected behavior or failure during the chat experience.
  
### Types of errors 

- Node: The entire node is erroneous and is highlighted red.
- Field: The field might be missing required data and is highlighted red.
- Expression: The expression might be invalid and is highlighted red.
- Variable deletion: A variable in a topic was deleted and is highlighted red wherever it was used. This causes the variable to become “orphaned,” and it must be either removed or replaced.
