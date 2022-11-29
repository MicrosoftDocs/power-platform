---
title: "Topics best practices"
description: "Best practices for efficient topic management in Power Virtual Agents"
author: hejammes

ms.date: 11/29/2022
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Topics best practices

What are topics in Power Virtual Agents?
In Power Virtual Agents, topics can be seen as competencies your chatbot can use and run. There are two ways to trigger a topic: the first is based on the user inputs, also known as utterences, that the chatbot can recognized based on its Natural Language Understanding capabilities and based on the trigger phrases that have been configured for the topic. The second way to trigger a topic is simply by redirecting directly to it, for example from an existing topic based on a condition.  
When setting up a new chatbot, some topics get automatically created to quickly get you started (e.g. Greetings). There are other a few system topics that are used to manage specific events:
•	Fallback: this is a specific topic for when the user input isn’t recognized and can’t be associated with confidence with any topic.
•	Did you mean: when multiple topics could potentially address the user input, the user is presented with the topics that score with sufficient confidence.
•	End of conversation: at the end of each conversation, you should redirect your topic to the ‘End of conversation’ topic so that the user can either confirm success or failure, and fill out a CSAT survey.
•	Escalate: this is to hand off the conversation to a live agent (when configured).
•	Conversation start: this is the topic that starts the conversation in the unified authoring experience, so your users can be greeted with a message even before they’ve started with any input.
[TO DO: diagram that shows both topics that get triggered with trigger phrases and those triggered by other topics – and potentially system topics too]
 
Choosing the right topics 
Defining the best topics for your chatbot requires understanding the questions your users will ask or tasks they will try accomplish, and the kind of information and automation you’ll need to provide. Obvious places to start are:
•	Any existing Frequently Asked Questions (FAQ) or knowledge base (KB).
•	Common subjects raised by your employees or customers in internal or customer service scenarios. For example, if you’re building a customer service chatbot, talk with existing service representatives to learn what the most common questions are and the order in which they’re typically asked.
For example, a retail chatbot might start by asking the user which of four things they want to do: find a store, place an order, check the status of an order, or return a purchased product. Their answer could lead them into one of four topics, each with its own topic dialog. 
When you are considering which business processes to automate, look for the ones with the highest traffic and those where the task can be completed in the chatbot without the need for human involvement. Don’t just replicate what your website can already do – most customers are familiar with websites and will accomplish these tasks themselves without needing to interact with a chatbot. Look to create topics for things which generate a high volume of calls. Build automations for those to start with, and then work on the longer tail of other topics over a period of time. 
When designing a topic, you should try to be as thorough as possible in your design and all the potential scenarios that your users might ask for fall into.
Identify the topic
•	Choose a topic your bot audience will ask about
•	Focus on high-impact topics first
•	Put your customer empathy hat on … topic design requires understanding both sides of the conversation 
List all scenarios
•	List all possible scenarios 
•	Think about informational needs, task completion, and troubleshooting
Design a high-level conversation tree
•	Use your favorite tool to draw the conversation tree
•	What is the fewest number of questions you can ask to understand the situation enough to provide the right solution?
Validate and iterate on the design
•	Read the dialog out loud before publishing
•	Get analytics and read session transcripts for further optimization
Topic types
People will use your chatbot with a specific issue (“topic”) to address or resolve. You can loosely categorize topics into 3 types:  
1.	Informational: E.g. “What is…?”, “When will…?”, “Why…?”
2.	Task completion: “I want to…”, “How do I…?”
3.	Troubleshooting: “Something isn’t working…”, “I got an error message…”
Informational, Task Completion, and Troubleshooting are different types of topics that the chatbot can support. You may also need some topics that are just there to take ambiguous user questions (“I need help” or “shopping”) and ask for clarification so you can then route the user to the correct topic.
Levarge the Suggest Topics feature
For existing FAQs, Power Virtual Agents includes a Suggest Topics feature. You supply URLs, then let Power Virtual Agents crawl these webpages for FAQ information. The feature will automatically import suggestions that you can promote to preformatted topics, including trigger phrases. You’re also free to edit or delete these suggestions before they’re promoted to topics. 
Expect to create both single-turn and multi-turn interactions
For simple interactions, you’ll create single-turn conversations with just one question and one answer. All of the interactions generated from FAQs by the Power Virtual Agents Suggest Topics feature are single-turn today. But more substantive topics require a multi-turn conversation with multiple back-and-forth interactions between the user and your chatbot. 
For instance, if a user asks a retail chatbot whether there are any stores nearby, the chatbot might respond with a question such as “What city do you live in” or “What is your postal code?” to narrow down its possible responses. The user’s response to this will determine the chatbot’s next response in the conversation.
Creating new topics with the end-user in mind
You’ll also need to create some topics yourself; working with an existing FAQ won’t be enough. Think about topics from your user’s point of view. Never forget that they might know much less about this area then you do. In fact, if the chatbot you create is helpful to you, it’s probably too advanced to be a good fit for less-knowledgeable users. 
Leveraging the Fallback topic
The Fallback topic gets triggered when Power Virtual Agents doesn’t understand a user utterance and doesn’t have sufficient confidence to trigger any of the existing topics.
There are multiple ways to leverage the Fallback topic and offer a great user experience.
Offloading single question/answer pairs
If you have a large number question/answer pairs for single-turn conversations you can also consider offloading them to the Fallback topic and integrate with external services such as custom question answering in Azure Language Studio (part of Azure Cognitive Services). It will also help Power Virtual Agents Natural Language Understanding focus on the trigger phrases you have configured for your topics.
Providing your chatbot with a personality 
When user inputs are not understood, you can also leverage Custom Question Answering in the Azure Cognitive Services Language Studio. “Chitchat” skills of various tone (professional, familiar, etc.) are available. This allows your chatbot to be able to answer trivial questions, such as “how are you feeling today, bot?”.
Learning from the Fallback topic
You should track what your customers are saying that doesn’t trigger a standard Power Virtual Agents topic. These could be used to enrich an existing topic’s trigger phrases (typically when the user utterance should have triggered a topic) or lead to the creation of new topics to better serve your users as you understand better what they’re trying to accomplish.

