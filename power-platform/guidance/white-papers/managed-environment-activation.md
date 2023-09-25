---
title: Activating Managed Environments
description: Learn about activating the features of Managed Environments.
author: rsantos00
ms.component: pa-admin
ms.topic: overview
ms.date: 09/25/2023
ms.author: rstand
ms.reviewer: sericks
ms.custom: bap-template
ms.subservice: guidance
contributors:
    - RobStand
---

# Activating Managed Environments

This article addresses the key features of Managed Environments and how organizations and administrators can plan the activation of features.

## Managed Environments overview

Managed Environments is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights. Admins can use Managed Environments with any type of environment.

There are different aspects depending on the environment type, business needs, or internal policies. In this article, you find illustrations and explanations based on various organizations that have implemented Managed Environments. To learn more about how to activate Managed Environments, see [Enable Managed Environments](/power-platform/admin/managed-environment-enable).

Managed Environments being a suite of features is important to understand each feature capability and advantages.

Pipelines in Power Platform are used by organizations to democratize application lifecycle management (ALM), enabling them to streamline and optimize their development processes. Managed Environments also offer a range of features and capabilities that empower administrators to customize makers' welcome messages in-product, restrict sharing of canvas apps, and gain valuable insights into user activity. With the possibility to manage all data loss prevention (DLA) policies associated with a specific environment, it allows administrators to be more efficient and focused on business needs. Enforcing static analysis checks on solutions and limiting user access to Dataverse through IP Firewall and IP cookie binding allows administrators to follow internal policies and best practices. Customers can use the Customer Managed Key (CMK) feature to encrypt their data at-rest and meet stringent data privacy and compliance requirements. Microsoft's Lockbox feature ensures that customer data is accessed by Microsoft only when there's a compelling business reason to do so, while extended backup capabilities safeguard against data loss and ensure continuous availability of service. Additionally, Power Automate's DLP feature enables organizations to create and enforce policies that classify desktop flow and individual actions, which helps to ensure that sensitive data is protected always.

The following sections are presented with examples and ideas of how your organization could take advantage of Managed Environments.

### Pipelines in Power Platform

Pipelines in Power Platform aim to democratize application lifecycle management practices for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service in a manner that's more approachable for all makers, admins, and developers. To learn more about pipelines, see [Overview of pipelines in Power Platform](../../alm/pipelines.md).

Although pipelines aren't always used by IT administrators or members of the governance team, it's common in organizations for these teams to provide support on how solutions should be deployed to different environments. Administrators are enabled to centrally manage and govern pipelines, providing makers with intuitive user experiences for easily deploying their solutions.

To move a solution from one environment to another, typically specified as the _source environment_ and _target environment_, a user with the appropriate security group needs to create a pipeline. A pipeline specifies all the environments included in the application lifecycle, meaning what the developer environment and target environments (test, quality, production) are. The most common pipeline is composed of Dev/Test/Production environments, but it's also common to see Dev/Validation/Test/Production, for instance. With pipelines in the Power Platform, you can create a pipeline that fits your needs and specifications. An example of a pipeline is shown in the following picture:

:::image type="content" source="../media/mae/image1.png" alt-text="A screenshot of the Pipelines screen in Power Apps.":::

One crucial aspect to consider when utilizing Managed Environments is that all environments within a pipeline must be activated as Managed Environments. If an organization has a pipeline consisting of Dev/Test/Production environments, all these environments must be activated as Managed Environments.

It's also important to note that personal productivity solutions should be in a personal, development environment. The usage of pipelines facilitate the deployment of these solutions to target environments. Having this in consideration, it allows administrators and Center of Excellence (CoE) teams to focus on enabling makers instead of cleaning up resources, especially in the default environment.

Some organizations include pipeline creation as part of their environment creation process. This not only streamlines the process for makers to publish solutions in the correct environments, but it also ensures standardization within the organization. Furthermore, these processes can be automated, from environment creation to pipeline creation, and the respective roles can be assigned accordingly.

### Maker welcome content

