---
title: Data policies for Managed Environments
description: View the data policies that are in effect in your Managed Environments.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 8/20/2025
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
ms.contributors:
  - miferlan
  - sericks
  - syalandur
contributors:
  - miferland-msft
  - sericks007
  - syalandur24
search.audienceType: 
  - admin
---

# Data policies for Managed Environments

With Managed Environments, admins can easily identify all the data policies that are applied to an environment. Data policies define the consumer connectors that data can be shared with. They make sure that data is managed in a uniform manner across your organization. They also prevent important business data from being accidentally published to connectors like social media sites. For more information about data policies, go to [Data loss prevention policies](wp-data-loss-prevention.md).

## View a managed environment's data policies

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select a managed environment.

4. [Edit the selected managed environment's settings](managed-environment-enable.md#enable-or-edit-managed-environments-in-the-admin-center).

1. In the **Data policies** section, select **See active data policies for this environment**.

    The data policies page opens in a new tab. The view is filtered to display only the data policies that are applied to the managed environment.
    
    :::image type="content" source="media/managed-environment-data-policies-new.png" alt-text="Screenshot of the data policies page in Power Platform admin center.":::
    
    To remove the environment filter and view data policies applied to all environments, select **Clear filter**.

    > [!NOTE]
    > The environment filter is exclusively available for managed environments.

    If no data policies are applied to the environment, the data policies page is empty. We highly recommend that you protect all environments in your tenant with a data policy.

### Related content

[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
