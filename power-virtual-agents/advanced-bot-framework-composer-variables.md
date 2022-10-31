---
# FIXME: update metadata

title: "Use Bot Framework Composer with chatbots"
description: "Use Bot Framework Composer to add Adaptive Cards, multi-select options, and more to your Power Virtual Agents chatbot."
keywords: "composer, adaptive card"
ms.date: 06/28/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Extend your bot with Bot Framework Composer

<!-- FIXME: write intro -->

## Prerequisites

<!-- FIXME: prereqs -->

## Use and update Power Virtual Agents variables in Bot Framework Composer

<!-- FIXME: add more detail about this feature -->

You can use and update the values in Power Virtual Agents global variables in Bot Framework Composer by referencing the following scope:

- `virtualagent`

For example, create a variable called **user_city** in your Power Virtual Agents bot. Make it a global variable by setting its **Usage** to **Bot (any topic can access)**.

:::image type="content" source="media/advanced-bot-framework-composer/E1_Dialog2.png" alt-text="Power Virtual Agents - variable.":::

This setting makes the Power Virtual Agents variable **user_city** available in Bot Framework Composer within the **virtualagent** scope. Use the following notation to refer to it in Composer:

```lu
${virtualagent.user_city} 
```

[!INCLUDE[footer-include](includes/footer-banner.md)]