In Managed Environments, admins can provide customized, welcome content to help their makers get started with [Power Apps](https://make.powerapps.com/).

For more information about how the feature works, see [Enable maker welcome content](../../admin/welcome-content.md).

It's crucial to inform makers about the company rules and what can be done in each environment or group of environments. Here are some suggestions on how your organization could use the welcome message, depending on the environment type.

#### Default environment 
The default environment is often the most restricted environment with DLPs and sharing controls. To make sure your makers know about the possible limitations, a good starting point is to create a customized welcome message and include a link to your organization’s policy website or document.

As an example, you could inform makers that the default environment is intended to be used only for Office 365 related features, such as SharePoint forms. It's recommended that you don't use production applications on the default environment, which means sharing limits might be in place. We describe how to limit the sharing possibilities, but informing the makers in the beginning can lead to a cleaner environment and more compliant apps. Taking all factors into consideration, an example of message could look like the following image.

:::image type="content" source="../media/mae/image2.png" alt-text="A screenshot of the Welcome message in Power Apps.":::

Based on the above image, configuration would look something like this:

```markdown
[Contoso](https://i.ibb.co/SNSTCx3/something.png)
## Welcome to Contoso Personal Productivity Environment

### Before you start here are some considerations
This environment should be used if you plan to have Power Apps integrated with Office 365.
Before you start make sure you are aware of these limitations:
1. You can't share the Apps with more than 5 users
2. The data in Dataverse is shared with all users in the organization
3. You are only allowed to use Office 365 connectors

If you are unsure about if you are in the right place? Follow [this guidance**](#).
```

The **Learn More** link can be configured under the settings, as the following picture suggests.

:::image type="content" source="../media/mae/image3.png" alt-text="A screenshot of Power Apps showing a "Getting Started" pop-up.":::

#### Production environments

They're typically used for deploying solutions to production. It's targeting enterprise applications and team productivity applications. In this case, it's important to have compliant apps and data. Since you need to control which users have access to the production environment it's beneficial to inform the user if you have a policy of refreshing access. According to the use case, you might allow more connectors and increase the sharing limits. Depending on your centralized or decentralized support team, you can also use this message to inform the right team to support the Makers.

A proposed message for an environment created for the Finance department in Europe could be the following.

:::image type="content" source="../media/mae/image4.png" alt-text="A screenshot of Power Apps showing a "Getting Started" popup for a production environment.":::

#### Developer environments

It's often used for developers to build their solutions. Since the developers are working on the application, it isn't in production and the scalability is limited. Normally it has more relaxed DLPs due to the nature of the makers, but to avoid the Developers using this type of environments with production assets is important to limit the sharing capabilities and a specific DLP to be assigned to this type of environments. An example of a Maker onboarding message can be the following.

:::image type="content" source="../media/mae/image5.png" alt-text="A screenshot of Power Apps showing a "Getting Started" popup for a developer environment.":::

#### Sandbox Environments

Typically this type of environments is used when testing a solution. Due to some tests involving a significant number of users these environments scale to a certain point and have more capacity than a Developer environment type. It's also common to use this type of environment as a development environment, normally shared by multiple developers. An example of a Maker onboarding message can be the following.

:::image type="content" source="../media/mae/image6.png" alt-text="A screenshot of Power Apps showing a "Getting Started" popup for a sandbox environment.":::

Now that you have seen some examples of how to use the Maker welcome message it's important you adapt based on your organization needs.

>[!TIP]
> Using images that identify the Environment type or owners is very good for user adoption and error prevention.

### Limit Sharing

In Managed Environments, admins can limit how broadly users can share canvas apps.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/managed-environment-sharing-limits).

An important aspect of activating Sharing Limits is the fact the limit will only be applied in future sharing actions, meaning if you apply a sharing limit of 20, on an existing Environment with Apps already shared with more than 20 users, those apps continue to work and all users previously shared will be able to access the apps. It's common to have a process to inform all the makers of Apps shared with more than the new limit, to reduce the number of users it was shared with, and, in some cases, the administrator might move the solution to another environment.

There are different situations that you need to control how Makers share their Apps across your organization. Here are the most common scenarios and reasons:

1. Limit Apps sharing in a Personal Productivity environment. If you have an environment where users can create Apps for their own work, Apps without global business value or Apps without support from IT, it's important that you limit those Apps for only the maker and not spread it across the organization. Sometimes you have Apps that start as personal productivity and reach popularity and are transformed into a crucial App, because of this reason you should be mindful about the limit you configure, between 5 and 50 users is commonly used.
1. Avoid Apps being shared with security groups or everyone. By sharing with security groups, you're allowing all members of the group to run the App. For instance, if you are in a developer environment you might want to make sure the developer is in control of how the Apps are shared and not by membership of the group. In other scenarios you might want to limit the sharing to everyone – notice by default all users in the tenant are added to the Default Environment.

