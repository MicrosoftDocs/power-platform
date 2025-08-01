---
title: Policies and communications for Power Platform and Dynamics 365 Services
description: Learn more about policies and communications for incidents provided for Microsoft 365 services.
author: kacortez
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/16/2025
ms.subservice: admin
ms.author: kacortez
ms.contributors:
  - lsuresh
contributors:
- lavanyapg 
search.audienceType: 
  - admin
---
---
# Policies and communications for Power Platform and Dynamics 365 Services

Microsoft regularly communicates work done to maintain and update Microsoft Power Platform (Power Apps, Power Automate, Microsoft Copilot Studio, and other services), and Microsoft Dynamics 365 apps (Sales, Customer Service, Supply Chain Management, and others) to ensure security, performance, availability, and to provide new features and functionality. Microsoft also communicates details of service incidents including the potential user experience, the start and end times of the incident, and any workaround that may be available.

For each of these scenarios, communication is provided through the Microsoft 365 admin center in the [Message Center](/microsoft-365/admin/manage/message-center), and the [Service health dashboard](/microsoft-365/enterprise/view-service-health). The Microsoft 365 admin center also has the ability to send email for a weekly digest of all messages, emails for major updates only, and emails for data privacy messages. You can opt in to this communication stream by following the instructions in [Preferences](/microsoft-365/admin/manage/message-center#preferences).

You can view service health information for Dynamics 365 and Power Platform products in the Power Platform admin center. Learn more in [How do I check my online service health?](check-online-service-health.md).

Microsoft may also send direct email to users assigned to the Power Platform administrator or Dynamics 365 administrator role in an impacted tenant. If you’re not sure who your admin is, learn more in [Find your administrator or support person](/powerapps/user/find-admin). To assign a service admin role to a user, follow the instructions in [Assign a service admin role to a user](use-service-admin-role-manage-tenant.md#assign-a-service-admin-role-to-a-user).
 
## Scheduled system updates and maintenance

Microsoft regularly performs updates and maintenance on the service and apps through a weekly update process. This update process delivers security and minor service improvements on a weekly basis, with each update rolling out region-by-region according to a safe deployment schedule, arranged in Stations. More information about the schedule of Station deployments can be found on the [Released Versions of Dynamics 365 for Customer Engagement](/dynamics365/released-versions/dynamics-365ce) page. 

There are also two major service update events in April (Wave 1) and October (Wave 2) that are delivered through the weekly update mechanism, and details can be found in the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/) release plans. 

### Minor service updates

Minor service updates contain customization changes to support new features, product improvements, and bug fixes. They're deployed on a weekly basis, region-by-region, according to a **Safe Deployment Process** we have defined. Each week, every region gets: 

- An updated deployment, starting with our “First Release” region 
- A Message Center notification is published with the date that the deployment begins to be applied to the infrastructure 
- A link to the weekly release notes that contain the list of fixes that are included 

> [!Note]
> The date the deployment is applied to the infrastructure isn't the date the update is applied to the environment. The environment and any apps are updated by an asynchronous process that runs during subsequent regional maintenance windows. Although there's no expected degradation to service performance or availability, during this maintenance window users may see short, intermittent impact such as transient SQL errors or a redirect to the login screen. 

You can verify that the update was completed successfully by checking the version number on the **About** page of the environment, or looking at the environment details on the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). A list of service updates can be found on our [Released Versions](/business-applications-release-notes/dynamics/released-versions/dynamics-365ce) page. 

### Major release events

We deliver two major release events per year with one in April (Wave 1) and the second in October (Wave 2), offering new capabilities and functionality. These updates are backward compatible, so your apps and customizations continue to work, after the update. New features with major, disruptive changes to the user experience are off by default, which means administrators are able to first test, then use these features for their organization. Administrators have the opportunity to use the new features using an [“Opt-in” feature](opt-in-early-access-updates.md) to get early access to the changes. 

Notifications about when the major release events are scheduled and links to the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/) release plans are published in the Microsoft 365 admin portal’s Message Center. 

### Security updates

The Service teams regularly perform the following to ensure the security of the system: 
 
- Scans of the service to identify possible security vulnerabilities 
- Assessments of the service to ensure that key security controls are operating effectively 
- Evaluations of the service to determine exposure to any vulnerabilities identified by the Microsoft Security Response Center (MSRC), who regularly monitors external vulnerability awareness sites 
 
These teams also identify and track any identified issues and take swift action to mitigate risks when necessary. 
 
#### How do I find out about security updates?
 
Because the Service teams strive to apply risk mitigations in a way that doesn’t require service downtime, administrators usually don’t see Message Center notifications for security updates. If a security update does require service impact, it's considered planned maintenance, and is posted with the estimated impact duration, and the window when the work occurs.
 
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

When this happens, your organization receives an **Unplanned Maintenance** notification in the Message Center. We also attempt to send an email to all System Administrators in the environment that is affected by the unplanned maintenance. You can see the status of current unplanned maintenance activities in the Message Center. 

### Regional maintenance windows

