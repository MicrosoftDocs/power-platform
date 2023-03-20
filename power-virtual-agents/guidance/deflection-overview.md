---
title: "Deflection Overview"
description: "Set of best practices on how to improve deflection rate in a PVA chatbot"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---
# Deflection overview

Return on investment (ROI) and improved customer satisfaction (CSAT) are top priorities for the organizations that implement Power Virtual Agents (PVA) bots. Optimizing the bot deflection rates is one of the top focus areas for organizations to achieve their business goals around ROI, CSAT etc. and improve the overall bot performance.  There are major indicators provided out-of-box in PVA to improve bot performance, such as resolution rate, escalation rate, and CSAT. While the metrics continue to evolve, there are several things you can do as a bot builder to improve the deflection rate of your PVA bot. In this playbook we will cover the importance of deflection in conversational AI and some general techniques/considerations that are universal for optimizing deflection for bots.  
In the context of conversational AI, deflection is an indicator representing the percentage of requests that are completed in a self-service fashion that would otherwise be handled by live agents. In other words, it refers to the number of items a team avoids having to deal with as a result of automation

## Why deflection optimization?

Better customer experience: more customers can get their issues resolved by the bot instead of waiting for a human agent in chat or phone. This leads to a better customer experience, and higher CSAT scores. While this help reduce wait time, live agents can also focus on more complex, higher-value tasks.
Cost savings: one of the key ways the ROI of the bot is determined is using the deflection rates. The human agent call support typically costs around $ 5-10 in the contact center industry  . However, a bot session that resolves a customer request costs around 50 cents. This means that higher deflection rates lead to higher cost savings.

## Understanding the key components of PVA analytics to improve deflection
A basic understanding of available PVA analytics is required to be able to determine what deflection means for your organization. Below is the description of the key metrics from Power Virtual Agents:

|Description                     |Details                           |
|--------------------------------|----------------------------------|
|  Total Sessions                | The total number of sessions within the specified time period.                                 |
|  Engagement Rate               | The percentage of total sessions that are engaged sessions. An engaged session is a session in which a user-created topic (as opposed to a system topic like “Greeting”) is triggered, or the session ends in escalation. Engaged sessions can have one of three outcomes—they are either resolved, escalated, or abandoned.                                 |
|  Resolution Rate               | The percentage of engaged sessions that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question "Did that answer your question?" and the user either does not respond or responds Yes.                                 |
|  Escalation Rate               | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that is escalated to a human agent.                                  |
|  Abandon Rate                  | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.                                 |
|  CSAT                          | The graphical view of the average of customer satisfaction (CSAT) scores for sessions in which customers respond to an end-of-session request to take the survey.                                 |


These metrics need to be continuously improved to optimize  the bot ROI. However, each organization may have their own definition of what deflection rate means to them. For example, an organization may consider “Abandon rate” along with “escalation rate” as part of deflection calculation while another organization may look purely at escalation rate. Despite having different definitions for deflection rate, the above listed PVA metrics will still provide the foundation to calculate deflection.
Based on our experience with various customers, we have seen that in the context of deflection, resolution rate and escalation rate play a major role. Increasing the resolution rate and reducing the escalation rate typically has a direct impact on the overall bot deflection metrics.

## Key Techniques
![deflection playbook techniques](./media/introduction/df-key-techniques.png)
