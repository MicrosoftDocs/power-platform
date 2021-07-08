---
title: "Policies and Communications for Power Platform and Dynamics 365 Services | MicrosoftDocs"
description: "Policies and Communications for incidents provided for Microsoft 365 services."
author: astockli
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/18/2021
ms.subservice: admin
ms.author: astockli
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Policies and Communications for Power Platform and Dynamics 365 Services

## Introduction

Microsoft regularly communicates work done to maintain and update Microsoft Power Platform (Power Apps, Power Automate, Power Virtual Agents, and other services), Microsoft Dynamics 365 apps (Sales, Customer Service, Supply Chain Management, and others) to ensure security, performance, availability, and to provide new features and functionality. Microsoft also communicates details of service incidents including the potential user experience, the start and end times of the incident, and any workaround that may be available. For each of these scenarios, communication is provided through the Microsoft 365 admin center in the [Message Center](/microsoft-365/admin/manage/message-center), and the [Service health dashboard](/microsoft-365/enterprise/view-service-health).

**Please note**: From time-to-time, Microsoft may also send direct email to users with the System Administrator role in a specifically impacted Microsoft Dataverse environment, or Microsoft Lifecycle Services project or environment.  
  
- If you’re not sure who your admin is, see [Find your administrator or support person](/powerapps/user/find-admin).  
  
- If you want to add additional recipients who receive email communications, see [Manage email notifications to admins](manage-email-notifications.md).  
  
## Scheduled system updates and maintenance

Microsoft regularly performs updates and maintenance on the service and apps through a weekly update process. This update process delivers security and minor service improvements on a weekly basis, with each update rolling out region-by-region according to a safe deployment schedule, arranged in Stations. More information about the schedule of Station deployments can be found on the [Released Versions of Dynamics 365 for Customer Engagement](/dynamics365/released-versions/dynamics-365ce) page.  

There are also two major service update events in April (Wave 1) and October (Wave 2) that are delivered through the weekly update mechanism, and details can be found in the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/)  release plans. 

### Minor service updates

Minor service updates contain customization changes to support new features, product improvements, and bug fixes. They are deployed on a weekly basis, region-by-region, according to a “Safe Deployment Process” we have defined. Each week, every region gets: 

- An updated deployment, starting with our “First Release” region 

- A Message Center notification is published with the date that the deployment will begin to be applied to the infrastructure 

- A link to the Weekly Release Notes that contain the list of fixes that are included 

**Please note**: The date the deployment is applied to the infrastructure is not the date the update will be applied to the environment. The Dataverse environment and any apps are updated by an asynchronous process that runs during subsequent Regional Maintenance Windows. Although there is no expected degradation to service performance or availability, during this maintenance window users may see short, intermittent impact such as transient SQL errors or a redirect to the login screen.  

You can verify that the update was completed successfully by checking the version number on the About page of the Dataverse environment, or looking at the environment details on the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). A list of service updates can be found on our [Released Versions](/business-applications-release-notes/dynamics/released-versions/dynamics-365ce) page. 

### Major release events

We deliver two major release events per year with one in April (Wave 1) and the second in October (Wave 2), offering new capabilities and functionality. These updates are backward compatible, so your apps and customizations will continue to work post update. New features with major, disruptive changes to the user experience are off by default which means administrators will be able to first test then enable these features for their organization. Additionally, administrators will have the opportunity to enable the new features using an [“Opt-in” feature](/power-platform/admin/opt-in-early-access-updates) to get early access to the changes. 

Notifications about when the major release events are scheduled and links to the [Dynamics 365 and Microsoft Power Platform](/dynamics365/release-plans/) release plans are published in the Microsoft 365 admin portal’s Message Center. 

### Security updates

The Service teams regularly perform the following to ensure the security of the system:  
  
- Scans of the service to identify possible security vulnerabilities  
- Assessments of the service to ensure that key security controls are operating effectively  
- Evaluations of the service to determine exposure to any vulnerabilities identified by the Microsoft Security Response Center (MSRC), who regularly monitors external vulnerability awareness sites  
  
These teams also identify and track any identified issues and take swift action to mitigate risks when necessary.  
  
**How do I find out about security updates?**  
  
Because the Service teams strive to apply risk mitigations in a way that doesn’t require service downtime, administrators usually don’t see Message Center notifications for security updates. If a security update does require service impact, it is considered planned maintenance, and will be posted with the estimated impact duration, and the window when the work will occur.
  
For more information about security, see [Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/Dynamics365).

### Planned maintenance

Planned maintenance includes updates and changes to the service to provide increased stability, reliability, and performance. 

These changes can include:  
  
