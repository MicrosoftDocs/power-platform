---
title: Manage context
description: Provide Project "Sophia" with a context to improve the relevancy and consistency of generated reports.
author: skent
ms.topic: overview
ms.custom: 
ms.reviewer: skent
ms.date: 7/11/2024
ms.service: power-platform
ms.author: pemikkel
search.audienceType:
  - maker
contributors:
  - mduelae
  - mikkelsen2000
---

# Manage contexts

You can increase the relevancy and consistency of the reports Project "Sophia" generates by modifying the _context_ it uses to interpret data. Project "Sophia" applies your context to how it interprets all prompts you enter while the context is active, so you also don't need to repeat that contextual information every time you generate a report.

For example, you can add the start of your organization's fiscal year to the context. Project "Sophia" can then relate input in prompts like _Q1_ or _this fiscal year_ to the correct period of time.

You can also add definitions for acronyms or column headings used by your organization in the context, so when they're used in prompts, Project "Sophia" can correctly interpret their meaning and return accurate results.

To set and manage the context:

1. Select the options menu (**&hellip;**), then **Manage context.**

> [!div class="mx-imgBorder"]
> ![Screenshot showing the location of the options menu](media/context-select.png)

1. Enter context information. You don't need to fill in every field, but adding more context leads to more relevant Project "Sophia" blueprints.

   - Turn on **Remember data for new workspaces** to have Project "Sophia" consider previous data and domains when working in new workspaces. Turn this off to only consider data and domains from the current workspace.
   - To delete the current context, data, and domain information, select **Delete all**.

1. Enter a question or topic to analyze with Project "Sophia".