The most common scenarios of sharing limits in the different environments are:

:::row:::
    :::column:::
    **Environment Type**
    :::column-end:::
    :::column:::
    **Sharing limits**
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Default**
    :::column-end:::
    :::column:::
    Choose `Exclude sharing with security groups`, tick the `Limit total individuals who can share to` checkbox, and select `20` for the value.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Developer**
    :::column-end:::
    :::column:::
    Choose `Exclude sharing with security groups`, tick the `Limit total individuals who can share to` checkbox, and select `5` for the value.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Sandbox**
    :::column-end:::
    :::column:::
    Choose `Exclude sharing with security groups`and leave the `Limit total individuals who can share to` checkbox unticked.
    If you want to control the Tester users and you need to use a security group, choose `Don't set limits (default)`.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Production**
    :::column-end:::
    :::column:::
    Choose `Don't set limits (default)`.
    :::column-end:::
:::row-end:::

Currently the sharing capabilities are only for Power Apps of type Canvas, but in the future, we might support Model Driven and Power Automate Flows.

Examples of what happens when you activate this feature with different configurations:

**Example 1:** Apps that are already in the environment and have been shared with users and security groups continue to work. If the Maker tries to share the App with any user or security group, will get an error message until it removes all previous security groups. After all groups are removed, the user is allowed to share with specific users without limitation on the number.

**Example 2:** Apps that are already in the environment and have been shared with users and security groups continue to work. If the Maker tries to share the App with any user or security group, will get an error message until it removes all previous security groups and the number of users that the app is shared with goes below 20. For example, if an App is shared with 50 users, when the Maker tries to change the sharing configuration, first would need to remove at least 30 users, and/or any security group, and maintain only a list of 20 users.

### Usage insights

Admins or preconfigured users can stay informed about what’s happening in their Managed Environments. These insights contain analytics about top apps, most impactful makers, and inactive resources you can safely clean up. These insights are generated and delivered to your mailbox once a week.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/managed-environment-usage-insights).

If you're ever wondering which Apps are the most popular (with the most runs) or which Apps or Flows you should consider cleaning, the weekly digest on Managed Environments is helpful. Every week the information is aggregated, meaning the information is consolidated from all the Managed Environments you have configured and sent to your email. 

Usage insights enable administrators to have a summary view of apps and flows activity in the environments, for more in depth analysis they can follow the links provided in the email and go directly to the resource.

It's common for decentralized IT teams to use this email to inform the different Administrators of what is happening with their Managed Environment, making recipient management an important task to follow. Due to the limit number of recipients you can configure, is suggested in some situations to use an email distribution list (for example [HR_Admins@contoso.com](mailto:HR_Admins@contoso.com)  or [Finance_Admins@contoso.com](mailto:Finance_Admins@contoso.com) distributions lists) and do the recipient management on the distribution list.

### Data policies

In Managed Environments, admins can easily identify all the data policies that are applied to the environment.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/managed-environment-data-policies). 

With a well-planned environment strategy, it's imperative to have a Data Loss Prevention (DLP) strategy in place. DLPs dictate which connectors are available and which ones can be used with each other. It's possible for multiple DLPs to be active in the same environment, but the most restrictive DLP will take precedence. For example, if one DLP allows the use of connector A and another DLP blocks the use of connector A, the connector is blocked.

It isn't uncommon for environments to have multiple DLPs applied, particularly in scenarios where DLPs are applied by region, country, department, or team within the same environment. It's crucial to have a clear visualization of all DLPs applied to a specific environment, and this can be achieved by ensuring that the environment is Managed. This is precisely the intention behind this feature.

### Solution checker

In Managed Environments, admins can easily enforce rich static analysis checks on your solutions against a set of best practice rules and identify problematic patterns.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/managed-environment-solution-checker).

Users with permission to install solutions in environments, such as those with the Environment Maker role, can import solutions using various methods, including manually in the Maker portal or using pac CLI. It's common for a Center of Excellence/Enablement (CoE) team to set up guardrails to reduce the risk of noncompliant solutions in the environment. In organizations with decentralized CoEs, it's often necessary to activate this feature along with sending an email to proactively reach out to Makers and offer support.

This feature allows for different levels of control, including None, Warn, and Block. Each level allows administrators to configure the impact of the check, whether it's to provide a warning but allow the import, or to block the import altogether, while also providing information to the maker about the result of the import.

