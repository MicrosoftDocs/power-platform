---
title: ​​Authentication in Copilot Studio with Microsoft​ Entra ID
description: Learn how authenticate in Copilot Studio with Microsoft​ Entra ID
#customer intent: As a Copilot Studio maker, I want to authenticate users in Copilot Studio with Microsoft​ Entra ID.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - adileibowitz
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/05/2025
---

# ​Authentication in Copilot Studio with Microsoft​ Entra ID

## Components 

### Channel 

- **Microsoft Teams**: Where employees collaborate day-to-day, and Copilot Studio can be surfaced with no context switching needed. 
- **Power Apps**: Builds lightweight, task-focused apps fast. Great for internal tools that connect to your data and systems without writing full code. This can also surface agents. 

### Connectors 
 
- **SharePoint**: Used for structured content like lists and documents. Good for storing data and making it easy to surface across apps. 
- **OneDrive**: Personal file storage. Employees use it to manage working docs before they move to something more formal. 
- **Outlook**: Email, calendar, and contacts. Great for pulling in messages, attachments, or meeting details when needed. 
- **Others**: Includes connectors for anything else. 

## Authentication

Microsoft Authentication, like Microsoft Entra ID, makes sure the right people are using the agent inside Teams. It checks who the user is, what access they have, and what actions they’re allowed to take. 

When someone opens the Copilot Studio Agent in Teams, Entra handles the sign-in behind the scenes. It sends over the user’s identity and permissions, so the agent experience can be tailored, for example, like showing their tickets, starting workflows, they’re allowed to run, or hiding anything they shouldn’t see. No extra login steps. No manual access checks. Just a secure access method without the user knowing. 

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Microsoft Entra ID](/entra/)
- [Microsoft Responsible AI Principles](/responsible-ai/)
