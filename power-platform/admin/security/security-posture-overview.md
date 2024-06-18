---
title: Manage security
description: Learn how to manage security in the Power Platform admin center with security features available to run your organizational workloads in the safest way possible.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/18/2024
author: jahnavisunil
ms.author: jasunil
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Manage security
                                                  
The **Security** page in the Power Platform admin center offers a consolidated experience that brings together all the best practices and a wide set of security features available to run your organizational workloads in the safest way possible. Take advantage of the following capabilities:

- **Security assessment**: Admins can understand and improve their organization’s security policies specific to their needs. 
- **Reactive governance through recommendations**: Admins can identify and act on the top-most, impactful recommendations to improve the assessment. 
- **Proactive governance with security features**: Admins can use the rich set of tools and security capabilities available to gain deep visibility, detect threats, and proactively set policies in place to help safeguard the organization from vulnerabilities and risks.

## Prerequisite
 
To get insights into the security assessment and recommendations for your tenant, turn on tenant-level analytics. To turn on tenant-level analytics, see [How do I enable tenant-level analytics](../tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics).   

> [!Note]
> After the tenant-level analytics feature is turned on, it might take up to 48 hours to populate all the insights, as shown in the following image. Until the page is populated, most sections on the page display “Not available”.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. From the left-side menu, select **Security**.

    :::image type="content" source="media/full-image.jpg" alt-text="The Security Hub page with data.":::
 
    If you don't turn on tenant-level analytics, no data is displayed on the page.
 
    :::image type="content" source="media/No-data.png" alt-text="The Security Hub page when it doesn't show data.":::

## Security assessment for your tenant

The security assessment is illustrated on a qualitative scale with labels of _Standard_, _Enhanced_, or _Advanced_. The assessment is calculated based on system recommendations, user and maker activity, and security configurations already applied by the administrators. It's a measurement of your organizational security position for Power Platform workloads. _Enhanced_ and _Advanced_ assessment labels indicate that more recommended actions have been taken and the security position of the tenant is improved.

Your security assessment is calculated as a sum of your achieved impact over total possible impact. 

**Formula: Total achieved impact/Total possible impact**

Each feature is assigned an impact status based on the feature scope (tenant or environment), and the number of resources impacted by turning the feature on or off.

| Feature | Impact |
|---------|--------|
| IP firewall   |  1 x each environment    |       
| IP cookie bindings   |   1 x each environment    |       
| Environment security group   |   1 x each environment    |       
| Tenant data policies   |  Total number of environments    |       
| Tenant isolation   |  Total number of environments    |       
| Customer Lockbox   |  If turned on, the total number of Managed Environments.<br>Zero if not turned on.<br>Zero if not turned on and there are no Managed Environments.    |       

Example: Tenant with 10 environments (five Managed Environments and five non-Managed Environments) 

| Feature | Impact |  Maximum impact |
|---------|--------|----------------|
| IP firewall   |  1 x each environment    |  10 environments x 1 or 10   |  
| IP cookie bindings   |   1 x each environment    |   10 environments x 1 or 10   |      
| Environment security group   |   1 x each environment    |  10 environments x 1 or 10   |       
| Tenant data policies   |  Total number of environments    | 10 environments |      
| Tenant isolation   |  Total number of environments    | 10 environments |         
| Customer Lockbox   |  If turned on, the total number of Managed Environments.<br>0 if not turned on.<br>0 if not turned on and there are no Managed Environments.    | 5 environments |   

The maximum impact possible is 55. 

Assume the following information about an environment: 

- Tenant isolation is used (10)
- At least one data policy is configured on the tenant (10)
- 5 of 10 environments have a security group 
- 2 of 10 environments have IP firewall 
- 3 of 10 Environments have IP cookie bindings 
- Customer Lockbox is off 
 
Based on the example outlined above, the achieved status is: 10 + 10 + 5 + 2 + 3 or 30. Given the formula: **Total achieved impact/Total possible impact** the assessment is 30/55, which has a label of _Enhanced_. 
 
> [!Note]
> The advisor can have more recommendations than the number of environments in the tenant because an environment can have multiple recommendations. There can be one-to-many relationships. For example, an environment can have a recommendation to enable IP firewall and IP cookie binding.

## Reactive governance through recommendations

The system generates various recommendations based on common, best practices that improve the security assessment of your tenant. Recommendations refer to actions or measures that the administrator can take to enhance their overall security status. 

- System-generated recommendations can be acted upon by selecting the link under the recommended action of that feature.
- To configure features outside of the recommendations, select the **Manage** button.

## Manage proactive policies for governance and security
 
There are several security features that help secure your tenant, including:

- **Tenant isolation**: This is a feature that is turned on at the tenant-level for both Managed and non-Managed Environments. Tenant isolation allows global administrators and Power Platform administrators to govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more: [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md)

- **Customer Lockbox**: This feature is applicable to only Managed Environments. Customer Lockbox provides an interface for customers to review and approve (or reject) data access requests on the rare occasions when access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, in response to a customer-initiated support ticket, or a problem identified by Microsoft. Learn more: [Securely access customer data using Customer Lockbox in Power Platform and Dynamics 365](../about-lockbox.md)

- **IP firewall**:  This feature is applicable to only Managed Environments with Dataverse. The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. Learn more: [IP firewall in Power Platform environments](../ip-firewall.md)

- **IP address-based cookie binding**: This feature is applicable to only Managed Environments with Dataverse. It prevents session, hijacking exploits in Dataverse with IP address-based cookie binding. Learn more: [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md)

- **Data policies**: This feature is applicable at both tenant-level and environment-level to both Managed Environments and non-Managed Environments. Setting up data policies at the environment or tenant-level  acts as guardrails to help reduce the risk of users from unintentionally exposing organizational data. Learn more: [Data policies](../wp-data-loss-prevention.md)

    > [!Note]
    > As a best practice, we recommend implementing tenant-level policies for effective data protection. While it's possible to implement environment-level policies, note that the overall security status is only calculated for policies set at the tenant level.

- **Environment security group**: This feature is applicable to both Managed Environments and non-Managed Environments. Setting up security groups helps control which licensed users can access environments. Learn more: [Control user access to environments: security groups and licenses](../control-user-access.md)

- **Azure Virtual Network:** This feature is applicable to only Managed Environments. Setting up Azure Virtual Network helps you integrate Power Platform with resources inside your 
 virtual network without exposing them over the public internet. Learn more: [Virtual Network support for Power Platform overview](../vnet-support-overview.md)

    > [!Note]
    > Recommendations for Azure Virtual Netwroks aren't available in the current version, but are planned for future updates.

- **Auditing:** This feature is applicable to only Managed Environments and non-Managed Environments with Dataverse. Auditing log changes are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment. Learn more: [Manage Dataverse auditing](../manage-dataverse-auditing.md)

## Frequently asked questions (FAQ)

### When will the Security page be available for Government Community Cloud (GCC)?

The **Security** page is planned for availability in GCC after the general availability release.

### Can customers modify the recommendations or parameters based on their needs?

No. The recommendations are system-generated and are based on Microsoft's best practices and guidance.




 
  
  

 








 





 

