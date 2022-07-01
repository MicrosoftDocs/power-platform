---
title: "Data policies | MicrosoftDocs"
description: Learn about data policies in Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/01/2022
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - alaug 
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Data policies

<!-- https://go.microsoft.com/fwlink/?linkid=2195000 -->

A principal capability of Managed Environments is enforcing policies that define the consumer connectors that specific data can be shared with. These policies are called data loss prevention (DLP) policies. DLP policies ensure that data is managed in a uniform manner across your organization, and they prevent important business data from being accidentally published to connectors such as social media sites. For more information on creating and managing DLP policies, see [Data loss prevention policies](wp-data-loss-prevention.md).

## New environment filters

New environment filters have been introduced to the data policies page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) that will help you identify all the data policies that are applied to an environment.

> [!NOTE]
> The environment filters are exclusively available for managed environments.

Open the **Edit Managed Environments** settings panel for a managed environment. In the **Data policies** section, select the **See active data policies for this environment**. The data policies page opens in a new tab and displays only the data policies applied to the managed environment. To remove the environment filter in the data policies page, select **Clear filter**.

:::image type="content" source="media/managed-environment-weekly-see-active-data-policies.png" alt-text="Managed Environments - see active data policies for this environment":::

You can see the Managed Environments data policies in the **Data policies** page in the Power Platform admin center.

:::image type="content" source="media/managed-environment-data-policies.png" alt-text="Managed Environments - data policies in Power Platform admin center":::

If there are no data policies applied to the managed environment, the data policies page will be empty. We highly recommend that all environments in your tenant are protected by DLP.

### See also  
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environment](managed-environment-enable.md) <br />
[Weekly digests](managed-environment-weekly-digests.md) <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />







[!INCLUDE[footer-include](../includes/footer-banner.md)]
