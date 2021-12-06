---
title: #FIXME: Required; page title is displayed in search results. Include the brand.
description: #FIXME: Required; article description that is displayed in search results.
author: v-alarioza
ms.author: v-alarioza
ms.topic: troubleshooting
ms.date: 12/06/2021
ms.service: power-virtual-agents
ms.reviewer: clmori
manager: shellyha
---

<!--FIXME: #Customer intent: As a < type of user >, I want < what? > so that < why? >.-->

# Error codes: Power Virtual Agents

|Error code |Description                                                                       |
|-----------|----------------------------------------------------------------------------------|
|2000		|InfiniteLoopInBotContentException	The user is trapped in an infinite loop. Check to make sure the topic reaches a logical conclusion.|
|2001		|InvalidContentException	The bot content is invalid.|
|2002		|CDSAccessDeniedException	We ran into an issue with CDS. [Please confirm your CDS license. ]|
|2003		|FlowActionException	There’s a problem with your flow. Please check your content.|
|2004		|SkillException	There’s a problem with your skill. Please check your content.|
|2005		|TemplateExpressionException	We ran into a problem with your expression. Please check your content.|
|2006		|BotNotFoundException	We couldn't find your bot.|
|2007		|BotContentSizeException	The bot contains too much content to be able to work.|
|2008		|UserTokenNotFoundException	We couldn’t find the user’s token.|
|2009		|LatestPublishedVersionNotFoundException	To use this bot, publish it in Power Virtual Agents.|
|2010		|BotContentNotFoundException	We can’t retrieve your bot content.|
|2011		|SkillNotFoundException	We couldn't find your skill. Please check your content.|
|2012		|FlowNotFoundException	We couldn't find your flow. Please check your content.|
|2013		|OmniChannelNotFoundErrorResponseException	Not able to find the OmniChannel for this conversation.|
|2014		|UnauthorizedTranslatorException 	The translation service did not respond.|
|2015		|UnauthorizedSkillInvocationException 	You're not authorized to call your skill. Please check the skill and its usage for any issues.|
|2016		|BCRDeletedErrorResponseException	Sorry, we couldn’t find your bot.|
|2017		|BCRForbiddenErrorResponseException	Sorry, we couldn’t access your bot.|
|2018		|TooManyRequestsErrorResponseException	The user’s is typing too fast.|
|2019		|EnvironmentNotFoundException	We couldn’t find your environment. It may have been deleted.|
|2020		|FlowActionBadRequestException	Something happened, and your flow isn’t working. Try again later. If the issue persists, check your flow's setup and run history.|
|2021		|DialogExecutionLimitExceededException	Number of dialogs executed in the current turn exceeded the maximum.|
|2022		|ActivityLimitExceededException	The bot sent too many messages in this turn. Please limit it to under 30.|
|2023		|AdaptiveDialogException	We ran into a problem executing your composer dialog.|
|2024		|DlpPoliciesViolationException	DLP errors.|
|2025		|InvalidBotContentByUserException (General)	There are one or more empty nodes in your topic, Please check your content.|
|2025		|InvalidBotContentByUserException (RedirectTopicDisabled)	Your topic is redirecting to a topic, which has been turned off. Return to your portal and check your content. |
|2025		|InvalidBotContentByUserException (RedirectingToDeletedTopic)	The topic you're trying to redirect to no longer exists. Return to your topic and check your content. |
|2026		|InstallFlowRequestUserException	There was a problem with the Power Automate Flow. Please check your content.|
|2100		|TeamsTooManyRequestsErrorResponseException	The user is typing too fast.|
|2101		|RequestEntityTooLargeException	The user’s conversation with the bot was too long or the user’s message was too long.|
|2102		|MessageTooLargeException	The user sent a message which is too large to process. |
|3000		|Unexpected Error	A system error appear. Please contact the support for more details.|
|3001		|FlowActionServiceUnavailableException	Power Automate isn’t available for your flow now. Try again later.|
|3002		|FlowActionTaskCanceledException	Something happened in Power Automate, and your request to your flow wasn’t accepted. Try again later.|
|3003		|FlowActionSocketException	There's a network problem connecting to your flow. Please try again later.|