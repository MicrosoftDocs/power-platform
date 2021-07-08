---
title: "Email exfiltration controls for connectors | MicrosoftDocs"
description: Block forwarded emails sent from Microsoft Power Automate.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/14/2020
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Email exfiltration controls for connectors

 Microsoft Exchange enables admins to disable email autoforwards and autoreplies to remote domains for external recipients. Exchange does this by using message-type headers, such as Auto Forward received from Outlook and Outlook on web clients.  

Microsoft Power Platform has the capability to insert specific SMTP headers in email messages sent through Power Automate and Power Apps. It does this using Microsoft 365 Exchange/Outlook connectors. You can use these SMTP headers to set up appropriate exfiltration rules. These rules are for the unauthorized transfer of data from one device to another in Exchange for outbound emails.  

For more details on the Microsoft 365 Outlook connector, see: [SMTP headers](/connectors/office365/#smtp-headers). 

## Block exfiltration of forwarded emails 

Admins can set up Exchange mail flow rules to monitor or block emails sent by Power Automate and/or Power Apps using the Microsoft 365 Outlook connector. The format of the SMTP header uses a reserved phrase ‘Microsoft Power Automate’ or ‘Microsoft Power Apps’. It's inserted with the header type: ‘x-ms-mail-application’. For example:

```
**x-ms-mail-application: Microsoft Power Automate**; User-Agent: 
azure-logic-apps/1.0 (workflow afa0fb167803450aa650267e95d43287; version 
08586093372199532216) microsoft-flow/1.0 
x-ms-mail-operation-type: Forward 
```

To identify the operation ID, a reserved word, such as Forward, Reply or Send, gets inserted with the header type ‘x-ms-mail-operation-type’. For example:

```
x-ms-mail-application: Microsoft Power Automate; User-Agent: 
azure-logic-apps/1.0 (workflow afa0fb167803450aa650267e95d43287; version 
08586093372199532216) microsoft-flow/1.0 
**x-ms-mail-operation-type: Forward**
```

Exchange admins can use these headers to set up exfiltration blocking rules in the Exchange admin center as shown in the example below. Here the ‘mail flow’ rule rejects outbound email messages with:  

- ‘x-ms-mail-application’ header set as ‘Microsoft Power Automate’ and
- ‘x-ms-mail-operation-type’ header set as ‘Send’ or ‘Forward’  

This is equivalent to the Exchange ‘mail flow’ rule set up for the message type equal to ‘auto-forward’.  This rules uses Outlook and Outlook for web clients. 

:::image type="content" source="media/block-outbound-forwards80.png" alt-text="Block outbound forwards":::

## Exempt specific flows from exfiltration blocking

In addition to the ‘x-ms-mail-application’ messages, Power Platform also inserts the workflow identifier as the new ‘User-Agent’ header. This is equal to the app or flow ID. For example:

```
x-ms-mail-application: Microsoft Power Automate; User-Agent: 
azure-logic-apps/1.0 (workflow afa0fb167803450aa650267e95d43287; version 
08586093372199532216) microsoft-flow/1.0 
**x-ms-mail-operation-type: Forward**
```

As an admin, if you want to exempt flows (or apps) from the exfiltration due to a legitimate business scenario, use the workflow ID as part of the user-agent header. All other exception conditions offered by Exchange rules, such as sender address, remain available to exempt the legitimate business use cases from the blocking enforcement. For example:

:::image type="content" source="media/block-outbound-forwards-exception85.png" alt-text="Block outbound forwards exceptions":::

Admins can also use other exception capabilities in Exchange mail rules to exempt flows from the exfiltration blocking rules, For example, a unique sender address allows legitimate business use cases to bypass the control. 

> [!div class="mx-imgBorder"] 
> ![Block outbound forwards exception list](media/block-outbound-forwards-exception-list85.png "Block outbound forwards exception list")


[!INCLUDE[footer-include](../includes/footer-banner.md)]