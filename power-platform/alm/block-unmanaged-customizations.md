---
title: "Block unmanaged customizations in Dataverse environments"
description: "Learn how admins can block unmanaged customizations in Dataverse environments, which help enforce healthy ALM processes."
author: swatimadhukargit
ms.subservice: alm
ms.author: swatim
ms.custom: ""
ms.date: 07/15/2024
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
---
# Block unmanaged customizations in Dataverse

This article describes how you as a Power Platform administrator can enable the **Block unmanaged customizations** environment setting in the Power Platform admin center for your Microsoft Dataverse environments. Unmanaged customizations reside at the top layer for a component and subsequently define the runtime behavior of the component. In most situations, you don't want unmanaged customizations determining the behavior of your components.

This environment setting allows system administrators to prevent unmanaged customizations in Microsoft Dataverse environments. By blocking unmanaged customizations, you ensure the changes to the environment are only coming from approved application lifecycle management (ALM) processes that have sufficient safety, visibility, and auditing. Block unmanaged customizations continues to allow solution operations that are needed to transport the unmanaged customizations to development environments while keeping the environment unmanaged customization free by removing the unmanaged customizations. This feature is helpful in reducing unmanaged customizations in production environments.

When the setting is enabled, these operations are blocked for the environment:

- Import of unmanaged solutions into the environment is blocked.
- Creation of new solution components like apps, tables, and forms are blocked.
- Adding unmanaged changes to existing managed components are blocked.
- Any unmanaged changes result in an error returned to the user, such as: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only.”

The following operations can be completed even with the block unmanaged customizations setting enabled:

- Change of environment variable, enabling or disabling components. For example, turning Power Automate flows on or off, assigning ownership, or sharing of table records.
- Solutions operations like remove [Remove an unmanaged layer](/power-apps/maker/data-platform/solution-layers#remove-an-unmanaged-layer).
- Creation and export of unmanaged solutions.
- Review flow run history to monitor and understand errors.
- Run the flow to test it.

## Enable block unmanaged customizations

This feature can be enabled or disabled from the **Features** area of the environment settings for environments in the Power Platform admin center. By default, this setting is disabled. More information: [Block unmanaged customizations](../admin/settings-features.md#block-unmanaged-customizations)

## Known limitations

These features have limitations and might not work as expected in an environment where block unmanaged customizations is enabled. Using these features can result in this error: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only."

If you must use one of the below apps or features in an environment where block unmanaged customizations is enabled, we recommend you disable the setting.

| App or feature  | Limitation  |
|---------|---------|
| Power Automate desktop flows     |  Hosted machine groups don't work.       |
| Dynamics 365 Resource Scheduling Optimization    |   Install or upgrade don't work.       |
|Automatic record creation     |  Activation, deactivation, and editing of automatic record creation doesn't work.        |
| Legacy workflows     |  Enable and disable of legacy workflows doesn't work.       |
|Field Service     |  Enabling or adjusting the enhanced autonumbering doesn't work. However, default autonumbering continues to work.   |
|Connected Field Service   | Install doesn't work.         |
|Field Service Mobile     |  Install of geofencing solution doesn't work. <br />Update doesn't work when relationships created during initial install are deleted.        |
|Resource Scheduling      | Enable of scheduling table and selection option to auto create relationships doesn't work.        |
|Sales Accelerator     |  Enabling Sales Accelerator or modifying settings, enabling leads data hygiene, creating or editing sequences, configuring work assignment, creating or editing segments, don't work.        |
|Dataflows      | Creation of a new dataflow, republish an existing dataflow, change refresh settings, change incremental refresh, and importing dataflows don't work.          |
|Dynamics 365 Customer Insights - Journeys (real-time journeys)  |  Journeys can't be created and published.  <br /> Engagement assets such as triggers can't be created and published.  <br />Channel assets such as emails, forms, SMS, and push notifications can't be created and published.  |
| Omnichannel  | Install or upgrade don't work.      |
|Service Level Agreement (SLA)  | Activation, deactivation, and editing of service level agreement doesn't work.|
|Attachments | File attachments to appointments or emails using the `activitymimeattachment` table fail.

## FAQ for block unmanaged customizations

### Can this be used to give users read-only access to flow run history in test and production environments?

Yes, this is one of the key scenarios that prompted this feature. When unmanaged customizations are blocked, responsible users can be made a co-owner on a managed flow in a test or production environment. Co-owners can review flow run history, using make.powerautomate.com or via APIs or PowerShell, to watch for errors and understand those errors. Those users won't be able to make changes to the managed component, so it's effectively read-only to them. They're able to turn the flow on and off if needed, as well as to run the flow for use or testing purposes. Co-owners of a flow can then use that increased visibility and knowledge to adjust the flows in a development environment and request to have them redeployed to the test or production environment.

## See also

[Solution layers](/power-apps/maker/data-platform/solution-layers)