- Hardware or infrastructure updates  
- Integrated services, such as a new version of [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] or [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)]  
- Service changes and software updates  
- Minor service updates that occur several times per year. See [Service updates](https://support.microsoft.com/help/2925359/microsoft-dynamics-crm-online-releases).  
 
### Unplanned maintenance 

The Power Platform services and the Dynamics 365 apps (Sales, Customer Service, Supply Chain Management, etc.) may encounter issues that require unplanned changes to protect availability. Microsoft strives to provide as much notification as possible during these events, but because they can’t be predicted, they are not considered planned maintenance. 

When this happens, your organization receives an “Unplanned Maintenance” notification in the Message Center. We also attempt to send an email to all System Administrators in the Dataverse environment that is affected by the unplanned maintenance. You can see the status of current unplanned maintenance activities in the Message Center.  

### Regional maintenance windows

To limit the impact on customers and their users, we plan the maintenance window according to the region where the Dataverse environments are deployed. The following maintenance timeline list shows the maintenance window for each region. The times are shown in Coordinated Universal Time (UTC, which is also known as Greenwich Mean Time). For organizations with users around the globe, we recognize that these Maintenance Windows might affect you differently. We apologize for the impact this may have on your users. 
 
### Maintenance timeline

To limit the impact on users, the maintenance window is planned according to the region where environments are deployed. The following list shows the maintenance window for each region. The times are shown in Coordinated Universal Time (UTC, which is also known as Greenwich Mean Time).

The following are service update times. Database updates run 24 hours after service updates.

|Region | URL | Window (UTC) |
| ------------- | -------------     | ------------- |
| NAM           | crm.dynamics.com  | 2 AM to 11 AM |
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
| CHE           | crm17.dynamics.com|  6 PM to 3 AM |
| CHN           | crm.dynamics.cn | 3 PM to 9 PM |

## Service incidents 

A service incident occurs when your environment is inaccessible or you’re unable to use one or more of the service components. We communicate service incidents through an authenticated experience on the Microsoft 365 admin portal Service health dashboard to provide visibility of service health to administrators across multiple Cloud services. Examples of service incidents may include: 

- Unable to sign-in to a specific environment or admin portal 
- Slow performance in apps or Dataverse queries 
- Error messages or unexpected blank pages 

**How do I find out about service incidents?**  

Check the [Service health dashboard](/office365/enterprise/view-service-health) to view the status of the service. If you are experiencing an issue that is not displayed in the Service health dashboard, contact Microsoft support by creating a ticket in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

If there is a broad customer impact during a service incident, we may also provide status updates on one of several service-specific support pages, including the [Power Apps support page](https://powerapps.microsoft.com/support/), [Power Automate support page](https://flow.microsoft.com/support/), or the [Power BI support page](https://powerbi.microsoft.com/support/). 

If the Microsoft 365 admin portal is unavailable, we will provide status updates through our [backup status site](https://status.office.com/). 

**What information is provided about service incidents?**

During the event, we include information that is related to the user impact, duration, any feasible workaround, and preliminary root cause. Our goal is to provide status updates on a hourly cadence, although this guideline may be reduced for substantive new information, or extended based on waiting on recovery activities. At the restoration of the service to optimal operation, we will publish a final status update and determine if additional post incident report will be provided based on the breadth and type of impact to customers. 

A post incident report (PIR) may be published after 5 business days on the Microsoft 365 Service health dashboard for certain events. 

This report summarizes the following details: 

- Summary 
- User Experience 
- Timeline of major activities or actions 
- Contributing Factors 
- Next steps 

## Additional methods of receiving notifications 

Because of the critical nature of service notifications and communications, there are additional methods of connecting to Service Communications. 

- Download and install the [Microsoft 365 Admin mobile app](https://products.office.com/business/manage-office-365-admin-app) on your mobile device to view service updates and incident notifications 
- Connect directly to our Service Communications using an externally accessible [Service Communication API](/office/office-365-management-api/office-365-service-communications-api-reference)
- Use PowerShell to [configure additional notification email addresses](manage-email-notifications.md) in Dataverse  
- [Track your message center tasks](/office365/planner/track-message-center-tasks-planner) in Planner 
  
### Notice about online policies
Review [Notice About Online Policies and Similar Documents](https://www.microsoft.com/legal/intellectualproperty/mtl/onlinedisclaimer.aspx).

If you have any feedback, fill out our [survey](https://forms.office.com/FormsPro/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbRxclc4NDdL5CqxoDKPhEMtxUQlNBTkhCWkZEQk1FM1JORU5XSTZFUFJNVyQlQCN0PWcu), and share your thoughts!



[!INCLUDE[footer-include](../includes/footer-banner.md)]