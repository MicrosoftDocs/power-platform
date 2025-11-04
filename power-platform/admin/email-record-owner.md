---
title: "How is an email record owner determined  | MicrosoftDocs"
description: How is an email record owner determined when synchronizing email messages to Dynamics 365?
author: DanaMartens
ms.component: pa-admin
ms.topic: concept-article
ms.date: 4/2/2022
ms.subservice: admin
ms.author: dmartens
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# How is an email record owner determined

When server-side sync or App for Outlook synchronizes an email message to Dynamics 365, the system determines the email owner based on the following factors: 
1. The system evaluates the **To**, **Cc**, and **Bcc** recipient list in order until an appropriate owner is found. The owner is selected from the first recipient list  it’s found in. The system checks each recipient and verifies that the owner of the associated mailbox is authorized to be the owner of the email. Eligibility is based on whether the owner of the mailbox associated with the recipient can also modify email records.

2. If the email is associated with an existing email, the system checks if the best match owner can be found. Using the recipient list, the system checks if any of the recipients are the owner of the associated email. If an eligible owner is found then the user is selected as the email owner.
 
3. If the best match owner isn’t found, then the system tries to find a second-best owner. 
If the related owner can't be found in the recipient list, the system attempts to resolve the sender of the email to a known contact, account, or lead. If the resolution is successful and the owner of the resolved record is an eligible owner that is also on the recipient list; only then the user is set as owner of the email. 

4. If the second-best owner isn’t found, then the system uses the first eligible owner. If the system can't find an eligible owner based on the associated email owner or the owner of the sender record, the system will pick the first eligible owner in the current recipient list.


 
