---
title: Activating Managed Environments
description: Learn about activating the features of Managed Environments.
author: rsantos00
ms.component: pa-admin
ms.topic: overview
ms.date: 09/29/2023
ms.author: rstand
ms.reviewer: sericks
ms.custom: bap-template
ms.subservice: guidance
contributors:
    - RobStand
---

# Activating Managed Environments

This white paper addresses the key features of Managed Environments and how organizations and administrators can be benefited activating these capabilities.

> [!NOTE]
> You can save or print this white paper by selecting **Print** from your browser, and then selecting **Save as PDF**.

## Managed Environments overview

Managed Environments is a suite of premium governance capabilities that allows IT administrators to manage Power Platform at scale with more control, more visibility, and less effort. Admins can use Managed Environments with any type of environment. Certain features can be configured upon enabling a Managed Environment. Once an environment is managed, it unlocks more features across the Power Platform. 

You'll learn about each of the features and examples based on organizations that have activated Managed Environments, including:

 - **Pipelines in Power Platform** bring application lifecycle management (ALM) automation to streamline development processes with reduced effort.
 - **Maker welcome content** provides customized welcome message to help makers in the organization get started with Power Apps.
 - **Limit Sharing** adds guardrail on how broadly users can share canvas apps.
 - **Usage Insights** keeps admins informed about apps usage and users activities via weekly digest email.
 - **Data policies** can be easily identified and accessed for Managed Environment.
 - **Solution Checker** enforces rich static analysis validations during solution imports.
 - **IP Firewall** protects organizational data by limiting user access to Dataverse from allowed IP locations.
 - **IP cookie binding** prevents session hijacking exploits in Dataverse with IP address-based cookie binding.
 - **Customer Managed Key (CMK)** offers added data protection to encrypt your data using the encryption key from your own key vault.
 - **Lockbox** provides an interface for customer approval to data access requests from Microsoft Support.
 - **Extended backup** allows extended backup retention period from 7 days to up to 28 days.
 - **DLP for desktop flow** governs desktop flow models and individual models actions in Power Automate.
 - **Export data to Azure Application Insights** helps diagnose and troubleshooting issues related to errors and performance.
 - **Catalog in Power Platform** promotes collaboration and productivity via sharing Power Platform artifacts at scale.
 - **Default environment routing** automatically direct new makers into their own personal developer environments. 
   
More information: [Enable Managed Environments](/power-platform/admin/managed-environment-enable)


### Pipelines in Power Platform

Pipelines in Power Platform aim to democratize application lifecycle management practices for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service in a manner that's more approachable for all makers, admins, and developers. More information: [Overview of pipelines in Power Platform](../../alm/pipelines.md)

It's common in organizations for IT administrators or members of the governance team to provide support on how solutions should be deployed to different environments, administrators can centrally manage and govern pipelines, providing makers with intuitive user experiences and easily deploying their solutions.

To deploy a solution from one environment to another via pipelines, typically specified as the _source environment_ and _target environment_, you need to identify which environments are part of the pipelines. The most common pipeline is composed of Dev/Test/Production environments, or Dev/Validation/Test/Production. Here's an example of a pipeline:

:::image type="content" source="media/mae/image1.png" alt-text="A screenshot of the Pipelines screen in Power Apps.":::

> [!NOTE]
> Is recommended to enable all environments, within a pipeline, as Managed Environments but the **Developer type environment are optional** and can be used in the pipeline without being activated as Managed Environment. 

It's a best practice for personal productivity solutions to be developed in a personal, development environment, which then can be deployed to target environment via pipelines. You may also consider settings up pipelines when creating new environments to facilitate ALM for citizen-led and pro-dev-led projects at scale. 


### Maker welcome content

