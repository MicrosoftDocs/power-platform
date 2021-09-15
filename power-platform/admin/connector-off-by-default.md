---
title: "Connectors off by default | MicrosoftDocs"
description: Describes how the connectors are off by default.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/15/2021
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Connectors off by default

Effective September 30<sup>th</sup>, 2021, new connectors that are introduced by Microsoft and other 3<sup>rd</sup> parties to the Power Platform will be disabled by default for customers operating in the following US government clouds: GCC High and DoD. Administrators will be able to review these new connectors before explicitly authorizing their use across the organization. Connectors that have been published before September 30<sup>th</sup>, 2021, will remain enabled by default, but admins can leverage the new tenant-level setting to disable them.

> [!NOTE]
> Custom connectors are excluded from this new configuration setting.

## Disable new connectors by default

### Value proposition

When new connectors are introduced to the Power Platform, they can be used immediately by all makers. This requires admins to constantly monitor the Connector ecosystem and reactively update the organization's Data Loss Prevention (DLP) policies to prevent makers from inadvertently exfiltrating data. Such occurrences must be avoided at all costs in US government clouds where strict Federal compliance is mandated. Administrators can now rely on this safeguard mechanism in GCC High and DoD to better control the use of connectors.

> [!NOTE]
> When a connector is disabled in this new tenant-level setting, the admins can still classify and configure the connector in the DLP policies, but its use will be blocked in Power Apps and Power Automate either when creating an app/flow or when executing an app/flow.

### Availability

This feature is exclusively available in GCC High and DoD for all customers. Sign-up is not required.

### Workflow

**Step one: View the new connector**

1. Select the **Data policies** tab where all DLP policies are located.

2. Select **Enable connectors** in the toolbar.

3. New connectors (those that have not been reviewed) have the status "Mark as reviewed".

4. Connectors that have already been reviewed and authorized have the status "Reviewed".

   \[TODO: insert screenshots here\]

**Step two: Enable or disable the new connector**

1. If you want to keep the connector disabled, select **Mark as reviewed**.

2. If you want to enable the connector, select the **Enable** toggle.

3. In both cases, the status is changed to "Reviewing".

4. Select **Save**. The status of the connector is now set to "Reviewed".

   \[TODO: insert screenshots here\]

**Step three: View a disabled connector in a DLP policy**

1. Select a data policy in the **Data policies** page.

2. Consult the **Prebuilt connectors** tab. Connectors that are disabled have the status "Disabled".

   \[TODO: insert screenshots here\]

**Step four: Attempt to add a disabled connector in a Power App**

1. Open any Power App.

2. Add a connector that has been disabled. An error message appears.

   \[TODO: insert screenshots here\]

   > [!NOTE]
   > This new tenant-level setting is also enforced on existing apps/flows that were built using connectors that are now disabled.

## PowerShell (owners: Mohit and Christina)

-  *TODO add PowerShell cmds for interacting with this feature*

## Known limitations

-  Disabled connectors are not enforced in Power Virtual Agent.