Organizations using this feature have different configurations depending on the environment type. It's normal to have exceptions, and this guidance should always be aligned with your needs. However, the most common scenarios for the solution checker in different environments are as follows:

:::row:::
    :::column:::
    **Environment Type**
    :::column-end:::
    :::column:::
    **Solution checker**
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Default**
    :::column-end:::
    :::column:::
    Choose `Block` and tick the `Send emails` box.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Developer**
    :::column-end:::
    :::column:::
    Choose `Warm` and leave the `Send emails` box unticked.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Sandbox**
    :::column-end:::
    :::column:::
    Choose `Warm` and leave the `Send emails` box unticked.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Production**
    :::column-end:::
    :::column:::
    Choose `Block` and tick the `Send emails` box.
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Teams Environment**
    :::column-end:::
    :::column:::
    Choose `Block` and tick the `Send emails` box.
    :::column-end:::
:::row-end:::

### IP Firewall

The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyses the IP address of each request in real time.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/ip-firewall).

By default, every Dataverse data can be accessed using the API from any IP address, secured by authentication. It's common in organizations to restrict access to some allowed sources mitigating insider threats like data exfiltration.

When this feature is enabled the IP address is being analyzed in real time and blocked in case it isn't allowed. For example, requests with a stolen access token to Dataverse from outside allowed IP ranges, will be validated against the allowed IP range and the attempt will be denied in real time.

Organizations tend to activate IP Firewall and configure it to allow connections from their office premises and to restrict connections coming from outside. The best practice is to use it together with conditional access to avoid inconsistent policies and dependencies.

Pro Tip: Note, if you have misconfigured these policies, you might need to request assistance from Microsoft Support or you might limit access in Power Apps from users outside of the allowed IPs and limit Power Automate actions that have been previously allowed.

### IP cookie binding (block cookie reply attacks)

Customers can prevent session cookie exploits with IP address-based cookie binding.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/block-cookie-replay-attack).

If you have a stolen session cookie from an authorized computer that has cookie IP binding enabled then once the exploiter tries to use the cookie from a different computer to gain unauthorized access to Dataverse, the attempt is blocked, and an error message is shown asking the user to reauthenticate.

The user is asked to reauthenticate in the following scenarios:

- When any VPN client is turned on or off
- When connecting to a wireless hotspot
- When the Internet connection is reset by the Internet service provider
- When a router is reset or restarted

Organizations enable the IP cookie-based binding in cases where they want to restrict the network traffic to come only from one IP address for the user, and in case of a change, it reauthenticates the user with the new IP address (let’s say if the user connects to a VPN network).

### Customer Managed Key (CMK)

Customers have data privacy and compliance requirements to secure their data by encrypting their data at-rest. This secures the data from exposure in an event where a copy of the database is stolen. With data encryption at-rest, the stolen database data is protected from being restored to a different server without the encryption key.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/customer-managed-key).

The CMK is being used by organizations, which need to meet laws and regulations around security and data confidentially, for example, signing confidential data with their own key. Using this feature, organizations guarantee that only they have access to the key to decrypt the information, restricting access to anyone without the encryption key, including Microsoft. Organizations with CMK also have strict procedures to protect and renew the encryption key.

CMK offers advantages then Bring Your Own Key (BYOK) feature, having the ability to use different or multiple encryption keys for separate environments and better management of your encryption key in your own key vault, upgrading BYOK to customer-managed key opens up your environments to all other Power Platform services that use non-SQL storage. For example, Customer Insights and Analytics, larger file upload sizes, more cost effective audit storage with audit retention, elastic table services, Dataverse search, and long-term retention are available. Organizations using BYOK are recommended to migrate to CMK.

This feature has been highly anticipated by customers with Dynamics 365 environments, since in most cases it contains confidential/secret information related to finance, healthcare, or business secrets.

### Lockbox

Most operations, support, and troubleshooting performed by Microsoft personnel (including subprocessors) don't require access to customer data. However, in certain cases it may be needed Microsoft support to access customer data in case there's a strong business reason for that. Microsoft has a complicated internal approval process to grant access to customer data in these rare cases. However, there are customers that need to meet laws and regulations and require to have full control over who can access confidential/classified data and when. With Power Platform Customer Lockbox, customers can review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. That gives full control over the data to the customer.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/about-lockbox).

