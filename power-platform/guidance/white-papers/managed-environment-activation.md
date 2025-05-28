---
title: Activating Managed Environments
description: Learn how your organization can use Power Platform Managed Environments to maintain a balance between innovation and security.
author: rsantos00
ms.component: pa-admin
ms.topic: overview
ms.date: 12/18/2024
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

This white paper describes the key features and capabilities of Managed Environments and their benefits for organizations and admins.

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
- [**Customer Lockbox**](#customer-lockbox) provides an interface where you can approve data access requests from Microsoft Support.
- [**Extended backup**](#extended-backup-7-to-28-days) extends the backup retention period from 7 days to up to 28 days.
- [**Export data to Application Insights**](#export-data-to-application-insights) helps with diagnosing and troubleshooting issues related to errors and performance.
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

:::image type="content" source="media/mae/image2.png" alt-text="Screenshot of the Welcome message for the default environment created by the first example.":::

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

:::image type="content" source="media/mae/image4.png" alt-text="Screenshot of the Welcome message for a production environment created by the second example.":::
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

It's common for environments to have multiple DLPs applied, particularly when DLPs are applied by country/region, department, or team in the same environment. It's crucial to have a clear visualization of all data policies that apply to an environment. The easiest way to accomplish that is to manage the environment. In Managed Environments, admins can easily identify all the DLPs that are applied.

### Solution checker enforcement

It's common for a Center of Excellence (CoE) team to set up guardrails to reduce the risk of users importing noncompliant solutions into an environment. In Managed Environments, admins can easily [enforce rich static analysis checks of solutions](/power-platform/admin/managed-environment-solution-checker) against a set of best practice rules to identify problematic patterns. Organizations with decentralized CoEs often find it necessary to activate solution checker enforcement along with proactively reaching out to makers by email to offer support.  

Solution checker enforcement offers three levels of control, None, Warn, and Block. Administrators configure the effect of the check, whether it provides a warning but allows the import or blocks the import altogether, while also providing the result of the import to the maker.

Organizations that use this feature configure it differently depending on the environment type. It's normal to have exceptions, and this guidance should always be aligned with your needs. However, here are the most common settings for solution checker enforcement in each environment type:

- Default: Select **Block** and **Send emails**.

- Developer: Select **Warn** and leave **Send emails** unselected.

- Sandbox: Select **Warn** and leave **Send emails** unselected.

- Production: Select **Block** and **Send emails**.

- Teams Environment: Select **Block** and **Send emails**.

### IP firewall

By default, all Dataverse data can be accessed through the API from any IP address, secured by authentication. Organizations commonly restrict access to allowed sources to mitigate insider threats like data exfiltration. The [IP firewall](../../admin/ip-firewall.md) in Managed Environments helps protect your organizational data in Dataverse by limiting user access to only from allowed IP addresses. The IP firewall analyzes the IP address of each request in real time and denies any from disallowed addresses.

Organizations often configure the IP firewall to allow connections from office premises and restrict connections coming from outside. The best practice is to use it together with conditional access to avoid inconsistent policies and dependencies.

> [!TIP]
> If you misconfigure these policies, you might need to request assistance from Microsoft Support. You might limit access in Power Apps from users outside of the allowed IPs and limit Power Automate actions that have been previously allowed.

### IP cookie binding (block cookie replay attacks)

[IP address-based cookie binding](../../admin/block-cookie-replay-attack.md) prevents session cookie exploits like cookie replay attacks in Managed Environments. If an attempt is made to access Dataverse on an unauthorized computer using a session cookie that's stolen from an authorized computer that has IP cookie binding enabled, the attempt is blocked and the user is asked to reauthenticate. The user must reauthenticate when:

- Any VPN client is turned on or off.
- Connecting to a wireless hotspot.
- The connection is reset by the Internet service provider.
- A router is reset or restarted.

### Customer-managed key

A [customer-managed key](/power-platform/admin/customer-managed-key) (CMK) is like a lock that you put on your storage unit. Rather than relying on how well the storage company guards the facility, you keep the key to your lock and decide who has access to your unit. Organizations that have to comply with laws and regulations around data security and confidentiality can secure their data by encrypting it at rest with their own key. If a copy of the data is stolen, it can't be restored on a different server without the encryption key.

When you use a CMK, you guarantee that only you have access to the key to decrypt the information. No one else can get access to your encrypted data without the encryption key, including Microsoft.

CMK offers advantages over the bring-your-own-key (BYOK) model. You can use different or multiple encryption keys for separate environments, and you can better manage your encryption key in your own key vault. Upgrading from BYOK to CMK also opens up your environments to all other Power Platform services that use non-SQL storage, such as customer insights and analytics, larger file upload sizes, more cost-effective audit storage with audit retention, elastic table services, Dataverse search, and long-term retention. If your organization is using BYOK, we recommend migrating to CMK.

Organizations that use CMK should have strict procedures to protect and renew their customer-managed encryption keys.

### Customer Lockbox

Most operations, support, and troubleshooting that Microsoft personnel perform don't require access to customer data. However, in rare situations, Microsoft personnel need limited access to customer data for investigational purposes. Microsoft has a multi-layered internal approval process to grant access to customer data when needed, but many organizations need or want more control over how Microsoft can access their data. With [Power Platform Customer Lockbox](/power-platform/admin/about-lockbox), customers can review, approve, and reject Microsoft data access requests.

When Customer Lockbox is activated and your support ticket requires us to have limited access to your data, your organization's Power Platform administrators receive a request. If it's approved, the Microsoft personnel who are working on your ticket have access to the data in the requested environment only, and only for a certain length of time. Moreover, their access isn't automatically renewed. Every time data access is needed, admins receive a new Customer Lockbox request. All requests and updates are automatically recorded in the audit log.

### Extended backup (7 to 28 days)

Regular, frequent backups protect your data in Power Platform and Dataverse from the risk of adverse events. If you use Power Platform to create production environments that have a Dataverse database and Dynamics 365 applications installed, those environments are [backed up automatically](/power-platform/admin/backup-restore-environments) and stored for up to 28 days. If a production environment doesn't have Dynamics 365 applications installed, back-ups are stored for seven days. However, for Managed Environments, admins can use the following PowerShell command to extend the back-up retention period to 14, 21, or 28 days:

```PowerShell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod -EnvironmentName <YourEnvironmentID> -NewBackupRetentionPeriodInDays 28
```

### Export data to Application Insights

[Application Insights](/power-platform/admin/overview-integration-application-insights) can receive diagnostics and performance data from Dataverse that you can use to diagnose and troubleshoot errors and performance issues. Organizations use Application Insights, a feature of [Azure Monitor](/azure/azure-monitor/overview), to get more control over their assets.

If you have Dataverse environments, you can use the data stream to monitor the performance of Dataverse API incoming calls, Dataverse plug-in execution calls, and Dataverse SDK calls, and to monitor failures in plug-in and Dataverse SDK operations. You can connect your apps to Application Insights to understand what users do with them, collect information to drive better business decisions, and improve the quality of the apps. For example, the following screenshot shows the count and average duration of each operation of a model-driven app. This information is useful in identifying operations that most affect the app's users.

:::image type="content" source="media/mae/image18.png" alt-text="Screenshot of the Application Insights Performance panel." lightbox="media/mae/image18.png":::

You can use Application Insights together with filters to detect any flow that's failing and create alerts. The following example shows how to create a custom alert and filter for failures in a specific cloud flow. For more examples, see [Set up Application Insights with Power Automate](../../admin/app-insights-cloud-flow.md).

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
```

### Catalog in Power Platform

The [catalog in Power Platform](/power-platform/developer/catalog/overview) is a central location where makers and developers can discover and share solutions, templates, and code components for reuse across the organization. It also provides a central location for admins to store and maintain Power Platform artifacts, with management capabilities and approval workflows to ensure compliance with regulatory and statutory requirements.

Makers and developers submit their solutions, templates, and components to the catalog to help their colleagues solve business problems. Admins and line-of-business approvers review and approve them. The catalog serves as a single source of truth for Power Platform artifacts, which can be curated and controlled to accelerate value for makers and developers. It streamlines the process of finding, creating, and sharing solutions and templates, making it easier for organizations to apply apps to business problems and achieve their goals.

Organizations that encourage developers and makers to build and share components and templates in the catalog derive more value from their investment in Power Platform. Simply building isn't enough. Sharing the artifacts, at scale, fosters communities and supports groups that can unlock value from a diverse set of personnel in the organization. In fact, organizations that are most successful with Power Platform adopt a fusion team model, where pro developers, makers, and admins work together to help their fellow employees derive the highest value possible from the platform by reusing solutions, templates, and components.

### Default environment routing

[Default environment routing](/power-platform/admin/default-environment-routing) is a premium governance feature that Power Platform admins can use to automatically direct new makers into their own personal developer environments the first time they visit [Power Apps](https://make.powerapps.com). Default environment routing offers new makers a personal, safe space to build with Microsoft Dataverse, without the fear of others accessing their apps or data.

## Considerations for using Managed Environments

You should keep a few things in mind when you're considering using Managed Environments.

### Governance: Managed Environments, CoE Starter Kit, or both?

Managed Environments is a set of features that's designed to make governance of Power Platform easier by giving more control to and requiring less effort from admins&mdash;something many organizations have eagerly anticipated. The governance processes of many organizations were influenced by the [CoE Starter Kit](/power-platform/guidance/coe/overview). Others are based on the kit's out-of-the-box features, extended to meet an organization's specific needs. Still others use the CoE Starter Kit to expand the governance features of Managed Environments.

The engineering team for Managed Environments worked closely with [Power CAT](https://aka.ms/whoispowercat), the team responsible for the Starter Kit, to identify the most-used features in the kit and add them to Managed Environments. As a result, some features are available in both products. When you use Managed Environments, in-product features are managed and supported by Microsoft. You don't need to update or maintain them&mdash;they're updated automatically with Power Platform release waves. If your organization uses the CoE Starter Kit, it's important to establish and maintain an internal process to update it monthly. Follow the suggestions presented in the [CoE Starter Kit Office Hours](https://aka.ms/coeofficehours).

The recommended approach is to use both&mdash;start with Managed Environments, and fill in any gaps with the Starter Kit. [How to decide whether to use Managed Environments with the CoE Starter Kit](#how-to-decide-whether-to-use-managed-environments-with-the-coe-starter-kit).

Since the kit is community-driven, it isn't subject to the same service level agreements as our licensed products. Go to the [GitHub site](https://github.com/microsoft/coe-starter-kit/issues) to report bugs, ask questions, and request new features.

### If you plan to deactivate Managed Environments

It's important to understand what happens if your organization stops using Managed Environments. The following table describes the effects on makers and admins.

| Feature | Maker impact | Admin impact |
|:---:|:---:|:---:|
| Maker welcome | Indirect: They stop seeing the welcome message when they enter the environment. | Indirect: They can't define customized welcome messages in environments. |
| Limit sharing | Direct: They can share their apps with any security groups and users. | Indirect: They can't control how apps in the environment are being shared. |
| Usage insights| None | Direct: They, and any other recipients, stop receiving the weekly email digest. |
| Data policies | None | Indirect: DLPs are enforced, but admins can't apply multiple DLPs to the environment. |
| Pipelines in Power Platform | Direct: They can't use the pipelines to deploy their solutions. | None |
| Solution checker enforcement | Indirect: They can import any solution without a check for errors, security, and noncompliant assets. | None |
| Customer-managed key | None | Indirect: The feature is limited. |
| IP firewall | None | Indirect: The feature is limited. |
| Customer Lockbox | None | Indirect: The feature is limited. |
| Extended backup (7 to 28 days)| None | Indirect: The feature is limited. |
| Export to App Insights | None | Indirect: The feature is limited. |
| Catalog in Power Platform | None | Indirect: The feature is limited. |

## Common settings for Managed Environments

If you're considering activating Managed Environments, you might find the following example settings for each type of environment useful:

- Default environment

  - **Limit sharing**: Exclude sharing with groups, limit sharing to 20 individuals
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Developer environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Warn and don't send emails
  - **Usage insights**: Off
  - **Maker welcome content**: Customized, including the link to learn more

- Sandbox environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Warn and don't send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Production environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Teams environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: No content or "learn more" link

## How to decide whether to use Managed Environments with the CoE Starter Kit

The CoE Starter Kit offers a comprehensive set of features to administer, govern, and nurture Power Platform adoption. It's a product of our experimentation and innovation with an open-source, low-code model that's heavily influenced by customer feedback. Some of its features overlap features of Managed Environments, and Managed Environments is planned to eventually replace some features of the kit. As Managed Environments is evolving, we're continuing to add new features to the kit to gauge interest. The CoE Starter Kit isn't intended to duplicate features that exist in Managed Environments. It focuses on innovation and addressing unmet customer requests as we gauge feedback on what's needed next.

You can use Managed Environments alone or with the CoE Starter Kit to administer and govern your adoption of Power Platform. How do you know which option to choose?

Our recommendation is to start with the default capabilities of the Power Platform admin center and Managed Environments. They're robust and fully supported. If you discover that you need more capabilities to govern your tenant, check whether the CoE Starter Kit can complement what you get out-of-the-box in Managed Environments. Every organization needs to find the best hybrid model that suits its requirements.

### CoE Starter Kit vs Managed Environments

Some important differences between the CoE Starter Kit and Managed Environments should be part of your consideration.

The CoE Starter Kit uses publicly available APIs and actions to apply guardrails on governance. Governance processes are asynchronous and happen reactively. Let's say your organization needs to restrict sharing of apps to 20 users. The CoE can only react after the limit is exceeded, possibly resulting in noncompliant assets. On the other hand, Managed Environments uses private APIs, built into the product, that enforce sharing limits before they're passed.

Managed Environments continually evolves based on customer feedback and learnings from customers who are using the CoE Starter Kit. Some features fully or partially overlap. Conversely, the Starter Kit has features that organizations can use to do things that aren't yet possible with Managed Environments, and vice versa. We recommend that you review the [Center of Excellence (CoE) overview](../coe/overview.md).

The following comparison of features of Managed Environments and the CoE Starter Kit should help guide your decisions.

**Managed Environments feature:** Maker welcome
**Available in CoE Starter Kit:** Partially

- In Managed Environments, admins can provide custom welcome content to greet makers on their first visit to Power Apps with information about how to get started. The CoE Starter Kit offers a welcome email that's sent to new makers only *after* they create their first app, flow, or bot.
- Managed Environments communicates with new makers directly in the maker studio. The CoE Starter Kit communicates only through email.
- Managed Environments allows admins to tailor the welcome message in each environment. The CoE Starter Kit has one welcome message across all environments.

**Managed Environments feature:** Limit sharing
**Available in CoE Starter Kit:** Not in real time (reactive)

Admins can set sharing limits in the Starter Kit, but they can't be proactively enforced. Sharing limits in the kit are used only to send compliance notifications and reminders to makers.

**Managed Environments feature:** Usage insights
**Available in CoE Starter Kit:** Yes

- Both solutions have good visualization of the inventory and usage insights.
- The CoE Starter Kit's reporting combines your diagnostics and inventory data with data about your tenant from Microsoft Entra ID, allowing you to find your most active makers by department, city, or country/region.
- The Starter Kit's reporting uses Power BI, which means that you can "slice and dice" the data based on your requirements and use Power BI row-level security to share dashboards with other admin groups. [Learn how to gain deep insights into your Power Platform adoption with the CoE Power BI dashboard](../coe/power-bi.md).

**Managed Environments feature:** Data policies
**Available in CoE Starter Kit:** Yes

The CoE Starter Kit includes a DLP impact tool that's useful in understanding the effect on an environment of activating or deactivating specific DLPs.

**Managed Environments feature:** Weekly digest
**Available in CoE Starter Kit:** Partially

- The CoE Starter Kit doesn't have a weekly digest for admins. Instead, admins get information from a Power BI dashboard.
- In Managed Environments, inactive apps and flows are highlighted in a weekly digest email. The CoE Starter Kit has an inactivity notification process, which notifies makers about their inactive resources and asks for approval to delete them.
- One of the main goals of both Managed Environments and the CoE Starter Kit is providing more insights that allow admins to take action. The CoE Starter Kit has the advantage here. It has capabilities that direct resource management to makers, making them responsible for their own resources and reducing the burden on admins.

**Managed Environments feature:** Pipelines in Power Platform
**Available in CoE Starter Kit:** Partially

Part of the CoE Starter Kit is another kit called **ALM Accelerator for Power Platform**, which has features similar to pipelines, including some extensibility for integration between both solutions.

**Managed Environments feature:** Solution checker enforcement
**Available in CoE Starter Kit:** No

Since these solutions are tightly integrated with the product, the CoE Starter Kit has no way to check them.

**Managed Environments feature:** IP firewall
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Block cookie replay attacks
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Customer-managed keys
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Customer Lockbox
**Available in CoE Starter Kit:** No

## Conclusion

Managed Environments with premium governance capabilities stands as a pivotal solution for IT admins who are tasked with managing and governing Power Platform adoption at scale. By providing a robust suite of tools and controls, it empowers governance teams to maintain a delicate balance between innovation and security. With granular access controls, streamlined solution deployment, and policy enforcement, Managed Environments offers the foundation for organizations to confidently harness the full potential of Power Platform while ensuring compliance, data integrity, and optimal performance. In an era where data governance is paramount, these capabilities make Power Platform a cornerstone in modern enterprise IT strategies, fostering efficiency and peace of mind for administrators and stakeholders alike.

## Related information

- [Power Platform white papers](index.md)
