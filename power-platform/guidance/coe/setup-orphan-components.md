---
title: Set up clean-up for orphaned objects
description: Learn how to set up the clean-up for orphaned objects component of the Center of Excellence (CoE) Starter Kit.
author: manuelap-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/29/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---

# Set up clean-up for orphaned objects

This article helps you set up clean-up for orphaned objects.

Use this functionality to identify objects where the maker left the organization, and ask managers to maintain permissions of their former employees.

>[!IMPORTANT]
>This article assumes you [installed the governance components solution](before-setup-gov.md), [set up your environments](setup.md#create-your-environments), and are signed in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

>[!NOTE]
>The flows that support this process post adaptive cards to users by using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams isn't available in GCC High and DoD regions. These flows should remain turned off in these regions.

[Watch a walk-through](https://www.youtube.com/watch?v=0zptiBppTNo&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the clean-up for orphaned objects process works.

## Set up the Clean-up for orphaned objects components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.

1. Open the **CoE Setup and Upgrade Wizard** app.

1. Open the **More features** page and select **Clean-up for orphaned resources**.

1. Follow the configuration steps.  
 
    :::image type="content" source="media/setupwizard-orph.png" alt-text="Screenshot showing the steps in the CoE Starter Kit Setup Wizard to configure the clean-up for orphaned objects process.":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise the issues on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the components manually.

## Set up the clean-up for orphaned objects components manually

Turn on the following flows, which are installed as part of the governance components solution:

- [Request Orphaned Objects Reassigned (Child)](governance-components.md#request-orphaned-objects-reassigned-child)
- [Request Orphaned Objects Reassigned (Parent)](governance-components.md#request-orphaned-objects-reassigned-parent)

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]
