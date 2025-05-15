---
title: Set up pipelines in Power Platform
description: Learn how to create, configure, share, and manage Power Platform pipelines.
author: caburk
ms.author: matp
ms.topic: how-to
ms.date: 05/22/2024
ms.custom: template-how-to
contributors:
- asheehi1
---
# Set up pipelines in Power Platform

Create and run pipelines to easily deploy solutions to environments. There are two different ways to set up pipelines: 

- [Platform host](platform-host-pipelines.md). The default tenant-wide platform host, which can be configured by makers.
- [Custom host](custom-host-pipelines.md). Admins configure a custom host to centrally govern citizen-led and pro-dev-led projects.

Information within each section of this article pertains to the specified host method for setting up pipelines.

## Frequently asked questions

### Will personal pipelines conflict with any pipelines that I have already set up?

No. Thanks to the host separation dynamic that we have in place, there's no way for a maker creating a personal pipeline (in the platform host) to associate an environment that is already associated with a custom host. By default, makers don't have permissions to create lightweight personal pipelines in environments already associated with a custom host. This means that your current pipelines UX, if in place, won't change.

> [!IMPORTANT]
> Makers also don't receive elevated access to environments as a result of this feature. Selectable target environments are filtered to include only environments that a maker can already import to. This feature ensures that all personal pipelines are stored in the platform host that is accessible to administrators, and provides an easier way for makers to self-service their application lifecycle management (ALM).

### Why can't I select or view certain environments when I create a pipeline?

The target environment picker filters out any environments that:

- The current user doesn't have import-access to, or
are outside of the geographical region that the pipelines host is located in if host-wide setting is disabled. More information: [Enable cross-geo solution deployments](enable-cross-geo-solution-deployments.md)

You also can't create a pipeline with a target environment that's already associated to the host as a development environment. To change an environment's type distinction in a host, you must [play the Deployment Pipeline Configuration app](custom-host-pipelines.md#accessing-the-deployment-pipeline-configuration-app-from-power-apps), delete the environment record, and re-create the environment record with the desired type.

### Why am I seeing an error that states "this environment is already associated with another pipelines host?"

This error indicates that another host already contains an active environment record that you're trying to associate with the current host. To resolve this, go to [Using Force Link to associate an environment with a new host](custom-host-pipelines.md#using-force-link-to-associate-an-environment-with-a-new-host) or [Disassociating environments from one host and associating them with another host](custom-host-pipelines.md#manually-disassociating-environments-from-one-host-and-associating-them-with-another-host).

### Do the pipelines and data within the platform host count towards my Dataverse capacity?

No. The data consumption in the *platform host* doesn't count against your current plan since the pipelines data for the platform host is stored in Power Platform infrastructure. This data is stored within your tenant and accessible by administrators, but due to its implementation details, doesn't consume data capacity within a plan.

However, capacity does apply to a *custom host*, which isn't an implementation in the platform but is instead in a customizable environment.

### Can I enable makers to create personal pipelines in a custom host?

Yes. As an administrator, you can assign the **Deployment Pipeline Default** role to anyone you want to grant lightweight pipeline creation permissions to. Administrators can also add users to the **Deployment Pipeline Maker** team via the **Security Teams** page in the Deployment Pipeline Configuration app.

This Deployment Pipelines Default role isn't assigned to anyone by default in the case of custom host, so the lightweight personal pipeline creation experience is only visible by default in environments that aren't already associated with a custom host.

### As an admin, how do I prevent makers from creating personal pipelines by default?

Because custom hosts don't grant pipeline create-access by default like the platform host does. You can [set up a custom host](custom-host-pipelines.md#install-the-pipelines-application-in-your-host-environment) and then [use force link](custom-host-pipelines.md#using-force-link-to-associate-an-environment-with-a-new-host), if necessary, to associate development environments with a custom host.

1. If there's already a custom host available skip this step. If not, you have to create one following the steps to [create a pipeline using a custom pipelines host](custom-host-pipelines.md).
1. Once there's a custom host available, as an admin, navigate to the Deployment Pipeline Configuration app for the custom host. The app is located in the environment that you installed the Power Platform Pipelines package in.
1. Go to **Environments** from the side navigation pane, and **create new environment record(s)** for the development environments that you would like to prevent makers from creating new personal pipelines from. If the environment was already linked to another host, such as the platform host, the validation fails. If this occurs, select **Force Link** on the command bar after validation failure to override the current link to the other pipelines host.

Following these steps effectively disables the **create pipeline** capability for any makers who access in pipelines feature in these development environments because they don't have pipelines permissions. Existing pipelines in the custom host, if any, are also not shared with any users by default. Admins are able to apply with workaround with any existing custom host as well.

### Why am I not seeing the latest features for pipelines?

The pipelines package is always being updated to give you the latest and greatest for your ALM processes. Ensure that you have the latest Power Platform pipelines package in your **custom host**:

1. Go to the [Power Platform admin center](https://admin.powerplatform.com),
1. Select your pipelines host environment.
1. Select **Dynamics 365 apps**, and locate **Power Platform Pipelines.** Notice if there's an update available.

For **platform hosts**, the pipelines package is updated automatically, and might not be available as soon as the manual package update is made available for custom hosts.

### How can I recover unmanaged solutions from Power Platform Pipelines past deployment history?

The [Import Solutions from a Pipelines Host](import-from-pipelines-host.md) feature in Power Platform allows users to recover unmanaged and managed solutions from past deployments. This capability is particularly useful in scenarios where a solution is accidentally lost or needs to be restored to a development environment. Alternatively, Pipelines admins can also use the pipeline configuration management app to download the unmanaged solution from the deployment history record easily.

## Next steps

- [Extend pipelines in Power Platform](extend-pipelines.md)
- [Run pipelines in Power Platform](run-pipeline.md)