With Lockbox activated, when data access is required for a ticket resolution, the Global administrators and Power Platform administrators receive a Lockbox request for approval. After the approval, the Microsoft engineer will have access to the data for a limited time that they need for investigation. Every time an engineer needs to access data, a new Lockbox request is sent to the administrators. All actions that the engineer did are being recorded in the audit log, so the environment will still have full audit log history.

Makers that need this kind of Microsoft support would need to coordinate with their Global administrators or Power Platform Administrators and should be carefully reviewed by them.

Extended backup (7 to 28 days)

It's important to protect your data in Microsoft Power Platform and Dataverse, and provide continuous availability of service. If you use Microsoft Power Platform to create production environments that have a database and Dynamics 365 applications enabled, you can benefit from the system backups that are automatically performed for those environments. The system backups are stored for up to 28 days. Therefore, you can restore your environment if there are any issues.

For production environments that don't have Dynamics 365 applications enabled, the default backup retention period is only seven days. However, for managed environments, admins can use PowerShell to change the setting and extend the backup retention period. The available options are 7, 14, 21, and 28 days.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/backup-restore-environments).

The ability to change the backup retention period is useful for managed environments that don't have Dynamics 365 applications enabled. Organizations are using this extension to retain the backup for a longer period, getting more flexibility and security for their data. It also helps with accidental data deletion scenarios or restores the system after a complex deployment that failed.

The following PowerShell command can be used to extend the backup to different retentions periods.

| **Set-AdminPowerAppEnvironmentBackupRetentionPeriod -EnvironmentName 6B29FC40-CA47-1067-B31D-00DD010662DA -NewBackupRetentionPeriodInDays 28** |
|---|

DLP for desktop flows

Power Automate allows you to create and enforce DLP policies that classify desktop flow modules and individual module actions such as Business, Nonbusiness, or Blocked. This categorization prevents makers from combining modules and actions from different categories into a desktop flow or between a cloud flow and the desktop flow it uses. The enforcement of DLP policies for desktop flows will only be enforced if the desktop flow is in a Managed Environment.

To find more information on how the feature works, you can follow [this link](/power-automate/prevent-data-loss).

At the time of writing, by default, desktop flows action groups don’t appear when a DLP policy is being created, the administrator needs to activate a Tenant Setting in the Power Platform admin center, as it’s shows in the following picture.

:::image type="content" source="../media/mae/image17.png" alt-text="Screenshot of the DLP for desktop flows setting in the Power Platform admin center.":::

The Default Environment allows everyone to be a Maker and take advantage of Desktop Flows in Microsoft Windows. However, it's important to have a strategy for Data Loss Prevention (DLP) strategy in Desktop Flows, just as one would for Cloud Flows. This is to ensure compliance with organizational policies. For example, if an organization is blocking the running of scripts on user PCs, it's important to prevent makers from creating Desktop Flows with a "Run Script" action. Similarly, if an organization is limiting the usage of the HTTP connector, it would be relevant to block similar actions in Desktop Flows to ensure compliance.

By having a strategy for DLP in Desktop Flows, organizations can ensure that their data remains secure and that their policies are being followed, even in the context of Desktop Flows.

If you want to do an impact analysis before applying a DLP policy, to assess the impact on your desktop flows, you can use the DLP impact analysis tool from the Automation KIT: [DLP impact analysis for desktop flows - Power Automate | Microsoft Learn](/power-automate/guidance/automation-kit/dlp-impact-analysis)

### Export data to Azure Application Insights

Application Insights can be set up to receive telemetry on diagnostics and performance captured by the Dataverse platform. This telemetry provides information that can be used to diagnose and troubleshooting issues related to errors and performance. Application Insights is part of the Azure Monitor ecosystem and is widely used by enterprises for monitoring and diagnostics.

To find more information on how the feature works, you can follow [this link](/power-platform/admin/overview-integration-application-insights).

Organizations that have widely used App or Power Automate Flows are using this feature to get more control of their assets. The following picture shows the count and average duration of each operation for a Model Driven App. This information is useful to identify those operations that most affect users.

:::image type="content" source="../media/mae/image18.png" alt-text="Application Insights Performance panel.":::

Organizations with Dataverse Environments use the data stream to monitor performance data related to Dataverse API incoming calls, Dataverse plug-in execution calls, and Dataverse SDK calls. It also provides data for failures in plug-in and Dataverse SDK operations.

Additionally, to Power Apps insights, organizations have also the possibility to monitor cloud flows executions and together with filters, is possible to detect any flow that is failing and create alerts to be notified when it happens.

