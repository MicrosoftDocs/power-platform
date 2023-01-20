---
title: "Deflection optimization techniques for Power Virtual Agents"
description: "Set of best practices on how to deflection rate in a PVA chatbot"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---
# Introduction

Return on investment (ROI) and improved customer satisfaction (CSAT) are top priorities for the organizations that implement Power Virtual Agents (PVA) bots. Optimizing the bot deflection rates is one of the top focus areas for organizations to achieve their business goals around ROI, CSAT etc. and improve the overall bot performance.  There are major indicators provided out-of-box in PVA to improve bot performance, such as resolution rate, escalation rate, and CSAT. While the metrics continue to evolve, there are several things you can do as a bot builder to improve the deflection rate of your PVA bot. In this playbook we will cover the importance of deflection in conversational AI and some general techniques/considerations that are universal for optimizing deflection for bots.  
In the context of conversational AI, deflection is an indicator representing the percentage of requests that are completed in a self-service fashion that would otherwise be handled by live agents. In other words, it refers to the number of items a team avoids having to deal with as a result of automation

# Why deflection optimization?

Better customer experience: more customers can get their issues resolved by the bot instead of waiting for a human agent in chat or phone. This leads to a better customer experience, and higher CSAT scores. While this help reduce wait time, live agents can also focus on more complex, higher-value tasks.
Cost savings: one of the key ways the ROI of the bot is determined is using the deflection rates. The human agent call support typically costs around $ 5-10 in the contact center industry  . However, a bot session that resolves a customer request costs around 50 cents. This means that higher deflection rates lead to higher cost savings.

# Understanding the key components of PVA analytics to improve deflection
A basic understanding of available PVA analytics is required to be able to determine what deflection means for your organization. Below is the description of the key metrics from Power Virtual Agents:

|Description                     |Details                           |
|--------------------------------|----------------------------------|
|                                |                                  |
|                                |                                  |


These metrics need to be continuously improved to optimize  the bot ROI. However, each organization may have their own definition of what deflection rate means to them. For example, an organization may consider “Abandon rate” along with “escalation rate” as part of deflection calculation while another organization may look purely at escalation rate. Despite having different definitions for deflection rate, the above listed PVA metrics will still provide the foundation to calculate deflection.
Based on our experience with various customers, we have seen that in the context of deflection, resolution rate and escalation rate play a major role. Increasing the resolution rate and reducing the escalation rate typically has a direct impact on the overall bot deflection metrics.
 <Insert Image>
  
  
  
  
  

# Technique 1: topic escalation analysis
  
Escalation is the conversation flow during which the bot couldn’t handle the conversation and escalated to a human agent. When a topic does not escalate to a human agent it is considered as deflection. The ideal goal is to increase the deflection rate of a bot by reducing the number of escalations. 
PVA has multiple ways to handle escalation, the direct way of initiating an escalation to human agent is through the “Escalate” system topic. This system topic enables PVA to understand that the bot is no longer able to address the customer request and would need to escalate to a human agent. Through the “Escalate” topic, one can enable the bot to transfer the conversation to an agent service desk tool like Dynamics 365 Omnichannel for Customer Service for the live agent transfer or an asynchronous support experience like creating a ticket, scheduling a call back etc. A common way of triggering this escalation is through the “Transfer to agent” node in the PVA authoring canvas.
<Insert Image>
  
  
  
  
  

Power Virtual Agents has two types of escalations:
1.	Direct escalation: in this case, the user comes to the bot and directly wants to talk to a human agent. These kinds of escalations cannot be avoided as the intent of the end-user is to trigger the “Escalate” topic directly.
•	Examples end-user queries:
	“can I talk to someone”
	“talk to a live agent”
	“speak with agent”
	“talk to a representative”
2.	Indirect escalation: in this case, the user gets escalated to an agent during the conversation. These can be grouped to expected vs unexpected escalations. Expected escalations happen when the topic is designed to escalate at some point during the conversation, or the user chooses to escalate since the bot did not answer their query while unexpected escalation can happen when the bot errors out due to other issues.

<Insert Image>
  
  
  
  
# STEP 1: Monitor and review topics performance
Identifying and optimizing escalation rate drivers can be done through the built-in analytics provided in PVA or through custom analytics.

  Built-in analytics:
All the bot sessions that led to an escalation or transfer to an agent are captured by PVA from beginning to end at the topic level. The escalation drivers in this are the bot topics. The PVA analytics dashboard has a section for “Escalation Rate Drivers” which gives the details on which are the bot topics that were escalated to human agents most of the time and why. This information is available in the numerical point of view and derived from the chat transcripts by the PVA analytics.
For example, in the below screenshot under the “Escalation Rate Drivers” section we see the “Returns, Exchanges…” topic has a “Rate” value of 75%. This means that 75% of all the sessions that triggered the “Returns, Exchanges…” topic were escalated to a human agent. Since the bot couldn’t solve the issue for the user, 75% of the times when user asked about returns, the bot had to escalate to a human agent. Now the bot author can go and improve the “Returns, Exchanges..” topic to reduce the number of escalations happening through this topic.
The chart also shows the “impact” as a red or blue bar. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic. In short “impact” helps you understand what this topic is contributing to the overall escalation rate, if the impact is high then that is the topic you have to focus on because if you improve that topic, the potential impact it has on escalation will also improve.
A red bar indicates that the topic's escalation rate is greater than the average escalation rate, resulting in a negative impact on overall escalation rate. A blue bar indicates that the escalation rate is smaller, resulting in a positive impact on overall escalation rate performance. Lowering the escalation rate for the topics in red has the greatest impact on improving the overall escalation rate.

  Note: The impact score is not represented as a number but as a bar chart in PVA.





<!-- TODO -->
