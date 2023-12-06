---
title: Activating Managed Environments
description: Learn how your organization can use Power Platform Managed Environments to maintain a balance between innovation and security.
author: rsantos00
ms.component: pa-admin
ms.topic: overview
ms.date: 12/05/2023
ms.author: rstand
ms.reviewer: sericks
ms.subservice: guidance
contributors:
  - RobStand
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:12/05/2023
---

# Activating Managed Environments

This white paper describes the key features and capabilities of Managed Environments and their benefits for organizations and administrators.

> [!NOTE]
> You can save or print this white paper by selecting **Print** from your browser, and then selecting **Save as PDF**.

## Managed Environments overview

Managed Environments is a suite of premium governance capabilities that allows IT administrators to manage Power Platform at scale with more control, more visibility, and less effort. Any type of environment can be managed. When an environment is managed, it unlocks more features across Power Platform. [Learn how to enable Managed Environments](/power-platform/admin/managed-environment-enable).

In this white paper, you'll learn about the following features and get examples based on organizations that have activated Managed Environments:

- [**Pipelines in Power Platform**](#pipelines-in-power-platform) apply application lifecycle management (ALM) automation to streamline development processes with reduced effort.
- [**Maker welcome content**](#maker-welcome-content) greets makers in the organization with a custom message to help them get started with Power Apps.
- [**Limit sharing**](#limit-sharing) adds a guardrail on how broadly users can share canvas apps.
- [**Usage insights**](#usage-insights) is a weekly digest email that keeps admins informed about app usage and users' activities.
- [**Data policies**](#data-policies) can be easily viewed and identified.
- [**Solution checker enforcement**](#solution-checker-enforcement) checks your solutions against a set of best practice rules to identify problematic patterns.
- [**IP firewall**](#ip-firewall) protects organizational data by limiting user access to Dataverse to allowed IP addresses.
- [**IP cookie binding**](#ip-cookie-binding-block-cookie-replay-attacks) prevents session hijacking exploits in Dataverse with IP address-based cookie binding.
- [**Customer-managed key**](#customer-managed-key) offers added data protection, encrypting your data using the encryption key from your own key vault.
- [**Lockbox**](#lockbox) provides an interface where you can approve data access requests from Microsoft Support.
- [**Extended backup**](#extended-backup-7-to-28-days) extends the backup retention period from 7 days to up to 28 days.
- [**DLP for desktop flow**](#dlp-for-desktop-flows) governs desktop flow models and individual model actions in Power Automate.
- [**Export data to Azure Application Insights**](#export-data-to-azure-application-insights) helps with diagnosing and troubleshooting issues related to errors and performance.
- [**Catalog in Power Platform**](#catalog-in-power-platform) promotes collaboration and productivity through sharing Power Platform artifacts at scale.
- [**Default environment routing**](#default-environment-routing) automatically directs new makers into their own personal developer environments.

### Pipelines in Power Platform

[Pipelines in Power Platform](../../alm/pipelines.md) bring ALM best practices, automation, and continuous integration and continuous delivery (CI/CD) capabilities to Power Platform and Dynamics 365 customers in a more approachable way.

It's common in organizations for IT administrators or members of the governance team to provide guidance on how solutions should be deployed to different environments. Centrally managed and governed pipelines provide makers with intuitive user experiences and easier deployment of their solutions.

To use pipelines to deploy a solution from one environment, typically specified as the *source environment*, to another, typically specified as the *target environment*, you need to identify which environments are part of the pipelines. The most common pipelines are composed of Dev/Test/Production or Dev/Validation/Test/Production environments. Here's an example of a pipeline:

:::image type="content" source="media/mae/image1.png" alt-text="Screenshot of a Dev/Test/Production pipeline in Power Apps.":::

We recommend making all environments in a pipeline Managed Environments, but development environments can be used in a pipeline without being managed.

As a best practice, personal productivity solutions should be developed in a personal development environment, from which they can be deployed to target environments using pipelines. You might also consider setting up pipelines when you create environments to facilitate ALM for both citizen-led and pro developer-led projects at scale.

### Maker welcome content

In Managed Environments, admins can provide [customized welcome content](../../admin/welcome-content.md) to help their makers get started with Power Apps. The custom welcome message can inform makers, the first time they visit Power Apps, about the company rules and what they can do in each environment or group of environments.

Here are some suggestions for how your organization might use the welcome message in each type of environment. Include an image that identifies the environment type or owners to help with user adoption and error prevention.

#### Default environment

The default environment is often the most restricted, with data loss prevention (DLP) policies and sharing controls. Create a welcome message that warns your makers about restrictions and possible limitations, and include a link to your organization's policy website or document.

For example, you might want to inform makers to use the default environment only for solutions that are related to Microsoft 365 applications, not to use production applications in the default environment, and to share their canvas apps only with a limited number of individuals. The following example shows how to create such a message in Managed Environments settings:

:::image type="content" source="media/mae/image3.png" alt-text="Screenshot of Maker welcome content settings in Power Apps.":::

```markdown
[Contoso](https://i.ibb.co/SNSTCx3/something.png)
## Welcome to Contoso Personal Productivity Environment

### Before you start, here are some considerations

Use this environment if you plan to build apps that integrate with Office 365.

Before you start, be aware of these limitations:

1. You can't share your apps with more than five users.
1. The data in Dataverse is shared with everyone in the organization.
1. You can only use Office 365 connectors.

If you're not sure you're in the right place, follow [this guidance**](#).
```

Here's the rendered welcome message:

:::image type="content" source="media/mae/image2.png" alt-text="Screenshot of the Welcome message for the default environment created by the first example.":::<!-- EDITOR'S NOTE: If it's possible, please recreate the screenshot using the edited welcome content for a more professional illustration. -->

#### Production environments

Production environments are typically used for deploying solutions that support the enterprise and team productivity. It's important that apps and data comply with organizational policies. Since you need to control which users have access to the production environment, it's a good idea to inform users if you have a policy of refreshing access. You might allow more connectors and increase the sharing limits in a production environment. You can also use the welcome message to inform makers of the right team to reach out to for support. The following example shows how to create such a message:

```markdown
[Contoso](https://i.ibb.co/SNSTCx3/something.png)
## Welcome to HR Europe Environment

### Before you start, here are some considerations

Use this environment if you're on the HR team and your data is located in Europe.

Before you start, be aware of these limitations:

1. You can only share apps with security groups. [Follow this process](#) to share your apps.
1. The data in Dataverse is stored in Europe.
1. You can only use social media connectors with read actions.
1. If you need more connectors, [submit a request](#).

If you're not sure you're in the right place, follow [this guidance**](#).
```

:::image type="content" source="media/mae/image4.png" alt-text="Screenshot of the Welcome message for a production environment created by the second example.":::<!-- EDITOR'S NOTE: If it's possible, please recreate the screenshot using the edited welcome content for a more professional illustration. -->

#### Developer environments

Developer environments are most often where developers build their solutions. Since the developers are working on the applications, they aren't in production and scalability is limited. Normally, dev environments have more relaxed DLPs due to the nature of the makers. To avoid developers using production assets in their dev environments, limit sharing capabilities and use a specific DLP for this type of environment. Here's an example of a welcome message for a development environment:

```markdown
[Contoso](https://i.ibb.co/SNSTCx3/something.png)
## Welcome to a Developer Environment

### Before you start, here are some considerations

Use this environment if you're a developer and you're building solutions.

Before you start, be aware of these limitations:

1. You can only share resources with up to two members of your team. If you need to share with more people, [submit a change request](#).
1. Use resources only while you're developing a solution.
1. Be mindful of the connectors and data you're using.
1. If you need more connectors, [submit a request](#).

If you're not sure you're in the right place, follow [this guidance**](#).
```

:::image type="content" source="media/mae/image5.png" alt-text="Screenshot of the Welcome message for a developer environment created by the third example.":::

#### Sandbox environments

Typically, sandbox environments are used to test solutions. Because some tests involve a significant number of users, these environments scale, up to a point, and have more capacity than a developer environment. Sandbox environments are also commonly used as development environments and are typically shared by multiple developers. Here's an example of a welcome message for such an environment:

```markdown
[Contoso](https://i.ibb.co/SNSTCx3/something.png)
## Welcome to a Test Environment

### Before you start, here are some considerations

Use this environment only if you're testing solutions.

Before you start, be aware of these limitations:

1. You can only share resources with your team. If you need to share with more people, [submit a change request](#).
1. You're not allowed to edit or import solutions directly in this environment.
1. Be mindful of the test data and compliance.
1. If you need help from a security export or IT support, [submit a request](#).

If you're not sure you're in the right place, follow [this guidance**](#).
```

:::image type="content" source="media/mae/image6.png" alt-text="Screenshot of the Welcome message for a sandbox environment created by the fourth example.":::

### Limit sharing

In Managed Environments, admins can [limit how broadly users can share canvas apps](../../admin/managed-environment-sharing-limits.md). The limit only applies to *future* sharing, however. If you apply a sharing limit of 20 to an environment with apps that are already shared with more than 20 users, those apps continue to work for all users the apps were shared with. You should have a process in place to inform the makers of apps that are shared with more than the new limit to reduce the number of users the apps are shared with. In some cases, you might decide to move the solution to another environment. Sharing limits apply to canvas apps only.

Admins typically need to control how makers share their apps when:

- **Apps are shared in a personal productivity environment.** If you have an environment where users can create apps for their own work, apps without global business value, or apps without support from IT, it's important that you not allow makers to share them across the organization. If apps start as personal productivity apps but later become popular and are widely used, be mindful about the limit you set on sharing. A common limit is between 5 and 50 users.

- **Apps are shared with security groups or everyone.** Apps that are shared with a security group can be run by all members of the group. In a developer environment, you might want the developer to control how apps are shared instead of relying on group membership. In other scenarios, you might want to allow sharing with everyone. If your organization's policy is that apps are shared with a security group that includes all users who are authorized to run the app and is managed by the IT department, you might want to restrict makers from sharing with other security groups.

Here are common sharing limits for each environment type:

- Default: Select **Exclude sharing with security groups**, select **Limit total individuals who can share to**, and select **20** for the value.
- Developer: Select **Exclude sharing with security groups**, select **Limit total individuals who can share to**, and select **5** for the value.
- Sandbox: Select **Exclude sharing with security groups** and leave **Limit total individuals who can share to** unselected. Use this option if apps are shared with an IT-managed security group that includes the users who are authorized to run the application. If the maker, user, or team can manage which users are permitted to test a solution, select **Don't set limits (default)**.
- Production: Select **Don't set limits (default)**. To control sharing based on a specific security group, select **Exclude sharing with security groups** and leave **Limit total individuals who can share to** unselected.

### Usage insights

Admins and authorized users can stay informed about what's happening in their Managed Environments with [usage insights](/power-platform/admin/managed-environment-usage-insights) and analytics, delivered in a weekly digest email. Find out which apps and flows are the most popular and which are inactive and can safely be cleaned up. Links in the email go directly to the resource for in-depth analysis.

Decentralized IT teams commonly use the weekly email to inform admins of what's happening with their Managed Environments, making recipient management an important task. The number of recipients is limited, so we recommend using an email distribution list like [HR_Admins@contoso.com](mailto:HR_Admins@contoso.com) instead of individual addresses.

### Data policies

A well-planned environment strategy includes robust [data policies](../../admin/managed-environment-data-policies.md). DLPs dictate which connectors are available and which ones can be used with each other. Multiple DLPs can be active in the same environment, but the most restrictive DLP takes precedence. If one DLP allows the use of connector A and another DLP blocks the use of connector A, the connector is blocked.

It's common for environments to have multiple DLPs applied, particularly when DLPs are applied by region, country, department, or team in the same environment. It's crucial to have a clear visualization of all data policies that apply to an environment. The easiest way to accomplish that is to manage the environment. In Managed Environments, admins can easily identify all the DLPs that are applied.

### Solution checker enforcement

It's common for a Center of Excellence (CoE) team to set up guardrails to reduce the risk of users importing noncompliant solutions into an environment. In Managed Environments, admins can easily [enforce rich static analysis checks of solutions](/power-platform/admin/managed-environment-solution-checker) against a set of best practice rules to identify problematic patterns. Organizations with decentralized CoEs often find it necessary to activate solution checker enforcement along with proactively reaching out to makers by email to offer support.  

Solution checker enforcement offers three levels of control, None, Warn, and Block. Administrators configure the effect of the check, whether it provides a warning but allows the import or blocks the import altogether, while also providing the result of the import to the maker.

Organizations that use this feature configure it differently depending on the environment type. It's normal to have exceptions, and this guidance should always be aligned with your needs. However, here are the most common scenarios for the solution checker in each environment type:

- Default: Select **Block** and **Send emails**.
- Developer: Select **Warn** and leave **Send emails** unselected.
- Sandbox: Select **Warn** and leave **Send emails** unselected.
- Production: Select **Block** and **Send emails**.
- Teams Environment: Select **Block** and **Send emails**.

### IP firewall

By default, all Dataverse data can be accessed through the API from any IP address, secured by authentication. Organizations commonly restrict access to allowed sources to mitigate insider threats like data exfiltration. The [IP firewall](../../admin/ip-firewall.md) in Managed Environments helps protect your organizational data in Dataverse by limiting user access to only from allowed IP addresses. The IP firewall analyzes the IP address of each request in real time and denies any from disallowed addresses.

Organizations often configure the IP firewall to allow connections from office premises and restrict connections coming from outside. The best practice is to use it together with conditional access to avoid inconsistent policies and dependencies.

> [!TIP]
> If you misconfigure these policies, you might need to request assistance from Microsoft Support. You might limit access in Power Apps from users outside of the allowed IPs and limit Power Automate actions that have been previously allowed.<!-- EDITOR'S NOTE: This isn't super-clear. Under what circumstances might readers need to get help from Microsoft? When you say "You might..." are you giving this as a reason to ask for help or suggesting something readers could do? -->

### IP cookie binding (block cookie replay attacks)

[IP address-based cookie binding](../../admin/block-cookie-replay-attack.md) prevents session cookie exploits like cookie replay attacks in Managed Environments. If an attempt is made to access Dataverse on an unauthorized computer using a session cookie that's stolen from an authorized computer that has IP cookie binding enabled, the attempt is blocked. The user is asked to reauthenticate when:

- Any VPN client is turned on or off.
- Connecting to a wireless hotspot.
- The connection is reset by the Internet service provider.
- A router is reset or restarted.

### Customer-managed key

A [customer-managed encryption key](/power-platform/admin/customer-managed-key) is like a lock that you put on your storage unit. Rather than relying on how well the storage company guards the facility, you keep the key to your lock and decide who has access to your unit. Customers who have data privacy and compliance requirements can secure their data by encrypting it at rest with their own key. If a copy of the data is stolen, it can't be restored to a different server without the encryption key.

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

By default, action groups for desktop flows don't appear when a DLP policy is being created. The admin needs to activate the **Desktop flows actions in DLP** tenant setting in the Power Platform admin center.

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

The following example shows how to create a custom alert to filter for a specific cloud flow's failure. For more examples, see [Set up Application Insights with Power Automate](../../admin/app-insights-cloud-flow.md).

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

Default environment routing is a premium, governance feature. This feature allows Power Platform admins to automatically direct _new makers_ into their own, personal developer environments when they visit [Power Apps](https://make.powerapps.com) for the first time. Default environment routing offers new makers a personal, safe space to build with Microsoft Dataverse, without the fear of others accessing their apps or data. More information: [Default environment routing](/power-platform/admin/default-environment-routing)

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

The CoE Starter Kit uses publicly available APIs and actions to apply guardrails in the governance process. These processes are asynchronous and happen reactively. For instance, if an organization needs to restrict sharing capabilities to 20 users, the CoE can only react after the limit has been exceeded, possibly resulting in noncompliant assets in the organization. On the other hand, Managed Environments use private APIs built into the product that allow for restriction of limits before they're passed, making it possible to have a fully compliant policy. While Managed Environments continues its evolution based on customer feedback, but also based on learnings from customers using the CoE Starter Kit, there may be partial overlaps in features that are available. It isn't the intent of the CoE Starter Kit to replicate or duplicate features that exist in Managed Environments, instead the CoE Starter Kit focuses on new innovation and addressing currently unmet customers asks to gauge feedback on what's needed next and to continue to inspire our customers and product evolution.

There are many features that the CoE Starter Kit enables organizations to use that aren't currently possible with Managed Environments, and vice versa. In this document, we focus on the features that have an overlap with Managed Environments to allow you to make the best decision on the most suitable approach for your tenant. We recommend that you review [Center of Excellence (CoE) overview](../coe/overview.md).

The following table offers a simple comparison between features of Managed Environment and CoE Starter Kit.

| **Feature** | **CoE Starter Kit** | **Observations** |
|:---:|:---:|:---:|
| Maker Welcome | Partially | In Managed Environments, admins can provide customized welcome content to help their makers get started with Power Apps. When the welcome content is enabled, upon signing into Power Apps, makers are greeted with customized information about how to get started.<br><br>A similar concept in the CoE Starter Kit is the welcome email, which sends an email to new makers only after they've created an app, flow, or bot for the first time. This means that makers may get necessary information only after they've created their first resource, while the Managed Environments feature shows them information when they sign into Power Apps. Managed Environments is the only one with communication in the maker studio. Managed Environments also allows you to tailor the welcome message per environment, whereas the CoE kit only has one welcome message across all environments. |
| Limit Sharing | Not real time (Reactive) | Admins can set sharing limits in the kit, but they can't be proactively enforced. Sharing limits in the CoE kit are used to send compliance notifications and reminders to makers only. |
| Usage insights| Yes | Both solutions have good visualization of the inventory and usage insights. One advantage of the CoE Starter Kit's reporting is that it combines your telemetry and inventory data with data about your tenant from Azure Active Directory, allowing you to find your most active makers by department, city, or country. Additionally, as reporting happens through a Power BI template, you can slice and dice the data based on your requirements and use Power BI row-level security to share dashboards with other admin groups. Learn more: [Gain deep insights into your Microsoft Power Platform adoption with the CoE Power BI dashboard](../coe/power-bi.md) |
| Data Policies| Yes | The CoE Starter Kit has a DLP impact tool that is useful to understand the impact of activating a certain DLP. |
| Weekly digest | Partially | The CoE Starter Kit doesn't have a weekly digest for admins, instead admins self-serve information through the Power BI dashboard. Inactive apps and flows are highlighted in the weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the inactivity notification process, which notifies makers of their inactive resources and asks for approval to delete them. One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights that allow admins to take action. The CoE Starter Kit provides more capabilities, which can reduce the burden on the admins dealing with inactive resources, as the CoE can direct resource management to the maker and make the owner responsible for their own resources. |
| Pipelines in Power Platform | Partially | Part of the CoE Starter Kit contains another kit called **ALM Accelerator for Power Platform** that has similar features of pipelines for Power Platform including some extensibility for integration between both solutions. |
| Solution checker | No | Since these solutions are tightly integrated with the product, there isn't a way for the CoE Starter Kit to support those. |
| IP Firewall | No | |
| Block cookie reply attacks | No | |
| CMK| No | |
| Lockbox | No | |

## Conclusion

Managed Environments with premium governance capabilities stand as a pivotal solution for IT admins tasked with managing and governing at scale. By providing a robust suite of tools and controls, it empowers governance teams in organizations to maintain a delicate balance between innovation and security. With granular access controls, streamlined solution deployment, and policy enforcement, Managed Environments offer the foundation for organizations to confidently harness the full potential of the Power Platform while ensuring compliance, data integrity, and optimal performance. In an era where data governance is paramount, these capabilities elevate the platform to be a cornerstone in modern enterprise IT strategies, fostering efficiency and peace of mind for administrators and stakeholders alike.

### See also

[Power Platform white papers](index.md)
