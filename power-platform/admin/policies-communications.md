---
title: "Policies and Communications for service incidents  | MicrosoftDocs"
description: Policies and Communications for service incidents
author: astockli
manager: timrob
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/21/2020
ms.author: astockli
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Policies and Communications for service incidents

## Introduction
Microsoft regularly communicates work done to maintain and update Dynamics 365, Power Platform (Power Apps, Power Automate, Power Virtual Agents, and other services) and all integrated Apps to ensure security, performance, availability, and to provide new features and functionality. Microsoft also communicates details of service incidents including the potential user experience, the start and end times of the incident, and any workaround that may be available. For each of these activities, communication is provided through the Microsoft 365 Admin center in the Message Center, and the Service health dashboard. From time-to-time, Microsoft may also send direct email to users with the System Administrator role in a specifically impacted environment. For example, during a service incident we attempt to deliver an organization-specific email to impacted System Administrators.
  
If you’re not sure who your admin is, see [Find your administrator or support person](https://docs.microsoft.com/powerapps/user/find-admin).  
  
 If you want to add additional recipients who receive email communications, see [Manage email notifications to admins](manage-email-notifications.md).  
  
 If you’re an admin, you can also see the latest status of updates and incidents in the Microsoft 365 service health page. To learn how to get to the Microsoft 365 service health page, see [View the status of your services](https://support.office.com/article/View-the-status-of-your-services-932ad3ad-533c-418a-b938-6e44e8bc33b0).  
  
## Scheduled system updates

The Service teams regularly performs security updates and minor service updates on a weekly basis.  There are also two major events in April and October that are delivered through the weekly update mechanism, and details can be found in the [Business Applications Release Notes](https://docs.microsoft.com/dynamics365/release-plans/). 

<a name="bkmk_SecurityUpdates"></a>   

### Security updates  
The Service teams regularly performs the following to ensure the security of the system:  
  
- Scans of the service to identify possible security vulnerabilities  
- Assessments of the service to ensure that key security controls are operating effectively  
- Evaluations of the service to determine exposure to any vulnerabilities identified by the Microsoft Security Response Center (MSRC), which regularly monitors external vulnerability awareness sites  
  
The teams identify and track any identified issues, and takes swift action to mitigate risks when necessary.  
  
**How do I find out about security updates?**  
  
Because the Service teams strives to apply risk mitigations in a way that doesn’t require service downtime, administrators usually don’t see Message Center notifications for security updates. If a security update does require service impact, it is considered planned maintenance, and will be posted with the estimated impact duration, and the window when the work will occur.
  
 For more information about security, see [Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/Dynamics365).
 
 <a name="bkmk_ServiceUpdates"></a>   

### Major release events
We are transforming how we do service updates. We will deliver two major release events per year (April and October), offering new capabilities and functionality. These updates will be backward compatible, so your apps and customizations will continue to work post update. New features with major, disruptive changes to the user experience are off by default. This means administrators will be able to first test then enable these features for their organization.

In addition to the two major updates, we will continue to deploy regular performance and reliability improvement updates throughout the year. We are phasing deployments over several weeks following safe deployment practices and monitoring updates closely for any issues.  Notifications about when the major release events are enabled in each geographic region are published in the Message Center.

> [!IMPORTANT]
> Be sure to check out [Opt in to early access updates](https://docs.microsoft.com/power-platform/admin/opt-in-early-access-updates) for important information about updating to the latest version.  
  
 **How do I find out about Major release events?**  
  
To find out what’s new and how to prepare for the next release, check the [Business Applications Release Notes](https://docs.microsoft.com/dynamics365/release-plans/). 
 
### Minor service updates
 
Minor service updates contain customization changes to support new features, product improvements, and bug fixes. They are deployed on a weekly basis, region-by-region, according to a “Safe Deployment Process” we have defined. Each week, every region gets:

- An updated deployment, starting with our “First Release” region
- A Message Center notification is published that details when the deployment will be delivered into the environment 
- A link to the Weekly Release Notes that contain the list of fixes that are included
  
A list of service updates can be found on our [Version Availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).
  
## System maintenance

<a name="bkmk_PlannedMaintenance"></a>

### Planned maintenance  
Planned maintenance includes updates and changes to the service to provide increased stability, reliability, and performance. These changes can include:  
  
- Hardware or infrastructure updates  
- Integrated services, such as a new version of [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] or [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)]  
- Service changes and software updates  
- Minor service updates that occur several times per year. See [Service updates](https://support.microsoft.com/help/2925359/microsoft-dynamics-crm-online-releases).  
 
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
| CHN           | crm.dynamics.cn | 3 PM to 9 PM |

### Service Update Release Schedule
To see the Service Update release schedule for your regions see our new [Released Versions](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#latest-version-availability) page.  


**Prior notification**  
  
- Your organization will receive a Maintenance notification through the [Microsoft 365 Message Center](https://support.office.com/article/Message-center-in-Office-365-38fb3333-bfcc-4340-a37b-deda509c2093). 

- You can also view notifications in the [Microsoft 365 Admin mobile app](https://products.office.com/business/manage-office-365-admin-app) on your mobile device.  

- In addition, you can see the schedule and status of planned maintenance activities on the Microsoft 365 service health page. To learn how to get to the Microsoft 365 service health page, see [View the status of your services](https://support.office.com/article/View-the-status-of-your-services-932ad3ad-533c-418a-b938-6e44e8bc33b0).

The following stakeholders will be notified about upcoming maintenance when there is expected to be downtime or user impact:

- Organization admins
<!-- - Email addresses set in the Dynamics 365 Admin center notification option for each environment -->
- Users that are assigned the System Admin user role
  
### During the update

To report an issue that is identified during update validation, file a support ticket with Microsoft and append the title with ‘Planned Maintenance Window’.
 
If the update fails or takes longer than the specified maintenance window, a notification will be posted on the Service health dashboard. This issue is considered the highest priority, and the product team becomes involved to address it. 
 
### Post-update notification

If your update is completed within the defined maintenance window, you won’t receive any notification when the update is completed. You can verify that the update was completed successfully by checking the version number on the **About** page.  Some updates are two part and the version number will change after the background processes are completed.

### How to sign up for notifications

To receive communications regarding incidents, updates, or features, reach out to your Microsoft 365 administrator and ask to have your email address added to the Admin center notification page.

<a name="bkmk_UnplannedMaintenance"></a>  

### Unplanned maintenance  
The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) inevitably encounter unplanned issues that require changes to ensure availability. Microsoft strives to provide as much notification as possible during these events. Because these events can’t be predicted, they are not considered planned maintenance.

When this happens, your organization receives an “Unplanned Maintenance” email. These emails go out to all System Administrators in every environment that is affected by the unplanned maintenance. You can see the status of current unplanned maintenance activities on the Microsoft 365 service health page. To learn how to get to the Microsoft 365 service health page, see  [View the status of your services](https://support.office.com/article/View-the-status-of-your-services-932ad3ad-533c-418a-b938-6e44e8bc33b0).  

## Minor Service incidents  
A service incident occurs when your organization is inaccessible or you’re unable to use the service or one of its components. Examples include:  
  
- Page not found or 404 error when trying to access customer engagement apps
- Unable to sign into your organization
- Slow performance for customer engagement apps
- Any customer engagement apps are unavailable or produce errors when accessing
  
### Major service incidents  
A major service incident occurs when multiple organizations can’t access the service, there is significant degradation, or Microsoft Azure is experiencing degraded functionality. 
  
**How do I find out about major service incidents?**  

Check the [Service health dashboard](https://docs.microsoft.com/office365/enterprise/view-service-health) to view the status of the service.  If you are experiencing an issue that is not displayed in the Service health dashboard you can open a ticket [here](https://admin.powerplatform.microsoft.com/).

If the Service health dashboard is not available, the status of customer engagement apps can be reviewed at the [backup status site](https://status.office.com/).

If the service incident breaches your *Service Level Agreement*, you can claim a billing credit according to the conditions of your [Online Service Terms outlined in our Product licensing](https://www.microsoft.com/licensing/product-licensing/products). 

<a name="BKMK_ServiceRestored"></a>  
 
### Service restored  
You can see the Service incident marked as Service restored in your Microsoft 365 service health page. To learn how to get to the Microsoft 365 service health page, see [View the status of your services](https://docs.microsoft.com/office365/enterprise/view-service-health).
  
<a name="BKMK_GeneralAwareness"></a>

**Post-Incident Report**

When there is a major service incident that impacts multiple customers, the Dynamics 365 team publishes a post-incident report (PIR) after 5 business days to the Microsoft 365 Service health dashboard. This report summarizes the following details about the incident: 
  
- Summary  
- User Experience  
- Start date and time
- Resolution date and time  
- Root Cause
- Next steps  

### Communications for releases, package deployments, and awareness
The [Microsoft 365 Message Center](https://docs.microsoft.com/office365/admin/manage/message-center?view=o365-worldwide) will display information specific to managing the service, including changes with the service and releases or feature offerings. The messaging can be informational in nature, drive specific actions, or both. The target audience for these communications are System Administrators or individuals designated to run the service. 
 
 <a name="BKMK_PostPurchase"></a>   

### Post-purchase customer lifecycle communications  
Once a customer has purchased customer engagement apps, we send a series of email communications to administrators during the first year. These communications direct customers to several resources that will assist both administrators and users to successfully adopt and expand their use of customer engagement apps.  This information can be found in the [Microsoft 365 Message Center](https://docs.microsoft.com/office365/admin/manage/message-center?view=o365-worldwide) as well.
  
### Notice about Online Policies
Please review [Notice About Online Policies and Similar Documents](https://www.microsoft.com/en-us/legal/intellectualproperty/mtl/onlinedisclaimer.aspx).

If you have any feedback, please fill out our [survey](https://forms.office.com/FormsPro/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbRxclc4NDdL5CqxoDKPhEMtxUQlNBTkhCWkZEQk1FM1JORU5XSTZFUFJNVyQlQCN0PWcu), and share your thoughts!

