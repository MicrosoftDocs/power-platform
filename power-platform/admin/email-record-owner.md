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

When server-side sync or App for Outlook synchronizes an email message to Dynamics 365, the system determines the email owner based on the following factors: 
1. The system evaluates the **To**,**Cc**, and **Bcc** recipient list in order until an appropriate owner is found. The owner is selected from the first recipient that it’s found in. 
The  system checks each recipient and verifies that the mailbox and the owner of that mailbox is authorized to be the owner of the email.  Eligibility is based on if the mailbox owner is associated with the recipient can modify email records. 

2. The system checks if the best match owner can be found if the email is associated with an existing email. For the current recipient list, the system checks if any of the recipients are the owner of the related email. If the related owner is found and is eligible, then this user is selected as the owner. 

3. If the best match owner isn’t found, then the system will try to identify the second-best owner. 
If the related owner wasn’t found in the recipient list, the system will attempt to resolve the sender of the email to a known contact, account, or lead. If the resolution is successful, and if the owner of the resolved record is an eligible owner who is also in the recipient list, then that user will become the owner of the email. 
4. If the second-best owner isn’t found, then the system uses the first eligible owner.
 If the system cannot find an eligible owner based on the correlated email owner or the owner of the sender record, the system will pick the first eligible owner in the current recipient list.

 
