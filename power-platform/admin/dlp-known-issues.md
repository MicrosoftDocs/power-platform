---
title: Known limitations for data loss prevention (DLP) policies
description: Learn more about the known limitations when using our suite of data loss prevention (DLP) capabilities.
ms.topic: concept-article
ms.date: 02/05/2025
ms.subservice: admin
author: laneswenka
ms.author: laswenka
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

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
Below are known limitations to know about when using our suite of data loss prevention (DLP) capabilities:

## General
- Runtime enforcement is being allowed across all Power Platform regions. For customers who have used the [connector action control](connector-action-control.md) to block all new actions for a given connector, this could block triggers implicitly.  To identify and resolve any blocked triggers, review [Identify blocked Power Automate flows](identify-blocked-flows-data-policies.md) for a script to review and add to your policies.
- If you delete an environment and it's still within the seven day recovery period, you can see it in DLP policies when you view them in PowerShell. Once the recovery period ends, the environment is permanently deleted. However, it may take up to seven days for all references to the environment to be automatically removed from your DLP policies.
- There's limited support for DLP actions in the [Power Platform for Admins connector](/connectors/powerplatformforadmins/). The ability to block a connector is only supported in the DLP actions labeled with "V2" (such as "Create DLP Policy V2"). Connector action control, connector endpoint filtering, and DLP for custom connectors can't be configured using the Power Platform for Admins connector.
- Tabular functions in the [Power Apps expression language](/powerapps/maker/canvas-apps/formula-reference) can't be governed with DLP.
- Solution flows need to be activated once, to create a runtime representation, before they can be targeted for DLP enforcement exemption using the [Set-PowerAppDlpPolicyExemptResources cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlppolicyexemptresources). If activation of the flow isn't allowed as-is because of a current DLP violation, then you could make changes to avoid violations, save, activate, add the exemption, then edit as desired with the exemption active.

## Power Apps
Power Apps treats [Dataverse native](/power-apps/maker/canvas-apps/data-platform-create-app-scratch) and [Dataverse (legacy)](/connectors/commondataservice/) connections as the same for DLP enforcement. 

> [!NOTE]
> Although the DLP authoring experience supports the technical possibility of grouping [Dataverse (legacy)](/connectors/commondataservice/) and [Dataverse](/connectors/commondataserviceforapps/) connectors in separate groups, doing so may result in non-compliant Canvas Apps when:
> - The app has an embedded flow, and
> - Both the app and embedded flow connect to Dataverse
> This is due to the connector in the app being treated as Dataverse (legacy), as mentioned in the first statement of this section. **To prevent errors, both [Dataverse (legacy)](/connectors/commondataservice/) and [Dataverse](/connectors/commondataserviceforapps/) connectors must be in the same group.**

### Desktop flows
- There's no support for cross checking the categories between a cloud flow and the desktop flows it calls. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for cross checking the modules that are used between a desktop flow and all its child desktop flows. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.
- There's no support for the "Set default group" for newly added desktop flow modules. This will be supported when [DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview) is generally available.


[!INCLUDE[footer-include](../includes/footer-banner.md)]

### Related content
[DLP for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-dlp-for-desktop-flows-preview)
