---
title: Control guest access to Microsoft Power Platform environments
description: Guest access is disabled by default for all new environments; existing environments must be manually enabled. When allowed (Disabled), guests can access data in Dataverse.
author: Greggbarker-MS
ms.author: grbarker
ms.reviewer: grbarker
ms.date: 03/03/2026
ms.topic: how-to
---
# Control guest access in Microsoft Power Platform environments

This article explains how to control guest access to Dataverse in Microsoft Power Platform environments. The guest access setting, named `restrictGuestUserAccess` in Microsoft Dataverse, lets administrators allow or block Microsoft Entra Business-to-Business (B2B) guest users from accessing Dataverse data in environments.

When guest access is restricted (Enabled), all external guest user Dataverse actions are blocked in that environment. Guest access to Dataverse is restricted by default for all new environments; Dataverse access in existing environments must be manually enabled. When allowed (Disabled), guest users can access data in Dataverse, provided they meet the necessary security role and licensing requirements. This enables selective external collaboration without applying broad tenant-wide restrictions.

## Prerequisites
- The guest access restriction setting only controls access to Dataverse in an environment.
- Administrator role in Dataverse, such as Power Platform Admin, Dynamics 365 Admin, or System Administrator.
- For CLI configuration:
    - Power Platform Command Line Interface (CLI) installed (through the Visual Studio Code extension or as a .NET global tool).
    - Authentication with appropriate credentials using `pac auth create`.

## Control guest access

The guest access setting can be used to:
- Prevent external guest users from accessing sensitive Dataverse data in specific environments while allowing access in others.
- Enable controlled collaboration with partners, contractors, or clients by allowing guest access in a development or testing environment but restricting it in production.

### Guest access behavior when restricted

When the setting is enabled (On):
- **No data access:** Guest users cannot connect to Dataverse in the environment, query or modify Dataverse data, or create new connections to Dataverse.
- **No app usage:** Guests cannot run Power Apps that rely on Dataverse within the environment. Attempts to open shared apps or execute flows using Dataverse are blocked.
- **No maker actions:** Guests cannot create or edit apps using Dataverse in the environment.
- **New connections and API calls blocked:** Guests cannot create new connections to Dataverse data or make API calls to Dataverse in the environment.
- **Existing guest connections disabled:** Previously created guest-owned connections to Dataverse are disabled but not removed.

### Limitations
- Not available for environments without Dataverse.
- Does not override tenant-level guest access policies set in Microsoft Entra ID or through Conditional Access.
- Guest access settings apply per environment and must be configured individually.
- By blocking guest access, you prevent any guest from saving to Dataverse and using Dataverse resources.
- **Guests are not restricted from accessing apps in the environment that are not using Dataverse.**
- Items that are made in Copilot Studio might use Graph connectors as knowledge sources from outside Microsoft Power Platform. Currently, the information in them might be accessible to guests, even if guest access is blocked.

## Configure guest access in Power Platform admin center

To manage guest access for an environment:
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and select **Security Hub**.
2. Select **Identity and access**.
3. Locate the **Guest access** setting.
4. Select the environment.
5. Toggle the setting **On** (Restricted) or **Off** (Allowed), and then select **Save**.
- **On (Restricted):** Guest access is blocked in the environment.
- **Off (Allowed):** Guest access is permitted.

This toggle updates the backend restrictGuestUserAccess flag:
- true when guest access is restricted.
- false when guest access is allowed.

## Configure guest access using Power Platform CLI

You can also configure guest access using the Power Platform CLI, which is useful for scripting and automating settings across multiple environments.

### Examples

**Restrict guest access (block guests):**
pac env update-settings --environment "" --name "restrictGuestUserAccess" --value true

**Allow guest access:**
pac env update-settings --environment "" --name "restrictGuestUserAccess" --value false

**List settings example:**
pac env list-settings --environment "your-environment-url" --filter "guest"
