---
title: ​​Authentication in Copilot Studio with Microsoft​ Entra ID and custom authentication
description: Learn how authenticate in Copilot Studio with Microsoft​ Entra ID and custom authentication
#customer intent: As a Copilot Studio maker, I want to authenticate users in Copilot Studio with Microsoft​ Entra ID and custom authentication.
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

# ​Authentication in Copilot Studio with Microsoft​ Entra ID and custom authentication

## Architecture diagram

![A screenshot of a computer flowchart  AI-generated content may be incorrect.](media/image1.png)

## Components

### Channel

- **Microsoft Teams**: Where employees collaborate day-to-day, and Copilot Studio can be surfaced with no context switching needed.
- **Power Apps**: Builds lightweight, task-focused apps fast. Great for internal tools that connect to your data and systems without writing full code. This can also surface agents.
- **Website**: This could be any public website such as a sales website, help center, or landing page. The Microsoft Copilot agent is embedded in the site and handles questions or starts tasks without users getting redirected to another experience. As a solution architect, you decide if users need to sign in or stay anonymous. You also control how it the agent experience looks, what the agent can access, and what the agent can do. The agent embeds into the page and works like as of the public website.

### Connectors

- **SharePoint**: Used for structured content like lists and documents. Good for storing data and making it easy to surface across apps.
- **OneDrive**: Personal file storage. Employees use it to manage working docs before they move to something more formal.
- **Outlook**: Email, calendar, and contacts. Great for pulling in messages, attachments, or meeting details when needed.
- **Others**: Includes connectors for anything else.

### Authentiction types

- **None**: No authentication. The API is public and doesn't need any headers or tokens. 
- **API key**: You pass a static key in the header or query string. 
- **Basic authentication**: Username and password passed with the request. 
- **Microsoft Entra ID**: Uses a registered app to get a token from Microsoft Entra.
- **User Delegation (OAuth 2.0)**: The user signs in, and the Copilot Studio agent uses their token to call the API on their behalf.

## Limitations

Copilot Studio only supports one type of user authentication per published agent. So if you need to support different identity providers such as Microsoft Entra for employees and OAuth 2.0 for external users, you'll have to create separate agents for each.

There's no built-in way to let a single agent handle both. It can't switch between authentication types based on who's signing in. That means if you're building something for both internal staff and external partners or customers, you'll need to duplicate the agent and manage each version separately.

### Solutions to limitations

While Copilot Studio natively supports only one authentication type per published agent, integrating with the Microsoft 365 Agents SDK enables you to code custom authentication flows. This allows your agent to handle different identity providers, such as Microsoft Entra for internal users and OAuth 2.0 for external users, within a single deployment.

### Related resources

- [Power Platform Well-Architected Framework](/power-platform/well-architected) 
- [Microsoft Entra](/entra/)
- [Configure user authentication in Copilot Studio](/microsoft-copilot-studio/configuration-end-user-authentication)
- [Microsoft 365 Agents SDK](https://github.com/microsoft/agents)
- [Microsoft Responsible AI Principles](/responsible-ai/)
