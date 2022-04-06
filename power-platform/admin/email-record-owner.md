---
title: "How is an email record owner determined?  | MicrosoftDocs"
description: How is an email record owner determined when synchronizing email messages to Dynamics 365?
author: mduelae
ms.component: pa-admin
ms.topic: conceptual
ms.date: 4/2/2022
ms.subservice: admin
ms.author: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# How is an email record owner determined?

When server-side sync or App for Outlook synchronizes an email message to Dynamics 365, the email owner is determined based on multiple evaluations which are described below: 

Evaluate each recipient list until an eligible owner is found.

  - The system evaluates the To, Cc, Bcc recipient lists in order.  

  - The first recipient list where an eligible owner is present will be the list where the owner is chosen from.  

  - When a recipient list is evaluated, the system checks each recipient to see if it is a mailbox and the owner of that mailbox is eligible to be the owner of the email.  

  - This eligibility is decided based off whether the owner of the mailbox associated with the recipient can modify email records. 

Check if a “best match” owner is found based on the email being correlated to a previously existing email. 

  For the current recipient list, check if any of the recipients were the owner of the correlated email. If the correlated owner is found and is eligible, then this user will be chosen as the owner. 
 

  If the “best match” owner was not found, try to identify the second-best owner 
If the correlated owner was not found in the recipient list, the system will attempt to resolve the sender of the email to a known contact, account, or lead. If the resolution is successful, and if the owner of the resolved record is an eligible owner who is also in the recipient list, then that user will become the owner of the email. 

 
- If the second-best owner was not found, use the first eligible owner.
  If the system cannot find an eligible owner based on the correlated email owner or the owner of the sender record, the system will pick the first eligible owner in the current recipient list. 

 
