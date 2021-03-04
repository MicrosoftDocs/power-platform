---
title: "Send email on behalf of another user  | MicrosoftDocs"
description: Set up users to send an outgoing email by updating the From field to another user or queue.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/03/2021
author: revachauhan
ms.author: rechauha
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Send email on behalf of another user 

Dynamics 365 users can send an outgoing email on behalf of another user by updating the **From** field to another user or queue.

## Prerequisites - 

- An admin should verify the user has a role in Dynamics 365 with “Send Email as Another User" privilege (Settings gear > Advanced settings > Settings > Security > Security Roles > select a role > Business Management tab > Miscellaneous Privileges).
  > [!div class="mx-imgBorder"] 
  > ![Send email as Another User](media/send-email-another-user.png "Send email as Another User")
-	The other user being set as sender on the email needs to enable personal option "Allow other Microsoft Dynamics CRM users to send e-mail on your behalf" (Settings Gear > Personalization Settings > Email tab).
  > [!div class="mx-imgBorder"] 
  > ![Allow sending email on your behalf](media/allow-others-send-email-your-behalf.png "Allow sending email on your behalf")
-	The user sending the email needs to have read access to the queue. Note, this option only applies to the send on behalf of queue. 

### Optional: Sending outgoing email as another user with Exchange mailbox delegation 

For the email to be shown as “send on behalf” of another user in outlook ensure below prerequisites are met. 

-	All prerequisites outlined in last section 
-	OrgDbOrSetting  - “EnableMailboxDelegationForOutgoingEmail must be enabled
-	User clicking send / submitting send request for the outgoing email in dynamics should have at least one of these 3 permissions (Full Access, Send as or Send on Behalf) on the Exchange mailbox of the user in “From” field.
              Exchange permissions : Manage permissions for recipients | Microsoft Docs

Note: This feature is only available for the Exchange Onprem / Exchange online email server profile. 

Caution : Once enabled, all users in Dynamics need to have proper permissions set up in Exchange if they want to use any other email address in the “From” field apart from their own email address otherwise email sending will fail with Exchange errors such as “ErrorSendAsDenied”.

Caution: If customer has multiple automated workflows owned by the same user configured to send emails via multiple users / queues, there may be Dynamics / Exchange throttling as the just one mailbox (workflow owners’ mailbox) will be used to send all these emails.
