---
title: "Known limitations for data loss prevention (DLP) policies | MicrosoftDocs"
description:  DLP policies known limitations.
ms.topic: conceptual
ms.date: 12/02/2022
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - mihaelablendea
  - ChrisGarty
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Known limitations
Below are known limitations to know about when leveraging our suite of data loss prevention (DLP) capabilities:

## General
- If you delete an environment and it's still within the 7-day recovery period, you'll still be able to see it in DLP policies when you view them in PowerShell. Once the recovery period ends, the environment is permanently deleted. However, it may take up to 7 days for all references to the environment to be automatically removed from your DLP policies.
- There's limited support for DLP actions in the [Power Platform for Admins connector](/connectors/powerplatformforadmins/). The ability to block a connector is only supported in the DLP actions labeled with "V2" (such as "Create DLP Policy V2"). Connector action control, connector endpoint filtering, and DLP for custom connectors can't be configured using the Power Platform for Admins connector.
- Tabular functions in the [Power Apps expression language](/powerapps/maker/canvas-apps/formula-reference) can't be governed with DLP.
- Solution flows need to be activated once, to create a runtime representation, before they can be targeted for DLP enforcement exemption using the [Set-PowerAppDlpPolicyExemptResources cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlppolicyexemptresources). If activation of the flow isn't allowed as-is because of a current DLP violation, then you could make changes to avoid violations, save, activate, add the exemption, then edit as desired with the exemption active.

## Power Apps
Power Apps treats [Dataverse native](/power-apps/maker/canvas-apps/data-platform-create-app-scratch) and [Dataverse (legacy)](/connectors/commondataservice/) connections as the same for DLP enforcement. 

> [!NOTE]
> DLP authoring experiences allow [Dataverse (legacy)](/connectors/commondataservice/) and [Dataverse](/connectors/commondataserviceforapps/) connectors to be grouped separately. If the following conditions are true, it can cause an app to not be DLP compliant:
> - The Dataverse connectors are grouped separately
> - An app triggers a flow 
> - Both the app and flow connect to Dataverse

## Child flows
- Blocking the HTTP connector will also block child flows because those child flows are called using the same HTTP connector technology.
- If a child flow violates a DLP policy, it will not result in the parent flow becoming non-compliant.

### Desktop flows
- There's no support for cross checking the categories between a cloud flow and the desktop flows it calls. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for cross checking the modules that are used between a desktop flow and all its child desktop flows. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for the "Set default group" for newly added desktop flow modules. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.


[!INCLUDE[footer-include](../includes/footer-banner.md)]

### See also
[DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview)
