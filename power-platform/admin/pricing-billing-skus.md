---
title: Licensing overview for Microsoft Power Platform
description: Learn information about licensing in Microsoft Power Platform, which includes Power Apps, Power Automate, Microsoft Copilot Studio, Power Pages, Power BI, AI Builder, and Dataverse.
author: dileepsinghmicrosoft
ms.topic: overview
ms.date: 05/29/2025
ms.subservice: admin
ms.author: dileeps
ms.reviewer: sericks
contributors:
- srpoduri 
search.audienceType: 
  - admin

---

# Licensing overview for Microsoft Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This article provides detailed information about Microsoft Power Platform licensing. You can also learn more on the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). 

## Power Apps, Power Automate, Microsoft Copilot Studio, and Power Pages offers 

Power Apps, Power Automate, Microsoft Copilot Studio, and Power Pages provide licensed users the ability to create and run apps, bots, flows, and custom websites across multiple data sources that extend beyond Microsoft 365 (such as Salesforce and on-premises or custom data sources). Those product licenses also include access to [Dataverse](/power-apps/maker/data-platform/data-platform-intro) to store and manage data.

- Learn more about [Power Automate licensing](/power-platform/admin/power-automate-licensing/types)
- Learn more about [Power Apps licensing](/power-platform/admin/signup-for-powerapps-admin)
- Learn more about [Power BI licensing](https://powerbi.microsoft.com/en-us/pricing/)

> [!Note]
> [AI Builder](https://go.microsoft.com/fwlink/?linkid=2103071) proposes AI features which can be used in Power Apps, Power Automate, and Microsoft Copilot Studio.

## Trial Plans

Trial plans are available for both Power Apps and Power Automate. Free trials last 30 days for Power Apps and 90 days for [Power Automate Trial](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license) plans. Users can self-service sign up for these trials in your organization. This can be done by explicitly visiting the pricing pages or by being prompted when they attempt an action in the apps that require additional licensing.

For Power Automate, an unlicensed user who signs into flow.microsoft.com will be set up with the [Power Automate Free](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license) license. If later they try to perform an action like sharing a flow, they'll be prompted to sign up for a *trial*. In this example, if the user accepted the offer for trial they would be signed up for a Power Automate Trial. This trial wouldn't show up under the user licenses in the Microsoft 365 Portal, however you can see it in the Power Automate and Power Apps license report discussed later in the security section.

For Power Apps, if a user signs up for a Power Apps trial, they'll get a Power Apps per user trial if needed for any of the actions they take such as creating an environment.

As the administrator, you'll likely be assisting users that had started in a trial and either want to continue experimenting or are ready to get a regular license to keep working with the app they are building. If you are moving to a regular license for a user, it would also be a good time to work with them to see if their app should stay where it was built or should be moved according to the environment strategy you adopt. For those not ready to get a full license but want to keep experimenting you could help them get set up on the developer plan and help them move their application and flow assets into their new developer environment.

## Power Apps and Power Automate for Microsoft 365

Power Apps and Power Automate capabilities for Microsoft 365 enable users to extend and customize the Office experience: with these productivity apps, users can create applications and flows based on Microsoft 365 data. Power Apps and Power Automate can also utilize data outside of Microsoft 365 by connecting to common services including Box.com, Facebook, and many more via the use of standard connectors. 

Learn more about Microsoft 365 plans including these capabilities in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

Here is a brief overview of capabilities included with the Power Apps for Microsoft 365 plan:

| Functionalities                                                   | Power Apps for Microsoft 365 |
|-----------------------------------------------------------------------|------------------------------|
| Create, run, and share apps                                            | Yes                          |
| Run canvas apps in context of Microsoft 365                              | Yes                          |
| Connect to Microsoft 365 data                                            | Yes                          |
| Connect to cloud services using standard connectors                   | Yes                          |
| Run apps in a browser or Power Apps mobile for iOS and Android         | Yes                          |
| Run Canvas apps offline                                               | Yes                          |
| Support for data policies established by the Microsoft 365 administrator | Yes                          |
| Access on-premises data or use premium or custom connectors           | \-                           |
| Access to Microsoft Dataverse                    | Yes (see the next section for details)                |

To learn about capabilities included with the Power Automate for Microsoft 365 plan, see [Power Automate seeded license for Microsoft 365](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license).

### Dataverse capabilities with Microsoft 365 licenses

As Dataverse continues to grow, more Microsoft applications like Microsoft Project are using Dataverse. To enable these Microsoft applications, limited Dataverse functionality is added to select Microsoft 365 licenses. This is achieved by adding a new service plan named "Dataverse" to the Microsoft 365 licenses. To see the new service plan in the Microsoft 365 admin center, select a user, select the **Licenses and Apps** tab, and then scroll down and expand the **Apps** section.

> [!div class="mx-imgBorder"]
> ![Dataverse license.](./media/common-data-service-license.png "Dataverse license")

#### Capabilities included

Dataverse functionality required by other Microsoft 365 applications appears as the "Dataverse" service plan in the **Apps** section of the Microsoft 365 admin center.  

This new service plan allows select Microsoft 365 applications to take advantage of Dataverse as a platform for storing application data and use the underlying business logic tier as part of extending application capabilities. This extension also helps these applications to use Dataverse instances within the [default environment](environments-overview.md#default-environment). However, if you need to create a Dataverse instance within production or sandbox environments (other than the default environment), you're still required to have a premium Power Apps or Power Automate license.

These limited capabilities of Dataverse are only available through select Microsoft 365 licenses and can't be used to run any custom apps or Power Automate flows, or run any Microsoft Copilot Studio bots, or use any other data that doesn't belong to the Microsoft 365 applications that take advantage of these capabilities.

These limited capabilities aren't the common set included with every Office application. They can be different, based on the Microsoft 365 applications that use these capabilities. For the complete list of various limited capabilities, customers should refer to the service description of these Microsoft 365 applications that contain these Dataverse plans. These limited capabilities of Dataverse don't entitle the licensed user to run standalone Power Apps or Power Automate, or any other Microsoft Power Platform applications that use Dataverse.

Review the [Microsoft Project Service description](/office365/servicedescriptions/project-online-service-description/project-online-service-description) for more details on the limited use of Dataverse that comes with Project.

#### Frequently asked questions

##### What are the select Office applications where Dataverse plans are included?

For now, the Dataverse service plan is included for Project. This list will evolve as more Office applications take advantage of Dataverse and Microsoft Power Platform.

##### Does this addition of Dataverse in Microsoft 365 mean that customers don't need a Power Apps license to use Dataverse?  

No, the capabilities of Dataverse included with select Microsoft 365 licenses don't allow customers to create custom apps with Power Apps or use the premium connectors with Power Automate. The capabilities included with this license entitle Microsoft 365 applications to use Dataverse for the purpose of enhancing the capabilities of the base Microsoft 365 application where Dataverse is included.

##### If customers can't use Dataverse, why is this being shown in the Microsoft 365 admin center during the license assignment experience?  

The service plan for Dataverse is shown to provide visibility to customers that Dataverse is being used to store and manage customer data related to the Microsoft 365 application that's using Dataverse. Additionally, this was communicated to all customers so that customers can prepare for this change and update any internal training or user documentation that they might need.

##### What will be the impact if the service plan for Dataverse is turned off (unselected)?  

Dataverse functionality appears as the **Common Data Service** plan in the **Apps** section of the Microsoft 365 admin center. Turning off the service plan will result in the Microsoft 365 features being disabled for the users of such a license. For example, when this capability is turned off, any Office application reading data from Dataverse will fail to load for the user.  

##### When can Office-licensed users be seen inside of Dataverse?

Users who have any Microsoft Power Platform or Dynamics 365 license are always synced into the environments with a Dataverse database. However, for Office licenses where Dataverse service plans are included, users aren't automatically synced into Dataverse until the Office application is accessed by the user. After this occurs, the user can get access to Dataverse tables and rows based on the additional security roles and privileges that the administrator assigned to this user. Such users, who just have the Office license, aren't automatically assigned any other security roles or privileges, other than the Maker role privilege in the [default environment](environments-overview.md#default-environment). As a security best practice, the administrator needs to ensure that security roles and privileges are assigned based on functional roles and needs only, and not automatically assigned based on the user being synced or present in Dataverse.

#### Known issues

- If you're an existing customer and a user with this license who comes directly to Dataverse, you might get an error message that states "You are not a member of the organization." We're addressing this problem in the coming weeks.
- We currently sync some of these Microsoft Dataverse licensed users to all environments with a Dataverse database. We're addressing this right now. Currently, these users won't be able to open Power Apps for Microsoft 365 with this license.

## Power Apps and Power Automate for Dynamics 365

Power Apps and Power Automate capabilities for Dynamics 365 enable users to extend and customize the Dynamics experience: 
- Power Apps is the platform to customize and extend applications in Dynamics 365, such as Dynamics 365 Sales and Customer Service, in context of the use rights.
- Power Automate is the platform to customize and extend automations in Dynamics 365, such as Dynamics 365 Sales and Customer Service, in context of the use rights.

To learn about capabilities included with the Power Automate for Dynamics 365 plan, see [Power Automate seeded license for Dynamics 365](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license).

More information on [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544).

## Power Apps Developer Plan

In addition to the trial plans, there's also a *free* Power Apps Developer Plan. This is a special plan that allows up individual self-service sign and it provides an individual environment that the user can use to build apps and flows. These environments will show up on the administrator’s list of environments and will list the type of environment as “Developer”. The environments are for individual use, so there's no ability to share with other users. Users in your organization can self-service sign up for this plan even if they have Power Apps and Power Automate license entitlements via another licensing plan. Sign-up for the Power Apps Developer Plan can be found [here](https://powerapps.microsoft.com/communityplan/) and more details on its features [here](/powerapps/maker/dev-community-plan).

## Pay-as-you-go plan

Pay-as-you-go is a way to pay for Power Apps and Power Automate using an Azure subscription, which allows you to get started building and sharing apps without any license commitment or upfront purchasing. More information: [Pay-as-you-go plan](pay-as-you-go-overview.md)

## Tenant-level special licenses

If a tenant administrator activates any one of the following SKUs, then all users in the tenant (active and guest) become eligible to be synced into all Dataverse environments in the tenant. Access to the users will be granted at runtime when the user accesses the Dataverse environment. In addition, the user’s access mode is set to Read-Write in Dataverse.

You can view a list of all assigned licenses in the [Microsoft Admin Center](https://admin.microsoft.com).

> [!NOTE]
> A user must be assigned to a security role in Dataverse before the user can access any data in Dataverse.
>
|Plan name   | SKU ID  | Capability string  |
|---|---|---|
| Dynamics 365 for Marketing  | 00b861da-8087-4e30-beb8-8db3c6d9581e  | DYN365_MARKETING_APP  |
| Dynamics 365 for Marketing Attach  | 85430fb9-02e8-48be-9d7e-328beb41fa29  | DYN365_MARKETING_APP_ATTACH  |
| Dynamics 365 Marketing (Self-Service)  | 1224df81-ff37-4222-a5fe-85c7feecdba8  | DYN365_MARKETING_APP_DEPT  |
| Dynamics 365 Marketing Attach (Self-Service)  |	95b34ddc-99ff-41f0-823d-0051478d9469  |	DYN365_MARKETING_APP_ATTACH_DEPT  |
| Dynamics 365 Marketing Additional Application (Self-Service)  |	fcc6a509-4249-47bf-8f21-0d882dbbdae3  |	DYN365_MARKETING_APPLICATION_ADDON_DEPT	 |
| Dynamics 365 Marketing Additional Non-Prod Application (Self-Service)	  | a7cd421b-9f64-4206-a33b-b9154ae28f97  |	DYN365_MARKETING_SANDBOX_APPLICATION_ADDON_DEPT	 |
| Project Plan 3  | 53818b1b-4a27-454b-8896-0dba576410e6  | PROJECTPROFESSIONAL  |
| Project Plan 3 (for Department)  | 46102f44-d912-47e7-b0ca-1bd7b70ada3b  | PROJECT_PLAN3_DEPT  |
| Project Plan 3 for faculty  | 46974aed-363e-423c-9e6a-951037cec495  | PROJECTPROFESSIONAL_FACULTY  |
| Project Plan 3 for students  | ef3a3775-8287-4df8-ba28-8ab34902710a  | PROJECTPROFESSIONAL_STUDENT  |
| Project Plan 5  | 09015f9f-377f-4538-bbb5-f75ceb09358a  | PROJECTPREMIUM  |
| Project Plan 5 for faculty  | 930cc132-4d6b-4d8c-8818-587d17c50d56  | PROJECTPREMIUM_FACULTY  |
| Project Plan 5 for students  | 149f0db2-7fde-45fa-80fa-7716317772c5  | PROJECTPREMIUM_STUDENT  |
| Project Plan 1  | beb6439c-caad-48d3-bf46-0c82871e12be  | PROJECT_P1  |
| Project Plan 1 (for Department)  | 84cd610f-a3f8-4beb-84ab-d9d2c902c6c9  | PROJECT_PLAN1_DEPT  |
| Project Plan 3 for GCC  | 074c6829-b3a0-430a-ba3d-aca365e57065  | PROJECTPROFESSIONAL_GOV  |
| Project Plan 5 for GCC  | f2230877-72be-4fec-b1ba-7156d6f75bd6  | PROJECTPREMIUM_GOV  |
| Dynamics 365 Customer Insights (and Attach)  | 1720c3f7-7da3-4a11-8324-92aad283eb68  | DYN365_CUSTOMER_INSIGHTS_JOURNEYS_BASE  |

## What users are licensed

You can always look at individual user licensing in the Microsoft 365 admin center by drilling into specific users. 

You can also use the following PowerShell command to export assigned user licenses.

```powershell
Get-AdminPowerAppLicenses -OutputFilePath '<licenses.csv>'
```

Exports all the assigned user licenses (Power Apps and Power Automate) in your tenant into a tabular view .csv file. The exported file contains both self-service sign-up internal trial plans and plans that are sourced from Microsoft Entra ID. The internal trial plans aren't visible to admins in the Microsoft 365 admin center.

The export can take a while for tenants with a large number of Microsoft Power Platform users.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
