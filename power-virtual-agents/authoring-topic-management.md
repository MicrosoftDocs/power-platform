---
title: "TITLE"
description: "DESCRIPTION"
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---

# Topic Management

As the number of topics in your bot grows, the following features will help you manage your topics so they are visible to end users only when they have been tested and ready to be invoked. We will discuss the following features in this section:

1. Topic errors
2. Topic status
3. Copying a topic

## Topic errors

The topic authoring canvas validates topics and shows errors and warnings. Warnings will not prevent the bot from functioning and will be overlooked while processing. Errors should be addressed to avoid unexpected behavior or failure during the chat experience.

You can see the error state of a topic on the topic list page by clicking on the **Topics** tab. On the Topics list page, the column **Errors** indicates the number of errors found during validation. This does not include warnings since warnings do not prevent the bot from functioning. If there are the no errors for a topic, a **-** is shown in the column.

<<<< INCLUDE IMAGE OF TOPIC LIST PAGE WITH 1 ERROR AT LEAST. HIGHLIGHT ERRORS COLUMN >>>

You can click on the error count, to see details about the errors. This will open the authoring canvas with the Topic checker opened to the firt error in the topic. As you fix the errors, they will dissaper from the Topic Checker, either automatically or after saving the topic. 
##
<<<<< INCLUDE IMAGE OF AUTHORING CANVAS WITH TOPIC CHECKER OPEN AND HIGHLIGHTED >>>

   > [!NOTE]
   >
   > You can save topics with errors. The errors will persist until they are addressed in the topic. Topics with errors cannot be deployed to production to avoid any unexpected behavior.


### Types of errors

Node: The entire node is erroneous and is highlighted red.
Field: The field might be missing required data and is highlighted red.
Expression: The expression might be invalid and is highlighted red.
Variable deletion: A variable in a topic was deleted and is highlighted red wherever it was used. This causes the variable to become “orphaned,” and it must be either removed or replaced.



## Topic status

Topics can have a status. Status refers to their ability to trigger in a bot conversation. Topics can be **on** or **off**. 

When a topic is **on**, it will trigger as expected. Either via its trigger phrases or when it is redirected to from another topic. Majority of your topics are likely to be in the **on** state.

When a topic is **of**, it will *not* trigger at all. Meaning, that if its trigger phrases are used in a bot conversation, it will not trigger, just as if the topic doesn't exist. An off topic will also not be redirected to when it is redirected to from another topic. 

When a bot is published, all topics (on or off) will be published, but the off topics will not trigger. Neither will it trigger on the channels that the bot is publised to, nor will it trigger in the test bot. This facilitates the bot author to work on a particular topic and leave it in a draft state while publishing changes to other topics that are ready to go live. Leave the topic that you are still working on in 'off' status before publishing the bot. 

This control is presented as a toggle under the **Status** column. It is not available on the topic details page at this time.

<< INCLUDE IMAGE OF TOPIC LIST PAGE WITH THIS COLUMN HIGHLIGHTED >>

By default a new topic created will be 'on'. 

   > [!NOTE]
   >
   > The Topic Checker will identify an error if a topic redirects to an 'off' topic.
   

## Copying a topic

Last but not least, we understand that once you have created a few topics, you may want to create additional topics to use a previous topic as a baseline.

On the topic list page, hover on a topic, and click the vertical ... to see the option to **Make a copy**. 

<< INCLUDE AN IMAGE OF THE TOPIC LIST PAGE WITH 'make a copy' highlighted in the flyout >>>

As the name suggests, this option creates a duplicate of the selected topic with (Copy) appended to the name. All the topic content like description, trigger phrases, and the entire dialog are copied over to the new topic.

The new topic is on top or bottom of the User topics list depenending on the page sort (Modified ascending or descending). 

This topic has status = Off by default when it is copied to avoid confusion on which topic will trigger since the trigger phrases are the same as the original topic. Once you are done editing the new topic, you can turn it on to test it in the test bot and when ready,p publish the new topic.

There is no limit to the number of times a topic can be copied. A number will be appended to the name and each topic will have its own internal ID.







