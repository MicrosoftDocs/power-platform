---
title: "Manage non-production support environments in your tenant"
description: "Learn about support environments created in your tenant by Microsoft to resolve customer issues. These non-production environments are managed by system admins."
ms.custom: ""
ms.date: 07/15/2022
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
author: "jimholtz"
ms.assetid: 
caps.latest.revision: 63
ms.subservice: admin
ms.author: "jimholtz"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# About support environments and the consent process

To successfully investigate and/or troubleshoot issues, agents need to perform one or more steps. After customer consent, the agent obtains diagnostic data access and/or creates a simulation of the affected environment by deep delving into the attributes applied or the types of data stored. To simulate the conditions of the issue, the agent could create a support environment to recreate the original environment. After initial customer consent, a support engineer with support user permissions will have access to the data stored in the support environment for troubleshooting purposes. 

## Consent information

### Why do I need to give consent? 

Consent is needed to allow Microsoft to take the necessary steps to successfully resolve the issue. An agent might require additional access while investigating issues, which is not common but when needed it would be more expedient if granted. A Microsoft engineer could inadvertently be exposed to customer data while investigating and troubleshooting an issue. It is rare that such scenarios would result in needing access but having it  The engineer might also need to simulate the environment and related situation to recreate the related environment and identify issue and/or solution. We could function as part of investigating and/or troubleshooting an issue but exposed to customer data. it is important that consent is granted so the agent will not have to pause work which would delay the issue resulting for one that is Consent can be granted at ticket creation time or after ticket has been created from the ticket settings page.  

### What does my consent allow? 

Customer is presented four options during ticket creation time if they have a decision making role. Three of the four options grant consent in varying degrees while the fourth does not grant consent. The four options:  

- **Allow Access to Diagnostic Information** - Advanced diagnostic information related consent allows Microsoft Support to gather necessary information while troubleshooting and or investigating issues for resolution. This is a read only access to diagnostic information that can help in identifying root cause and in solving the issue filed. You can grant or revoke access at any time, and it is removed automatically when your case is closed. This is the recommended option, but it is not set by default and would need to be explicitly selected during ticket creation.  

- **Allow Minimal Copy with Access to Diagnostic Information** -  this option seeks consent for a duplication of the customer environment to successfully simulate the problems to solve. The agent performs troubleshooting and testing outside of a production environment to minimize impact. The support environment created in this instance is not a fully copy but a minimal one which does not have actual data but just attributes and settings utilized in the actual production environment. Data access is necessary here to access the support environment created.  

- **Allow Full Copy with Access to Diagnostic Information** - A full copy of the production environment with its data is replicated to simulate the issues seen in the production environment. The agent would run tests and can bounce the environment as appropriate to pinpoint or successfully investigate issues. Data access is necessary here to access the support environment created.  

- **Do Not Allow Access to Diagnostic Information** – Consent is not granted. If the situation where the customer does not grant consent for data access and/or replicate the environment to fully diagnose the issue. The agent would have to contact the customer to seek the proper consent. This would require updating the ticket settings and could slow down the investigation, troubleshooting and/or resolution of the  issue.  

### What happens if I do not give consent? 

You can deny consent at ticket creation time by simply selecting “Don’t allow advanced diagnostic” or revoke it afterwards by editing to update the “consent” field value in the ticket settings.  

### How long does the consent last? 

Consent is for the life of the ticket but can be modified in the ticket settings at any time. Consent can either be modified to grant or revoke consent after the ticket is created. A change in consent takes effect immediately.  

### What permissions are needed to set or change consent?  

Only decision making roles are permitted to set and/or change consent. The roles vary depending on the product.  


|Power Platform security roles  |
|---------|
|AAD Role Admin      |
|Power Apps Admin      |
|Power Apps Environment Admin       |
|Power Apps System Admin      |
|Company Admin      |
|Billing Admin      |
|Service Admin      |
|CRM Service Admin      |
|Power Platform Admin      |
|Security Admin      |
|CRM Organization Admin      |
|Partner Delegated Admin      |
|SharePoint Admin      |
|Teams Admin      |
|Exchange Admin      |
|Power BI Admin      |
|Compliance Admin      |
|Helpdesk Admin      |

## Consent workflow walkthrough

