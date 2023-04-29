---
title: "About GDPR (EU) compliance"
description: Learn about GDPR (EU) compliance
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
contributors:
  - mayadumesh
  - NHelgren
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/28/2022
search.audienceType: 
  - admin
---
# About GDPR (EU) compliance

As of May 25, 2018, a European privacy law, the [General Data Protection Regulation (GDPR)](https://ec.europa.eu/justice/data-protection/reform/index_en.htm), is in effect. The GDPR imposes new rules on companies, government agencies, non-profits, and other organizations which offer goods and services to people in the European Union (EU), or which collect and analyze data tied to EU residents. Microsoft applies GDPR requirements to all online services. 

Microsoft designed Dynamics 365 with industry-leading security measures and privacy policies to safeguard your data in the cloud, including the categories of personal data identified by the GDPR. Dynamics 365 can help you on your journey to reducing risks and achieving compliance with the GDPR. 

- Controlling who has access to personal data is a key to securing that data, and data security is a critical requirement of the GDPR. The platform enables you to manage and control access to your data in several ways: 
- Role-based security allows you to group together a set of privileges that limits the tasks which can be performed by a given user. This is an important capability, especially when people change roles within an organization. 
- Record-based security allows you to restrict access to specific records. 
- Field-level security allows you to restrict access to specific high-impact fields, such as Personally Identifiable Information (PII). 
- Azure Active Directory (Azure AD) helps you protect your environment from unauthorized access by simplifying the management of users and groups and allowing you to assign and revoke privileges easily. Azure AD includes tools such as Multi-Factor Authentication for highly-secure sign-in. Additionally, Azure AD Privileged Identity Management helps you reduce risks associated with administrative privileges through access control, management, and reporting. 

Another core requirement of the GDPR is to protect the personal data that you control or process. Power Platform is designed to optimize the security of your data: 

- Security Development Lifecycle is a mandatory Microsoft process that embeds security requirements into every phase of the development process. Microsoft products, including Dynamics 365 are built using the Security Development Lifecycle. 
- Encryption in transit between your users’ devices and our data centers, as well as while at rest in Dataverse data storage, helps protect your data at all times. 

## Getting started with GDPR 

Compliance is an on-going process and a shared responsibility. Microsoft offers a powerful set of tools and provides extensive documentation on how to use them to make the process easier. Microsoft is investing in additional features and functionality to help organizations with GDPR compliance. 

Whether you’re a compliance officer, a decision-maker considering Dynamics 365 as a cloud solution, an administrator seeking help with a specific GDPR-compliant implementation, or an interested party looking for general information on how the GDPR relates to Dynamics 365 and cloud computing, the information here can provide you with a starting point to get what you need. 

Every journey needs a roadmap. Your roadmap to GDPR compliance begins with focusing on four key steps, and Microsoft Dynamics 365 provides robust tools and solutions for tackling each step. Learn more about how Microsoft products and services can help you on the road to GDPR compliance. 

### Assess your organization

**Discover**

The first step towards GDPR compliance is to assess whether the GDPR applies to your organization, and, if so, what data under your control is subject to the GDPR. This analysis includes understanding what data you have and where it resides. Adopting a classification scheme that applies throughout your organization helps you respond to data subject requests because it allows you to more quickly identify and process personal data requests. 

Microsoft Dynamics 365 and related tools help you discover and classify personal data. You can search for and identify personal data with: 
- Quick Find and Advanced Find 
- Relevance Search 
- Filters 
- Web API 

### Take advantage of tools

**Manage**

The GDPR provides data subjects—individuals to whom data relates—with more control over how their personal data is captured and used. Managing access and controlling how data is used and accessed are fundamental to GDPR compliance. Dynamics 365 provides capabilities to authenticate users and govern access to personal data. Organizations can: 

- Display custom privacy notices and request and obtain consent for processing activities. 
- Rectify inaccurate or incomplete personal data using a variety of methods. 
- Decide if the delete request meets the GDPR requirements for deleting personal data. 
- Meet data subject portability requests by using data export capabilities. 

The organization may decide to use advanced-find capabilities to identify the data subject and their related data. 

### Discover built-in protection

**Protect**

Microsoft services are developed using the Microsoft Secure Development Lifecycle which incorporates privacy-by-design and privacy-by-default methodologies. Dynamics 365 and related tools can help you comply with GDPR data protection requirements by providing ways to further secure/encrypt personal data at rest and in transit, detect and respond to data breaches, and facilitate regular testing of security measures. Dynamics 365 provides: 

- Transport Layer Security (TLS), SQL Server cell-level encryption, and Transparent Data Encryption (TDE) to protect personal data in transit and at rest. 
- Support for Azure Active Directory (Azure AD) to manage user identities. 
- The ability to grant and restrict user access to personal data via security roles and fields and hierarchy level security models. 
- Dynamics 365 auditing to help detect data breaches. 

### Tools to help keep detailed records

**Report**

The GDPR sets new standards in transparency, accountability, and record-keeping. Organizations processing personal data will need to keep detailed records to be compliant. Microsoft provides capabilities to help meet data reporting requirements. With environments, you can: 

- Track and record changes to personal data using the audit functionality. 
- Track and record processing activities relevant to a Data Protection Impact Assessment (DPIA) using audit capabilities. 

The GDPR sets requirements regarding the flows of personal data into and out of the EU and flows of personal data to third-party service providers. Exposure to unnecessary cross-border data transfer is reduced by Microsoft using a regional data center strategy. 

Microsoft offers contractual commitments for all its enterprise cloud services, including Dynamics 365. The commitments include detailed data protection terms, the EU Model Clauses, and compliance with the EU-US Privacy Shield Framework regarding the collection, use, and retention of personal information transferred from the European Union to the United States. Microsoft also maintains an inventory of third-party service providers who may have access to customer data, and limits access to customer data by third parties. 

Organizations that process personal data may be required to conduct Data Protection Impact Assessments (DPIAs). To help customers who are seeking information that may help them perform a DPIA addressing their use of Dynamics 365, Microsoft provides detailed information about its processing of customer data and the security measures used to protect that data. 

## Resources to manage GDPR compliance

For information on tools and resources available for the Microsoft Power Platform to assist administrators in their efforts to comply with GDPR, see [Resources to manage GDPR Compliance](wp-compliance-data-privacy.md#resources-to-manage-gdpr-compliance).


### See also
[Microsoft privacy and GDPR resources](https://www.microsoft.com/trust-center/privacy/resources) <br />
[GDPR FAQs](/compliance/regulatory/gdpr#gdpr-faqs) <br />
[Get Started: Support for GDPR Accountability](https://servicetrust.microsoft.com/ViewPage/GDPRGetStarted) 





[!INCLUDE[footer-include](../includes/footer-banner.md)]
