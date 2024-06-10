---
title: Security Hub in Power Platform Admin Center
description: Description goes here.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/07/2024
author: mihaelablendea
ms.author: mihaelab
ms.reviewer: sericks
search.audienceType: 
  - admin
---

 # Security Hub in Power Platform Admin Center

 ## Overview                                                           
**Security Hub in Power Platform Admin Center** offers a consolidated experience that brings together all the best practices and the wide set of security features available to run your organizational workloads in the safest way possible. Security hub offers
- **Security posture management**: where admins can understand and improve their organization’s security policies specific to their needs. 
- **Reactive governance**: in the form of recommendations. identify and act on the topmost impactful recommendations to improve the posture 
- **Proactive governance**: utilizes the rich set of high values tools and security capabilities available to gain deep visibility, detect threats effectively, and proactively set policies in place to safeguard from vulnerabilities and risks.

 **Getting started** 
 
 To use Security Hub on your tenant, you will have to first enable ‘Tenant Level Analytics’. 
 Not enabling Tenant Level Analytics will cause no data to populate as shown below.
 
 :::image type="content" source="media/No-data.png" alt-text="No-data.":::
 
 To enable tenant analytics, click on the ‘Enable Tenant Analytics’ button in the below screenshot, click on the toggle and save. 
 
  :::image type="content" source="media/Analytics-toggle.png" alt-text="Analytics-toggle.":::

  
 The Security Hub landing page will take 48 hours to populate all the insights as shown below, and till then most sections on the home page will display “Not available”.

 
:::image type="content" source="media/full-image.png" alt-text="this is the description of the full-image.":::

 ## Security posture management for your Tenant
 In general security posture is a measure of the level of visibility you have into your asset inventory and attack surface. It’s a set of custom or predefined profiles you can create for you SAAS applications or public cloud services from cyber-attacks. Your security posture determines the cybersecurity strength level.  

 **Calculating your security posture**
 
 Security score is a numerical summary of your organization's security posture based on systems configurations, user behavior, and other security-related measurements. It is a measurement of organization security posture, with a higher number indicating more recommended actions taken, thereby improving the overall security posture of the organization. 

 
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
 
**Turning on a security feature**

The system will not prompt you any recommendations unless you turn on a security feature. 

Here is an example where the customer lockbox feature is not enabled. Click on “**Manage Customer Lockbox**” button to see the pop up as shown below 

 

Toggle the switch to enable it and hit save 


 ## Reactive governance for your tenant

 The system generates various recommendations which will improve the security posture of your tenant. Recommendations refer to actions or measures that the administrator can take to enhance their overall security stance. Recommendations are provided at 
 
- Tenant level
- Environment level 

 **Enable a recommendation**

Recommendations can be enabled via two entry points 
- By clicking on the direct link under the recommended action of that feature
- By clicking on the Manage button at the bottom of the tile 

Note: The following method is applicable to IP firewall, IP address- based cookie binding, Environment Security groups, Auditing, Client application access control, Administrator privileges and Environment Azure Vnet. Once above steps are performed, it opens another dialog box to allow you to choose all the applicable environment to which the feature can be enabled. 

 ## Manage proactive policies for goveranance and security
 
Security hubs offer a variety of security features that will help secure your tenant. Some of the features it has to offer is as below 

**Tenant Isolation**: This is a feature that is enabled at the tenant level for both managed and unmanaged environments. Tenant isolation allows Global administrators and Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant. For more information, refer to  [tenant isolation](../cross-tenant-restrictions.md). 

**Customer Lockbox:** This feature is applicable to only managed environments. Customer Lockbox provides an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft. For more information, refer to [Customer Lockbox](../about-lockbox.md)

**IP Firewall:**  This feature is applicable to only managed environments with dataverse. The IP firewall helps to protect your organizational data by limiting user access to Microsoft Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. For more information, refer to [IP Firewall](../ip-firewall.md).

**IP address-based cookie binding:** This feature is applicable to only managed environments with dataverse. It prevent session hijacking exploits in Dataverse with IP address-based cookie binding. For more information, refer to IP address-based [cookie binding](../block-cookie-replay-attack.md).

**Data Policy: **This feature is applicable at both tenant level and at environment level to both managed and un-managed environments. Setting up DLP at the environment or tenant level will act as guardrails to help reduce the risk of users from unintentionally exposing organizational data. For more information, refer to [Data Policy](../wp-data-loss-prevention.md).

**Environment security group:** This feature is applicable to both managed and un-managed environments. Setting up security groups will help control which licensed users can access environment. To learn how to add a use to the Security group and more, refer to Environment [security group](../control-user-access.md).



  ## FAQ

**Why do I see a different set of environments if I follow the recommended action vs the “Manage” workflow?**

This exists since recommendations will show all environments (manages as well as not managed) vs when user tries to manage their environments, this tab contains only managed environments.  Note: This is true only for features that require Managed Environments 

**Why are there more recommendation notifications than the number of environments?**

 The advisor can have more recommendations than the number of environments in the tenant because an environment can have multiple recommendations, 1: many relationships. For example, an environment can have a recommendation to enable IP Firewall and IP Cookie binding. 

 **What is the purpose of the security hub?**
 
The purpose of the security hub is to improve customer experience and manageability of security in the power platform.

**What is the main benefit of the security hub?**

The main benefit of the security hub is that it provides recommendations and assessments based on best practices to improve the security posture of the power platform.

**How does the security hub provide recommendations?**
The security hub evaluates the security configuration and policies of the tenant and the environments, and provides a summarized status and recommendations to improve the security posture. The recommendations are based on Microsoft's best practices and guidance.

**When will the security hub be available for GCC?**

GCC will be made available 90 days post  GA, Q1CY2025

**Would be the customer able to customize the recommendations or parameters based on their needs?**

It is not possible today, but it is a common feedback that will be considered for GA.




 
  
  

 








 





 

