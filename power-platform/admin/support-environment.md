---
title: Support environments and consent to access customer data
description: Understand why Microsoft Support may need your consent to access your customer data and create a support environment in your tenant to resolve an issue.
ms.date: 08/24/2022
ms.reviewer: "yinkafatona"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: how-to
applies_to: 
  - "Dynamics 365 (online)"
author: sericks007
contributors:
  - davidme-ms
ms.assetid: 
caps.latest.revision: 63
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
ms.custom:
  - ""
  - sfi-image-nochange
---

# Support environments and consent to access customer data

Microsoft may need to access customer data in your tenant or environment to investigate and troubleshoot issues for which you've requested support.  We may also need to replicate the environment in your tenant, with or without data, for testing purposes. We can reproduce an issue or evaluate a solution in a replicated [support environment](#what-are-support-environments) without affecting your production environment. 

Microsoft respects your privacy and puts you in control of the level of consent you grant as part of receiving support. We'll never access your customer data or replicate your environment without your consent. You can give your consent at the time you request support directly onto the support ticket, which helps eliminate delays in the issue resolution time and/or help expedite the issue resolution.  Your consent is temporary, and you can revoke it at any time. This consent doesn't grant [lockbox](about-lockbox.md) request approval and/or revoke it.  

## Consent information 

You may grant a varying degree of consent or deny consent altogether when you submit a support request.

  :::image type="content" source="media/support-allow-access.png" alt-text="Screenshot of a support request with Allow access for advanced investigation and creation of support environment highlighted.":::

### What does my consent allow?

Here's a closer look at the consent options you may have on the support request form:

- **Allow access to diagnostic information**: You temporarily grant Microsoft Support access to customer data associated with your tenant or environment. Access is read-only. You can revoke it at any time, and it's automatically removed when the case is closed. This option is recommended, but it isn't set by default. You need to explicitly select it.

- **Allow [minimal copy](copy-environment.md#copy-over-customizations-and-schemas-only) with access to diagnostic information**: You grant consent to Microsoft Support to:
  - Create a minimal copy of your environment in your tenant. The support environment doesn't contain customer data, only attributes and settings.
  - Access diagnostic information as explained earlier.

- **Allow [full copy](copy-environment.md#copy-over-everything) with access to diagnostic information**: You grant consent to Microsoft Support to:
  - Create a full copy of your environment in your tenant. The support environment fully replicates your production environment, including customer data, attributes, and settings.
  - Access diagnostic information as explained earlier.  

- **Do not allow access to diagnostic information**: You deny consent at the time you make your request. We don't recommend this option because it may delay resolving your issue. If you grant consent at the outset, Microsoft Support can start investigating and troubleshooting right away.

### Can I revoke consent?

You can revoke consent at any time before the request is resolved.

The support environment expires seven days after you revoke consent or when the support request is closed. You can delete a support environment at any time.

### How long does consent last?

Consent lasts as long as the support request is open or until you revoke it.

### How do I grant or revoke consent after I create a support request? 

A change in consent takes effect immediately.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Support**.
1. Select the support request.
1. Select **Edit**.
1. Select a consent option, and then select **Save**.

    :::image type="content" source="media/support-consent-ticket.png" alt-text="Screenshot of a support request with consent information highlighted.":::

### What permissions are needed to grant, revoke, or change consent?  

The permissions you need to manage consent depend on the environment you specify at the time you create your request. Consent can be granted at ticket creation time on the support form and it can be updated in the ticket settings page once the ticket is created. 

## What are support environments?

A support environment is a replica of an environment that Microsoft Support creates in your tenant. We use support environments to reproduce and resolve issues without affecting your production environment or business operations.

Here are a few things we'd like you to know about support environments:

- Use of a support environment doesn't require you to purchase another environment.
- The database of a support environment doesn't count toward your storage limit.
- The support environment resides in the same regional datacenter as the source environment.
- Support environments are visible to administrators in the Power Platform admin center.
- Support environments are protected by the same administrative and technical measures that protect your production environment.
- Access to and usage of a support environment is audited.

### What data is in a support environment?

A support environment can be either [a minimal or a full copy](#what-does-my-consent-allow) of the customer environment. A support environment initially contains only attributes and customizations. A minimal support environment doesn't contain customer data. A full support environment does contain customer data.

### Who has access to a support environment?

- **Minimal copy** - Microsoft staff who are members of a support security group
- **Full copy** - Microsoft staff who are members of an elevated support security group

### What kind of data access does Microsoft have in a support environment?

- **Online (via the application)**: System admin privileges
- **Database (via SQL query tools)**: Read/write access to all tables
  - Access to the database requires additional approval by Microsoft and it's managed, controlled, and granted as needed.
  - Access to the database is subject to our standard just-in-time access controls. For instance, access is time-limited (for example, 30 minutes) and expires automatically.

### How long does a support environment stay in my tenant?

A support environment expires in seven days or when the ticket is resolved. System admins can delete the support environment at any time.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
