---
title: "Buy Power Automate licenses"
description: "Buy Power Automate licenses."
author: msftman
ms.service: power-platform
ms.component: pa-admin
ms.topic: overview
ms.date: 10/06/2021
ms.author: deonhe
manager: kvivek
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Buy Power Automate licenses

[!INCLUDE [cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

## I am an admin

### Buy Power Automate plans

You can purchase Power Automate plans from [O365 Admin portal](https://admin.microsoft.com/). In O365 portal, find Purchase services under Billing and search for Power Automate to find all plans.

![](RackMultipart20211020-4-1g0es0r_html_9406c3235d4b04.png)

Select the Details of the plan and purchase

![](RackMultipart20211020-4-1g0es0r_html_8faec3151001b626.png)

###

###

### Buy Unattended add-on

You can purchase Power Automate unattended addon from [O365 Admin portal](https://admin.microsoft.com/). In O365 portal, find Purchase services under Billing. You can find Unattended addon in 2 ways

1. Search for unattended RPA add-on trial

![](RackMultipart20211020-4-1g0es0r_html_3b59b11079da0832.jpg)

2. Or search for RPA to find all RPA plans.

![](RackMultipart20211020-4-1g0es0r_html_6945ad108a0633eb.png)

Select the details of attended RPA plan and click on Add-ons

![](RackMultipart20211020-4-1g0es0r_html_7174445bdb499435.png)

Find unattended RPA add-on Trial

![](RackMultipart20211020-4-1g0es0r_html_ce1ee24c26b10ebe.png)

Once bought, the environment admin must assign the available (paid or trial) unattended add-on capacities to a specific environment in [power platform admin center](https://admin.powerplatform.microsoft.com/).

## Manage licenses

### Assign per user licenses to user

In[O365 Admin portal](https://admin.microsoft.com/), select Active users and select a user

![](RackMultipart20211020-4-1g0es0r_html_880673df5fa09152.png)

Assign the appropriate licenses and save changes.

![](RackMultipart20211020-4-1g0es0r_html_b5dfcb88d877a707.png)

### Assign per flow license

Allocating the per flow plan is a 2-step process

1. Allocate per flow license to an environment in power platform admin center

2. Assign a per flow license to a flow

It&#39;s easy and scalable to allocate the per flow add-ons you&#39;ve purchased to the environments that need add-ons. In the [Power platform admin center](https://admin.powerplatform.microsoft.com/)under capacity, a new section appears if your organization has purchased add-ons.

To allocate add-ons:

1. Select  **Manage**  in the add-on section.
2. Select an environment.
3. Enter the amount of each add-on you would like to allocate to each environment. Flow per business process is same as per flow license.
4. Select save.

![](RackMultipart20211020-4-1g0es0r_html_814d96f130e20a19.png)

Once you have allocated a per flow plan add-on to an environment, you can choose which flows will be able to use that add-on. In [flow portal](https://flow.microsoft.com/), choose the flow you want the license. Owners, co-owners of the flow and admins can assign a per flow license to a flow.

When you select a flow, you&#39;ll now see a new section in the details pane that tells you if the flow is assigned to a user, or if it is part of the per-flow plan. The default for a flow is to use the license of the user.

![](RackMultipart20211020-4-1g0es0r_html_cec90fc770264773.png)

To have a flow use the per-flow plan, select  **Edit**  in the details panel. You will then see the  **Name** ,  **Description**  and  **Plan**  that the flow uses. If your environment has the add-on allocated, you can move that flow to use the per flow plan. Otherwise, you&#39;ll need to allocate capacity.

![](RackMultipart20211020-4-1g0es0r_html_4bbebd2ee377279e.png)

Once you update your flow, anyone will be able to use that flow, even if it leverages premium connectors. Additionally, capacity will be dedicated to that flow.

### Assign unattended add-ons to an environment

In [Power platform admin center](https://admin.powerplatform.microsoft.com/), Select Capacity under Resources and select Manage in Addons to assign addons

![](RackMultipart20211020-4-1g0es0r_html_4dcd78626cca08ac.png)

Makers can now run unattended desktop flows within the environment that has the unattended capacity.

Note:

The unattended add-on is environment specific. So, if you have multiple environments that need to run unattended RPA, you need to assign add-on capacity to each of them. Also, if you need to run multiple unattended desktop flows in parallel in a single environment, you need to assign the right number of unattended add-ons to the environment to support the flow runs.

### Assign capacity add-on to an environment

[Capacity add-ons for Power Apps and Power Automate - Power Platform | Microsoft Docs](/power-platform/admin/capacity-add-on)

Monitor license usage

To monitor license usage, go to [O365 Admin portal](https://admin.microsoft.com/).

Go to Billing -\&gt;Licenses to see all licenses that are assigned vs available

![](RackMultipart20211020-4-1g0es0r_html_29f6c1107dc4f851.png)

Click on the progress bar in Assigned licenses to see which users have the license assigned

FAQ

1. How do I remove Power Automate from the app launcher for my organization?

If a user was assigned a Power Automate license, you can take the following steps to remove the license for that user, which will remove the Power Automate icon from the app launcher:

1. Go to the [Office 365 Admin Portal](https://admin.microsoft.com/).
2. In the left navigation bar, select  **Users**  \&gt;  **Active Users**.
3. Find the user for whom you want to remove the license, and then select their name.
4. On the user details pane, select the  **Licenses and Apps**  tab, and then uncheck the license for Power Automate.
5. At the bottom of the pane, select  **Save changes**.

Bulk removal of licenses is also possible through PowerShell. See [Remove licenses from user accounts with Office 365 PowerShell](/microsoft-365/enterprise/remove-licenses-from-user-accounts-with-microsoft-365-powershell) for a detailed example. Finally, further guidance about bulk removal of services within a license can be found at [Disable access to services with Office 365 PowerShell](/microsoft-365/enterprise/disable-access-to-services-with-microsoft-365-powershell).

Removing of the Power Automate license or service for a user in your organization will result in the removal of the Power Automate icon from the following locations for that user:

Note

This action removes the Power Automate tile by default. A user may still choose to use Power Automate as an individual.

2. Why did 10,000 licenses for Power Automate show up in my Office 365 tenant?

Any person can try out Power Automate Free for 90 days, and these trial licenses represent the available capacity for new Power Automate users in your tenant. There is no charge for these licenses.

If at least one user in your tenant has signed-up for a  **Microsoft Power Automate Free**  license, you will see 10,000 licenses (minus any assigned) under  **Billing**  \&gt;  **Licenses**  for your organization.

You can choose to assign additional licenses to users yourself through the Office 365 admin portal but note that these are trial licenses for Power Automate, and they will expire after 90 days of being assigned to a user.

3. Is this free? Will I be charged for these licenses?

No user can incur any cost to your organization without your express consent, so neither free nor trial licenses can cause any charges to your organization. Moreover, they also do not use any quotas, such as run quotas.

4. I removed the Power Automate Free license and users can still access it.

The Power Automate Free license is included only for tracking purposes. As covered in the first section, it is not possible to prevent another person from using Power Automate for individual purposes. Thus, the presence of a Power Automate Free license does not actually grant or remove any capabilities.

5. Why can&#39;t I see all Power Automate licenses in the Office 365 Admin portal?

Users can use Power Automate either as individuals or as a part of their organization. Licenses at the organization level will always be visible in the Office 365 portal. However, if a user signs up for a trial as an individual then that is not managed by their Office 365 admin and will not show up in the portal.

6. How can I restrict my users&#39; ability to access my organization&#39;s business data?

Power Automate allows you to create data zones for business and non-business data, as shown below. Once these data loss prevention policies are implemented, users are prevented from designing or running Power Automate that combine business and non-business data. For more details, See [Data loss prevention (DLP) policies](/power-automate/prevent-data-loss).

![](RackMultipart20211020-4-1g0es0r_html_da9709af36063e13.png)

7. I assigned a premium license to a user, but the user can&#39;t use premium features. Why?

It might take up to a week for all the downstream systems to update. To force an update for a particular flow, turn the flow off and on or edit and save the flow.

## I am a maker

### 1. What is my license?

1. Sign into [Power Automate](https://powerautomate.com/).
2. Select your profile picture in the top right corner of the screen.
3. Select  **View account**.
4. Select the  **Subscriptions**  tile.
5. Search for  **Power Automate**  under the  **Licenses**  section.

You will see the license that you have for Power Automate.

See your  [subscription page](https://portal.office.com/account/#subscriptions) to see licenses and trials assigned to you.

### 2. Can maker buy licenses?

Microsoft launched [self-service purchase](/microsoft-365/commerce/subscriptions/self-service-purchase-faq) for Microsoft Power Platform (Power BI, Power Apps, and Power Automate). This capability currently isn&#39;t available to government, non-profit, or education tenants in the United States.

Customers can make a self-service purchase online from Power Automate portal. Customers will first be asked to enter an email address to ensure they are a user in an existing Azure Active Directory (Azure AD) tenant. Then they&#39;ll be directed to log in by using their Azure AD credentials. After signing in, the customer will be asked to select how many subscriptions they want to purchase and provide credit card payment. When the purchase is complete, they&#39;ll be able to start using their subscription. The purchaser will also be able to access a limited view of the Microsoft 365 admin center where they can enable other people in their organization to use the product.

![](RackMultipart20211020-4-1g0es0r_html_4a0a915c1da39718.png)

Admins are provided with a way to turn off self-service purchasing on a per product basis via the [MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell).

Central procurement and IT teams have visibility to all users who buy and deploy self-service purchase solutions through the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339). Admins can turn off self-service purchasing on a per product basis via PowerShell

### 3. Where does the self-service purchaser see and manage their purchases?

Self-service purchasers can manage their purchases in the limited view of the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339). Purchasers can always get to the admin center from the  **Admin**  tile in the app launcher built into all Microsoft 365 and Dynamics online apps. Purchasers can view the purchases they&#39;ve made, buy additional subscriptions to the same service, and assign licenses for those subscriptions to other users in their organization. Additionally, purchasers can view and pay their bill, update their payment method, and cancel their subscription.

### FAQ

1. Are there differences between Microsoft Accounts and work or school accounts for billing?

Yes. If you sign in with a Microsoft Account (such as an account that ends with @outlook.com or @gmail.com), you can use only the free plan. To take advantage of the features in the paid plan, sign in with a work or school email address.

2. I&#39;m trying to upgrade, but I&#39;m told my account isn&#39;t eligible.

To upgrade, use a work or school account, or create an [Office 365 trial account](https://powerbi.microsoft.com/documentation/powerbi-admin-signing-up-for-power-bi-with-a-new-office-365-trial/).

3. Who can buy Microsoft Power Apps and Power Automate plans?

Any customer can sign up for a free trial. Microsoft 365 admins can buy Power Apps plans for their teams or organization. Contact your Microsoft 365 admin when you&#39;re ready to buy.

4. Can maker request admin to assign license?

Yes. Go to [Pricing | Microsoft Power Automate](https://flow.microsoft.com/pricing/), select the right license and click on Buy Now

![](RackMultipart20211020-4-1g0es0r_html_e4dc09be4c60275f.png)

fill in the details and that sends a request to your admin.

![](RackMultipart20211020-4-1g0es0r_html_96e55d996ee4b201.png)

Admin can see your request in O365 admin center and assign you license.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]