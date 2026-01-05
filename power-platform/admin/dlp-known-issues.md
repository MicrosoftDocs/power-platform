---
title: Known limitations for data policies
description: Learn more about the known limitations when using our suite of data policy capabilities.
ms.topic: concept-article
ms.date: 02/05/2025
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - laneswenka
  - mikferland-msft
  - mihaelablendea
  - ChrisGarty
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Known limitations

Below are known limitations to know about when using our suite of data policy capabilities:

## General
- Runtime enforcement is being allowed across all Power Platform regions. For customers who have used the [connector action control](connector-action-control.md) to block all new actions for a given connector, this could block triggers implicitly.  To identify and resolve any blocked triggers, review [Identify blocked Power Automate flows](identify-blocked-flows-data-policies.md) for a script to review and add to your policies.
- If you delete an environment and it's still within the seven day recovery period, you can see it in data policies when you view them in PowerShell. Once the recovery period ends, the environment is permanently deleted. However, it may take up to seven days for all references to the environment to be automatically removed from your data policies.
- There's limited support for data policy actions in the [Power Platform for Admins connector](/connectors/powerplatformforadmins/). The ability to block a connector is only supported in the data policy actions labeled with "V2" (such as "Create Data Policy V2"). Connector action control, connector endpoint filtering, and data policy for custom connectors can't be configured using the Power Platform for Admins connector.
- Tabular functions in the [Power Apps expression language](/powerapps/maker/canvas-apps/formula-reference) can't be governed with data policies.
- Solution flows need to be activated once, to create a runtime representation, before they can be targeted for data policy enforcement exemption using the [Set-PowerAppDlpPolicyExemptResources cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlppolicyexemptresources). If activation of the flow isn't allowed as-is because of a current data policy violation, then you could make changes to avoid violations, save, activate, add the exemption, then edit as desired with the exemption active.

## Power Apps
Power Apps treats [Dataverse native](/power-apps/maker/canvas-apps/data-platform-create-app-scratch) and [Dataverse (legacy)](/connectors/commondataservice/) connections as the same for data policy enforcement. 

> [!NOTE]
> Data policy authoring experiences allow [Dataverse (legacy)](/connectors/commondataservice/) and [Dataverse](/connectors/commondataserviceforapps/) connectors to be grouped separately. If the following conditions are true, it can cause an app to not be data policy compliant:
> - The Dataverse connectors are grouped separately
> - An app triggers a flow 
> - Both the app and flow connect to Dataverse

### Desktop flows
- There's no support for cross checking the categories between a cloud flow and the desktop flows it calls. This will be supported when [Data policy for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for cross checking the modules that are used between a desktop flow and all its child desktop flows. This will be supported when [Data policy for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for the "Set default group" for newly added desktop flow modules. This will be supported when [Data policy for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.


[!INCLUDE[footer-include](../includes/footer-banner.md)]

### Related content
[Data policy for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview)
