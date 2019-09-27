---
title: "For partners: the Delegated Administrator for Dynamics 365  | MicrosoftDocs"
description: Use this role to delegate admins to manage users, licenses, permissions, and domains.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# For partners: the Delegated Administrator

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

Admins for Dynamics 365 apps can use their [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] global administrator role to create and edit users, reset user passwords, manage user licenses, manage domains, and assign admin permissions to other users in their organization, among other things. However, if admins want someone else to do these administrative tasks, they can delegate this role to an authorized [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps partner. When admins authorize a partner to take on this role, the partner is referred to as a delegated admin. A delegated admin can perform routine tasks such as adding users and resetting passwords, or more complex tasks such as adding a domain. A delegated admin can have access to multiple tenants, which can simplify and consolidate tenant management.  
  
 You can see the new Delegated Admin user in Dynamics 365 apps revisions 2040 or greater or in [!INCLUDE[pn_crm_2015_update_0_2](../includes/pn-crm-2015-update-0-2.md)]. This user won’t appear in standard provided views. You must create a custom view to see it.  
  
> [!TIP]
>  To determine your revision of Dynamics 365 apps, in the upper-right corner of your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps screen, choose the **Settings** gear (![User settings button](../admin/media/user-settings-button.png "User settings button")) > **About**.  
> 
>  Your revision should be 2040 or above for both numbers highlighted.  
  
 ![Dynamics 365 apps revision version](../admin/media/revision-version.png "Dynamics 365 apps revision version")  
  
 To create a simple custom view to see the delegated admin user:  
  
1. Go to **Settings** > **Security** > **Users**.  
  
2. Choose **Select a view** (![Drop-down button](../admin/media/dropdown-button.png "Drop-down button")) and then choose **Create Personal View**.  
  
3. Verify **Users** is selected in **Look for**.  
  
4. Choose **User** > **Contains Data**, and then choose **Results**.  
  
   ![Create a custom user view](../admin/media/user-custom-view.png "Create a custom user view")  
  
   Delegated Admin will appear in the list of users.  
  
   ![Delegated admin appears in user list](../admin/media/delegated-admin-user.png "Delegated admin appears in user list")  
  
## How to get authorized as a delegated admin  
 [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps partners can be authorized to be delegated admins for a company in several ways:  
  
1. A partner can offer the customer to become a delegated admin for their account by sending a link to the delegated admin offer. The customer will need to accept and sign in with their [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)]/Dynamics 365 apps credentials.  
  
2. A partner can send the customer a purchase offer link with delegated admin selected as part of the offer. The customer will need to sign up for the offer and accept the delegated admin offer.  
  
3. A partner can create a trial invitation link to Dynamics 365 apps and invite the customer to the trial via a link in email or a link on the partner’s website. The trial invitation can include delegated admin if the prospect chooses to accept.  
  
## Related information  
 Review the following for more information on partners and delegated admins.  
  
-   [Learn how to provide technical support as a delegated admin](https://msdn.microsoft.com/library/partnercenter/mt157012.aspx)  
  
-   [Learn how to do common partner tasks](https://partnercenter.microsoft.com/partner/howto)  
  
-   [Learn about the Microsoft Cloud Solution Provider (CSP) program](http://go.microsoft.com/fwlink/p/?LinkID=617116)  
  
### See also  
 [Introducing the new Office 365 Partner admin center](https://blogs.office.com/2014/01/28/introducing-the-new-office-365-partner-admin-center/)   
 [Partners: Offer delegated administration](https://support.office.com/article/Partners-Offer-delegated-administration-26530dc0-ebba-415b-86b1-b55bc06b073e?ui=en-US&rs=en-US&ad=US)   
 [Partners: Add or delete a delegated admin](https://support.office.com/article/partners-add-or-delete-a-delegated-admin-201ccb3b-6011-4bf1-a6b2-84e7cc1ee2d0)
