---
title: "For partners: Get the credit when your customers subscribe to Dynamics 365  | MicrosoftDocs"
description: "For partners: Get the credit when your customers subscribe to Dynamics 365"
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
  - Flow
---
# For partners: Get the credit when your customers subscribe

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

As a Dynamics 365 partner, you can help your customer sign up for a [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)]. You can customize and set up their organization for them, and reduce their effort to get started. After signing up, you can designate your company as the customer’s partner of record. As the partner of record, you can help to ensure that your customer has a great trial experience and start them down the path toward success with Dynamics 365 apps.  
  
 This document describes in detail the tasks you must complete to sign up for Dynamics 365 apps on behalf of your customer. It also describes the tasks a customer must do to remove your administrative privileges from the customer's company to ensure that they won’t be charged for your access after the trial is complete.  
  
<a name="BKMK_OneSignupfor"></a>   
## Sign up for a free trial subscription  
 Using a [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)], which can be your ID or your customer’s, sign up for a free trial of Dynamics 365 apps. The free 30-day trial subscription includes 20 user licenses and 5 gigabytes (GB) of storage. You can activate your customer’s trial subscription as a paying subscription at any time during the first 30 days. If you sign up for the trial subscription using your customer's [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)], you won't need to worry about transferring ownership of the account later on.  

For information on signing up for a trial, see [Try Power Apps and Dynamics 365 apps](try-powerapps-dynamics-365.md).
  
> [!IMPORTANT]
> When signing up for the free trial, note the following:  
>   
> -   Make sure to select the correct country/region for your customer. The country/region is important for setting up your customer's billing.  
>   
> -    If the customer doesn’t have a billing address in the country/region you select, their account can’t be activated later.  
> -   When you accept the terms of service, you're accepting it on behalf of your customer and representing their agreement to our terms.  
  
Soon after you complete the sign up, you’ll be notified by email that the trial subscription is ready. You’ll also receive email messages that provide help for new organizations during the first 30 days of their subscription. Forward these email messages to your customer.  
  
<a name="BKMK_TwoDesignateyourself"></a>   
## Designate yourself as the partner of record  
 After completing the trial sign up, designate your company as the partner of record who is responsible for the customer. As the partner of record, you can help [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] provide our partners and customers with the best service and support. After the trial subscription becomes a paid subscription, your partner company can also claim the Software Advisor (CSA) fee for the subscription. For information about the CSA fee program, visit the [Microsoft Partner Network](https://go.microsoft.com/fwlink/p/?LinkId=532917) site. <!--, where you can download the [Dynamics 365 apps Software Advisor Operations Guide and FAQ](https://go.microsoft.com/fwlink/p/?LinkId=204192), which provides detailed instructions for the fee claim process.  -->
  
 If your customer has already signed up for a [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)], or prefers to sign up for the trial subscription themselves, they can still designate your company as the partner of record.  
  
1. Go to the [Partner of Record Designation](https://go.microsoft.com/fwlink/p/?LinkId=204179) page in CustomerSource.  
  
2. Sign in with the same [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that you used to sign up for the trial subscription.  
  
    If this [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] is associated with more than one [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)], select your customer’s organization.  
  
3. Search for your partner company’s account, and then select **Dynamics 365** as the product line from the drop-down list.  
  
   > [!TIP]
   >  You can search for your partner company by company name, phone number, or their 10-digit partner MBS authorization number.  
  
4. Select your company from the search results, and then click **Associate**.  
  
<a name="BKMK_ThreeTransferownership"></a>   

## Transfer ownership after completing the trial  
 After the trial period is complete and your customer is ready to start their subscription, there are a few steps you need to complete in order to transfer ownership of the environment. If you signed up for the [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] on behalf of the customer by using a [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] other than your customer’s, call [Customer Service and support](support-overview.md) to request a transfer of ownership of the subscription to your customer and designate him or her as the billing administrator of the customer’s organization. The billing administrator can take actions that have financial implications to the [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)], such as:  
  
- Upgrading to a different subscription  
  
- Upgrading to a different release  
  
