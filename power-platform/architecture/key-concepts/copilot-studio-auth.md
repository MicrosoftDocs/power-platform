---
title: ​​Authentication in Copilot Studio
description: Learn how authenticate in Copilot Studio with Microsoft​ Entra ID, custom authentication and a combination of both
#customer intent: As a Copilot Studio maker, I want to authenticate users in Copilot Studio with Microsoft​ Entra ID or custom authentication.
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

## Authentication in Copilot Studio

Copilot Studio agents that are available in Microsoft Teams or Power Apps use Microsoft Entra ID for seamless user authentication. However, some scenarios are more complex and require different authentication designs. These scenarios include architectures where the agent is available on an external website. 

This article describes key patterns that provide authentication for Copilot Studio agents:

- [Authentication in Copilot Studio with Microsoft Entra ID](#authentication-in-copilot-studio-with-microsoft-entra-id)
- [Authentication in Copilot Studio with with Microsoft Entra ID and custom authentication](#authentication-in-copilot-studio-with-microsoft-entra-id-and-custom-authentication)
- [Authentication in Copilot Studio with custom autehntication](#authentication-in-copilot-studio-with-custom-authentication)

## ​Authentication in Copilot Studio with Microsoft​ Entra ID

### Architecture diagram

:::image type="content" source="media/authentication-mcs/authenticate-with-microsoft.png" alt-text="Diagram showcasing the components of ​authentication in Copilot Studio with Microsoft Entra ID." lightbox="media/authentication-mcs/authenticate-with-microsoft.png":::

### Components 

#### Channel 

##### Microsoft Teams

Where employees collaborate day-to-day, and Copilot Studio can be surfaced with no context switching needed. 

##### Power Apps

Builds lightweight, task-focused apps fast. Great for internal tools that connect to your data and systems without writing full code. This can also surface agents. 

#### Connectors

##### SharePoint

Used for structured content like lists and documents. Good for storing data and making it easy to surface across apps. 

##### OneDrive

Personal file storage. Employees use it to manage working docs before they move to something more formal. 

##### Outlook

Email, calendar, and contacts. Great for pulling in messages, attachments, or meeting details when needed. 

##### Others

Copilot Studio and Power Platform have a large ecosystem of software as a service (SaaS) connectors that enable you to connect apps, data, and devices in the cloud. Learn more: [What are connectors?](/connectors/overview) and [List of all connectors](/connectors/connector-reference/).

#### Authentication

Authenticating with Microsoft Entra ID makes sure the right people are using the agent inside Teams. It checks who the user is, what access they have, and what actions they’re allowed to take. 

When someone opens the Copilot Studio Agent in Teams, Entra handles the sign-in behind the scenes. It sends over the user’s identity and permissions, so the agent experience can be tailored, for example, like showing their tickets, starting workflows, they’re allowed to run, or hiding anything they shouldn’t see. No extra login steps. No manual access checks. Just a secure access method without the user knowing. 

## ​Authentication in Copilot Studio with Microsoft​ Entra ID and custom authentication

### Architecture diagram

:::image type="content" source="media/authentication-mcs/custom-web-auth-and-microsoft.png" alt-text="Diagram showcasing the components of ​authentication in Copilot Studio with Microsoft​ Entra ID and custom authentication." lightbox="media/authentication-mcs/custom-web-auth-and-microsoft.png":::

### Components

#### Channel

##### Microsoft Teams

Where employees collaborate day-to-day, and Copilot Studio can be surfaced with no context switching needed.

##### Power Apps

Builds lightweight, task-focused apps fast. Great for internal tools that connect to your data and systems without writing full code. This can also surface agents.

##### Website

This could be any public website such as a sales website, help center, or landing page. The Microsoft Copilot agent is embedded in the site and handles questions or starts tasks without users getting redirected to another experience. As a solution architect, you decide if users need to sign in or stay anonymous. You also control how it the agent experience looks, what the agent can access, and what the agent can do. The agent embeds into the page and works like as of the public website.

#### Connectors

##### SharePoint

Used for structured content like lists and documents. Good for storing data and making it easy to surface across apps.

##### OneDrive

Personal file storage. Employees use it to manage working docs before they move to something more formal.

##### Outlook

Email, calendar, and contacts. Great for pulling in messages, attachments, or meeting details when needed.

##### Others

Copilot Studio and Power Platform have a large ecosystem of software as a service (SaaS) connectors that enable you to connect apps, data, and devices in the cloud. Learn more: [What are connectors?](/connectors/overview) and [List of all connectors](/connectors/connector-reference/).

#### Authentiction types

##### None

No authentication. The API is public and doesn't need any headers or tokens. 

##### API key

You pass a static key in the header or query string. 

##### Basic authentication

Username and password passed with the request. 

##### Microsoft Entra ID

Uses a registered app to get a token from Microsoft Entra.

##### User Delegation (OAuth 2.0)

The user signs in, and the Copilot Studio agent uses their token to call the API on their behalf.

### Limitations

Copilot Studio only supports one type of user authentication per published agent. So if you need to support different identity providers such as Microsoft Entra for employees and OAuth 2.0 for external users, you'll have to create separate agents for each.

There's no built-in way to let a single agent handle both. It can't switch between authentication types based on who's signing in. That means if you're building something for both internal staff and external partners or customers, you'll need to duplicate the agent and manage each version separately.

#### Solutions to limitations

While Copilot Studio natively supports only one authentication type per published agent, integrating with the Microsoft 365 Agents SDK enables you to code custom authentication flows. This allows your agent to handle different identity providers, such as Microsoft Entra for internal users and OAuth 2.0 for external users, within a single deployment.

## ​Authentication in Copilot Studio with custom authentication

### Architecture diagram

:::image type="content" source="media/authentication-mcs/custom-web-auth-no-entra.png" alt-text="Diagram showcasing the components of ​authentication in Copilot Studio with custom authentication." lightbox="media/authentication-mcs/custom-web-auth-no-entra.png":::

### Components

#### Website

This could be any public website such as a sales website, help center, or landing page. The Microsoft Copilot agent is embedded in the site and handles questions or starts tasks without users getting redirected to another experience. As a solution architect, you decide if users need to sign in or stay anonymous. You also control how it the agent experience looks, what the agent can access, and what the agent can do. The agent embeds into the page and works like as of the public website.

#### Knowledge

##### Example website

You can point the Copilot Studio agent to a website (or the same website it will be hosted on) by adding it as a knowledge source. The agent uses the content to answer questions with generative AI.

##### Example document

You can upload documents like PDFs into Copilot Studio as a knowledge source. The agent then reads the content and uses it to answer questions with generative AI.

#### App registration

Defines the app's identity and permissions in Azure. It's how the app signs in and proves what it's allowed to do.

#### API

You can connect Copilot Studio agents to your own APIs to get real-time data or trigger actions.

#### Authentiction types

##### None

No authentication. The API is public and doesn't need any headers or tokens.

##### API key

You pass a static key in the header or query string.

##### Basic authentication

Username and password passed with the request.

##### User Delegation (OAuth 2.0)

The user signs in, and the Copilot Studio agent uses their token to call the API on their behalf.

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Microsoft Entra ID](/entra/)
- [Microsoft Responsible AI Principles](https://www.microsoft.com/ai/principles-and-approach/)
- [Power Platform Well-Architected Framework](/power-platform/well-architected)
- [Microsoft Entra](/entra/)
- [Configure user authentication in Copilot Studio](/microsoft-copilot-studio/configuration-end-user-authentication)
- [Microsoft Responsible AI Principles](https://www.microsoft.com/ai/principles-and-approach/)