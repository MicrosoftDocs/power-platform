---
title: "Set up clean-up for orphaned objects | MicrosoftDocs"
description: "Learn how to set up the clean-up for orphaned objects components of the CoE Starter Kit"
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 02/08/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up clean-up for orphaned objects

This article will help you to set up the clean-up for orphaned objects.

You use this functionality to identify objects where the maker has left the organization, and ask managers to maintain permissions of their former employees.

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md), and you have your [environment set up](setup.md#create-your-environments) and are signed in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

>[!NOTE]
>The flows supporting this processes post adaptive cards to users using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams is not available in GCC High and DoD. These flows should remain turned off in these regions as they will not work.

[Watch a walk-through](https://www.youtube.com/watch?v=0zptiBppTNo&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the clean-up for orphaned objects process works.

## Set up the Clean-up for orphaned objects components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Clean-up for orphaned resources**.
1. This app provides a guided step by step experience through the configuration steps.   
    :::image type="content" source="media/setupwizard-orph.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up the Clean-up for orphaned objects components manually

### Turn on flows

Turn on the following flows, which are installed as part of the governance components solution:

- [Request Orphaned Objects Reassigned (Child)](governance-components.md#request-orphaned-objects-reassigned-child)
- [Request Orphaned Objects Reassigned (Parent)](governance-components.md#request-orphaned-objects-reassigned-parent)

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
