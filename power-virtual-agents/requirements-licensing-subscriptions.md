---
title: "Get access to Microsoft Copilot Studio"
description: "Compare the capabilities you can access in Microsoft Copilot Studio depending on whether you have a Microsoft 365 subscription or standalone Microsoft Copilot Studio subscription."
keywords: "Administration, licensing, PVA, standalone, compare, comparison"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "licensing, admin, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Get access to Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This topic includes details about Copilot Studio Licensing. You can also review the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130) to learn more.

If you already have licenses, see the [Assign licenses and manage access to Microsoft Copilot Studio](requirements-licensing.md) topic.

Copilot Studio is [available in the US Government Community Cloud (GCC) plan](requirements-licensing-gcc.md).

For more information and to request assistance, visit the [Microsoft Copilot Studio Community](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Community/ct-p/PVACommunity).

## Microsoft Copilot Studio for Microsoft Teams plan

Copilot Studio for Teams enables customers to build conversational interfaces within Teams. The copilots can use data stored in Microsoft Dataverse for Teams or many other sources, using the supplied standard connectors.

Capabilities available in the Copilot Studio app in Teams are available as part of select Microsoft 365 subscriptions with Microsoft Power Platform and Teams capabilities, excluding plans for US government environments (GCC, GCC High, and DoD), EDU A1, and SUB SKUs.

This table compares key capabilities in the Copilot Studio for Teams plan, which is available in select Microsoft 365 subscriptions, against the standalone Copilot Studio subscription. For a full, comparative list, see the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

Also see the [Quotas, limits, and configuration values](requirements-quotas.md) topic for other capacity considerations.

| Capability | Select Microsoft 365 subscriptions | Microsoft Copilot Studio subscription |
| ---------- | ---------------------------------- | ------------------------------------- |
| Deploy copilot to channels | [Teams](publication-add-bot-to-microsoft-teams.md) | [Any channel supported by Copilot Studio](publication-fundamentals-publish-channels.md) |
| Power Automate connectors | [Standard connectors for flows triggered from Copilot Studio](advanced-flow.md) | [Premium connectors for flows triggered from Copilot Studio](advanced-flow.md) |
| Web security | [Secure access enabled by default, can't generate secrets to enable secure access](configure-web-security.md) | [Can generate secrets and turn on or off secure access by the copilot author](configure-web-security.md) |
| Create (edit) with Copilot | Not available | [Can create and iterate on topics by describing what you want, then AI builds it](nlu-authoring.md) |
| Use Microsoft Bot Framework skills | Not available | [Can extend Copilot Studio copilots with Microsoft Bot Framework skills](advanced-use-skills.md) |
| Use a Copilot Studio copilot as a Bot Framework skill | Not available | [Use a Copilot Studio copilot as a skill](advanced-use-pva-as-a-skill.md) |
| Integrate Microsoft Bot Framework dialogs | Not available | [Develop custom dialogs with Bot Framework Composer](advanced-bot-framework-composer.md) |
| Hand off copilot conversation to a live agent | Not available | [Trigger hand-off to a live agent](advanced-hand-off.md) |

> [!NOTE]
> A paid, standalone Copilot Studio subscription is required to run flows with premium connectors with copilots.  
>
> Similarly, usage rights and functionality are part of paid, standalone Power Automate subscriptions serve automation scenarios and cannot be applied to Copilot Studio scenarios.

### Upgrading your license

To access the full range of Copilot Studio capabilities, upgrade your plan to a standalone Copilot Studio subscription.

After you upgrade your license, you can continue using the same copilot in the same environment. Capabilities that were previously only available in a standalone license are now be available. These capabilities might include [billed sessions that require Copilot Studio capacity](analytics-billed-sessions.md).

You can upgrade within the Copilot Studio app for Teams from **Settings** >  **Channels**. Select the apps you want to publish to and you're prompted to upgrade.

:::image type="content" source="media/requirements-licensing-subscriptions/upgrade-channels.png" alt-text="Screenshot showing where the Channels section is located. You need an upgraded license to publish to channels other than Teams." lightbox="media/requirements-licensing-subscriptions/upgrade-channels.png":::

You can [start a 60 day free trial of Microsoft Copilot Studio](https://aka.ms/trypva) to try out all the capabilities. You're prompted to sign up for a trial if you try to create a copilot without a license.

:::image type="content" source="media/requirements-licensing-subscriptions/upgrade-create.png" alt-text="Screenshot that shows a prompt to start a free trial or upgrade to premium when creating a copilot without a license.":::

> [!NOTE]
> The option to create a free trial may be disabled. For more information, see the [Self-service sign-up disabled section](sign-up-individual.md#self-service-sign-up-disabled).

## Standalone Microsoft Copilot Studio subscription

The standalone Copilot Studio subscription allows you to build copilots on any supported channel and connect to any data using premium connectors.

You can obtain a standalone Copilot Studio subscription from the Microsoft 365 admin center. For more information, see [Assign licenses and manage access to Microsoft Copilot Studio](requirements-licensing.md).

## Other subscriptions that include Microsoft Copilot Studio

Entitlements for Copilot Studio are included in Digital Messaging and Chat add-ons for Dynamics 365 Customer Service. For more information, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544&usg=AOvVaw31TJQMIji481LIHcfzy3Qw).

[!INCLUDE[footer-include](includes/footer-banner.md)]
