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
 
 To use Security Hub in your tenant, turn on tenant-level analytics. To turn on tenant-level analytics, see [How do I enable tenant-level analytics?](../tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics).   

The Security Hub landing page takes 48 hours to populate all the insights, as shown below, and until then, most sections on the page display “Not available”.

:::image type="content" source="media/full-image.jpg" alt-text="this is the description of the full-image.":::
 
If you don't turn on tenant-level analytics, no data is displayed in the **Security** wep part of the page.
 
:::image type="content" source="media/No-data.png" alt-text="No-data.":::

 ## Security posture management for your Tenant
 Security posture is a set of custom or predefined profiles you can create for you SAAS applications or public cloud services from cyber-attacks. 
 
 **Calculating your security posture**
 
Security score is a numerical summary of your organization's security posture based on systems recommendations, user behavior, and other security-related measurements. It is a measurement of organization security posture, with a higher number indicating more recommended actions taken, thereby improving the overall security posture of the organization. 

 
Your security score is calculated as a sum of your achieved impact score over total possible impact score. 

****Formula**: Total Achieved Impact / Total Possible Impact**

 **Calculating your feature impacts**

Each feature is assigned an impact score based on the feature scope (Tenant or Environment), and the number of resources that will be impacted by enabling/disabling the feature. 

 :::image type="content" source="media/feature.png" alt-text="feature.":::

 
Example: 
Tenant w/ 10 Environments (5 Managed, and 5 Non-Managed Environments) 


 :::image type="content" source="media/feature-1.png" alt-text="feature-1.":::

Maximum Impact: 55 

Assume the following: 

- Tenant Isolation is enabled (10)
- At least one DLP policy is configured on the tenant (10)
- 5 of 10 Environments have a Security Group. 
- 2 of 10 Environments have IP Firewall. 
- 3 of 10 Environments have IP Cookie Bindings. 
- Customer Lockbox is Off. 
 
Based on the hypothetical state above, the achieved score is: 10 + 10 + 5 + 2 + 3 or 30 

Given the formula: Total Achieved Impact / Total Possible Impact 

Secure Score = 30 / 55 
 
**Note** : The advisor can have more recommendations than the number of environments in the tenant because an environment can have multiple recommendations, 1: many relationships. For example, an environment can have a recommendation to enable IP Firewall and IP Cookie binding both.

 ## Reactive governance through recommendations

 The system generates various recommendations which will improve the security posture of your tenant. Recommendations refer to actions or measures that the administrator can 
 take to enhance their overall security stance. 
 - System generated recommendations can be acted upon by **directly clicking on the link** under the recommended action of that feature.
 - If you are configure features outside of the recomendation then this can be done by click on the '**manage**' button.
   
 Recommendations are provided at 
 
- Tenant level
- Environment level

**Note**: You may see a different set of environments when you follow the recommended action vs the Manage” workflow. The reason being, recommendations will show all environments (manages as well as not managed) vs when user tries to manage their environments, the tab contains only managed environments and, this is true only for features that require managed environments 

 ## Manage proactive policies for goveranance and security
 
Security hubs offer a variety of security features that will help secure your tenant. Some of the features it has to offer is as below 

**Tenant Isolation**: This is a feature that is enabled at the tenant level for both managed and unmanaged environments. Tenant isolation allows Global administrators and Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant. For more information, refer to  [tenant isolation](../cross-tenant-restrictions.md). 

**Customer Lockbox:** This feature is applicable to only managed environments. Customer Lockbox provides an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft. For more information, refer to [Customer Lockbox](../about-lockbox.md)

**IP Firewall:**  This feature is applicable to only managed environments with dataverse. The IP firewall helps to protect your organizational data by limiting user access to Microsoft Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. For more information, refer to [IP Firewall](../ip-firewall.md).

**IP address-based cookie binding:** This feature is applicable to only managed environments with dataverse. It prevent session hijacking exploits in Dataverse with IP address-based cookie binding. For more information, refer to IP address-based [cookie binding](../block-cookie-replay-attack.md).

**Data Policy:** This feature is applicable at both tenant level and at environment level to both managed and un-managed environments. Setting up DLP at the environment or tenant level will act as guardrails to help reduce the risk of users from unintentionally exposing organizational data. For more information, refer to [Data Policy](../wp-data-loss-prevention.md).

**Environment security group:** This feature is applicable to both managed and un-managed environments. Setting up security groups will help control which licensed users can access environment. To learn how to add a use to the Security group and more, refer to Environment [security group](../control-user-access.md).

**Environement Azure Vnet:** This feature is applicable to only managed environments. Setting up Azure Vnet will help you integrate Power Platform with resources inside your 
 virtual network without exposing them over the public interne. For more information, refer to  [environment Azure Vent](../vnet-support-overview.md).

 **Auditing:** This feature is applicable to only managed and un-managed environments with Dataverse. Auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing 
 also logs user access through an app or through the SDK in an environment. For more information, refer to [Auditing](../manage-dataverse-auditing.md).



  ## FAQ

**When will the security hub be available for GCC?**

Security hub will be available in GCC post GA

**Would be the customer able to customize the recommendations or parameters based on their needs?**

The recommendations are system generated, that are based on Microsoft's best practices and guidance.




 
  
  

 








 





 

