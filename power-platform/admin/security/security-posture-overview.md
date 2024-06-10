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

 
  :::image type="content" source="media/full-image.png" alt-text="full-image.":::

 ## Security posture management for your Tenant
 In general security posture is a measure of the level of visibility you have into your asset inventory and attack surface. It’s a set of custom or predefined profiles you can create for you SAAS applications or public cloud services from cyber-attacks. Your security posture determines the cybersecurity strength level.  

 **Calculating your security posture**
 
 Security score is a numerical summary of your organization's security posture based on systems configurations, user behavior, and other security-related measurements. It is a measurement of organization security posture, with a higher number indicating more recommended actions taken, thereby improving the overall security posture of the organization. 

 
Your security score is calculated as a sum of your achieved impact score over total possible impact score. 

**Formula: Total Achieved Impact / Total Possible Impact**

### How are feature impacts determined

Each feature is assigned an impact score based on the feature scope (Tenant or Environment), and the number of resources that will be impacted by enabling/disabling the feature. 

 
Example: 
Tenant w/ 10 Environments (5 Managed, and 5 Non-Managed Environments) 

Maximum Impact: 55 
Assume the following: 
•	Tenant Isolation is enabled (10)
•	At least one DLP policy is configured on the tenant (10)
•	5 of 10 Environments have a Security Group. 
•	2 of 10 Environments have IP Firewall. 
•	3 of 10 Environments have IP Cookie Bindings. 
•	Customer Lockbox is Off. 
 
Based on the hypothetical state above, the achieved score is: 10 + 10 + 5 + 2 + 3 or 30 
Given the formula Total Achieved Impact / Total Possible Impact 
Secure Score = 30 / 55 
 




## What is security posture?

In general security posture is a measure of the level of visibility you have into your asset inventory and attack surface. It’s a set of custom or predefined profiles you can create for you SAAS applications or public cloud services from cyber-attacks. Your security posture determines the cybersecurity strength level. 

## How do I get started?

To use Security Hub on your tenant, you will have to first enable ‘Tenant Level Analytics’. 
Not enabling Tenant Level Analytics will cause no data to populate as shown below 

<img width="446" alt="image" src="https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/4bbc636d-fda5-4ec7-85d9-56ef3802fc86">





To enable tenant analytics, click on the ‘Enable Tenant Analytics’ button in the below screenshot, click on the toggle and save. 

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/be718d7a-dc6b-43f3-aadb-486232aa2b7a)
 




The Security Hub landing page will take **48 hours** to populate all the insights as shown below, and till then most sections on the home page will display “Not available”

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/7d1f29cd-72d6-4ae7-85f5-bc565d52e2a6)

 

## What is a recommendation?

Security hub recommendations refer to actions or measures that the administrator can take to enhance their overall security stance. The benefits are as follows
• Adopt a proven recommendation engine which provides a generalized pattern for minting and managing recommendations. 

### Why are there more recommendation notifications than the number of environments?

 The advisor can have more recommendations than the number of environments in the tenant because an environment can have multiple recommendations, **1: many relationships**. For example, an environment can have a recommendation to enable IP Firewall and IP Cookie binding. 
In the image below, we see that there are 28 recommendations for 17 environments showing the 1: many relationships type scenario 

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/9f7f9734-3127-4949-93cf-e9a3a900fe52)



**Why do I see a different set of environments if I follow the recommended action vs the “Manage” workflow?**

This exists since recommendations will show all environments (manages as well as not managed) vs when user tries to manage their environments, this tab contains only managed environments.  Note: This is true only for features that require Managed Environments 

## How is your security posture calculated?

**Security score** is a numerical summary of your organization's security posture based on systems configurations, user behavior, and other security-related measurements. It is a measurement of organization security posture, with a higher number indicating more recommended actions taken, thereby improving the overall security posture of the organization. 

Your security score is calculated as a sum of your achieved impact score over total possible impact score. 

Formula: **Total Achieved Impact / Total Possible Impact** 

•	How are feature impacts determined? 
Each feature is assigned an impact score based on the feature scope (Tenant or Environment), and the number of resources that will be impacted by enabling/disabling the feature. 

<img width="463" alt="image" src="https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/9e9da776-7d30-481d-88c0-636436778107">

 

Example: 

Tenant w/ 10 Environments (5 Managed, and 5 Non-Managed Environments) 

<img width="521" alt="image" src="https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/cc80ff3e-5e0f-4dd7-8caf-2faaf4e98f79">

 


Maximum Impact: 55 
Assume the following: 

