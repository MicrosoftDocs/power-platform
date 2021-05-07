---
title: "Test connection to Exchange Server (on-premises) | MicrosoftDocs"
description: Learn how to test your app connection to  Exchange Server (on-premises)
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/06/2021
author: revachauhan
ms.author: rechauha
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Test connection to Exchange Server (on-premises)

The following guidance is for those having issues with connecting Dynamics 365 Online to a mailbox hosted on their Microsoft Exchange on-premise deployment using server-side synchronization.

Dynamics 365 is hosted on Microsoft Azure. Server-side sync will try to initiate an HTTP connection to the Exchange Web Services (EWS) endpoint configured by the customer on the email server profile associated to the mailbox. The EWS endpoint is an internet-facing HTTP accessible resource which can be accessed from outside the customer network.

![Scenario for troubleshooting connection issues](media/troubleshooting-scenario.png "Scenario for troubleshooting connection issues")

Take Dynamics out of the picture
Server side sync uses the EWS protocol to connect to Exchange onpremise and perform mailbox sync. Troubleshooting exchange onpremise issues can be really time consuming and not actionable for SSS team or even not actionable for Dynamics customer support as the issue usually is on customer side.

Once we can show to the customer that even the connection/request from external testing tools is not working, Dynamics customer support should engage Exchange onpremise team for further troubleshooting.



> [!NOTE]
> Do not use test connection on the emailserver profile as in certain scenarios can misrepresent what the real issue is. Instead please configure a test mailbox associate it to the emailserver profile and test and enable it.


Please work on extracting info from internal doc what you think makes most sense. To get started  I could think of avoiding the scenario, some unify snapshots, response options could be simplified in an official language. As few of things could not be used by end customer and are relevant only to support folks. The intent is to make it usable for end users to test their end point and it may just mean running the test analyzer tool with the right information. 