The following example shows how to create a custom alert to filter for specific cloud flow’s failure, is possible to find [more examples here](/power-platform/admin/app-insights-cloud-flow).

| |
|---|

```
let myEnvironmentId = **'Insert your environment ID here**;
let myFlowId = **Insert your flow ID here** ';
requests
| where timestamp > ago(**1d**)
| where customDimensions ['resourceProvider'] == 'Cloud Flow'
| where customDimensions ['signalCategory'] == 'Cloud flow runs'
| where customDimensions ['environmentId'] == myEnvironmentId
| where customDimensions ['resourceId'] == myFlowId
| where success == false
```

### Catalog in Power Platform

The catalog in Power Platform is a centralized location where makers and developers can find, create, submit, approve, store, discover, and acquire solutions and templates. It allows them to crowd-source and find Power Platform templates and code components within their organization easily, and get started with templates that provide immediate value. The catalog also provides a central location for administrators to store and maintain power platform artifacts, with management capabilities and approval workflows to ensure compliance with regulatory and statutory requirements.

Makers and developers can create solutions and templates with useful configuration points, and submit them to the catalog to help their colleagues solve business problems. Admins and LOB approvers can review and approve these submissions, and the catalog serves as a single source of truth for power platform artifacts that can be curated and controlled to accelerate value for makers and developers. Overall, the catalog in Power Platform streamlines the process of finding, creating, and sharing solutions and templates, making it easier for organizations to solve business problems and achieve their goals.

To find more information on how the feature works, you can follow [this link](/power-platform/developer/catalog).

Organizations are using the catalog in Power Platform to allow developers and makers to easily find and use templates and code components within their organization. It also provides a central location for administrators to store and maintain power platform artifacts, with management capabilities and approval workflows to ensure compliance with regulatory and statutory requirements. The process of using catalog in Power Platform is a continuous cycle of five steps:

1. Create
1. Submit
1. Approve & Store
1. Discover
1. Acquire

Organizations that encourage developers and makers to build and share components and templates on the Power Platform can derive more value from it. Simply building isn't enough; sharing these artifacts at scale can foster communities and support groups that can unlock value from a diverse set of personnel within the organization. Successful organizations adopt a fusion teams model where pro-developers, makers, and admins work together to help their fellow employees derive the highest value possible from the platform, by reusing components and templates.

## Considerations for Managed Environments (ME)

Managed Environments are a set of features designed to make governance of the Power Platform easier by giving more control and requiring less effort from administrators, which is something that many organizations have been eagerly anticipating. Multiple organizations have their own governance processes that were influenced by the CoE Starter Kit, while others are using the out-of-the-box features of the kit and extending it to meet their specific needs. For organizations using the kit, it's important to maintain an internal process to update it monthly and follow the suggestions presented in the [CoE Starter Kit Office Hours](https://aka.ms/coeofficehours). Power CAT is the team responsible for the CoE Starter Kit, and is community driven, hence not covered with the same Service Level Agreement (SLA) as the licensed products. Customers are advised to interact using the [GitHub site](https://github.com/microsoft/coe-starter-kit/issues) to report bugs, ask questions, or request new features.

When using Managed Environments, you're using in-product features that are managed by Microsoft, so you don't need to update or maintain any of these features, and they're updated with the release waves of the Power Platform, or more announcements throughout the year. When you use in-product features, you're will also receive full support via opening Microsoft Support ticket if needed.