- Purchasing additional licenses  
  
- Purchasing additional storage  
  
  > [!TIP]
  >  If you used a [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that belongs to someone in your customer’s organization, or that can be transferred to your customer, skip this task. Give the email address and its password to your customer.  
  
  To transfer the ownership of the trial subscription, you’ll need the following:  
  
- The email address of the person from your customer’s organization who will act as a system administrator and the billing administrator for the subscription.  
  
  > [!IMPORTANT]
  >  Each organization must have a billing administrator.  
  
- The [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that was used to sign up for the subscription.  
  
- The name of the company used to create the trial subscription.  
  
   You’ll need this name to identify your customer's company if there is more than one account registered at the [Microsoft Billing and Account Management](https://go.microsoft.com/fwlink/p/?LinkId=204182) site.  
  
- If the free trial subscription has already been activated to a paying subscription, you’ll also need the credit card number used to pay for the subscription.  
  
### Add a system administrator  
  
1. Sign in using the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that you used to sign up for the trial.  
  
2. Follow the steps in [Create users and assign security roles](create-users-assign-online-security-roles.md) to create a user and assign the system administrator security role. This user will also function as the billing administrator.  
  
3. Make sure the new billing administrator has successfully signed in to your organization before transferring ownership.  
  
### Add an account delegate  
  
1. Go to the [Microsoft Billing and Account Management](https://go.microsoft.com/fwlink/p/?LinkId=204182) site.  
  
2. Sign in with the same [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that you used to sign up your customer for the trial subscription.  
  
3. Under **Billing account overview**, select the company account where you want to add a delegate.  
  
4. Click **View or add account delegates**.  
  
5. On the **Manage account delegates** page:  
  
   1. Click **Add an account delegate**.  
  
   2. Enter the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] of the new billing administrator.  
  
   3. Click **Add delegate**.  
  
### Request an ownership transfer  
  
1. Contact [Support](get-help-support.md). 
  
2. Give the customer service representative the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that was used to sign up for the subscription and the account ID number.  
  
3. Give the customer service representative the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] of the new billing administrator.  
  
4. Ask the customer service representative to promote the new billing administrator to initial user, and primary administrator.  
  
   > [!IMPORTANT]
   >  Make sure that the new billing administrator has accepted the invitation to become a system administrator. The [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that was used to sign up for the trial subscription will be demoted to an account delegate.  
  
<a name="BKMK_FourRemovethepartners"></a>   
## Remove the partner's administrative privileges  
 These tasks are optional. After you sign up your customer and register yourself as the partner of record, you will have access to your customer's subscription and billing account for the subscription. The following tasks are performed by the customer.  
  
> [!IMPORTANT]
>  If you or your customer do not remove your privileges, the customer will be charged the standard monthly user fee for your access.  
  
 If your customer wants to remove your access to the billing account for the subscription, they must complete the following steps:  
  
### Remove partner access to the billing account  
  
1. Go to the [Microsoft Billing and Account Management](https://go.microsoft.com/fwlink/p/?LinkId=204182) site.  
  
2. Sign in with the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] you use for the billing administrator at your company.  
  
3. If the service name displayed under **Billing account overview** is not correct, select the account from the menu that corresponds to the [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)].  
  
4. Click **View or add account delegates**.  
  
5. Next to the names of account delegates you want to remove, click **Remove**.  
  
6. In the next window, click **Yes** to confirm the removal.  
  
   > [!IMPORTANT]
   >  We strongly recommend that at least two people in the organization have access to the Billing and Account Management site. To add someone, click **Add an account delegate**, and then follow the online instructions.  
  
   > [!TIP]
   >  To verify that the information on the personal information page is correct, click **Go to Account Information**.  
  
If your customer wants to disable your access to the subscription, they must complete the following steps:  
  
### Disable partner access to the [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)]  
  
1. Sign in to the [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] with the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] you use for the billing administrator at your company.  
  
2. Follow the steps in [Create users and assign security roles](create-users-assign-online-security-roles.md) to disable the user from the partner company.
