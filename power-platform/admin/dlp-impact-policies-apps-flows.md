---
title: Impact of data policies on apps and flows 
description: About the impact of data policies on apps and flows.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/03/2024
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
  - amchern 
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Impact of data policies on apps and flows

If you've disallowed certain connectors to be used together in an environment by classifying them as **Business** or **Non-Business**, or marked certain connectors as **Blocked** by using tenant-level or environment-level data policies, these restrictions can negatively affect makers and users of Power Apps and Power Automate. The restrictions are enforced at both design time and at runtime.

As an admin, you should have a process and plan in place to handle these types of support needs if you're using data policies.

## Design-time impact on apps and flows

Users who create or edit a resource affected by the data policy will see an appropriate error message about any data policy conflicts. For example, Power Apps makers will see the following error when they use connectors in an app that don't belong together or have been blocked by data policies. The app won't add the connection.

> [!div class="mx-imgBorder"] 
> ![First example of a conflict error message: Using these connections together conflicts with the company data loss prevention policies, with a link to learn more.](media/dlp-conflict-error.png "First example conflict error")

> [!div class="mx-imgBorder"] 
> ![Second example of a conflict error message: It looks like this app isn't compliant with the latest data loss prevention policies.](media/dlp-conflict-error2.png "Second example conflict error")

Similarly, Power Automate makers will see the following error when they try to save a flow that uses connectors that don't belong together or have been blocked by data policies. The flow itself will be saved, but it will be marked as **Suspended** and won't be executed unless the maker resolves the data policy violation.

> [!div class="mx-imgBorder"] 
> ![Flow checker panel showing errors.](media/dlp-suspended-flow-error2.png "Flow error")

## Runtime impact on apps and flows

As an admin, you can decide to modify the data policies for your tenant or for specific environments at any point. If apps and flows were created and executed in compliance with an earlier data policy, some of them might be negatively affected by any policy changes you make. 

Users who use a resource that's in violation of the latest data policy will see an error message about the data policy conflict. For example, Power Apps makers and users will see the following error when they try to open an app that uses connectors that don't belong together or have been blocked by data policies. 

> [!div class="mx-imgBorder"] 
> ![App opening error.](media/dlp-opening-error.png "App opening error")

Similarly, Power Automate makers and users won't be able to start a flow that uses connectors that don't belong together or have been blocked by data policies. A background system process marks the flow as **Suspended**, and the flow won't be executed until the maker resolves the data policy violation.

> [!NOTE]
> The flow and app suspension process works in a polling mode. This change isn't instantaneous. For more information, see [Process for policy changes](./wp-data-loss-prevention.md#process-for-policy-changes).

> [!div class="mx-imgBorder"] 
> ![Flow suspension.](media/dlp-flow-suspension.png "Flow suspension")

## Data policy evaluation of Dataverse in Power Apps and Power Automate 
Power Automate uses the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector. Power Apps can use [Microsoft Dataverse (legacy)](/connectors/commondataservice/) or [Dataverse native connections](/power-apps/maker/canvas-apps/use-native-cds-connector) which, from a data policy perspective, are treated the same as [Microsoft Dataverse (legacy)](/connectors/commondataservice/).

## Providing an admin contact and reference link in data policy error messages

Power Platform data policy runtime enforcement experiences can include an admin contact and a link to governance reference material. The admin contact and reference link can be set using the PowerShell for [Governance error message content commands](powerapps-powershell.md#governance-error-message-content-commands). 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
