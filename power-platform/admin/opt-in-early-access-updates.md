---
title: Opt in to early access updates 
description: Opt in to early access updates in Microsoft Power Platform and Dynamics 365. 
author: paulda64
ms.subservice: admin
ms.author: paulda
ms.reviewer: sericks
ms.topic: how-to
ms.date: 06/25/2025
search.audienceType: 
  - admin
contributors:
  - lavanyapg
ms.contributors:
- lekha27
- swatim
- matleon
- lsuresh
---
# Opt in to early access updates 

Microsoft Power Platform and customer engagement apps teams deliver two [major releases](policies-communications.md#major-release-events) per year (April and October) that offer new capabilities and functionality.

Each major release includes features that may affect the user experience. You may opt in for early access to update to the new release. Use the early enrollment period to validate the new functionality.

> [!TIP]
> Check out the early access features for Microsoft [Power Platform](/power-platform-release-plan/2021wave1/features-ready-early-access) and [Dynamics 365](/dynamics365-release-plan/2021wave1/features-ready-early-access) to know the features that roll out to the users automatically when you opt in for an update.

## Early access availability

Early access begins approximately two months before general availability of each release wave in your region.

**Release wave 1**

- Early access: First Monday of February
- Sovereign early access: Second Monday of February

**Release wave 2**
- Early access: First Monday of August
- Sovereign early access: Second Monday of August

## Deployment schedule  

|Region  | Deployment schedule for 2025 wave 2 early access |
|---------|---------|
| Canada                       | July 23, 2025  |
| South America                | July 23, 2025  |
| India                        | July 23, 2025  |
| France                       | July 23, 2025  |
| South Africa                 | July 23, 2025  |
| Germany                      | July 23, 2025  |
| Switzerland                  | July 23, 2025  |
| Norway                       | July 23, 2025  |
| Korea                        | July 23, 2025  |
| Sweden                       | July 23, 2025  |
| Singapore                    | July 28, 2025  |
| United Arab Emirates         | July 28, 2025  |
| Japan                        | July 28, 2025  |
| Asia Pacific                 | July 28, 2025  |
| England                      | July 28, 2025  |
| Australia                    | July 28, 2025  |
| Europe                       | July 30, 2025  |
| North America                | August 4, 2025 |

> [!NOTE]
> Sovereign regions begin early access one week after production regions.

General availability dates are listed in [General availability deployment](general-availability-deployment.md#deployment-schedule). These dates are updated with each release wave.

> [!NOTE]
> You must explicitly opt in for early access.
> - For each _release wave_, you must opt in for early access updates.
> - For each _environment that you want updated_, you must opt in for early access updates.

The following image is an example of an early update availability timeline.

:::image type="content" source="media/opt-in-2020-timeline.png" alt-text="Opt in timeline example for 2020.":::

> [!NOTE]
> After a release wave is generally available, the updates status in your environments become **On** to automatically receive all planned features and updates throughout the release. 
>
> To learn more, see [release schedule and early access](/dynamics365/get-started/release-schedule).

## Environments available for early access updates 

The early access updates are available for all types of environments, including trial, sandbox, and production. However, the best practice is to enable the updates in **trial** or **sandbox** environments before production environments.
 
[Tenant to tenant migration](move-environment-tenant.md) isn't supported for early access updates.  

> [!IMPORTANT]
> Although you can get early access updates in a production environment, we highly recommend that you create a copy of your production environment as a sandbox environment to try out the new features first. The updates can't be reverted after they've been deployed; therefore, if you test and validate the updates in a sandbox environment before enabling them in a production environment, you can determine the impact they'll have on users in your organization.
>
> Be sure to:
> - Learn about the Dynamics 365 [release plan](/dynamics365-release-plan/2021wave1/) and Microsoft Power Platform [release plan](/power-platform-release-plan/2021wave1/), and the new features available for early access. 
> - Review [Prepare for a release wave](#prepare-for-a-release-wave). 
> - Validate and test the updates in a sandbox environment before rolling out to production. 

## How to get early access updates 

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Manage** in the navigation pane.

1. In the **Manage** pane, select **Environments**. Then select an environment.

1. Under **Updates**, the new release wave is available. Select **Manage**. 

1. Select **Update now**, and then proceed through the confirmation dialog boxes to get the new features and capabilities of the release wave. 

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). 

1. Select the environment to update. 

1. Under **Updates**, the new release wave is available. Select **Manage**. 

1. Select **Update now**, and then proceed through the confirmation dialog boxes to get the new features and capabilities of the release wave. 

---

After the update is complete, all early access features will be turned on for your model-driven apps in your environment. 

> [!NOTE]
> - All available updates to your environment initiate at once. 
> - After they're deployed, the updates can't be reverted. Be sure to update your sandbox or trial environment before updating the production environment. 
> - Only the apps that you currently have licenses for update. Applications that haven't been installed before don't update. 
> - It might take a few hours to complete the updates. All applications in the environment are still available during the update, though you might experience slightly reduced performance.

## Other requirements to get early access updates 

Some apps require more steps to turn on early access features. If you have any of the following apps, after enabling the early access updates in the Power Platform admin center, you must complete the following manual steps.

|Early access apps  |Description of manual steps  |
|---------|---------|
|Microsoft Cloud for Healthcare | If you have Microsoft Cloud for Healthcare solutions powered by Dynamics 365, you must update or deploy from the [Microsoft Cloud Solution Center](https://solutions.microsoft.com/Microsoft%20Cloud%20for%20Healthcare#). For detailed instructions, see [Deploy Microsoft Cloud for Healthcare](/dynamics365/industry/healthcare/deploy). | 
| Dynamics 365 Service Scheduling | After you opt in to early access: <br /> 1. Sign in to the Power Platform admin center as a tenant admin. <br />2. Select **Dynamics 365 Service Scheduling**. <br /> 3. Select **Install** and follow the steps. |

> [!IMPORTANT]
> Be sure to turn on the early access updates in the Power Platform admin center first. If you run the Dynamics 365 Marketing setup wizard to update your Marketing app to a new release wave before activating the early access updates in the Power Platform admin center, you must [run the Dynamics 365 Marketing setup wizard again](/dynamics365/customer-engagement/marketing/re-run-setup) after opting in to install and deploy the early access features. 

## Update status and Retry 

To check the update status, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and select the environment. From **Updates**, you see the update process of each of the applications. 

### Retry 

If an application update failed during the opt-in update, you can use the **Retry** button to restart the update for the failed application.
 
The retry restarts the update for the failed application. If multiple applications failed during the update, you need to retry for each of the failed updates individually. 
The updates might take a few hours. If multiple retry attempts fail after 24 hours, contact [Support](https://dynamics.microsoft.com/support/) for assistance. 

> [!NOTE]
> The retry experience is only available for early access updates. The retry experience doesn't apply to general availability updates. 

### Confirm update complete 

To verify that a release wave is deployed, open the environment, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **About** to see the release wave that's deployed.

|In Unified Interface  |In the web client interface  | 
|---------|-------|
|![Opt in status](media/update-status.png "Opt in status")<br /> An example screenshot. May not be current wave.        | ![Opt in status webclient](media/update-status-webclient.png "Opt in status webclient") <br /> An example screenshot. May not be current wave.         |

> [!NOTE]
> You need to select **About** from a Dynamics 365 apps page that's displayed in [Unified Interface](about-unified-interface.md), such as Sales Hub or Customer Service Hub pages. 
>
> The server version won't be updated to the next version after a release wave is deployed. 

## Features available in the early access updates 

Each release wave includes features and functionality that are available for different types of users. They're categorized as the following three types of features:

- **Users, automatically**: These features include changes to the user experience for users and are available automatically.
- **Admins, makers, or analysts, automatically**: These features are meant to be used by administrators, makers, or business analysts and are available automatically. 
- **Users by admins, makers, or analysts**: These features must be turned on or configured by the administrators, makers, or business analysts to be available for their users.

By opting in for early access updates, you get features that are mandatory changes that are automatically available for users. For more details, check the **Enabled for** column in [Dynamics 365](/dynamics365-release-plan/2021wave1/) and Microsoft [Power Platform](/power-platform-release-plan/2021wave1/) release plans.

## Prepare for a release wave 

The following checklist provides the general guidelines to help you prepare for a release wave. 

1. Review the [release plans](/dynamics365/release-plans/) as soon as the early access updates are available to learn about upcoming features.

2. Create a sandbox environment from the production environment. After a new release wave is deployed for an environment, it can't be reverted. Thus, we strongly recommend using a new release wave in a sandbox environment that's a replica or copy of the existing production environment. Use this environment to test and validate the new features in the sandbox environment without affecting the current production environment.

   > [!NOTE]
   > If you don't have a sandbox copy of your production environment, you can [create a copy](copy-environment.md) in the Power Platform admin center. 

3. Opt in to the early access updates from the Power Platform admin center to use the new release wave in the sandbox environment.

4. Validate that key scenarios work as expected in the sandbox environment after the update is completed. 
   - Update the customizations in your applications, if any, to respond to the new capabilities as needed. 
   - You might also need to update internal readiness materials (training and communications) for your organization based on new features or user experiences.
   - If you find any issues during the validation&mdash;such as regressions, or functional or performance issues&mdash;contact [Support](https://dynamics.microsoft.com/support/) or get help from [Dynamics 365 forum](https://community.dynamics.com/f). 

5. Allow the early access updates in your production environment. We recommend allowing the updates in your production environment during business downtime.

## Early access updates FAQ

### Will an environment that previously opted in for the early access updates automatically get the early access update of the new releases?

An environment opted in for the previous early access isn't automatically opted in for the next early access release. Each early access release needs to be opted in explicitly. When a release becomes generally available, all environments are automatically updated to the latest release throughout the release wave. 

### After I update to a new release wave, can I export solutions? 

Yes, you can export solutions to other environments that have also been updated to the same release wave. 

### Will the version number be updated with each release wave? 

No, the version number isn't necessarily going to change with a release wave.

### Will Microsoft provide a free sandbox environment at no charge for testing updates? 

No. You're responsible for creating a sandbox environment from a copy of the production environment for testing and validation, at your own cost.

### When will the updates be available for testing in the sandbox environment? 

See [Early access availability](#early-access-availability).

### How do I report issues with updates? 

Create a [support ticket](https://dynamics.microsoft.com/support/). 

### Can I skip or postpone an update? 

No. To ensure you get the best quality of the new features and capabilities, all customers are required to update to the latest release as scheduled. 

### What happens to the environments after a release wave becomes generally available? 

If you turned on the early access updates in your environments, you continue to get updates throughout the release wave. 

If you didn't opt in for the early access updates in your environments, after a release wave is generally available, all environments will be automatically turned on to receive mandatory updates of the release wave. For regional deployment, see [General availability deployment](./general-availability-deployment.md)
 
Throughout a release wave, your environments are updated during one of the [maintenance windows](policies-communications.md#maintenance-timeline) over a weekend based on your environments' region. The specific dates when the updates occur are published to the [Message Center](/office365/admin/manage/message-center?view=o365-worldwide&preserve-view=true). Each notification includes the dates, the maintenance window, and the Release Plan reference for the list of optimizations, fixes, and enhancements. Each environment should see the new features and build numbers by Monday morning, local time.

See [Policies and communications](policies-communications.md#scheduled-system-updates-and-maintenance). 

### Related content
[Dynamics 365 release schedule and early access ](/dynamics365/get-started/release-schedule)<br />
[Dynamics 365 and Microsoft Power Platform Release Plans ](/dynamics365/release-plans/)<br />
[Policies and communications](./policies-communications.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
