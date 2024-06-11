---
title: Use the Security Hub in Power Platform admin center
description: Security hub in Power Platform admin center offers a consolidated experience that brings together all the best practices and the wide set of security features available to run your organizational workloads in the safest way possible.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/11/2024
author: jahnavisunil
ms.author: jasunil
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Use the Security Hub in Power Platform admin center
                                                  
Security hub in Power Platform admin center offers a consolidated experience that brings together all the best practices and the wide set of security features available to run your organizational workloads in the safest way possible. Security hub offers the the following advantages:

- **Security posture management**: Admins can understand and improve their organization’s security policies specific to their needs. 
- **Reactive governance through recommendations**: Admins can identify and act on the top-most, impactful recommendations to improve the posture. 
- **Proactive governance with security features**: Admins can use the rich set of tools and security capabilities available to gain deep visibility, detect threats, and proactively set policies in place to help safeguard the orgainization from vulnerabilities and risks.

## Turn on tenant-level analytics
 
To use Security Hub in your tenant, turn on tenant-level analytics. To turn on tenant-level analytics, see [How do I enable tenant-level analytics](../tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics).   

The Security Hub landing page takes 48 hours to populate all the insights, as shown below. Until the page is populated, most sections on the page display “Not available”.

:::image type="content" source="media/full-image.jpg" alt-text="this is the description of the full-image.":::
 
If you don't turn on tenant-level analytics, no data is displayed on the page.
 
:::image type="content" source="media/No-data.png" alt-text="No-data.":::

## Security posture management for your tenant
Security posture is a set of custom or predefined profiles you can create for you software as a service (SAAS) applications or public cloud services from cyber-attacks. 

### Calculating your security posture
 
Security score is a numerical summary of your organization's security posture based on system recommendations, user behavior, and other security-related measurements. It's a measurement of organizational security posture, with a higher number indicating more recommended actions taken, thereby improving the overall security posture of the organization. 

Your security score is calculated as a sum of your achieved impact score over total possible impact score. 

**Formula: Total achieved impact/Total possible impact**

### Calculating your feature impacts

Each feature is assigned an impact score based on the feature scope (tenant or environment), and the number of resources impacted by turning the feature on or off.

| Feature | Impact |
|---------|--------|
| IP firewall   |  1 x each environment    |       
| IP cookie bindings   |   1 x each environment    |       
| Environment security group   |   1 x each environment    |       
| Tenant data policies   |  Total number of environments    |       
| Tenant isolation   |  Total number of environments    |       
| Tenant Lockbox   |  If turned on, the total number of Managed Environments.<br>Zero if not turned on.<br>Zero if not turned on and there are no Managed Enviornments.    |       

Example: Tenant with ten environments (five Managed Environments and five non-Managed Environments) 

| Feature | Impact |
|---------|--------|
| IP firewall   |  1 x each environment    |  10 environments x 1 or 10   |  
| IP cookie bindings   |   1 x each environment    |   10 environments x 1 or 10   |      
| Environment security group   |   1 x each environment    |  10 environments x 1 or 10   |       
| Tenant data policies   |  Total number of environments    | 10 environments |      
| Tenant isolation   |  Total number of environments    | 10 environments |         
| Tenant Lockbox   |  If turned on, the total number of Managed Environments.<br>0 if not turned on.<br>0 if not turned on and there are no Managed Enviornments.    | 5 environments |   

Maximum Impact: 55 

Assume the following: 

- Tenant isolation is used (10)
- At least one data policy is configured on the tenant (10)
- 5 of 10 environments have a security group
- 2 of 10 environments have IP firewall
- 3 of 10 Environments have IP cookie bindings
- Customer Lockbox is off 
 
Based on the hypothetical state outlined above, the achieved score is: 10 + 10 + 5 + 2 + 3 or 30 

Given the formula: Total achieved impact/Total possible impact the Secure Score = 30/55 
 
> [!Note]
> The advisor can have more recommendations than the number of environments in the tenant because an environment can have multiple recommendations. There can be 1:many relationships. For example, an environment can have a recommendation to enable IP firewall and IP cookie binding.

## Reactive governance through recommendations

The system generates various recommendations which improve the security posture of your tenant. Recommendations refer to actions or measures that the administrator can take to enhance their overall security stance. 

- System-generated recommendations can be acted upon by selecting the link under the recommended action of that feature.
- To configure features outside of the recomendations, slect the **Manage** button.

Recommendations are provided at these levels:
 
- Tenant-level
- Environment-level

> [!Note]
> You may see a different set of environments when you follow the recommended actions than if you used the **Manage** workflow. This is because recommendations show _all_ environments (Managed Envrionments and non-Managed Environments). When a user tries to manage their environments, the tab contains only Managed environments and, this is true only for features that require Managed Environments.

## Manage proactive policies for goveranance and security
 
Security hubs offer a variety of security features that will help secure your tenant. Some of the features it has to offer is as below 

**Tenant isolation**: This is a feature that is turned on at the tenant-level for both Managed and non-Managed Environments. Tenant isolation allows global administrators and Power Platform administrators to govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more: [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md)

**Customer Lockbox:** This feature is applicable to only Managed Environments. Customer Lockbox provides an interface for customers to review and approve (or reject) data access requests on the rare occasions when access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, in response to a customer-initiated support ticket, or a problem identified by Microsoft. Learn more: [Securely access customer data using Customer Lockbox in Power Platform and Dynamics 365](../about-lockbox.md)

**IP firewall:**  This feature is applicable to only Managed Environments with Dataverse. The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. Learn more: [IP firewall in Power Platform environments](../ip-firewall.md)

**IP address-based cookie binding:** This feature is applicable to only Managed Environments with Dataverse. It prevent session, hijacking exploits in Dataverse with IP address-based cookie binding. Learn more: [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md)

**Data policy:** This feature is applicable at both tenant-level and environment-level to both Managed Environments and non-Managed Environments. Setting up data policies at the environment or tenant-level  acts as guardrails to help reduce the risk of users from unintentionally exposing organizational data. Learn more: [Data policies](../wp-data-loss-prevention.md)

**Environment security group:** This feature is applicable to both managed and un-managed environments. Setting up security groups will help control which licensed users can access environment. To learn how to add a use to the Security group and more, refer to Environment [security group](../control-user-access.md).

**Environement Azure Vnet:** This feature is applicable to only managed environments. Setting up Azure Vnet will help you integrate Power Platform with resources inside your 
 virtual network without exposing them over the public interne. For more information, refer to  [environment Azure Vent](../vnet-support-overview.md).

**Auditing:** This feature is applicable to only managed and un-managed environments with Dataverse. Auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment. For more information, refer to [Auditing](../manage-dataverse-auditing.md).


## FAQ

**When will the security hub be available for GCC?**

Security hub will be available in GCC post GA

**Would be the customer able to customize the recommendations or parameters based on their needs?**

The recommendations are system generated, that are based on Microsoft's best practices and guidance.




 
  
  

 








 





 

