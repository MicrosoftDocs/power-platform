---
title: "Customer data access consent and support environment creation"
description: "Learn about support environments created in your tenant by Microsoft to resolve customer issues. These non-production environments are managed by system admins."
ms.custom: ""
ms.date: 07/20/2022
ms.reviewer: "yinkafatona"
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

# Customer data access consent and support environment creation

To successfully investigate and/or troubleshoot issues associated with a support request, Microsoft Support may need to access customer data associated with your tenant and/or environment. The troubleshooting could also include the replicating of the environment with or without data for testing purposes. A replicated environment ([a support environment](#what-are-support-environments)), is sometimes required to successfully reproduce an issue and/or to evaluate a solution without impact to the production environment. Microsoft respects your privacy and puts you in control over the level of consent you allow as part of providing support. Allowing customer data access with or without allowing the replication of your environment at support request creation eliminates unnecessary delays incurred during issue resolution. The consent is temporary and can be revoked if needed. With consent, Microsoft Support is given customer data access and/or environment copy access for troubleshooting purposes and/or resolving the technical issue described in the Microsoft Support case.

## Consent information

### What does my consent allow?

We present four consent options at support request creation time with three of the options to grant a varying degree of consent and fourth option to deny consent altogether. Here's a closer look at each option:

- **Allow access to diagnostic information** – with this option you can temporarily grant Microsoft Support access to customer data associated with your tenant and/or environment. Allowing customer data access ensures there's no delay in troubleshooting to identify the root cause and the solution to the issue as it eliminates the back-and-forth to contact you directly for access. This is a read-only access that you can revoke at any time, and it's automatically removed once the case is closed. This is the recommended option, but it isn't set by default and needs to be explicitly selected during ticket creation.

- **Allow minimal copy with access to diagnostic information** – with this option you grant consent to create a copy of your customer environment, which creates a support environment. A support environment is a non-production environment that allows troubleshooting of the issue without impact to your production environment. For this specific option, only a minimal copy of your environment is created which doesn't have customer data but does have attributes and settings. This option also requires customer data access for troubleshooting. 

- **Allow full copy with access to diagnostic information** - with this option you grant consent to create a full copy of your customer environment, which creates a support environment. A support environment is a non-production environment that allows troubleshooting of the issue without impact to your production environment. For this specific option, a full copy of your environment is created which is a replication of your production environment including customer data, attributes, and settings. This option also requires customer data access for troubleshooting. 

- **Do not allow access to diagnostic information** – with this option you can choose not to grant consent. However, choosing this option could introduce delays in support request resolution. Choosing this option includes the process of Microsoft Support having to make additional contacts to solicit this information and/or scheduling additional calls. If Microsoft Support is unable to resolve the ticket without customer data access and/or replicating the environment, they'll have to schedule diagnostic information. Microsoft Support will have to contact the customer to seek consent. This will slow down the investigation, troubleshooting and/or prevent the successful resolution of the issue.


### What happens if I don't give consent? 

You can deny consent at ticket creation time by selecting “Don’t allow advanced diagnostic” or revoke it afterwards by updating the **Consent** field value in the ticket settings.  The support environment will expire within seven days and/or once the support request is resolved closed.  However, you can delete a support environment at any time. 

### How long does the consent last? 

Consent is for the life of the ticket but can be modified in the ticket settings at any time. Consent can either be modified to grant or revoke consent after the ticket is created. A change in consent takes effect immediately.

### What permissions are needed to set or change consent?  

Permissions needed to manage consent are specific to the environment provided during ticket creation time.  For Dataverse-based products, the Environment Administrator (or System Administrator role in Dataverse) has permission to manage consent for the provided environment.   

## What are support environments? 

A support environment is a special kind of non-production Dataverse-based environment used by Microsoft Support to reproduce and resolve customer issues. When there's an issue affecting the operation of your online service, with your consent Microsoft can create a support environment in your tenant to troubleshoot and fix the issue. It's isolated from your production environment, so it doesn't impact your business operations. 
 
### What are the details of a support environment? 

- It's an environment created in your tenant by Microsoft under your direct instructions, for preventing, detecting, or repairing problems affecting the operation of your online service. 
- It doesn't require any additional non-production environment to be purchased. 
- The database size of a support environment doesn't count towards your storage limit. 
- It resides in the same regional datacenter as your source environment. 
- Support environments are protected by the same administrative and technical measures implemented by Microsoft to protect your production environment. 

### What data is in a support environment? 

- A support environment will initially contain attributes and customizations with no customer data.
- Support environments are created in the customer’s tenant and will be visible to administrators in the Power Platform admin center.
- A support environment can be either a minimal or a full copy of the customer environment.
- A minimal support environment doesn't contain customer data while a full support environment does contain customer data.

### Who has access to a support environment? 

- **Minimal copy** - Microsoft staff who are members of a support security group 
- **Full copy** - Microsoft staff who are members of an elevated support security group 

### What kind of data access does Microsoft have within a support environment?

Online (via the application) - System admin privileges
Database (via SQL query tools):
Read/Write access to all tables
Access to the database requires additional approval by Microsoft and it's managed, controlled, and granted as needed.
Access to the database is subject to our standard access controls (that is, just-in-time); for instance, access is time limited (for example, 30 minutes) and expires automatically.

### How long does a support environment stay in your tenant? 

- Seven days or upon resolution of the problem. 
- System admins can delete the support environment at any time. 

### Is access and usage of support environment audited? 

Yes. 

## Consent workflow walkthrough

To assist with diagnosing and resolving a support issue, you can grant Microsoft Support consent to access customer data and/or replicate your production environment as a [minimal](copy-environment.md#copy-over-customizations-and-schemas-only) or a [full](copy-environment.md#copy-over-everything) copy of the environment with the issue. 

**Updated consent on ‘new support request’ form**    

:::image type="content" source="media/support-allow-access.png" alt-text="Allow access for advanced investigation and creation of support environment.":::

**Consent section in ticket settings** 

:::image type="content" source="media/support-consent-ticket.png" alt-text="Support consent as seen in the request ticket.":::

### How do I modify consent to either grant it or deny it? 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Help + Support**.
3. Select the ticket Number/ID.
4. View the **Consent** section of the ticket settings.

   :::image type="content" source="media/support-consent-ticket.png" alt-text="Support consent as seen in the request ticket.":::

5. Select **Edit** on the top menu bar.
6. Select the desired consent, and the select **Save**.






[!INCLUDE[footer-include](../includes/footer-banner.md)]