Plan your conversation tree and topic dialogs 
Chatbots typically interact with their users by asking questions. To make your chatbot as effective as possible, you should carefully think about what these questions should be and how a user will navigate through them from the most general to the most specific. 
Think hard about your question hierarchy
To do this, think holistically about your chatbot’s overall conversation tree. What are the initial questions a user asks to choose a particular topic? Once you’ve worked out what these should be, define your topic dialogs, i.e., the hierarchy of questions asked inside each topic.
Keep the conversation short, simple and efficient
Your goal is to understand what the user wants while still keeping the interaction simple, asking as few questions as possible. It’s also a good idea to keep your responses short; strive to be both precise and concise. Long paragraphs can be hard to read in a typical chatbot user interface. 
Whatever the details of your chatbot interaction, you should carefully plan your question hierarchy. The more thought you put in ahead of time, the better your chatbot will be. 
Make answers clear and concise so users can scan information quickly
Organizing your topics
Chatbot topic authoring is an iterative process, and it involves authors observe bot/end-user interactions with each authoring iteration.
Create bite-size topics
It’s often more manageable to create many bite-size topics rather than a few large topics. Taking this approach also helps making triggering more effective, by clearly mapping trigger phrases to the specific topics that address those areas.
Bite-size topics doesn’t mean that all topics should have trigger phrases, as topics triggered with trigger phrases can in turn redirect to other topics based on additional user inputs and answers.
The number of topics is a Conversational Design preference and decision, as it either results in having a few bigger topic (in case of joining) or having more smaller topics (in case of splitting). 
When multiple topics are too close, create a disambiguation topic
On joining vs splitting topics, 
E.g. “unblock credit card” and “unblock debit card”. Users might just say “unblock card” and the model doesn’t know what specific topic and process to trigger. You can start an “unblock card” topic, use a question and an entity for the type of card (debit or credit) and launch the appropriate child topic accordingly.
Balance the number of trigger phrases per topic
Try to balance the number of trigger phrases between topic (starting with at least 5 to 10 per topic). That way, the Power Virtual Agents Natural Language Understanding capabilities don’t overweight a topic versus another based on the configured trigger phrases. 
Leverage entities to reduce the number of topics
Instead of creating similar topics:
•	Order Pizzas
•	Order Burgers
•	Order Drinks
Create:
•	1 topic for Order
•	1 entity for Pizzas/Burgers/Drinks
For intents that are more complex to recognize (for example when they could be about a large number of options in a customer’s existing implementation, e.g. “request” for a banking customer, as one could request many different things), then splitting the topics might be a better option, with adequate trigger phrases.
Avoid topic overlap
For topics triggered with trigger phrases, you should:
•	Compare the trigger phrases across your topics and remove ambiguous pairs.
•	Try to not use the same words in different topics. 
There are multiple ways to monitor topic overlap:
•	Analyze the user utterances that trigger a “Did You Mean” topic, as it’s a key indicator that you have overlap
•	Power Virtual Agents offers a Topic Overlap detection feature that enables authors to discover overlapping topics to resolve accordingly (deleting/moving trigger phrases between topics).
Monitor topic performance and optimize
Once the chatbot or voice assistant is live, it is important to monitor abandoned, escalated, and unhandled (unengaged) topics to improve the overall response effectiveness.
https://aka.ms/PVAAnalytics 
What are the topics that preceded failed or abandoned outcomes, or to low CSAT scores? 
What user utterance could not be recognized and triggered the fallback topic?
What user utterance were too ambiguous and triggered the “Did You Mean” topic?

 
Trigger Phrases best practices
Optimizing Trigger Phrases and Natural Language Understanding
What are trigger phrases in Power Virtual Agents
Trigger phrases train your chatbot Natural Language Understanding model. You configure trigger phrases to help your chatbot recognize for what typical user utterances you should trigger a specific topic. trigger phrase is a way to describe an intent, it captures the way a customer might ask about a problem/issue.
•	E.g., “problem with weeds in lawn” 
You only need to provide a few sample phrases – the AI will parse whatever the user says and trigger the topic closest in meaning to the user utterance 
Creating new trigger phrases
If available, use real customer data / production data over making up your own trigger phrases.
Agree, the best trigger phrases are the ones aligned with (similar to) actual data coming from end users (as these are the ones that will be asked to the bot when the bot is deployed).

