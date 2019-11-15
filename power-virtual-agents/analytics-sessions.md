---
title: "Download Power Virtual Agents bot sessions"
description: "Download sessions from the last 30 days for your bot conversations."
ms.date: 11/12/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.cusom: analysis
ms.collection: virtual-agent
---

# Analyze session information in Power Virtual Agents

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]


![Sessions page](media/sessions-page.png)

>[!WARNING]
>Need an updated image

You can download a maximum of seven days of sessions from the past 30 days. If your bot had a high number of sessions, they will be broken down into multiple rows. Click on each row to download the sessions for the specified timeframe.

>[!WARNING]
>I think this has changed.

The downloaded file contains the following information: 

- SessionID: A unique identifier per session. 

- StartDateTime: Time at which the session started. Entries are sorted by this column in descending order. 

- InitialUserMessage: First message typed by the user.

- TopicName: Name of the last authored topic that was triggered in this session. 

- ChatTranscript: Transcript of the session in the following format:
    - “User says”/“Bot says” structure
    - Conversation turns separated by semicolons</br>
   Note that **Bot says** does not include the options presented to the user.
    
    Example: “User says: store hours; Bot says: Which store are you asking about?; User says: Bellevue; Bot says: Bellevue store is open from 10am to 7pm every day.;”

- SessionOutcome: Outcome of the session (Resolved, Escalated, Abandoned, Unengaged).

- TopicId: A unique identifier of the last authored topic triggered in this session. 
