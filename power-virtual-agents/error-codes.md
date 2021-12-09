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
## Where to view errors
<!-- TODO: error in topic view -->
<!-- TODO: topic checker -->
<!-- TODO: bot error message -->
## Error List

|          |            |                                                                                                                                                     |
| -------- | ---------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- |
| **2000** | Name       | InfiniteLoopInBotContentException                                                                                                                   |
|          | Message    | "The user is trapped in an infinite loop. Check to make sure {TopicName} reaches a logical conclusion."                                             |
|          | Resolution | Specifed topic loops indefintely. Check the topic to ensure it reaches a logical conclusion.                                                        |
| **2001** | Name       | InvalidContentException                                                                                                                             |
|          | Message    | "The bot content is invalid."                                                                                                                       |
|          | Resolution | Specified topic contains invalid content. Check the topic for errors.                                                                               |
| **2002** | Name       | CDSAccessDeniedException                                                                                                                            |
|          | Message    | "We ran into an issue with CDS."                                                                                                                    |
|          | Resolution | There was a problem accessing the Common Data Service.                                                                                              |
| **2003** | Name       | FlowActionException                                                                                                                                 |
|          | Message    | "There’s a problem with {FlowName} in {TopicName}. Please check your content."                                                                      |
|          | Resolution | There was a problem with your Power Automate Flow. Check the flow for errors.                                                                       |
| **2004** | Name       | SkillException                                                                                                                                      |
|          | Message    | "There’s a problem with {SkillName} in {TopicName}. Please check your content."                                                                     |
|          | Resolution | There was a problem with your skill. Check both the skill and topic for errors.                                                                     |
| **2005** | Name       | TemplateExpressionException                                                                                                                         |
|          | Message    | "We ran into a problem. Please check your content."                                                                                                 |
|          | Resolution | There was a problem with your Power Automate Flow template. Check the flow for errors.                                                              |
| **2006** | Name       | BotNotFoundException                                                                                                                                |
|          | Message    | "We couldn't find your bot."                                                                                                                        |
|          | Resolution | Your bot couldn't be found because the bot or it's environment was deleted.                                                                         |
| **2007** | Name       | BotContentSizeException                                                                                                                             |
|          | Message    | "The bot contains too much content to be able to work."                                                                                             |
|          | Resolution | Reduce message lengths or number of topics, then try again.                                                                                         |
| **2008** | Name       | UserTokenNotFoundException                                                                                                                          |
|          | Message    | "We couldn’t find the user’s token."                                                                                                                |
|          | Resolution | Your user token couldn't be found. Check your bot's [authorization configuration](advanced-end-user-authentication.md) for errors.                  |
| **2009** | Name       | LatestPublishedVersionNotFoundException                                                                                                             |
|          | Message    | n/a                                                                                                                                                 |
|          | Resolution | To use this bot, publish it in Power Virtual Agents.                                                                                                |
| **2010** | Name       | BotContentNotFoundException                                                                                                                         |
|          | Message    | "We can’t retrieve your bot content."                                                                                                               |
|          | Resolution | Content couldn't be found because it was deleted.                                                                                                   |
| **2011** | Name       | SkillNotFoundException                                                                                                                              |
|          | Message    | "We couldn't find {SkillName} in {TopicName}. Please check your content."                                                                           |
|          | Resolution | Skill couldn't be found because it was deleted.                                                                                                     |
| **2012** | Name       | FlowNotFoundException                                                                                                                               |
|          | Message    | "We couldn't find {FlowName} in {TopicName}. Please check your content."                                                                            |
|          | Resolution | Your Power Automate Flow couldn't be found because it was deleted.                                                                                  |
| **2013** | Name       | OmniChannelNotFoundErrorResponseException                                                                                                           |
|          | Message    | n/a                                                                                                                                                 |
|          | Resolution | OmniChannel couldn't be found for this conversation. Check your [OC configuration](configuration-hand-off-omnichannel.md) for errors.               |
| **2014** | Name       | UnauthorizedTranslatorException                                                                                                                     |
|          | Message    | "The translation service did not respond."                                                                                                          |
|          | Resolution | The translation service did not respond. Try again later.                                                                                           |
| **2015** | Name       | UnauthorizedSkillInvocationException                                                                                                                |
|          | Message    | "You're not authorized to call {SkillName}. Please check the skill and its usage for any issues."                                                   |
|          | Resolution | You're not authorized to call your skill. Check the skill and its usage for any issues.                                                             |
| **2016** | Name       | BCRDeletedErrorResponseException                                                                                                                    |
|          | Message    | "Sorry, we couldn’t find your bot."                                                                                                                 |
|          | Resolution | Sorry, we couldn’t find your bot.                                                                                                                   |
| **2017** | Name       | BCRForbiddenErrorResponseException                                                                                                                  |
|          | Message    | "Sorry, we couldn’t access your bot."                                                                                                               |
|          | Resolution | Sorry, we couldn’t access your bot.                                                                                                                 |
| **2018** | Name       | TooManyRequestsErrorResponseException                                                                                                               |
|          | Message    | "The user’s is typing too fast."                                                                                                                    |
|          | Resolution | The user is sending too many messages for the bot to process. Try responding slower.                                                                |
| **2019** | Name       | EnvironmentNotFoundException                                                                                                                        |
|          | Message    | "We couldn’t find your environment. It may have been deleted."                                                                                      |
|          | Resolution | We couldn’t find your environment. It may have been deleted.                                                                                        |
| **2020** | Name       | FlowActionBadRequestException                                                                                                                       |
|          | Message    | "Something happened, and {FlowName} isn’t working in {TopicName}. Try again later. If the issue persists, check your flow's setup and run history." |
|          | Resolution | Your Power Automate flow isn’t working. Try again later. If the issue persists, check your flow's setup and run history.                            |
| **2021** | Name       | DialogExecutionLimitExceededException                                                                                                               |
|          | Message    | "Number of dialogs executed in the current turn exceeded the maximum of {DialogLimit}."                                                             |
|          | Resolution | Number of dialogs executed in the current turn exceeded the maximum.                                                                                |
| **2022** | Name       | ActivityLimitExceededException                                                                                                                      |
|          | Message    | "The bot sent more than {MessageLimit} messages in this turn."                                                                                      |
|          | Resolution | The bot sent too many messages in this turn. Please limit it to under 30.                                                                           |
| **2023** | Name       | AdaptiveDialogException                                                                                                                             |
|          | Message    | "We ran into a problem executing your composer dialog."                                                                                             |
|          | Resolution | We ran into a problem executing your composer dialog. Check the composer dialog for errors.                                                         |
| **2024** | Name       | DlpPoliciesViolationException                                                                                                                       |
|          | Message    | n/a                                                                                                                                                 |
|          | Resolution | There was a Data Loss Prevention error.                                                                                                             |
| **2025** | Name       | InvalidBotContentByUserException (General)                                                                                                          |
|          | Message    | "There are one or more empty nodes in topic {topicName}, Please check your content."                                                                |
|          | Resolution | There are one or more empty nodes in your topic. Add content to nodes or remove them from the topic.                                                |
| **2025** | Name       | InvalidBotContentByUserException (RedirectTopicDisabled)                                                                                            |
|          | Message    | {TopicName} is redirecting to a topic, which has been turned off. Return to {TopicName} and check your content.                                     |
|          | Resolution | Your topic is redirecting to another topic which has been turned off. Goto the topic list and re-enabled the topic.                                 |
| **2025** | Name       | InvalidBotContentByUserException (RedirectingToDeletedTopic)                                                                                        |
|          | Message    | "The topic you're trying to redirect to no longer exists. Return to {TopicName} and check your content."                                            |
|          | Resolution | The topic you're trying to redirect to no longer exists.                                                                                            |
| **2026** | Name       | InstallFlowRequestUserException                                                                                                                     |
|          | Message    | "There was a problem with the Power Automate Flow. Please check your content."                                                                      |
|          | Resolution | There was a problem with the Power Automate Flow. Please check your content.                                                                        |
| **2100** | Name       | TeamsTooManyRequestsErrorResponseException                                                                                                          |
|          | Message    | "The user is typing too fast."                                                                                                                      |
|          | Resolution | The user is typing too fast.                                                                                                                        |
| **2101** | Name       | RequestEntityTooLargeException                                                                                                                      |
|          | Message    | "The user’s conversation with the bot was too long or the user’s message was too long."                                                             |
|          | Resolution | The user’s conversation with the bot was too long or the user’s message was too long.                                                               |
| **2102** | Name       | MessageTooLargeException                                                                                                                            |
|          | Message    | n/a                                                                                                                                                 |
|          | Resolution | The user sent a message which is too large to process.                                                                                              |
| **3000** | Name       | Unexpected Error                                                                                                                                    |
|          | Message    | n/a                                                                                                                                                 |
|          | Resolution | A system error appear. Please contact the support for more details.                                                                                 |
| **3001** | Name       | FlowActionServiceUnavailableException                                                                                                               |
|          | Message    | "Power Automate isn’t available for your flow {flowName} now. Try again later."                                                                     |
|          | Resolution | Power Automate is not responding. Try again later.                                                                                  |
| **3002** | Name       | FlowActionTaskCanceledException                                                                                                                     |
|          | Message    | "Something happened in Power Automate, and your request to your flow {flowName} wasn’t accepted. Try again later."                                  |
|          | Resolution | An error occured in Power Automate and your request to your flow wasn’t accepted. Try again later.                                               |
| **3003** | Name       | FlowActionSocketException                                                                                                                           |
|          | Message    | "There's a network problem connecting to your flow {flowName}. Please try again later."                                                             |
|          | Resolution | There's a network problem when connecting to your Power Automate Flow. Please try again later.                                                                          |  |