- Tenant Isolation is enabled (10)
- At least one DLP policy is configured on the tenant (10)
- 5 of 10 Environments have a Security Group
- 2 of 10 Environments have IP Firewall
- 3 of 10 Environments have IP Cookie Bindings
- Customer Lockbox is Off 
 
Based on the hypothetical state above, the achieved score is: 10 + 10 + 5 + 2 + 3 or 30 

Given the formula Total Achieved Impact / Total Possible Impact 
Secure Score = 30 / 55 
 
![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/c7d7c27d-6941-4385-9a2d-60f64c0bf9b9)
 
  
  
## What do I see on the Security Hub landing page?**

On the landing page you will see 
1.	Summary Scorecard 
2.	Feature cards


**Summary Scorecard** is the tile that showcases the speedometer that tells you where the tenant lands on their security score and shows the security recommendations to improve your overall score 


![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/6fd73b28-9cd0-477a-8c08-e622a07084bb)


**Feature cards** 
are the various tiles showcasing all the available security features we have to offer as below 

- Tenant Isolation (Managed and un-managed environments)
- Customer Lockbox ( Managed environments only)
- IP Firewall (Managed environments only with Dataverse)
- IP address-based cookie binding  ( Managed environments only with Dataverse)
- Data Policy (Managed and un-managed environments)
- Environment security Groups (Managed and un-managed environments )
- Auditing (Managed and un-managed environments with Dataverse)
- Client application access Control (Managed environments only)
- Environments Azure VNet (Managed environments only)
- Administrator privileges (Managed environments only with Dataverse)
  
![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/f000104d-a5fb-47d5-92bd-9d0ca598bcc5)

 

## What components make up a security feature card?

Each security feature tile consists of the following specifications 

- Description – Provides the full details of that specific security feature
- Impact – The overall impact it brings to the security posture 
- Recommended action – Steps needed to take to increase the security score 
- Completion status – Percentage left towards completing a recommended action
- Refreshed time – Timestamp as to when the recommended action was calculated


## What are the various security features that Security Hub has to offer?

**Tenant Isolation:** This is a feature that is enabled at the tenant level for both managed and unmanaged environments. Tenant isolation allows Global administrators and Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant. For more information, refer to [tenant isolation](../cross-tenant-restrictions.md).

**Customer Lockbox:** This feature is applicable to only managed environments. Customer Lockbox provides an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft. For more information, refer to [Customer Lockbox](../about-lockbox.md)

**IP Firewall:**  This feature is applicable to only managed environments with dataverse. The IP firewall helps to protect your organizational data by limiting user access to Microsoft Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. For more information, refer to [IP Firewall](../ip-firewall.md).

**IP address-based cookie binding:** This feature is applicable to only managed environments with dataverse. It prevent session hijacking exploits in Dataverse with IP address-based cookie binding. For more information, refer to IP address-based [cookie binding](../block-cookie-replay-attack.md).

**Data Policy: **This feature is applicable at both tenant level and at environment level to both managed and un-managed environments. Setting up DLP at the environment or tenant level will act as guardrails to help reduce the risk of users from unintentionally exposing organizational data. For more information, refer to [Data Policy](../wp-data-loss-prevention.md).

**Environment security group:** This feature is applicable to both managed and un-managed environments. Setting up security groups will help control which licensed users can access environment. To learn how to add a use to the Security group and more, refer to Environment [security group](../control-user-access.md).

## How do you turn on a security feature?

The system will not prompt you any recommendations unless you turn on a security feature. Here is an example where the customer lockbox feature is not enabled

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/8d350586-c038-4ea4-bcc1-1afa06eda8e7)

 


Click on “**Manage Customer Lockbox**” button to see the pop up as shown below 
 

Toggle the switch to enable it and hit save 

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/b151c9ea-9b24-4231-b2a9-ce7d45991809)

 


**Note**: Tenant Isolation and Customer Lockbox are the only two features that can be enabled using the above procedure. 

## How do you enable a recommendation?


Recommendations can be enabled via two entry points 
1.	By clicking on the direct link under the recommended action of that feature
2.	By clicking on the Manage button at the bottom of the tile 

Example as below:

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/e3642d0f-ab6e-4ab8-a259-28165f46c1d4)


 

**Note**: The following method is applicable to IP firewall, IP address- based cookie binding, Environment Security groups, Auditing, Client application access control, Administrator privileges and Environment Azure Vnet

Once steps 1 or 2 is performed, it opens another dialog box to allow you to choose all the applicable environment to which the feature can be enabled. Example below 

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/171295423/68b745f9-cb2a-415a-b47e-665d1441f6e0)

 

