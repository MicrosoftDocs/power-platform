---
title: "Set up environment request components | MicrosoftDocs"
description: "Setup instructions for how to set up the core admin components solution of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/13/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up environment request components

This article will help you to setup the environment request components of the Core solution, which automate the request, approval and creation of environments and Data Loss Prevention (DLP) policies.

>[!IMPORTANT]
> Get started by completing the [before the setup](before-setup.md) and [setup inventory](setup-core-components.md) instructions. This article assumes you have your environment setup, and are logged in with the correct identity.

## Before you start

### Update environment variables

During solution import, you will configure environment variable values. Make sure to have the below information ready:

| Name | Description |
|------|---------------|
|Environment Request Admin App Url | Update this environment variable with the URL for the **Admin - Environment Request** canvas app. To collect the URL: <br>[Get App URL – Production Environment](internal link) <Br> |

## Turn on flows

There are several flows which will need to be turned on for this component:  

- DLP Request | Make approved policy change
- Env Request | Cleanup expired environments
- Env Request | Create approved environment
- Env Request | Notify admin when new request submitted
- Env Request | Notify requestor when rejected

## Share apps with admins and makers

The Environment Request components consist of two apps:

- **Admin - Environment Request** app for admins to view and approve environment and connectors requests - share this app with other admins and assign them the **Power Platform Admin SR** security role.
- **Environment Request** app for makers to request environments and connectors - share this app with your makers and assign them the **Power Platform Maker SR** security role.

More information:
[Share a canvas app in Power Apps](/powerapps/maker/canvas-apps/share-app)
[Publish and add an app to Teams](/powerapps/teams/publish-and-share-apps#publish-and-add-an-app-to-teams)

## Environment variables in the Core components solution

Here is the full list of environment variables that impact the environment request components. You may have to [update environment variables](setup-core-components.md#update- environment-variables) after import.

| Name | Description | Default Value
|------|---------------|------|
|Environment Request Admin App Url | Update this environment variable with the URL for the **Admin - Environment Request** canvas app. To collect the URL: <br>[Get App URL – Production Environment](internal link) <Br> | n/a |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