To limit the impact on customers and their users, we plan the maintenance window according to the region where the environments are deployed. The following maintenance timeline list shows the maintenance window for each region. The times are shown in Coordinated Universal Time (UTC, which is also known as Greenwich Mean Time). For organizations with users around the globe, we recognize that these Maintenance Windows might affect you differently. We apologize for the impact this issue may have on your users. 
 
### Maintenance timeline

To limit the impact on users, the maintenance window is planned according to the region where environments are deployed. The following list shows the maintenance window for each region. The times are shown in Coordinated Universal Time (UTC, which is also known as Greenwich Mean Time).

The following are service update times. Database updates run as soon as possible depending on the system load during the maintenance window of the environment.

|Region | URL | Window (UTC) |
| ------------- | ------------- | ------------- |
| NAM           | crm.dynamics.com | 2 AM to 11 AM |
| DEU           | crm.microsoftdynamics.de | 5 PM to 2 AM |
| SAM           | crm2.dynamics.com | 12 AM to 10 AM |
| CAN           | crm3.dynamics.com | 1 AM to 10 AM |
| EUR           | crm4.dynamics.com | 6 PM to 3 AM |
| FRA           | crm12.dynamics.com | 6 PM to 3 AM | 
| APJ           | crm5.dynamics.com | 3 PM to 8 PM |
| OCE           | crm6.dynamics.com | 11AM to 9PM |
| JPN           | crm7.dynamics.com | 10 AM to 7 PM |
| IND           | crm8.dynamics.com | 7:30PM to 1AM |
| GCC           | crm9.dynamics.com | 2 AM to 11 AM |
| GCC High      | crm.microsoftdynamics.us | 2 AM to 11 AM |
| GBR           | crm11.dynamics.com | 6 PM to 3 AM |
| ZAF           | crm14.dynamics.com | 5 PM to 2 AM |
| UAE           | crm15.dynamics.com| 3 PM to 12 AM |
| GER           | crm16.dynamics.com| 6 PM TO 3 AM |
| CHE           | crm17.dynamics.com| 6 PM to 3 AM |
| CHN           | crm.dynamics.cn | 3 PM to 9 PM |

## Service incidents 

A _service incident_ is a term used to refer to an event, or series of events, that typically cause multiple customers to have a degraded experience with one or more of our services. ​These incidents are effectively platform issues that cause unplanned downtime&mdash;including unavailability, performance degradation, and problems interfering with service management. We communicate service incidents through an authenticated experience on the Microsoft 365 admin portal [Service health dashboard](/office365/enterprise/view-service-health) to provide visibility of service health to administrators across multiple cloud services. Examples of service incidents may include: 

- Unable to sign-in to a specific environment or admin portal 
- Slow performance in apps or Dataverse queries 
- Error messages or unexpected blank pages 

### How do I find out about service incidents? 

Check the [Service health dashboard](/office365/enterprise/view-service-health) to view the status of the service, details about existing service incidents, and up to 30 days’ worth of history. The Power Platform admin center offers a view of service health information in the Support page. Service health knows which tenants you manage, so it shows a much more accurate view of any known issues impacting your services than nonauthenticated sources of information. If you're experiencing an issue that's not displayed in the Service health dashboard, contact Microsoft support by creating a ticket in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

If there's a broad customer impact during a service incident, we may also provide status updates on one of several service-specific support pages, including the [Power Apps support page](https://powerapps.microsoft.com/support/), [Power Automate support page](https://flow.microsoft.com/support/), or the [Power BI support page](https://powerbi.microsoft.com/support/). 

If the Power Platform or Microsoft 365 admin portal is unavailable or experiencing issues, we provide status updates through the unauthenticated [Service Health Status](https://status.cloud.microsoft/) page. 

### What information is provided about service incidents?

During the event, we include information that is related to the user impact, duration, any feasible workaround, and preliminary root cause. Our goal is to provide status updates on an hourly cadence, although this guideline may be reduced for substantive new information or extended based on waiting on recovery activities. At the restoration of the service to optimal operation, we publish a final status update and determine if other, post-incident reports are provided based on the breadth and type of impact to customers. 

A post incident report (PIR) may be published after five business days on the Microsoft 365 Service health dashboard for certain events. 

This report summarizes the following details: 

- Summary 
- User Experience 
- Timeline of major activities or actions 
- Contributing Factors 
- Next steps 

## Other methods of receiving notifications 

Because of the critical nature of service notifications and communications, there are other methods of connecting to Service Communications. 

- Sign up for email notifications for new incidents that affect your tenant and status changes for an active incident.
- Download and install the [Microsoft 365 Admin mobile app](https://products.office.com/business/manage-office-365-admin-app) on your mobile device to view service updates and incident notifications. 
- Connect directly to our service communications using an externally accessible [Service Communication API](/office/office-365-management-api/office-365-service-communications-api-reference).
- [Track your message center tasks](/office365/planner/track-message-center-tasks-planner) in Planner. 



[!INCLUDE[footer-include](../includes/footer-banner.md)]