To assist with diagnosing and resolving a support issue, you must grant consent to the agent either allow advanced diagnostic data and/or with a [Minimal](copy-environment.md#copy-over-everything) or a [Full](copy-environment.md#copy-over-customizations-and-schemas-only) copy of the environment with the issue.  

**Updated consent on ‘new support request’ form**

:::image type="content" source="media/support-allow-access.png" alt-text="Allow access for advanced investigation and creation of support environment.":::

**Consent options**

image

**Consent section On ticket settings** 

:::image type="content" source="media/support-consent-ticket.png" alt-text="Support consent as seen in the request ticket.":::

### What kind of data access does Microsoft have? 

Online (via the application): 
- System admin privileges 

Database (via SQL query tools): 
- Read/Write access to all tables 
- Access to the database requires additional approval by Microsoft and it is managed, controlled, and granted as needed. 
- Access to the database is subject to our standard access controls (i.e. Just-in-time); for instance, access is time limited (for example, 30 minutes) and expires automatically. 

### How long does a support environment stay in your tenant? 

- Seven days or upon resolution of the problem. 
- System admins can delete the support environment at any time.

### Is access to support environment audited?  

Yes.

### Can I change and/or revoke consent after I create a ticket? 

Yes. Edits can be made to ticket from the tickets settings page directly in PPAC.  

## Support environments

### What are support environments? 

A support environment is any non-production environment of Microsoft Dataverse used by Microsoft support to reproduce and resolve customer issues. When there is an issue affecting the operation of your online service, Microsoft can create a support environment in your tenant to troubleshoot and repair the issue.  It is isolated from your production environment so it does not impact your business operations. System admins have full control of managing and providing organization data by [copying it](copy-environment.md) to a support environment. 
 
### What are the details of a support environment? 

- It is an environment created in your tenant by Microsoft under your direct instructions, for purposes of preventing, detecting, or repairing problems affecting the operation of your online service. 
- It does not require any additional non-production environment to be purchased. 
- The database size of a support environment does not count towards your storage limit. 
- It resides in the same regional datacenter as your source environment. 
- Support environments are protected by the same administrative and technical measures implemented by Microsoft to protect your production environment. 

### What data is in a support environment? 

- When Microsoft initially creates a support environment, it contains no customer data or customizations. 
- System admins manage support environments in the Power Platform admin center. 
- System admins can copy an environment to a support environment, and then choose whether to provide a Minimal or a Full copy of their environment. 
- Prior to provisioning, system admins must consent to providing a copy of their data to Microsoft. 

### Who has access to a support environment? 

- **Minimal copy** - Microsoft staff who are members of a support security group 
- **Full copy** - Microsoft staff who are members of an elevated support security group 

### What kind of data access does Microsoft have? 

- Online (via the application) - System admin privileges 
- Database (via SQL query tools): 
- Read/Write access to all tables 
- Access to the database requires additional approval by Microsoft and it is managed, controlled, and granted as needed. 
- Access to the database is subject to our standard access controls (i.e., Just-in-time); for instance, access is time limited (for example, 30 minutes) and expires automatically. 

### How long does a support environment stay in your tenant? 

- Seven days or upon resolution of the problem. 
- System admins can delete the support environment at any time. 

### Is access and usage of support environment audited? 

Yes. 









<!-- 
## What is a support environment?

- It is an environment created in your tenant by Microsoft under your direct instructions, for purposes of preventing, detecting, or repairing problems affecting the operation of your online service.
- It does not require any additional non-production environment to be purchased.
- The database size of a support environment does not count towards your storage limit.
- It resides in the same regional datacenter as your source environment. 
- Support environments are protected by the same administrative and technical measures implemented by Microsoft to protect your production environment. 

## What data is in a support environment?

- When a support environment is initially created by Microsoft, it contains no customer data or customizations.
- System admins manage support environments in the Power Platform admin center.
- System admins can [copy an environment](copy-environment.md) to a support environment, and then choose whether to provide a [Minimal](copy-environment.md#copy-over-customizations-and-schemas-only) or a [Full](copy-environment.md#copy-over-everything) copy of their environment.  
- Prior to provisioning, system admins must consent to providing a copy of their data to Microsoft.

## Who has access to a support environment?

Minimal copy:

-  Microsoft staff who are members of a support security group

Full copy:

-  Microsoft staff who are members of an elevated support security group

## What kind of data access does Microsoft have?

Online (via the application):

-  System admin privileges

Database (via SQL query tools):

-  Read/Write access to all tables
-  Access to the database requires additional approval by Microsoft and it is managed, controlled, and granted as needed.
-  Access to the database is subject to our standard access controls (i.e. Just-in-time); for instance, access is time limited (for example, 30 minutes) and expires automatically.

## How long does a support environment stay in your tenant?

- Seven days or upon resolution of the problem.
- System admins can [delete](delete-environment.md) the support environment at any time.

### Is access and usage of support environment audited?

Yes.

## What is the consent form in the New support request page?

To assist with diagnosing and resolving a support issue, you must consent to the creation of a [Minimal](copy-environment.md#copy-over-everything) or a [Full](copy-environment.md#copy-over-customizations-and-schemas-only) copy of the environment with the issue. The consent form shown below records your instructions to Microsoft for the creation of a support environment. 

> [!div class="mx-imgBorder"] 
> ![Consent for support environment.](./media/consent-support-environment.png "Consent for support environment")
-->






[!INCLUDE[footer-include](../includes/footer-banner.md)]
