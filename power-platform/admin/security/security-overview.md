---
title: Security overview
description: Learn how to manage security in the Power Platform admin center by using the available security features.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/10/2025
ms.custom: NewPPAC
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Security overview

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The **Security** > **Overview** page in the Power Platform admin center is designed to enhance your organization's security and streamline management. It provides a centralized location where you can view and manage security recommendations, assess your security score, and implement proactive policies to safeguard your organization.

Administrators can complete these tasks:

- **Assess your security score**: Use the security score to understand and improve your organization's security policies. The security score is shown on a qualitative scale (**Low**, **Medium**, or **High**). It helps you measure your organizational security position for Microsoft Power Platform and Dynamics 365 workloads.
- **Act on recommendations**: Identify and implement impactful recommendations that the system generates. These recommendations are based on best practices for improving a tenant's security score.
- **Manage proactive policies**: Manage proactive policies for governance and security.

## Prerequisite

To view your security score, you must turn on tenant-wide analytics. You can find instructions in [How do I turn on tenant-level analytics?](../tenant-level-analytics.md#how-do-i-turn-on-tenant-level-analytics)

> [!NOTE]
> After you turn on tenant-wide analytics, it might take up to 24 hours for the **Security** > **Overview** page to be populated with data. Until then, most sections of the page show the message "Calculating security score."

## Access the Security > Overview page

To access the **Security** > **Overview** page, you must have Microsoft Entra ID roles such as Power Platform administrator or Dynamics 365 administrator. Learn more about these roles in [Use service admin roles to manage your tenant](../use-service-admin-role-manage-tenant.md). Environment administrators can manage security and compliance features for owned environments by opening the **Security** page as explained in the following procedure.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select the page that you want to open. You can open pages for the overview, [data protection and privacy](data-protection-privacy.md), [identity and access management](identity-access-management.md), and [compliance](compliance.md).

> [!NOTE]
> - Only tenant administrators can access the scorecard and recommendations on the **Security** > **Overview** page.
> - Only tenant administrators can convert an environment to a managed type.
> - On every security page, features that apply to Managed Environments are marked with the following meter symbol:
>
>     :::image type="content" source="media/managed-environments-icon.png" alt-text="Symbol that indicates that a Managed Environment is required.":::

## Security score (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

The security score is calculated based on the security features that are turned on in your environment. It provides a measurement of your organizational security position for Microsoft Power Platform and Dynamics 365 workloads.

- **Qualitative scale**: The security score is shown on a qualitative scale that uses three assessment labels:

    - **Low**: For scores from 0 through 50
    - **Medium**: For scores from 51 through 80
    - **High**: For scores from 81 through 100

    The more security features are turned on in your environment, the higher your security score. The **Medium** and **High** assessment labels indicate that more recommended actions were taken and led to an improvement in the security position of the tenant.

- **Feature impact**: Each security feature is assigned a score, based on the feature's scope and the number of resources that are affected by turning it on or off. As new security features are added, the total possible score might change. Therefore, your overall score might be affected even if your settings remain the same.
- **Score calculation formula**: The security score is expressed as a percentage and is calculated by using the following formula:

    (*Your score* &divide; *Total possible score*) &times; 100

For example, your tenant has 10 environments, five Managed Environments and five non-Managed Environments. The following features are configured:

- **IP firewall**: Turned on in two of the 10 environments (2 points).
- **Tenant isolation**: Turned on in all 10 environments (10 points).
- **Environment security group**: Turned on in five of the 10 environments (5 points).

In this case, your total score is 2 &plus; 10 &plus; 5 = 17, and the total possible score is 30. Therefore, your security score is (17 &divide; 30) &times; 100 = 56.66%.

> [!IMPORTANT]
> - The security score is updated every 24 hours. Therefore, any action that is taken might take up to 24 hours to reflect the updated score.
> - The score calculation considers all environments, both Managed Environments and non-Managed Environments.
> - If there are no Managed Environments that you can take action on in the recommendation pane, no environments are listed.

## Turn on environment management to unlock full security benefits

To ensure your organization benefits from the complete suite of managed security features, each environment must be configured as a managed environment.

As an admin, you can now view the percentage of environments in your tenant that are currently unmanaged. This new experience allows you to convert environments from unmanaged to managed at scale—with just a few clicks.

1.	Select **Get started** to begin the conversion process. The **Get enhanced secrity features** pane appears.
1.	Select environments from the **Recommended environments** tab, which prioritizes environments based on data volume. Alternatively, switch to the **All eligible environments** tab to manually select environments you want to convert.
1.	Review and accept the terms and conditions.
1.	Select **Turn on environment management** to complete the conversion.

If you prefer to take this action later, select **Not now** to dismiss the prompt and revisit when ready.

By using environment management, you’re taking a proactive step toward stronger, more consistent security across your organization.

## Reactive governance through recommendations

The system generates various recommendations, based on common best practices that improve the security score of your tenant. Recommendations refer to actions or measures that the administrator can take to enhance the overall security status.

- Administrators are guided through an intuitive experience where they take relevant actions on environments, based on specific recommendations.
- Each recommendation shows the potential increase to the overall security score.

Although the recommendations span all environments, you can act on them only in Managed Environments. In the case of non-Managed Environments, you can turn on recommended features by opening the **Settings** page, finding the required feature, and turning it on for those environments.

## Conditions that trigger feature recommendations

The following table outlines the conditions that trigger specific feature recommendations.

| Feature | Scope | Condition that triggers recommendations |
|---------|-------|-----------------------------------------|
| Administrator privileges | Environment | Environments that have more than 10 administrators |
| Auditing | Environment | Environments where auditing is turned off |
| Customer Lockbox | Tenant | Tenants where Customer Lockbox is turned on, but that have no Managed Environments |
| Client application access control | Environment | Environments where auditing is turned on and client application access control isn't configured |
| Data policy | Tenant | No tenant-level policy is set. |
| Environments Azure Virtual Network | Environment | Environments that have no Virtual Network policy |
| Environment security group | Environment | Environments that have no security group |
| Guest access | Environment | Environments where restricted guest access is turned off |
| IP firewall | Environment | Environments where IP firewall isn't configured |
| IP address-based cookie binding | Environment | Environments where IP address-based cookie binding isn't configured |
| Sharing | Environment | Environments that have no sharing limit |
| Tenant isolation | Tenant | The tenant isolation setting is turned off. |

## Manage proactive policies for governance and security

Several security features are available to help secure your tenant. For some of these features, a Managed Environment is a prerequisite. Therefore, before you can configure such a feature, you're asked to convert the environment to a managed type if it isn't one.

Use the following links to view and manage proactive policies for governance and security:

- [Data protection and privacy](data-protection-privacy.md): Ensure that personal information is securely handled, stored, and protected; prevent unauthorized access to data; and protect apps and cloud workloads from network-based cyberattacks through features such as [customer-managed keys](../customer-managed-key.md), data policies, and Azure Virtual Network.
- [Identity and access management](identity-access-management.md): Ensure that authorized users are the only people who can access sensitive data in items across the tenant, through features such as IP firewall, IP address-based cookie binding, tenant isolation, environment security groups, sharing controls, and guest access.
- [Compliance](compliance.md): Implement robust compliance measures to safeguard organizational data and ensure adherence to industry regulations, through features such [Customer Lockbox](../about-lockbox.md) and auditing.

## Dismiss recommendations
Administrators now have the ability to dismiss security recommendations that have been mitigated through alternative solutions. Previously, unaddressed recommendations could result in a stagnant security score, despite proactive measures taken outside the recommended solutions.

Dismissed recommendations no longer negatively impact the security score, ensuring an accurate reflection of the organization's security posture.

Your dismissed recommendations are always accessible, meaning that you can review their history at any time. If circumstances change or you wish to revisit a previously dismissed recommendation, you can easily reactivate it to ensure continuous security optimization.

To dismiss a recommendation, complete the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Overview**.
1. The **Overview** page appears. Scroll down to the **Take action to increase your security score** section.
1. In the **Active** tab, select the recommendations that you want to dismiss.
1. Select the **X** icon to dismiss the recommendation.
1. The **Dismiss** window is displayed. Select a reason for dismissing the recommendation from the dropdown list. Then select **Dismiss**.

    The recommendation moves to the **Dismissed** tab.

To make a recommendation active again, complete the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Overview**.
1. The **Overview** page appears. Scroll down to the **Take action to increase your security score** section.
1. Select the **Dismissed** tab.
1. Select the recommendation that you want to make active.
1. Select the **Arrows** icon to make the recommendation active.

    The recommendation moves to the **Active** tab.
  
## Manage security settings at an environment group-level
Managing Power Platform at scale presents challenges for IT teams overseeing numerous environments. To streamline security governance, administrators can configure security settings at the *environment group* level, ensuring uniform enforcement of policies across all environments within a group.

Currently, security management at the environment group-level is available for **Sharing** features, with plans to extend support to additional security capabilities in the near future. This structured approach simplifies administration, enhances security, and optimizes large-scale environment management for both startups and enterprises.

To configure security settings at the environment group-level, complete the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Overview**.
1. The **Overview** page appears. Scroll down to the **Take action to increase your security score** section.
1. Select a recommendation.
1. In the pane that is displayed, select the **Environment groups** tab and the **Environments** tab to select the environment groups or environments to which you want the security setting applied.
1. Select the **Manage sharing** button.

    > [!Note]
    > The name of the button is determined by the security setting you're applying. In this specific example, we're applying a **Sharing** security setting, that's why **Manage sharing** is the name of the button mentioned in this step.
    >
    > Selected settings are applied to all the environments in that environment group.

## Provide feedback

Every security page includes a **Feedback** button in the lower-right corner. Select this button to open a Microsoft Form where you can submit feedback and suggestions about the **Security** page and related features.

## Frequently asked questions (FAQ)

### How is the security score calculated?

The security score is calculated based on the security features that are turned on in your environment. Each security feature is assigned a score, based on the feature's scope and the number of resources that are affected by turning it on or off. It's important to note that the total possible score might change as new security features are added. Therefore, your overall security score might be affected even if your settings remain the same.

### Why don't all environments appear in the recommended action?

Although the recommendations span all environments, you can act on them only in Managed Environments. In the case of non-Managed Environments, you can turn on recommended features by opening the **Settings** page, finding the required feature, and turning it on for those environments.

### Can customers modify the recommendations based on their needs?

No. The recommendations are system-generated and are based on Microsoft best practices and guidance.

### When can the security score be updated after I take recommended actions?

After you take action to turn on the feature, it might take up to 24 hours to reflect the overall security score. The security score isn't updated in real time.

### Why don't administrator privileges work for environment administrators, such as the System Administrator role?

This issue is a known limitation. Only tenant administrators can manage the administrator privileges.