On which words to leave out, yes, stop words doesn't have a topic-identifying value given they don't represent the topic, however, the model is designed (trained) to give less weight for stop words. For more trigger phrases authoring tips, please refer to the triggering phrases tips section panel in the PVA authoring UX. And some more details about which words to leave out (f.e. because they're stop words or words that appear often in user utterances).
Optimize your trigger phrases
•	At least 5-10 trigger phrases per topic – then iterate.
•	Vary sentence structure and key terms.
•	Use short trigger phrases, > 10 words but avoid single-word trigger phrases. 
•	Try to train with full phrases.
•	It’s best to have unique verb/noun or combinations of those to increase accuracy. 
•	If you use examples from slot filling entities, make sure you use spread options.
Rabobank (Stefan) comment:

We don't really understand this last point. It appears you're saying you need to add entity values in the trigger phrases. This counters what we were told before. That simply adding an entity would be enough.
Omar:
I don't fully understand the last point too (copied below for reference), could you please clarify?

"If you use examples from slot filling entities, make sure you use spread options."
Henry:
Thanks @Omar Abouelkhir and sorry for the confusion here!
The idea was if a C1 user has an entity with product names (e.g. burger, pizza, chicken nuggets), when they create trigger phrases, they should distribute the entity values if they use it in the trigger phrases as examples (e.g. I want to order a burger, I would like a pizza, I want chicken nuggets), instead of always using the same example.
What do you think?
Omar:
I see, this would work, however, a better experience would be: using one variation of the entity value (ex: burger) in a trigger phrase, and PVA NLU will consider all the variations of this entity. Please refer to comment in slide 24.
Henry:
Thank you, @Omar Abouelkhir! QQ, if multiple trigger phrases of a topic typically include an entity value, what would you recommend?
This recommendation came from working with a customer who would base all trigger phrases on the same product ("what are the ingredients of chicken noodle soup?", "what are the allergens in chicken noodle soup?", etc.)
Omar:
That works, as long as the "chicken noodle soup" is one variation of an entity and that entity is consumed in the dialog (i.e used in a question node).

Volume of training data (i.e. Trigger Phrases)
When thinking about the question “how much training data is sufficient”? You should resist the general answer “the more the better”. In best cases it doesn’t help your Natural Language Understanding model and in worst case it can have an have negative effect by overfitting it. 
You should keep your training data small and focused.
Assessing the impact of your changes to an existing chatbot
When updating trigger phrases or merging / splitting topics, there are 2 ways to assess the changes;
1.	An immediate change in chatbot behavior which can be observed through the "test bot" canvas (e.g. a topic that is now triggering or not based on trigger phrases updates).
2.	A change after bot deployment and facing traffic, which translates to higher/lower deflection (non-escalation) rates. This can be observed from the analytics tab in PVA.
