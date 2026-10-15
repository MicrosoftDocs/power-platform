---
title: Policies and communications for Power Platform and Dynamics 365 services
description: Learn where administrators can find planned-change and service-incident communications, configure alerts, and integrate service health data.
author: kacortez
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: concept-article
ms.date: 10/01/2026
ms.subservice: admin
ms.author: kacortez
ms.contributors:
  - philipkyres
  - lsuresh
contributors:
- lavanyapg 
search.audienceType: 
  - admin
---

# Policies and communications for Power Platform and Dynamics 365 services

Microsoft communicates planned changes, maintenance, service incidents, and other updates for Microsoft Power Platform and Microsoft Dynamics 365 services. These communications help administrators prepare for new functionality, understand service impact, find available workarounds, and follow incident recovery.

## Where to find service communications

Use the following resources based on the type of information you need.

| Resource | Use it for | Access |
| --- | --- | --- |
| [Message center](/microsoft-365/admin/manage/message-center) | Upcoming changes, feature releases, planned maintenance, retirements, and other announcements that might require preparation or action. | Authenticated Microsoft 365 admin center |
| [Service health dashboard](/microsoft-365/enterprise/view-service-health) | Active incidents and advisories that affect your tenant, incident updates, issue history, and available post-incident reports. | Authenticated Microsoft 365 admin center |
| [Power Platform admin center service health](check-online-service-health.md) | A Power Platform-focused view of service health and Message center information. | Authenticated Power Platform admin center |
| [Service Health Status](https://status.cloud.microsoft/) | Known issues that prevent customers from accessing the Microsoft 365 or Power Platform admin centers. This public page isn't a replacement for tenant-specific Service health information. | Public and unauthenticated |

> [!IMPORTANT]
> Use the authenticated Service health dashboard as the primary source for incidents affecting your organization. Microsoft uses the public Service Health Status page when an admin portal is unavailable or experiencing an issue that prevents access to authenticated communications.

Users need an appropriate Microsoft 365 administrator role to view Service health. For role details, see [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles#commonly-used-microsoft-365-admin-center-roles).

### Configure email notifications

Administrators can configure separate email preferences for planned changes and service incidents:

- For Message center digests, major updates, and data privacy messages, follow the [Message center preference instructions](/microsoft-365/admin/manage/message-center#preferences).
- For new service incidents, advisories, and updates to active issues, follow the email notification instructions in [How to check Microsoft 365 service health](/microsoft-365/enterprise/view-service-health#how-to-check-service-health).

Each administrator can add up to two email addresses to their Service health notification preferences and choose the services and issue types they want to monitor.

Microsoft may also send direct email to users assigned the Power Platform administrator or Dynamics 365 administrator role in an impacted tenant. These messages supplement, but don't replace, the authenticated Service health dashboard.

If you aren't sure who your administrator is, see [Find your administrator or support person](/powerapps/user/find-admin). To assign a service administrator role, see [Assign a service admin role to a user](use-service-admin-role-manage-tenant.md#assign-a-service-admin-role-to-a-user).
 
## Scheduled system updates and maintenance

Microsoft regularly performs updates and maintenance on the service and apps through a weekly update process. This process delivers security and minor service improvements, with each update rolling out region-by-region according to a safe deployment schedule arranged in stations. For the current schedule, see [Released versions of Microsoft Dataverse](/dynamics365/released-versions/microsoft-dataverse).

There are also two major service update events in April (Wave 1) and October (Wave 2) that are delivered through the weekly update mechanism, and details can be found in the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/) release plans. 

### Minor service updates

Minor service updates contain customization changes to support new features, product improvements, and bug fixes. They're deployed on a weekly basis, region-by-region, according to a **Safe Deployment Process** we have defined. Each week, every region gets: 

- An updated deployment, starting with our “First Release” region 
- A Message Center notification is published with the date that the deployment begins to be applied to the infrastructure 
- A link to the weekly release notes that contain the list of fixes that are included 

> [!NOTE]
> The date the deployment is applied to the infrastructure isn't the date the update is applied to the environment. The environment and any apps are updated by an asynchronous process that runs during subsequent regional maintenance windows. Although there's no expected degradation to service performance or availability, during this maintenance window users may see short, intermittent impact such as transient SQL errors or a redirect to the login screen. 

You can verify that the update was completed successfully by checking the version number on the **About** page of the environment, or looking at the environment details on the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). For a list of service updates, see [Released versions of Microsoft Dataverse](/dynamics365/released-versions/microsoft-dataverse).

### Major release events

We deliver two major release events per year with one in April (Wave 1) and the second in October (Wave 2), offering new capabilities and functionality. These updates are backward compatible, so your apps and customizations continue to work, after the update. New features with major, disruptive changes to the user experience are off by default, which means administrators are able to first test, then use these features for their organization. Administrators have the opportunity to use the new features using an [“Opt-in” feature](opt-in-early-access-updates.md) to get early access to the changes. 

Notifications about when the major release events are scheduled and links to the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/) release plans are published in the Microsoft 365 admin portal’s Message Center. 

### Security updates

The service teams regularly perform the following to ensure the security of the system:
 
- Scans of the service to identify possible security vulnerabilities 
- Assessments of the service to ensure that key security controls are operating effectively 
- Evaluations of the service to determine exposure to any vulnerabilities identified by the Microsoft Security Response Center (MSRC), who regularly monitors external vulnerability awareness sites 
 
These teams also identify and track any identified issues and take swift action to mitigate risks when necessary. 
 
#### How do I find out about security updates?
 
Because the service teams strive to apply risk mitigations in a way that doesn’t require service downtime, administrators usually don’t see Message center notifications for security updates. If a security update does require service impact, it's considered planned maintenance and is posted with the estimated impact duration and the window when the work occurs.
 
For more information about security, go to [Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/Dynamics365).

### Planned maintenance

Planned maintenance includes updates and changes to the service to provide increased stability, reliability, and performance. 

These changes can include: 
 
- Hardware or infrastructure updates 
- Integrated services, such as a new version of [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] or [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)] 
- Service changes and software updates 
- Minor service updates that occur several times per year. Learn more in [Service updates](https://support.microsoft.com/help/2925359/microsoft-dynamics-crm-online-releases). 
 
### Unplanned maintenance 

The Power Platform services and the Dynamics 365 apps (Sales, Customer Service, Supply Chain Management, etc.) may encounter issues that require unplanned changes to protect availability. Microsoft strives to provide as much notification as possible during these events, but because they can’t be predicted, they're not considered planned maintenance. 

When this happens, your organization receives an **Unplanned Maintenance** notification in Message center. We also attempt to send an email to users assigned the System Administrator role in the affected environment. You can see the status of current unplanned maintenance activities in Message center.

### Maintenance timeline

To limit the impact on users, the maintenance window is planned according to the region where environments are deployed. The following list shows the maintenance window for each region. The times are shown in Coordinated Universal Time (UTC, which is also known as Greenwich Mean Time).

The following are service update times. Database updates run as soon as possible depending on the system load during the maintenance window of the environment. In addition to the listed update windows, database updates also run 24 hours on weekends (Saturdays and Sundays). Expanding your environment's maintenance window or staggering it from the regional default can significantly improve the speed at which database updates are applied to your organization.

| Region | URL | Window (UTC) |
| --- | --- | --- |
| NAM           | crm.dynamics.com | 2 AM to 11 AM |
| DEU           | crm.microsoftdynamics.de | 5 PM to 2 AM |
| SAM           | crm2.dynamics.com | 12 AM to 10 AM |
| CAN           | crm3.dynamics.com | 1 AM to 10 AM |
| EUR           | crm4.dynamics.com | 6 PM to 3 AM |
| FRA           | crm12.dynamics.com | 6 PM to 3 AM | 
| APJ           | crm5.dynamics.com | 3 PM to 8 PM |
| OCE           | crm6.dynamics.com | 11 AM to 9 PM |
| JPN           | crm7.dynamics.com | 10 AM to 7 PM |
| IND           | crm8.dynamics.com | 7:30 PM to 1 AM |
| GCC           | crm9.dynamics.com | 2 AM to 11 AM |
| GCC High      | crm.microsoftdynamics.us | 2 AM to 11 AM |
| GBR           | crm11.dynamics.com | 6 PM to 3 AM |
| ZAF           | crm14.dynamics.com | 5 PM to 2 AM |
| UAE           | crm15.dynamics.com | 3 PM to 12 AM |
| GER           | crm16.dynamics.com | 6 PM to 3 AM |
| CHE           | crm17.dynamics.com | 6 PM to 3 AM |
| CHN           | crm.dynamics.cn | 3 PM to 9 PM |

## Service incidents 

A _service incident_ is an event, or series of related events, that causes customers to have a degraded experience with one or more Microsoft services. Incidents can include unavailability, performance degradation, and problems that interfere with service management.

Microsoft communicates tenant-specific service incidents through the authenticated [Service health dashboard](/microsoft-365/enterprise/view-service-health). Because the dashboard knows which services your organization subscribes to and which tenant is signed in, it provides a more relevant view than public, unauthenticated status sources.

Examples of service incidents include:

- Unable to sign-in to a specific environment or admin portal 
- Slow performance in apps or Dataverse queries 
- Error messages or unexpected blank pages 

### Authenticated dashboard and public status page

| Resource | When to use it |
| --- | --- |
| [Service health dashboard](/microsoft-365/enterprise/view-service-health) | Use this authenticated dashboard for incidents and advisories that affect your tenant, ongoing updates, incident history, and available post-incident reports. |
| [Service Health Status](https://status.cloud.microsoft/) | Use this public page when the Power Platform or Microsoft 365 admin portal is unavailable or experiencing issues. It doesn't provide a complete tenant-specific incident view. |

### How do I find out about service incidents? 

Check the [Service health dashboard](/microsoft-365/enterprise/view-service-health) to view active issues, incident details, and recent history. You can also view service health from the Power Platform admin center. For instructions, see [How do I check my online service health?](check-online-service-health.md).

If you're experiencing an issue that isn't displayed in Service health:

1. In the Microsoft 365 admin center, use **Report an issue** from the Service health page.
2. If you still need assistance, create a support request in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

If there's a broad customer impact during a service incident, we may also provide status updates on one of several service-specific support pages, including the [Power Apps support page](https://powerapps.microsoft.com/support/), [Power Automate support page](https://flow.microsoft.com/support/), or the [Power BI support page](https://powerbi.microsoft.com/support/).

### What information is provided about service incidents?

During an event, Service health updates can include the user impact, affected services, incident start time, current status, available workarounds, mitigation progress, and preliminary cause. Our goal is to provide updates on an hourly cadence. We might post sooner when substantive information is available or later when we're waiting for recovery actions to complete.

After service is restored, we publish a final status update and determine whether a post-incident report is appropriate based on the breadth and type of customer impact.

For certain events, a post-incident report (PIR) may be published in the Microsoft 365 Service health dashboard after five business days.

This report summarizes the following details: 

- Summary 
- User experience
- Timeline of major activities or actions 
- Contributing factors
- Next steps 

## Other notification and integration options

Use the following options to receive or integrate service communications:

- [Configure Service health email notifications](/microsoft-365/enterprise/view-service-health#how-to-check-service-health) for incidents, advisories, and active-issue updates that affect your tenant.
- Use the [Microsoft 365 Admin mobile app](/microsoft-365/admin/admin-overview/admin-mobile-app) to view service health and receive configurable push notifications.
- Use the [service communications API in Microsoft Graph](/graph/service-communications-concept-overview) to access tenant service health and Message center data.
- Integrate the Microsoft Graph service communications API into internal dashboards and automated workflows. For example, your organization can route selected updates to its own incident-management, messaging, or SMS systems. These integrations must be designed and operated by your organization.
- [Track your Message center tasks](/planner/track-message-center-tasks-planner) in Planner.