The engineering team for Managed Environments has worked closely with [Power CAT](https://aka.ms/whoispowercat) to identify the features mostly used in the CoE Starter Kit and onboard them in-product. This has created a situation where some features are available in both places. If you're currently using the CoE Starter Kit, it's important to have a hybrid strategy. Using the CoE Starter Kit to expand the governance features included in Managed Environments is the recommended approach, where organizations first use the Managed Environment feature and then use the kit to fulfill more needs.

Having a transition plan is a valuable exercise that can help ensure a smooth and successful outcome. It's important to understand what steps to take when transitioning away from Managed Environments.

The following list shows the impact caused by deactivating ME.

| **Feature** | **Makers Impact** | **Admin Impact** |
|:---:|:---:|:---:|
| **Maker Welcome** | **None directly** – Will stop seeing the Welcome Message when users enter the environment | **None directly** – Won't be able to define customized messages in environments |
| **Limit Sharing** | **None directly** – Will be able to share the Apps with Security Groups and any User they want | **None directly** – Won't be able to control how the Apps are being shared in the respective environment |
| **Usage Insights** | **None** | Will stop receiving the weekly email about the insights of the Environment and impacting anyone who was configured it to receive it |
| **Data Policies** | **None** | **None directly** – the DLPs will still be enforced to the environments, but the Admin won't have the modern experience capability to apply many DLPs to a specific environment |
| **Pipelines in Power Platform** | Won't be able to use the previously configure Pipelines | **None** |
| **Solution Checker** | **None** | **None directly** – This allows makers to import any solution without previously check for errors, security, and noncompliant aspects |
| **CMK** | **None** | The feature might be limited |
| **IP Firewall** | **None** | The feature might be limited |
| **LockBox** | **None** | The feature might be limited |
| **Extended backup (7 to 28 days)** | **None** | The feature might be limited |
| **DLP for desktop flows** | **None** | The makers are able to run the previously blocked actions |
| **Export to App Insights** | **None** | The feature might be limited |
| **Catalog in Power Platform** | **None** | The feature might be limited |

## Examples of commonly used settings for Managed Environments

If you're about to start activating ME features and based on the knowledge you acquired from the previous modules, it would be advisable to generate a comparable template to the one demonstrated below, for each environment group type.

:::row:::
    :::column:::
    **Default Environment**
    :::column-end:::
    :::column:::
    **Developer Environment**
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    Limit Sharing: Exclude sharing with limit total individuals to 20
    Solution Checker: Block with activated the sending emails
    Usage Insights: Activated
    Maker Welcome content: Customized including the link to learn more
    ![ME Settings for Default Environments](../media/mae/image20.png)
    :::column-end:::
    :::column:::
    Limit Sharing: Don't set limits
    Solution Checker: Warning without the sending emails
    Usage Insights: Deactivated
    Maker Welcome content: Customized including the link to learn more
    ![ME Settings for Developer Environments](../media/mae/image21.png)
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
    **Sandbox Environment**
    :::column-end:::
    :::column:::
    **Production Environment**
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    Limit Sharing: Don't set limits
    Solution Checker: Warning without the sending emails
    Usage Insights: Activated
    Maker Welcome content: Customized including the link to learn more
    ![ME Settings for Sandbox Environments](../media/mae/image22.png)
    :::column-end:::
    :::column:::
    Limit Sharing: Don't set limits
    Solution Checker: Block with activated the sending emails
    Usage Insights: Activated
    Maker Welcome content: Customized including the link to learn more
    ![ME Settings for Production Environments](../media/mae/image23.png)
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    **Teams Environment**
    :::column-end:::
    :::column:::
    :::column-end:::
:::row-end:::
:::row:::
    :::column:::
    Limit Sharing: Don't set limits
    Solution Checker: Block with activated the sending emails
    Usage Insights: Activated
    Maker Welcome content: Empty without the link to learn more
    ![ME Settings for Teams Environments](../media/mae/image24.png)
    :::column-end:::
    :::column:::
    :::column-end:::
:::row-end:::

## How to use Manage Environment feature together with CoE Starter Kit

Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit reflects our customer obsession through experimentation and innovation with an open-source low-code model influenced by customer feedback. Managed Environments continues our customer obsession - and over time will replace certain features in the CoE Starter Kit. Whilst the evolution of Managed Environments continues, new experiments and innovations are added to the CoE Starter Kit to gauge admin interest.

The CoE Starter Kit offers a comprehensive set of features to administer, govern and nurture Power Platform adoption. Some of these features in the CoE kit overlap with Managed Environments features, which raises the question of how organizations should use the CoE Starter Kit and/or Managed Environments features. Our recommendation is to start with the out of the box capabilities in Power Platform admin center and Managed Environments. The built-in product capabilities are robust and fully supported. And if you discover you need more capabilities to govern your tenant, check if features in the CoE Starter Kit can complement what you get out of the box.

This guide provides the reader with some base concepts, but it depends on each organization and their governance processes to find the best hybrid model that suits their needs.

The CoE Starter Kit uses publicly available APIs and actions to apply guardrails in the governance process. These processes are asynchronous and happen reactively. For instance, if an organization needs to restrict sharing capabilities to 20 users, the CoE can only react after the limit has been exceeded, possibly resulting in noncompliant assets in the organization. On the other hand, Managed Environments use private APIs built into the product that allow for restriction of limits before they're passed, making it possible to have a fully compliant policy. Whilst Managed Environments continues its evolution based on customer feedback, but also based on learnings from customers using the CoE Starter Kit, there may be partial overlaps in features that are available. It isn't the intent of the CoE Starter Kit to replicate or duplicate features that exist in Managed Environments, instead the CoE Starter Kit focuses on new innovation and addressing currently unmet customers asks to gauge feedback on what’s needed next and to continue to inspire our customers and product evolution. 

There are many features that the CoE Starter Kit enables organizations to use that aren't currently possible with Managed Environments, and vice versa. In this document, we focus on the features that have an overlap with Managed Environments to allow you to make the best decision on the most suitable approach for your tenant. Additionally, we recommend getting an overview of all the notable features the CoE Kit has to offer by [following this link](/power-platform/guidance/coe/overview).

The following table offers a simple comparison between features of Managed Environment and CoE Starter Kit.

| **Feature** | **CoE Starter Kit** | **Observations** |
|:---:|:---:|:---:|
| **Maker Welcome** | Partially | In Managed Environments, admins can provide customized welcome content to help their makers get started with Power Apps. When the welcome content is enabled, upon signing into Power Apps, Makers are greeted with customized Getting started information. A similar concept in the CoE Starter Kit is welcome email, which sends an email to new Makers only after they've created an app, flow, or bot for the first time. This means that makers may get necessary information only after they've created their first resource, whereas the Managed Environments feature shows them information when they sign into Power Apps. ME is the only one with communication in the Maker Studio. ME also allows you to tailor the welcome message per environment, whereas the CoE kit only has one welcome message across all environments. |
| **Limit Sharing** | Not real time (Reactive) | Admins can set sharing limits in the kit, but they can't be proactively enforced. Sharing limits in the CoE kit are used to send compliance notifications and reminders to Makers only. |
| **Usage Insights** | Yes | Both solutions have good visualization of the inventory and usage insights. One advantage of the CoE kits reporting is that it combines your telemetry and inventory data with data about your tenant from Azure Active Directory, allowing you to find your most active Makers by department/city/country/etc. Additionally, as reporting happens through a Power BI template you can slice and dice the data based on your requirements and use Power BI row-level security to share dashboards with other admin groups. Learn more: [CoE Power BI Dashboard - Power Platform &#124; Microsoft Learn](/power-platform/guidance/coe/power-bi) |
| **Data Policies** | Yes | Kit has a DLP impact tool that is useful to understand the impact of activating a certain DLP |
| **Weekly Digest** | Partially | The CoE Starter Kit doesn't have a weekly digest for admins, instead admins self-serve information through the Power BI dashboard. Inactive apps and flows are highlighted in the Weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the inactivity notification process, which notifies Makers of their inactive resources and asks for approval to delete them. One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights thus allowing admins to act. The CoE kit provides more capabilities, which can reduce the burden on the admins dealing with inactive resources, as the CoE can direct resource management to the Maker thus making the owner responsible for their own resources. |
| **Pipelines in Power Platform** | Partially | Part of the CoE Kit, exists another Kit called ALM Accelerator for Power Platform that has similar features of Pipelines for Power Platform including some extensibility for integration between both solutions. |
| **Solution Checker** | No | Since these solutions are tightly integrated with the product, there isn’t a way for the Kit to support those. |
| **IP Firewall** | No | |
| **Block cookie reply attacks** | No | |
| **CMK** | No | |
| **Lockbox** | No | |

## Conclusion

In summary, Managed Environments in Power Platform offer a powerful suite of tools for organizations looking to streamline their development processes while ensuring compliance with internal policies and best practices. With features like Pipelines, DLP, and governance at scale through Maker Welcome and Solution checker, organizations can accelerate their professional development while protecting sensitive data and ensuring healthy solutions in the environment. Additionally, the platform offers robust data privacy and security measures through the Customer Managed Key feature and Microsoft's Lockbox feature, as well as extended backup capabilities for continuous availability of service.

Overall, Managed Environments in Power Platform provide a comprehensive solution for organizations looking to democratize application lifecycle management and achieve greater efficiency and compliance in their development processes. With more visibility, control, and less effort in the development process, organizations can make informed decisions about their development processes and ensure that internal policies and best practices are followed. Whether it's accelerating professional development, protecting sensitive data, or ensuring data privacy and security, Managed Environments in Power Platform offer significant value to organizations looking to optimize their development processes and achieve their business goals.
