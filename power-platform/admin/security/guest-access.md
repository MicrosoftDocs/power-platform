---
title: Control guest access to Microsoft Power Platform environments
description: Learn about controlling guest access to Microsoft Power Platform environments. Guest access is disabled by default for all new environments; existing environments must be manually enabled. When allowed (Disabled), guests can access data in Dataverse.
author: Greggbarker-MS
ms.author: grbarker
ms.reviewer: ellenwehrle
ms.date: 03/09/2026
ms.topic: how-to
---
# Control guest access in Microsoft Power Platform environments

As an admin, you can control guest access to Dataverse in Microsoft Power Platform environments. By using the guest access setting, `restrictGuestUserAccess` in Microsoft Dataverse, you can allow or block Microsoft Entra Business-to-Business (B2B) guest users from accessing Dataverse data in environments.

When you restrict guest access (Enabled), you block all external guest user Dataverse actions in that environment. By default, guest access to Dataverse is restricted for all new environments. You must manually enable Dataverse access in existing environments. When you allow guest access (Disabled), guest users can access data in Dataverse, provided they meet the necessary security role and licensing requirements. This setting enables selective external collaboration without applying broad tenant-wide restrictions.

## Prerequisites
- The guest access restriction setting only controls access to Dataverse in an environment.
- Administrator role in Dataverse, such as Power Platform Admin, Dynamics 365 Admin, or System Administrator.
- For CLI configuration:
    - Power Platform Command Line Interface (CLI) installed (through the Visual Studio Code extension or as a .NET global tool).
    - Authentication with appropriate credentials by using `pac auth create`.

## Control guest access

Use the guest access setting to:
- Prevent external guest users from accessing sensitive Dataverse data in specific environments while allowing access in others.
- Enable controlled collaboration with partners, contractors, or clients by allowing guest access in a development or testing environment but restricting it in production.

### Guest access behavior when restricted

When the setting is enabled (On):
- **No data access:** Guest users can't connect to Dataverse in the environment, query or modify Dataverse data, or create new connections to Dataverse.
- **No app usage:** Guests can't run Power Apps that rely on Dataverse within the environment. Attempts to open shared apps or execute flows using Dataverse are blocked.
- **No maker actions:** Guests can't create or edit apps using Dataverse in the environment.
- **New connections and API calls blocked:** Guests can't create new connections to Dataverse data or make API calls to Dataverse in the environment.
- **Existing guest connections disabled:** Previously created guest-owned connections to Dataverse are disabled but not removed.

### Limitations
- Not available for environments without Dataverse.
- Doesn't override tenant-level guest access policies set in Microsoft Entra ID or through Conditional Access.
- Apply guest access settings per environment and configure them individually.
- By blocking guest access, you prevent any guest from saving to Dataverse and using Dataverse resources.
- **Guests aren't restricted from accessing apps in the environment that aren't using Dataverse.**
- Items that you create in Copilot Studio might use Microsoft Graph connectors as knowledge sources from outside Microsoft Power Platform. Currently, guests might access the information in these items even if you block guest access.

## Configure guest access in Power Platform admin center

To manage guest access for an environment:
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and select **Security Hub**.
1. Select **Identity and access**.
1. Locate the **Guest access** setting.
1. Select the environment.
1. Toggle the setting **On** (Restricted) or **Off** (Allowed), and then select **Save**.

- **On (Restricted):** Block guest access in the environment.
- **Off (Allowed):** Permit guest access.

This toggle updates the backend `restrictGuestUserAccess` flag:
- `true` when guest access is restricted.
- `false` when guest access is allowed.

## Configure guest access by using Power Platform CLI

You can also configure guest access by using the Power Platform CLI, which is useful for scripting and automating settings across multiple environments.

### Examples

**Restrict guest access (block guests):**
`pac env update-settings --environment "" --name "restrictGuestUserAccess" --value true`

**Allow guest access:**
`pac env update-settings --environment "" --name "restrictGuestUserAccess" --value false`

**List settings example:**
`pac env list-settings --environment "your-environment-url" --filter "guest"`

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
