---
title: "Manage non-production support environments in your tenant"
description: "Learn about support environments created in your tenant by Microsoft to resolve customer issues. These non-production environments are managed by system admins."
ms.custom: ""
ms.date: 07/20/2022
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

To successfully investigate and/or troubleshoot issues associated with a support request, Microsoft Support may need to access data associated with your tenant or environment. Microsoft respects your privacy and puts you in control over the level of consent you provide to access customer data while providing support. Providing advance consent at the time the support ticket is created can streamline the process and lead to faster issue resolution but isn't necessarily required. Sometimes a support environment is required to reproduce an issue or test a mitigation while ensuring no impact to the production environment. You can decide whether to consent to the use of a support environment, and whether a minimal or full copy of environment data is allowed.

## Consent information

### Why do I need to give consent? 

Consent might be needed to allow Microsoft to take the necessary steps to successfully resolve the issue. Microsoft Support might require additional access while investigating issues. This isn't common but when needed, providing consent in advance can minimize delays in resolving the issue. The engineer might also need to simulate the environment and support issue by recreating the related environment to identify the issue and/or solution. Consent can be granted at ticket creation time or after a ticket has been created from the ticket settings page.

### What does my consent allow? 

Admins are presented four options at support ticket creation time. Three of the four options grant consent in varying degrees while the fourth doesn't grant consent. The four options are:

- **Allow Access to Diagnostic Information** - this option allows Microsoft Support to gather the necessary information while troubleshooting and/or investigating issues for resolution. This is read-only access to diagnostic information that can help in identifying root cause of the issue filed. You can grant or revoke access at any time; it is removed automatically when your case is closed. This is the recommended option, but it's not set by default and would need to be explicitly selected during ticket creation.

- **Allow Minimal Copy with Access to Diagnostic Information** -  this option provides consent for duplication of the customer environment into a support environment to successfully simulate the problems to solve. Microsoft Support performs troubleshooting and testing outside of the production environment to minimize impact. The support environment created in this instance isn't a full copy but a minimal one which doesn't have actual data but just attributes and settings utilized in the actual production environment. Data access is necessary here to access the support environment created.

- **Allow Full Copy with Access to Diagnostic Information** - this option allows for a full copy of the production environment with its data to be replicated into a support environment to simulate the issues seen in the production environment. Microsoft Support would run tests as appropriate to pinpoint or successfully investigate issues. Data access is necessary here to access the support environment created. 

- **Do Not Allow Access to Diagnostic Information** – Consent isn't granted. This option could result in delays in support ticket resolution. If Microsoft Support is unable to resolve the ticket without access to diagnostic information, Microsoft Support will have to contact the customer to seek consent. This will require the customer to update the ticket settings if they agree to provide consent. Failure to provide consent at that point could slow down investigating and troubleshooting, and/or prevent the successful resolution of the issue.

### What happens if I do not give consent? 

You can deny consent at ticket creation time by simply selecting “Don’t allow advanced diagnostic” or revoke it afterwards by updating the **Consent** field in the ticket settings.  

### How long does the consent last? 

Consent is for the life of the ticket but can be modified in the ticket settings at any time. Consent can either be modified to grant or revoke consent after the ticket is created. A change in consent takes effect immediately.  

### What permissions are needed to set or change consent?  

Only decision making roles are permitted to set and/or change consent. The roles vary depending on the product.  See [Prerequisites](get-help-support.md#prerequisites).

## Consent workflow walkthrough

To assist with diagnosing and resolving a support issue, you must grant consent to the agent either allow advanced diagnostic data and/or with a [Minimal](copy-environment.md#copy-over-everything) or a [Full](copy-environment.md#copy-over-customizations-and-schemas-only) copy of the environment with the issue.  

To assist with diagnosing and resolving a support issue, you must grant consent to the Microsoft Support either allow advanced diagnostic data and/or with a [Minimal](copy-environment.md#copy-over-everything) or a [Full](copy-environment.md#copy-over-customizations-and-schemas-only) copy of the environment with the issue. 

**Updated consent on ‘new support request’ form**

:::image type="content" source="media/support-allow-access.png" alt-text="Allow access for advanced investigation and creation of support environment.":::

**Consent section in ticket settings** 

:::image type="content" source="media/support-consent-ticket.png" alt-text="Support consent as seen in the request ticket.":::

### Can I change and/or revoke consent after I create a ticket? 

Yes. Edits can be made to ticket from the ticket's settings page in the Power Platform admin center.  

### What kind of data access does Microsoft have? 

Online (via the application): 
- System admin privileges 

Database (via SQL query tools): 
- Read/Write access to all tables 
- Access to the database requires additional approval by Microsoft and it is managed, controlled, and granted as needed. 
- Access to the database is subject to our standard access controls (that is, Just-in-time); for instance, access is time limited (for example, 30 minutes) and expires automatically.

## Support environments

### What are support environments? 

A support environment is any non-production environment of Microsoft Dataverse used by Microsoft support to reproduce and resolve customer issues. When there is an issue affecting the operation of your online service, with your consent, Microsoft can create a support environment in your tenant to troubleshoot and repair the issue. It is isolated from your production environment, so it doesn't impact your business operations. System admins have full control of managing and providing organization data by [copying it](copy-environment.md) to a support environment. 
 
### What are the details of a support environment? 

- It is an environment created in your tenant by Microsoft under your direct instructions, for preventing, detecting, or repairing problems affecting the operation of your online service. 
- It doesn't require any additional non-production environment to be purchased. 
- The database size of a support environment doesn't count towards your storage limit. 
- It resides in the same regional datacenter as your source environment. 
- Support environments are protected by the same administrative and technical measures implemented by Microsoft to protect your production environment. 

### What data is in a support environment? 

- When Microsoft initially creates a support environment, it contains no customer data or customizations. 
- System admins manage support environments in the Power Platform admin center. 
- System admins can copy an environment to a support environment, and in the process can choose whether to provide a Minimal or a Full copy of their environment.
- Prior to provisioning, system admins must consent to providing a copy of their data to Microsoft. 

### Who has access to a support environment? 

- **Minimal copy** - Microsoft staff who are members of a support security group 
- **Full copy** - Microsoft staff who are members of an elevated support security group 

### How long does a support environment stay in your tenant? 

- Seven days or upon resolution of the problem. 
- System admins can delete the support environment at any time. 

### Is access and usage of support environment audited? 

Yes. 

### How do I modify consent to either grant it or deny it? 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Help + Support**.
3. Select the ticket Number/ID.
4. View the **Consent** section of the ticket settings.

   :::image type="content" source="media/support-consent-ticket.png" alt-text="Support consent as seen in the request ticket.":::

5. Select **Edit** on the top menu bar.
6. Select the desired consent, and the select **Save**.





[!INCLUDE[footer-include](../includes/footer-banner.md)]
