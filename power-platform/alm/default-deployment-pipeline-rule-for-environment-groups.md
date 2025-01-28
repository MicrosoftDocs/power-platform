---
title: "Associate a pipeline with development environments in a group (preview)"
description: "Use the default deployment pipeline rule to associate a pipeline with all development environments in an environment group."
Keywords: pipelines, ALM, environment groups
author: asheehi1
ms.author: asheehi1
ms.reviewer: matp
ms.topic: how-to
ms.date: 02/06/2025
ms.custom: template-how-to
---
# Associate a pipeline with development environments in a group (preview)

The [default deployment pipeline rule](../admin/environment-groups) for environment groups is designed to mitigate steps required to implement standardized Application Lifecycle Management (ALM) processes at scale. It ensures consistent application of pipeline settings and configurations across an entire group, simplifying governance and compliance for your organization.

## Prerequisites to configure the default deployment pipeline rule

- You must be a **Tenant Administrator** to access [environment groups](../admin/environment-groups) in the Power Platform Admin Center.
- The **Power Platform Pipelines**** package must be installed in at least one environment (i.e. you must have a [pipelines host](set-up-pipelines.md)).
- At least one pipeline must be configured in the desired pipelines host.
  > [!IMPORTANT]
  > Ensure that all users of the pipeline have access to the selected pipelines host. The easiest way to do this is to create an AAD Team on the pipelines host that maps to an AAD Security group containing the makers. This ensures users would obtain just-in-time (JIT) access to the pipelines host and be part of the ‘default team’, thus gaining the 'Deployment Pipeline User' role.
  > For the purposes of the default deployment pipeline rule, "development" environments are defined as **developer** or **sandbox** environments. The chosen pipeline will only be associated with environments of these types. This is to prevent production environments from being unintentionally specified as development environments in the pipelines host. Environments can only be specified as development or target environments in a pipelines host, they cannot be both.
- All environments used in pipelines must have a Microsoft Dataverse database.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

## Configuring the default deployment pipeline rule for a group

1. Within an [environment group](../admin/environment-groups) in the Power Platform Admin Center, select **Rules**.
1. Select **Default deployment pipeline** from the list of rules.
1. In the first dropdown, select a **Pipeline Host**.
1. Once a host is selected, select a **Pipeline** to associate with all development environments in the group and be shared with all users on the default team of the pipelines host environment (see prerequisite).

   :::image type="content" source="media/default-deployment-pipeline-configuration.png" alt-text="Screenshot of the default deployment pipeline rule configuration panel, consisting of a pipeline host dropdown and a pipeline dropdown." lightbox="media/default-deployment-pipeline-configuration.png":::

5. Click **Save**.
6. You should now see an asterisk next to the rule, indicating that it has unpublished changes. Click **Publish rules** in the command bar.

The default deployment pipeline rule is now configured for development and sandbox environments in the group. Please wait up to 10 minutes for the rule to apply.

## Related content
- [Environment Groups](../admin/environment-groups)
- [Managed Environments](../admin/managed-environment-overview.md)
- [Set up pipelines in Power Platform](set-up-pipelines.md)
- [Extend pipelines in Power Platform](extend-pipelines.md)
- [Run pipelines in Power Platform](run-pipeline.md)