In Managed Environments, admins can provide customized, welcome content to help their makers get started with [Power Apps](https://make.powerapps.com/). More information: [Enable maker welcome content](../../admin/welcome-content.md).

A customized welcome content allows admins to inform makers about the company rules and what can be done in each environment or group of environments when first time a maker visits [Power Apps](https://make.powerapps.com). Here are some suggestions on how your organization could use the welcome message for each of the environment types.

#### Default environment 
The default environment is often the most restricted environment with DLPs and sharing controls. To ensure your makers know about the possible limitations, a good starting point is to create a customized welcome message and include a link to your organization’s policy website or document.

For example, admins may want to inform makers that the default environment is intended to be used only for Office 365 related features, not to use production applications in the default environment, and the canvas app should only be shared with limited number of individuals. Below illustrates how to configure such customized message in the Managed Environment setting pane:

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
In addition, a **Learn more** link can also be customized: 

:::image type="content" source="media/mae/image3.png" alt-text="A screenshot of Power Apps showing the Getting Started pop-up.":::

Based on the configuration example mentioned above, here's what the maker welcome message looks like:

:::image type="content" source="media/mae/image2.png" alt-text="A screenshot of the Welcome message in Power Apps.":::


#### Production environments

Production environments are typically used for deploying solutions that support enterprise applications and team productivity applications. In this case, it's important to have compliant apps and data. Since you need to control which users have access to the production environment, it's beneficial to inform the user if you have a policy of refreshing access. According to the use case, you might allow more connectors and increase the sharing limits. Depending on your support team, you can also use this message to inform the right team to support the makers.

An example of a proposed message for an environment created for the Finance department in Europe could be:

:::image type="content" source="media/mae/image4.png" alt-text="A screenshot of Power Apps showing the Getting Started pop-up for a production environment.":::

#### Developer environments

Developer environments are often used for developers to build their solutions. Since the developers are working on the application, it isn't in production and the scalability is limited. Normally, the environment has more relaxed DLPs due to the nature of the makers. To avoid the developers using this type of environment with production assets, limit the sharing capabilities and use a specific DLP for this type of environment. An example of a maker onboarding message might look like the following image.

:::image type="content" source="media/mae/image5.png" alt-text="A screenshot of Power Apps showing the Getting Started pop-up for a developer environment.":::

#### Sandbox Environments

Typically sandbox environments are used when testing a solution. Due to some tests involving a significant number of users, these environments scale to a certain point and have more capacity than a developer environment. It's also common to use a sandbox environment as a development environment, which is typically shared by multiple developers.

An example of a maker onboarding message is shown in the following image.

:::image type="content" source="media/mae/image6.png" alt-text="A screenshot of Power Apps showing the Getting Started pop-up for a sandbox environment.":::

Now that you have seen some examples of how to use the welcome message, it's important that you adapt, based on your organizational needs.

> [!TIP]
> Using images that identify the environment type or owners is very good for user adoption and error prevention.

### Limit sharing

In Managed Environments, admins can limit how broadly users can share canvas apps. More information: [Limit sharing](../../admin/managed-environment-sharing-limits.md)

An important aspect of limit sharing is the fact that the limit only applies to future sharing actions. This means that if you apply a sharing limit of 20 to an existing environment with apps already shared with more than 20 users, those apps continue to work for all users the apps were previously shared with. It's recommended to have a process to inform all the makers of apps shared with more than the new limit to reduce the number of users the apps were shared with, and, in some cases, the administrator might move the solution to another environment.

There are different situations that you need to control how makers share their apps across your organization. Here are the most common scenarios and reasons:

- **Limit app sharing in a personal productivity environment.** If you have an environment where users can create apps for their own work, apps without global business value, or apps without support from IT, it's important that you limit those apps for only the makers and not share those apps across the organization. You may have apps that start as personal productivity apps, but later become popular and are transformed into widely used apps. In this scenario, be mindful about the limit you configure. A common limitation is between 5 and 50 users.

- **Avoid apps being shared with security groups or everyone.** By sharing with security groups, you're allowing all members of the group to run the app. For instance, if you are in a developer environment, you might want to make sure that the developer is in control of how the apps are shared, instead of relying on membership of the group. In other scenarios, you might want to limit the sharing to everyone. In organizations, where the sharing of apps is regulated by a Security Group that is managed by the IT department, it may be advisable to restrict makers from sharing with Security Groups other than those that have been preconfigured by the IT department.

Here are common scenarios of sharing limits in the different environment types:

| Environment Type|Sharing limits|
|----------------|-------------------|
|Default|Choose **Exclude sharing with security groups**, select the **Limit total individuals who can share to** check box, and select **20** for the value.|
|Developer| Choose **Exclude sharing with security groups**, select the **Limit total individuals who can share to** check box, and select **5** for the value.|
|Sandbox| Choose **Exclude sharing with security groups** and leave the **Limit total individuals who can share to** checkbox clear. This option also enables IT to manage a particular Security Group that includes all users authorized to run the application. <br><br>If the maker, user, or team has the ability to manage which users are permitted to test, choose **Don't set limits (default)**.|
|Production|Choose **Don't set limits (default)**. If you want to control based on a specific Security Group, choose **Exclude sharing with security groups** and leave the **Limit total individuals who can share to** checkbox clear. |

Currently, the limit sharing capabilities are for canvas apps only. 


### Usage insights

Admins or preconfigured users can stay informed about what’s happening in their Managed Environments. These insights contain analytics about top apps, most impactful makers, and inactive resources you can safely clean up. These insights are generated and delivered to your mailbox once a week. More information: [Usage insights](/power-platform/admin/managed-environment-usage-insights)

If you're ever wondering which apps are the most popular (with the most runs) or which apps or flows you should consider cleaning, the weekly digest on Managed Environments is helpful. Every week the information is aggregated from all the Managed Environments you have configured and sent to your email. 

Usage insights enable administrators to have a summary view of apps and flows activity in the environments, the links provided in the email also allow directly to the resource for in depth analysis. 

It's common for decentralized IT teams to use this email to inform the different admins of what is happening with their Managed Environment, making recipient management an important task to follow. Due to the limited number of recipients you can configure, use an email distribution list, such as [HR_Admins@contoso.com](mailto:HR_Admins@contoso.com)  or [Finance_Admins@contoso.com](mailto:Finance_Admins@contoso.com), and manage the recipients on the distribution list.

### Data policies

In Managed Environments, admins can easily identify all the data policies that are applied to the environment. More information: [Data policies](../../admin/managed-environment-data-policies.md)

With a well-planned environment strategy, it's imperative to have a DLP strategy in place. DLPs dictate which connectors are available and which ones can be used with each other. It's possible for multiple DLPs to be active in the same environment, but the most restrictive DLP will take precedence. For example, if one DLP allows the use of connector A and another DLP blocks the use of connector A, the connector is blocked.

It's common for environments to have multiple DLPs applied, particularly in scenarios where DLPs are applied by region, country, department, or team within the same environment. It's crucial to have a clear visualization of all DLPs applied to a specific environment, and this can be achieved by ensuring that the environment is managed. 

### Solution checker

In Managed Environments, admins can easily enforce rich static analysis checks on your solutions against a set of best practice rules and identify problematic patterns. More information: [Solution checker enforcement in Managed Environments](/power-platform/admin/managed-environment-solution-checker)

Users with permission to install solutions in environments, such as those with the Environment Maker role, can import solutions using various methods, including manually import solution from the maker portal or using pac command line input(CLI). It's common for a Center of Excellence (CoE) team to set up guardrails to reduce the risk of noncompliant solutions in the environment. In organizations with decentralized CoEs, it's often necessary to activate this feature along with sending an email to proactively reach out to makers and offer support.

This feature allows for different levels of control, including None, Warn, and Block. Each level allows administrators to configure the impact of the check, whether it's to provide a warning but allow the import, or to block the import altogether, while also providing information to the maker about the result of the import.

Organizations using this feature have different configurations depending on the environment type. It's normal to have exceptions, and this guidance should always be aligned with your needs. However, the most common scenarios for the solution checker in different environments are as follows:


|Environment Type|Solution checker|
|------------------|-------------|
|Default |Choose **Block** and select the **Send emails**  check box.|
|Developer|Choose **Warn** and leave the **Send emails** check box clear.|
| Sandbox | Choose **Warn** and leave the **Send emails** check box clear.|
| Production| Choose **Block** and select the **Send emails** check box.|
|Teams Environment|Choose **Block** and select the **Send emails** check box.|

### IP firewall

The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. More information: [IP firewall in Power Platform environments](../../admin/ip-firewall.md)

By default, all Dataverse data can be accessed using the API from any IP address, secured by authentication. It's common in organizations to restrict access to some allowed sources, mitigating insider threats like data exfiltration.

When this feature is enabled, the IP address is being analyzed in real time and blocked in case it isn't allowed. For example, requests with a stolen access token to Dataverse from outside allowed IP ranges, are validated against the allowed IP range and the attempt is denied in real time.

Organizations tend to activate IP firewall and configure it to allow connections from their office premises and to restrict connections coming from outside. The best practice is to use it together with conditional access to avoid inconsistent policies and dependencies.

> [!TIP]
> If you've misconfigured these policies, you might need to request assistance from Microsoft Support. You might limit access in Power Apps from users outside of the allowed IPs and limit Power Automate actions that have been previously allowed.

### IP cookie binding (block cookie reply attacks)

Customers can prevent session cookie exploits with IP address-based cookie binding. More information: [Block cookie replay attacks in Dataverse](../../admin/block-cookie-replay-attack.md).

If you have a stolen session cookie from an authorized computer that has cookie IP binding enabled, then once the exploiter tries to use the cookie from a different computer to gain unauthorized access to Dataverse, the attempt is blocked, and an error message is shown asking the user to reauthenticate.

The user is asked to reauthenticate in the following scenarios:

- When any VPN client is turned on or off
- When connecting to a wireless hotspot
- When the Internet connection is reset by the Internet service provider
- When a router is reset or restarted

Organizations enable the IP cookie-based binding in cases where they want to restrict the network traffic to come only from one IP address for the user, and if there is a change, it reauthenticates the user with the new IP address (let’s say if the user connects to a VPN network).

### Customer-managed key (CMK)

Customers have data privacy and compliance requirements to secure their data by encrypting their data at-rest. This secures the data from exposure in an event where a copy of the database is stolen. With data encryption at-rest, the stolen database data is protected from being restored to a different server without the encryption key. More information: [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)

The customer-managed key (CMK) is being used by organizations, which need to meet laws and regulations around security and data confidentially, for example, signing confidential data with their own key. Using this feature, organizations guarantee that only they have access to the key to decrypt the information, restricting access to anyone without the encryption key, including Microsoft. Organizations with CMK also have strict procedures to protect and renew the encryption key.

CMK offers more advantages compared to the bring-your-own-key (BYOK) feature, such as having the ability to use different or multiple encryption keys for separate environments and better management of your encryption key in your own key vault. Upgrading BYOK to customer-managed key opens up your environments to all other Power Platform services that use non-SQL storage. For example, customer insights and analytics, larger file upload sizes, more cost effective audit storage with audit retention, elastic table services, Dataverse search, and long-term retention are available. Organizations using BYOK are recommended to migrate to CMK.

This feature has been highly anticipated by customers with Dynamics 365 environments, since in most cases it contains confidential and secret information related to finance, healthcare, or business secrets.

### Lockbox

Most operations, support, and troubleshooting performed by Microsoft personnel (including sub-processors) don't require access to customer data. However, in rare situations, accessing limited customer data is required for investigation purposes. Microsoft has a multi-layered internal approval process to grant access to customer data in these cases. Customers who are following compliance and regulatory requirements need extra control over who or when Microsoft can access their data. With Power Platform Customer Lockbox, customers can review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. That gives full control over the data access to the customer.

With Lockbox activated, when data access is required for a ticket resolution, the Global administrators and Power Platform administrators receive a Lockbox request for approval. After the approval, the Microsoft personnel will have access to the data within the boundary of the environment that the request came for. Access is time bound and it isn't automatically renewed - every time data access is needed, a new Lockbox request is sent to the administrators. All updates to Lockbox requests are automatically recorded in the audit log. More information:[Lockbox in Power Platform](/power-platform/admin/about-lockbox)

### Extended backup (7 to 28 days)

It's important to protect your data in Power Platform and Dataverse and provide continuous availability of service. If you use Power Platform to create production environments that have a database and Dynamics 365 applications enabled, you can benefit from the system back-ups that are automatically performed for those environments. The system back-ups are stored for up to 28 days. Therefore, you can restore your environment if there are any issues.

For production environments that don't have Dynamics 365 applications enabled, the default, back-up retention period is only seven days. However, for Managed Environments, admins can use PowerShell to change the setting and extend the back-up retention period. The available options are 7, 14, 21, and 28 days. More information: [Back up and restore environments](/power-platform/admin/backup-restore-environments)

The ability to change the back-up retention period is useful for Managed Environments that don't have Dynamics 365 applications enabled. Organizations are using this extension to retain the back-up for a longer period, getting more flexibility and security for their data. It also helps with accidental data deletion scenarios or restores the system after a complex deployment that failed.

The following PowerShell command can be used to extend the back-up to different retention periods.

```PowerShell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod -EnvironmentName 6B29FC40-CA47-1067-B31D-00DD010662DA -NewBackupRetentionPeriodInDays 28
```

## DLP for desktop flows

Power Automate allows you to create and enforce DLP policies that classify desktop flow modules and individual, module actions such as _Business_, _Nonbusiness_, or _Blocked_. This categorization prevents makers from combining modules and actions from different categories into a desktop flow, or between a cloud flow and the desktop flow it uses. The enforcement of DLP policies for desktop flows are enforced if the desktop flow is in a Managed Environment. More information: [Manage data loss prevention (DLP) policies](/power-automate/prevent-data-loss)

By default, action groups for desktop flows don’t appear when a DLP policy is being created. The admin needs to activate the **Desktop flows actions in DLP** tenant setting in the Power Platform admin center.

:::image type="content" source="media/mae/image17.png" alt-text="Screenshot of the DLP for desktop flows setting in the Power Platform admin center.":::

The default environment allows everyone to be a maker and take advantage of desktop flows in Windows. However, it's important to have a DLP strategy for desktop flows, just as one would for cloud flows. This is to ensure compliance with organizational policies. For example, if an organization is blocking the running of scripts on user PCs, it's important to prevent makers from creating desktop flows with a **Run Script** action. Similarly, if an organization is limiting the usage of the HTTP connector, it would be relevant to block similar actions for desktop flows to ensure compliance.

By having a DLP strategy for desktop flows, organizations can ensure that their data remains secure and that their policies are being followed, even in the context of desktop flows.

To assess the impact on your desktop flows, you can use the DLP impact analysis tool from the automation kit. More information: [DLP impact analysis for desktop flows](/power-automate/guidance/automation-kit/dlp-impact-analysis)

### Export data to Azure Application Insights

Application Insights can be set up to receive telemetry on diagnostics and performance captured by the Dataverse platform. This telemetry provides information that can be used to diagnose and troubleshoot issues related to errors and performance. Application Insights is part of the Azure Monitor ecosystem and is widely used by enterprises for monitoring and diagnostics. More information: [Overview of integration with Application Insights](/power-platform/admin/overview-integration-application-insights)

Organizations that have widely used apps or Power Automate flows are using this feature to get more control of their assets. The following image shows the count and average duration of each operation for a model-driven app. This information is useful to identify those operations that most affect users.

:::image type="content" source="media/mae/image18.png" alt-text="Application Insights Performance panel.":::

Organizations with Dataverse environments use the data stream to monitor performance of data related to Dataverse API incoming calls, Dataverse plug-in execution calls, and Dataverse SDK calls. It also provides data for failures in plug-in and Dataverse SDK operations.

For Power Apps insights, organizations can monitor cloud flow executions. Together with filters, it's possible to detect any flow that is failing and create alerts for notifications.

The following example shows how to create a custom alert to filter for a specific cloud flow’s failure. For more examples, see [Set up Application Insights with Power Automate](../../admin/app-insights-cloud-flow.md).

```kusto
let myEnvironmentId = **'Insert your environment ID here**;
let myFlowId = **Insert your flow ID here** ';
requests
| where timestamp > ago(**1d**)
| where customDimensions ['resourceProvider'] == 'Cloud Flow'
| where customDimensions ['signalCategory'] == 'Cloud flow runs'
| where customDimensions ['environmentId'] == myEnvironmentId
| where customDimensions ['resourceId'] == myFlowId
| where success == false
``````

### Catalog in Power Platform

The catalog in Power Platform is a centralized location where makers and developers can find, create, submit, approve, store, discover, and acquire solutions and templates. It allows them to crowd-source and find Power Platform templates and code components within their organization easily, and get started with templates that provide immediate value. The catalog also provides a central location for admins to store and maintain power platform artifacts, with management capabilities and approval workflows to ensure compliance with regulatory and statutory requirements.

Makers and developers can create solutions and templates with useful configuration points, and submit them to the catalog to help their colleagues solve business problems. Admins and line-of-business approvers can review and approve these submissions. The catalog serves as a single source of truth for power platform artifacts that can be curated and controlled to accelerate value for makers and developers. Overall, the catalog in Power Platform streamlines the process of finding, creating, and sharing solutions and templates, making it easier for organizations to solve business problems and achieve their goals. More information: [Catalog in Power Platform](/power-platform/developer/catalog)

Organizations are using the catalog in Power Platform to allow developers and makers to easily find and use templates and code components within their organization. It also provides a central location for admins to store and maintain power platform artifacts, with management capabilities and approval workflows to ensure compliance with regulatory and statutory requirements. The process of using the catalog in Power Platform is a continuous cycle of five steps:

1. Create
1. Submit
1. Approve and store
1. Discover
1. Acquire

Organizations that encourage developers and makers to build and share components and templates on the Power Platform can derive more value from it. Simply building isn't enough. Sharing these artifacts, at scale, can foster communities and support groups that can unlock value from a diverse set of personnel within the organization. Successful organizations adopt a fusion team model where pro-developers, makers, and admins work together to help their fellow employees derive the highest value possible from the platform, by reusing components and templates.

## Default environment routing

Default environment routing is a premium, governance feature. This feature allows Power Platform admins to automatically direct *new makers* into their own, personal developer environments when they visit [Power Apps](https://make.powerapps.com) for the first time. Default environment routing offers new makers a personal, safe space to build with Microsoft Dataverse, without the fear of others accessing their apps or data. More information: [Default environment routing](/power-platform/admin/default-environment-routing)

## Considerations for Managed Environments

Managed Environments are a set of features designed to make governance of the Power Platform easier by giving more control and requiring less effort from admins, which is something that many organizations have been eagerly anticipating. Multiple organizations have their own governance processes that were influenced by the CoE Starter Kit, while others are using the out-of-the-box features of the kit and extending it to meet their specific needs. For organizations using the kit, it's important to maintain an internal process to update it monthly and follow the suggestions presented in the [CoE Starter Kit Office Hours](https://aka.ms/coeofficehours). Power CAT is the team responsible for the CoE Starter Kit, and is community driven, hence not covered with the same service level agreement (SLA) as the licensed products. Customers are advised to interact using the [GitHub site](https://github.com/microsoft/coe-starter-kit/issues) to report bugs, ask questions, or request new features.

When using Managed Environments, you're using in-product features that are managed by Microsoft, so you don't need to update or maintain any of these features, and they're updated with the release waves of the Power Platform, or more announcements throughout the year. When you use in-product features, you also receive full support through Microsoft Support, if needed.

The engineering team for Managed Environments has worked closely with [Power CAT](https://aka.ms/whoispowercat) to identify the features mostly used in the CoE Starter Kit and onboard them in the product. This has created a situation where some features are available in both places. If you're currently using the CoE Starter Kit, it's important to have a hybrid strategy. Using the CoE Starter Kit to expand the governance features included in Managed Environments is the recommended approach, where organizations first use the Managed Environment feature and then use the kit to fulfill more needs.

Having a transition plan is a valuable exercise that can help ensure a smooth and successful outcome. It's important to understand what steps to take when transitioning away from Managed Environments.

The following list shows the impact caused by deactivating Managed Environments.

| Feature| Makers Impact | Admin Impact |
|:---:|:---:|:---:|
| Maker Welcome | None directly – Will stop seeing the welcome message when users enter the environment. | None directly – Won't be able to define customized messages in environments. |
| Limit Sharing | None directly – Will be able to share the apps with security groups and any user they want. | None directly – Won't be able to control how the apps are being shared in the respective environment. |
| Usage Insights| None| Will stop receiving the weekly email about the insights of the environment and impacting anyone who was configured as recipients. |
| Data Policies | None | None directly – the DLPs are enforced to the environments, but the admin doesn't have the modern experience capability to apply many DLPs to a specific environment. |
| Pipelines in Power Platform| Can't use the previously configure pipelines. | None|
| Solution Checker | None | None directly – This allows makers to import any solution without a check for errors, security, and noncompliant aspects. |
| CMK | None | The feature will be limited. |
| IP Firewall | None | The feature will be limited. |
| LockBox | None| The feature will be limited. |
| Extended backup (7 to 28 days)| None | The feature will be limited. |
| DLP for desktop flows | None | The makers are able to run the previously blocked actions. |
| Export to App Insights | None | The feature will be limited. |
| Catalog in Power Platform | None | The feature will be limited. |

## Examples of commonly used settings for Managed Environments

If you're about to start activating Managed Environment features, consider options for each environment group type. The following sections provide examples.

### Default environment
- **Limit sharing**: Exclude sharing with limit total of 20 individuals
- **Solution checker**: Block and send emails
- **Usage insights**: On
- **Maker welcome content**: Customized, including the link to learn more

### Developer environment
- **Limit sharing**: Don't set limits
- **Solution checker**: Warn and don't send emails
- **Usage insights**: Off
- **Maker welcome content**: Customized, including the link to learn more

### Sandbox Environment
- **Limit sharing**: Don't set limits
- **Solution checker**: Warn and don't send emails
- **Usage insights**: On
- **Maker welcome content**: Customized, including the link to learn more

### Production environment
- **Limit sharing**: Don't set limits
- **Solution checker**: Block and send emails
- **Usage insights**: On
- **Maker welcome content**: Customized including the link to learn more

### Teams environment
- **Limit sharing**: Don't set limits
- **Solution checker**: Block and send emails
- **Usage insights**: On
- **Maker welcome content**: No content or learn more link

## How to use the Managed Environment feature with CoE Starter Kit

Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit reflects our customer obsession through experimentation and innovation with an open-source, low-code model influenced by customer feedback. Managed Environments  are planned to eventually replace certain features in the CoE Starter Kit. While the evolution of Managed Environments continues, new experiments and innovations are added to the CoE Starter Kit to gauge admin interest.

The CoE Starter Kit offers a comprehensive set of features to administer, govern, and nurture Power Platform adoption. Some of the features in the CoE kit overlap with Managed Environments features, which raises the question of how organizations should use the CoE Starter Kit with Managed Environments features. Our recommendation is to start with the default capabilities in the Power Platform admin center and Managed Environments. The built-in product capabilities are robust and fully supported. If you discover that you need more capabilities to govern your tenant, check if features in the CoE Starter Kit can complement what you get out-of-the-box.

Each organization, along with their governance processes, needs to find the best hybrid model that suits their requirements.

The CoE Starter Kit uses publicly available APIs and actions to apply guardrails in the governance process. These processes are asynchronous and happen reactively. For instance, if an organization needs to restrict sharing capabilities to 20 users, the CoE can only react after the limit has been exceeded, possibly resulting in noncompliant assets in the organization. On the other hand, Managed Environments use private APIs built into the product that allow for restriction of limits before they're passed, making it possible to have a fully compliant policy. While Managed Environments continues its evolution based on customer feedback, but also based on learnings from customers using the CoE Starter Kit, there may be partial overlaps in features that are available. It isn't the intent of the CoE Starter Kit to replicate or duplicate features that exist in Managed Environments, instead the CoE Starter Kit focuses on new innovation and addressing currently unmet customers asks to gauge feedback on what’s needed next and to continue to inspire our customers and product evolution. 

There are many features that the CoE Starter Kit enables organizations to use that aren't currently possible with Managed Environments, and vice versa. In this document, we focus on the features that have an overlap with Managed Environments to allow you to make the best decision on the most suitable approach for your tenant. We recommend that you review [Center of Excellence (CoE) overview](../coe/overview.md).

The following table offers a simple comparison between features of Managed Environment and CoE Starter Kit.

| **Feature** | **CoE Starter Kit** | **Observations** |
|:---:|:---:|:---:|
| Maker Welcome | Partially | In Managed Environments, admins can provide customized welcome content to help their makers get started with Power Apps. When the welcome content is enabled, upon signing into Power Apps, makers are greeted with customized information about how to get started.<br><br>A similar concept in the CoE Starter Kit is the welcome email, which sends an email to new makers only after they've created an app, flow, or bot for the first time. This means that makers may get necessary information only after they've created their first resource, while the Managed Environments feature shows them information when they sign into Power Apps. Managed Environments is the only one with communication in the maker studio. Managed Environments also allows you to tailor the welcome message per environment, whereas the CoE kit only has one welcome message across all environments. |
| Limit Sharing | Not real time (Reactive) | Admins can set sharing limits in the kit, but they can't be proactively enforced. Sharing limits in the CoE kit are used to send compliance notifications and reminders to makers only. |
| Usage insights| Yes | Both solutions have good visualization of the inventory and usage insights. One advantage of the CoE Starter Kit's reporting is that it combines your telemetry and inventory data with data about your tenant from Microsoft Entra ID, allowing you to find your most active makers by department, city, or country. Additionally, as reporting happens through a Power BI template, you can slice and dice the data based on your requirements and use Power BI row-level security to share dashboards with other admin groups. Learn more: [Gain deep insights into your Microsoft Power Platform adoption with the CoE Power BI dashboard](../coe/power-bi.md) |
| Data Policies| Yes | The CoE Starter Kit has a DLP impact tool that is useful to understand the impact of activating a certain DLP. |
| Weekly digest | Partially | The CoE Starter Kit doesn't have a weekly digest for admins, instead admins self-serve information through the Power BI dashboard. Inactive apps and flows are highlighted in the weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the inactivity notification process, which notifies makers of their inactive resources and asks for approval to delete them. One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights that allow admins to take action. The CoE Starter Kit provides more capabilities, which can reduce the burden on the admins dealing with inactive resources, as the CoE can direct resource management to the maker and make the owner responsible for their own resources. |
| Pipelines in Power Platform | Partially | Part of the CoE Starter Kit contains another kit called **ALM Accelerator for Power Platform** that has similar features of pipelines for Power Platform including some extensibility for integration between both solutions. |
| Solution checker | No | Since these solutions are tightly integrated with the product, there isn’t a way for the CoE Starter Kit to support those. |
| IP Firewall | No | |
| Block cookie reply attacks | No | |
| CMK| No | |
| Lockbox | No | |

## Conclusion

Managed Environments with premium governance capabilities stand as a pivotal solution for IT admins tasked with managing and governing at scale. By providing a robust suite of tools and controls, it empowers governance teams in organizations to maintain a delicate balance between innovation and security. With granular access controls, streamlined solution deployment, and policy enforcement, Managed Environments offer the foundation for organizations to confidently harness the full potential of the Power Platform while ensuring compliance, data integrity, and optimal performance. In an era where data governance is paramount, these capabilities elevate the platform to be a cornerstone in modern enterprise IT strategies, fostering efficiency and peace of mind for administrators and stakeholders alike. 

### See also

[Power Platform white papers](index.md)