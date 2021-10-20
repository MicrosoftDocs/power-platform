---
title: "Types of Power Automate licenses"
description: "Types of Power Automate licenses."
author: msftman
ms.service: power-platform
ms.component: pa-admin
ms.topic: overview
ms.date: 10/06/2021
ms.author: jimholtz
manager: kvivek
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Types of Power Automate licenses

[!INCLUDE [cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

Standalone plans: Customers that need full-fledged, general-purpose workflow, [business process automation](#businessprocessflow) or [Robotic Process Automation (RPA)](#RPA) capabilities, should consider purchasing standalone Power Automate licenses. The prices below are based on United States. To see prices by your region and purchase plans, visit the [pricing](https://flow.microsoft.com/pricing/) page.

- **Power Automate per user plan** equips a user to run unlimited flows (within service limits) with the full capabilities of Power Automate ([Standard connectors](#standardconnectors),[Premium connectors](#premiumconnectors) ,[Business Process Flows](#businessprocessflow), [Custom connectors](#customconnectors) ,[on-premises gateways](#onpremisegateway)) based on their unique needs for $15/user/month.
- **Power Automate per user with attended RPA plan** spans legacy and modern applications, allowing individual users to create unlimited flows for API-based automation and automate legacy applications with desktop flows [through Robotic Process Automation (RPA)](#RPA) and AI. This plan includes all Power Automate per user plan capabilities and the ability for users to run an attended RPA bot on their workstation. Additionally, attended RPA includes access to [AI Builder capacity](#AIbuildercredits) in support of scenarios like forms processing, object detection, prediction, text classification and recognition. This plan can be purchased for $40/user/month.
- **Power Automate per flow plan**  enables organizations to implement flows with reserved capacity that serve a team, a department, or an entire organization without having to license each end user. This plan starts at $500/month for 5 flows.There is a $100.00 monthly fee for each additional active flow.
- **Power Automate P1 and P2 plans (grand fathered)** are no longer available for purchase, including via auto-renewal, after December 31, 2020. Customers with these plan licenses that have renewals falling on or after January 1, 2021 will need to transition to the Power Apps per user or per app plans, or the Power Automate per user or per flow plans to continue using the Microsoft Power Platform services. Customers with active contracts created before January 1, 2021 with grand fathered licenses will continue to be supported until the contract end date. Please contact your Microsoft account rep for more information or purchase licenses from [pricing](https://flow.microsoft.com/pricing/?ef_id=dd65eaf79fda13e945118bbef5cc361a:G:s&amp;OCID=AID2200054_SEM_dd65eaf79fda13e945118bbef5cc361a:G:s&amp;msclkid=dd65eaf79fda13e945118bbef5cc361a) page.

Seeded plans

The most important concept that potentially simplifies most licensing questions is &quot;Is power automate capabilities included with my Office 365/Dynamics 365/Power App License?&quot; &quot;Seeded&quot; in this case relates specifically for &quot;inclusion&quot; to another license type. Power Automate rights are included in the following plans:

1. Office 365
2. Dynamics - Dynamics 365 Enterprise plans, Dynamics 365 Professional plans, Dynamics 365 Team Member
3. Power Apps (Canvas and Model driven Apps)- Per App plans, Power Apps per user plan, Power Apps Plan 1(grandfathered), Power Apps Plan 2(grandfathered)
4. Windows licenses

Power Automate use within seeded plans is limited to the context of the application. What this means is that for both triggers and actions, flows included within a Dynamics/Power Apps application can connect:

  - To any data source within the use rights of the Dynamics/Power Apps application
  - Directly with the Dynamics/Power Apps application (via built in trigger/action)

For example, if a flow uses [premium connector](#premiumconnectors) and is triggered by a Power App, any user can run the flow if they have a Power Apps license.

If the flow is isolated and has nothing to do with the application, then standalone Power Automate licenses will need to be purchased.

More details can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Compare Power Automate Plans

Please [click here](#Licenseentitlements) to understand about entitlements

![](RackMultipart20211020-4-1g0es0r_html_154db3c5a29b8acc.png)

1. Dynamics 365 Sales Professional, Dynamics 365 Customer Service Professional
2. Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, Dynamics 365 Customer Engagement plan
3. In Dataverse for Teams environments (included in [select Office licenses),](/power-platform/admin/powerapps-flow-licensing-faq#which-microsoft-365-subscriptions-include-dataverse-for-teams-and-power-virtual-agents-capabilities-with-teams) customers can use custom connectors built on Azure and Dataverse capabilities

## How to choose the right plan

![](RackMultipart20211020-4-1g0es0r_html_d1db1ccf46bf7ef7.png)


## Transition period

All customers are in a transition period. That means that enforcement is not as strict. Once the transition period ends(Spring 2022), which will be after the full reporting is available in the Power Platform Admin Center, users will have time to react and purchase higher licenses before enforcement begins.

Transition period behavior:

1. Transition period does not mean there are no daily limits - it simply means that the currently enforced limits are more generous than the stated limits to prevent potential unintended impact on your apps or flows. See [Power platform requests](#Transition_period) to understand both plan limits and transition period limits. These transition period limits are applied at the flow level.
2. Since limits are more generous during transition period, [stacking of user licenses is not supported](/power-platform/admin/api-request-limits-allocations).If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow will use the higher plan (Dynamics 365 plan).
3. Power platform requests capacity add-on packs are not assignable to the user/flow during the transition period. However, it is recommended that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. If your flows are currently being throttled, purchase addons and create a support ticket with the flow details, add on details so support team can provide exception to un throttle the flows.

1. Dynamics/Power Apps/Office seeded license users can only use flows within the context of the app. See [Seeded plans](#Seededplans) section to understand more. The enforcement is less strict during transition period and it is recommended that you remain within your license terms to avoid any disruptions when the transition period ends.

## License entitlements

Connectors represent the app / service you want to connect. For example, OneDrive, SharePoint, Twitter etc. The connectors in Power Automate are designed to speak the language of the app you want to connect to, as well as give Power Automate access to the account. Connectors are categorized by Standard / Premium.

### Standard connectors

Standard connectors are included in your standard Office 365 subscription. We are continuously adding connectors. You can find full list of standard connectors in Power Automate at [https://preview.flow.microsoft.com/connectors/?filter=&amp;category=standard](https://preview.flow.microsoft.com/connectors/?filter=&amp;category=standard)

![](RackMultipart20211020-4-1g0es0r_html_8b8612bcfc1c1a28.png)

### Premium connectors

Premium connectors are not included in the Office365 license.

You can find full list of premium connectors in Power Automate at [https://preview.flow.microsoft.com/connectors/?filter=&amp;category=premium](https://preview.flow.microsoft.com/connectors/?filter=&amp;category=premium)

![](RackMultipart20211020-4-1g0es0r_html_c5d15eea092aa1c1.png)

### Business process flows

You can create Business process flow for a scenario to ensure that people enter data consistently and follow the same steps every time. BPF flows provide a streamlined user experience that leads people through the processes their organization has defined for interactions that need to be advanced to reach a conclusion. Learn more about BPF here

[Business process flows overview - Power Automate | Microsoft Docs](https://docs.microsoft.com/power-automate/business-process-flows-overview)

### Custom connectors

You may want to communicate with apps/services that aren&#39;t available as prebuilt connectors. Custom connectors allow you to create (and even share) a connector. Learn more about custom connectors here [Custom connectors overview | Microsoft Docs](https://docs.microsoft.com/connectors/custom-connectors/)

### Robotic Process Automation

What if I have an application that Power Automate doesn&#39;t have a connector for, and I can&#39;t create a custom connector because the app doesn&#39;t have an API? This is where _robotic process automation_ (RPA) comes in. You can use RPA to create automation even in older systems that don&#39;t have an API. With RPA, you automate applications by teaching Power Automate to mimic the mouse movements and keyboard entries of a human user, as if a robot was using the computer. In other words, whereas digital process automation provides API connectors so you can _tell_ the application what to do, with RPA, you _show_ it what to do.

### On Premise gateway

The on-premises data gateway acts as a bridge to provide quick and secure data transfer between on-premises data (data that isn&#39;t in the cloud) and several Microsoft cloud services. By using a gateway, organizations can keep databases and other data sources on their on-premises networks, yet securely use that on-premises data in cloud services. Learn more about gateways here:

https://docs.microsoft.com/power-automate/gateway-reference

### AI Builder credits

AI builder enables you to add intelligence to your automated processes, predict outcomes, and help improve business performance. Learn how to use AI builder in Power Automate [here](https://docs.microsoft.com/power-automate/use-ai-builder). AI Builder capacity is expressed in the form of &quot;service credits&quot;. Service credits serve as the single (common) currency across all the scenarios supported by AI Builder. Available service credits are deducted when AI Builder services are used. For instance, you could use these credits to extract data from a few documents with _form processing_ or perform hundreds of basic OCR extractions with _text recognition_. Different scenarios (for example, forms processing, prediction, etc.) burn down service credits at different rates. Each per user with attended RPA license grants you 5000 credits, allowing you to assess the capabilities in AI Builder. Learn more about AI builder licensing here: [https://docs.microsoft.com/power-platform/admin/powerapps-flow-licensing-faq#ai-builder](/power-platform/admin/powerapps-flow-licensing-faq%23ai-builder)

### Dataverse database and file capacity

Data volume continues to grow exponentially, as businesses advance their digital transformation journey and bring data together across their organization. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today&#39;s organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs. Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). Power Automate standalone license customers receive a tenant-wide default entitlement for each of these three storage types. Additional storage can be purchased in 1-GB increments. Learn more about Dataverse capacity storage at [https://docs.microsoft.com/power-platform/admin/capacity-storage](/power-platform/admin/capacity-storage)

## Power Platform Requests (aka API Requests)

To help ensure service levels, availability and quality, there are limits to the number of Power Platform requests users can make across all power platform products. Service limits are set against normal usage patterns in both 5-minute and per 24-hour intervals, and most customers will not reach them.

1. 24-hour limit is based on the user/flow license. If a user has Power Automate per user plan, they can make 5K power platform requests across all their flows of the tenant in 24 hours. This includes requests made by platform to 3rd party connectors too. If a flow has per flow plan, the flow can make 15K Power Platform requests across all users of the flow in 24 hours.
2. 5-minute limit is 100K requests and is independent of user&#39;s license. For example, during transition period, flow with per flow license can make 500K requests in 24 hours but cannot make more than 100K requests in 5 minutes. API capacity is tracked based on consumption at an individual user/flow level and cannot be pooled at any other level like environment or tenant. For example, 2 users in a tenant have per user licenses and each get 5K requests/day. If the first user uses more than 5K requests, their flows will slow down even though the second user only used 2K and still have 3K requests left. This ensures a usage heavy flow/user from impacting another user.

![](RackMultipart20211020-4-1g0es0r_html_74431845a05eac17.png)

### FAQ

1. What counts as Power platform requests?

Based on license plan, there are limits to the number of actions a cloud flow can run in day. These limits are different from connector throttling limits. You can see the number of actions your flow has run by selecting Analytics from the flow details page and looking at the Actions tab. Even when the flow uses fewer Power platform requests, you can still reach your limits if the flow runs more frequently than you expect. For example, you might create a cloud flow that sends you a push notification whenever your manager sends you an email. That flow must run every time you get an email (from anyone) because the flow must check whether the email came from your manager. The limit applies to all runs across all your flows in 24-hours. Some guidelines to estimate API request usage of a flow:

1. One or more actions are executed as part of a flow run. A simple flow with 1 trigger and 1 action will result in 2 &quot;actions&quot; executed per run, consuming 2 requests.

1. Every trigger/action in the flow generates Power platform requests. All kinds of actions like connector actions, HTTP actions, built-in actions (from initializing variables, creating scopes to a simple compose action) generates Power platform requests. For example, a flow connects SharePoint, exchange, twitter and Dataverse. All those actions are counted towards Power platform request limits.

1. Both succeeded and failed actions count towards these limits. Skipped actions are not counted towards these limits.
2. Each action generates one API request. If the action is in an apply to each loop, it generates more Power platform requests as the loop executes.
3. An action can have multiple expressions but is still counted as one API request.
4. Retries and additional requests from pagination count as action executions as well.

Consider the below flow where every email attachment is saved to one drive – Trigger consumes 1 Power platform request, Apply to each consumes 1 request and the actions within Apply to each section consumes multiple requests based on the number of times the loop runs. If there are 4 attachments, this section consumes 8 Power platform requests(4 \* 2 actions). In total, this flow consumes 10 power platform requests.

![](RackMultipart20211020-4-1g0es0r_html_c4a308a4bb326c08.png)

2. Whose Power platform request limits are used by the flow?

  1. If a flow has per flow license, the flow will always use the per flow limits and not the creator/owner/invoking user&#39;s limits.
  2. Automated and scheduled flows always use the flow creator/owner&#39;s power platform request limits regardless of who started the process or what accounts are used for connections inside of the process. For a solution flow, you can change the owner of the flow using Web API(Instructions [here](https://docs.microsoft.com/power-automate/web-api#update-a-cloud-flow)). Once the owner is changed, the new owner&#39;s API request limits are used. For a non-solution flow, the flow always uses the original creator&#39;s limits which can&#39;t be changed. If the original creator leaves the company, any co-owners of the flow can export and import the flow as a different owner. Check out the[video tutorial](https://www.youtube.com/watch?v=K7_xWJvEPUc). Once the flow is imported, it becomes a new flow and will start using limits from the new owner. Alternatively, a per flow license can be assigned to the flow.
  3. Instant flows (button, power apps, hybrid triggers) use limits of invoking user irrespective of connections used in the flow.
  4. If an automated/scheduled flow is shared with another user and that user triggered the same flow, it would still use limits of the original owner and not the new users limits. But if the user then leveraged it to make their own new flow, then that new user will become the owner of the second flow and that flow will use the new user&#39;s limits.
  5. If a parent flow calls a child flow, child flow will use parent flow&#39;s limits. For example, if the parent flow is an automated flow, child flow uses parent flow creator/owner&#39;s limits.
  6. If the parent flow is a manual flow, the child flow will use the parent flow&#39;s invoking user&#39;s limits.
  7. If the child flow has a per flow license, flow will use the per flow limits and not the parent flow&#39;s license.
  8. During [transition period](#Transition_period), there is a slight difference in this behavior. Child flow owner&#39;s license will be used unless the child flow has a per flow license but once the transition period ends, child flow owner&#39;s limits will be ignored and only parent flow owner&#39;s limits will be used unless child flow has a per flow license.

3. As a maker, what tools do I have to analyze my usage?

If you are experiencing delays or slowdowns during your flow execution, it&#39;s likely that you have hit Power Automate limits for the day. For flows that are consistently getting delayed due to overages, users also receive a notification informing them about these overages with tips and tricks on how to prevent delayed execution of your flow runs.

Here is an example of an email that was sent for a flow that was consistently running up against action limits.

![](RackMultipart20211020-4-1g0es0r_html_c2694be6d07d76c7.png)

Power Platform admin center will soon contain reports on Power Automate requests.This reporting will help you to quickly view adoption and user metrics for your organization.

Additionally, you can see the action usage for a given flow by selecting the  **Analytics**  action from the flow properties page, and this works across all types of actions. This helps you understand how many actions are running each day. It can help you detect inefficiencies in your workflow logic, overages, understand usage patterns to optimize for capacity.

![](RackMultipart20211020-4-1g0es0r_html_506275adcda597da.png)

![](RackMultipart20211020-4-1g0es0r_html_d03b35d358e5d01c.png)

3. As an admin, what tools do I have to analyze my environment&#39;s usage?

Once the transition period ends, users will have 2 reports available in the Power Platform admin center:

1. User report – Power platform request usage by every user in the environment vs their entitled limits

2. Per flow report - Power platform request usage by every flow in the environment that has a per flow license.

Once the reports are available, users will have time to react and purchase higher licenses before enforcement begins.

4. What happens when my flow runs too many actions?

When you have a flow that is executing many actions it will impact on the performance of your flow. You will see a banner on the flow if your flow is being throttled.

In the most common case – exceeding limits will result in delayed execution of subsequent actions – which will slow down the overall execution of your flow run. These delays are proportional to the degree of overages caused by a flow.

Occasional overages are okay. For instance: Exceeding your daily limits by 500 actions is not going to impact the performance of your flow, however exceeding your limit by 50,000 actions will have a significant performance impact on your flow.

5. What are connector limits and are they different from power platform request limits?

The connectors in the flow have separate limits as a service protection mechanism. For example, the SharePoint connector caps actions at 600 per minute. A single SharePoint connection used across multiple flows can still only execute 600 operations per minute. Most connector pages have a [Throttling Section](https://docs.microsoft.com/connectors/sharepointonline/#limits) that documents this limit. This limit is different from API request limits. For example, an office user can execute 2000 actions/day across all their flows but can still get throttled by connector if they used more than 600 SharePoint actions in a minute despite not reaching the 2000 actions limit.

When a flow was throttled because of reaching connector limits, you might see a 429 (Too Many Requests) error in your flow with error text like &quot;Rate limit is exceeded. Try again in 27 seconds.&quot;

6. What can I do if my flow is above limits?

Users won&#39;t be blocked from using an app or flow for occasional and reasonable overages.

1. Revisit your flow design and check for any efficiency that can help reduce the number of actions being executed. Check out Best Practices section to create flows to use less actions.
2. If the flow is already optimized but uses more actions because of the nature of the business, consider buying a higher license. During [transition period](#Transition_period), Per Flow plan provides the best performance quota available (500K actions/day).
3. Purchase the  **Power Apps and Power Automate capacity add-on**  for your organization. During [transition period](#Transition_period), as enforcement is currently less strict, there is no facility to yet assign the  **Power Apps and Power Automate capacity add-on**  to a user. However, it is recommended that you purchase these add-ons now to remain within your license terms and raise a support ticket with the flow details to un throttle the flow.

If a flow is consistently above transition period limits for 14 consecutive days, the flow will be systematically turned off and the owner is notified. You can fix the flow/buy higher license and turn it on anytime.

7. I am using COE toolkit in the organization will the usage count towards my API request limits?

Yes. Flows included in COE toolkit also draw limits from the owner. We recommend you buy additional capacity and reach out to support to get temporary relief from throttling.

8. Can I user a service account and run multiple flows under it?

Yes. Make sure you have the right license assigned to the service account based on your usage to avoid flows being throttled.

9. Can I use Service principal in Flow, and does it count against my power platform request limits?

Service principal is not yet supported but it is on the road map. Once the support is available, service principal flows will draw from a separate quota called non-interactive limits. More information here

/power-platform/admin/api-request-limits-allocations#requests-limits-not-based-on-licensed-users-or-flows

10. Will desktop flow usage count towards against my power platform request limits?

Only the desktop flow action, invoked from cloud, would count against the limit. All actions contained within the desktop flow are not counted towards API limits.

11. What happens to my Power platform requests if I have multiple plans?

Since limits are more generous during transition period, [stacking of user licenses is not supported](/power-platform/admin/api-request-limits-allocations).If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow will use the higher plan (Dynamics 365 plan).

After transition period,

If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license as well as a Power Apps per user license then that user will have a total of 20000 + 5000 = 25000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365 Customer Service.

12. What are performance profiles and how do I know which performance profile is used by my flow?

| **Performance profile** | **Plans** |
| --- | --- |
|
| |
|
| |
| Low | - Free
 - Microsoft 365 plans
 - Power Apps Plan 1, Per App plans
 - Power Automate Plan 1
 - All license trials |
| --- | --- |
| MediumLow1 | - Power Apps Plan 2, Power Apps per user plan
 - Power Automate Plan 2, Power Automate per user, Power Automate per user with Attended RPA plans
 - Dynamics 365 Team Member |
| MediumLow2 | - Dynamics 365 Enterprise plans, Dynamics 365 Professional plans
 - [Dynamics 365 non-licensed users, application users, users with special free licenses](/power-platform/admin/api-request-limits-allocations#non-licensed-usersapplication-usersusers-with-special-free-licenses) |
| Medium | - Power Apps triggered flows, or child flows- Power Apps Plan 2, Power Apps per user plan
 - Power Automate Plan 2, Power Automate per user, Power Automate per user with Attended RPA plans
 - Dynamics 365 Team Member- Dynamics 365 Enterprise plans, Dynamics 365 Professional plans




 |
| High | - Power Automate per flow plan |

Based on the license of the owner, flow is assigned a performance profile which in turn decides the power platform request limits of the flow. If there are multiple licenses assigned to the owner, flow will pick the highest perf plan out of all of them.

| Performance profile | Limits during [transition period](#Transition_period) | Limits after [transition period](#Transition_period) |
| --- | --- | --- |
| Low | 10,000 | 2000 |
| Medium Low1 | 25,000 | 5000 |
| Medium Low1 | 100,000 | 20,000 |
| Medium | 125,000 | 25,000 |
| High | 500,000 | 15,000 |

Performance profile tier is primarily for limits during transition period. Once transition period ends, the limits are based on entitlements of the plan and not related performance profile tiers. For example, during transition period, High limit(500K) is more than Medium(125K) but once transition period ends high limit(15K) is lower than medium limits(25K).

13. In an organization, 8 users have Office 365 license and their daily Power Platform requests/API would be 2000 API/user/24 hours. Does that mean that it will be pooled to tenant level with a limit of 16000 API/24 hours (8\*2000) and all users can consume from this pool?

No. Power platform requests are not pooled at the env/tenant. This is to make sure a heavy user doesn&#39;t end up consuming all Power platform requests of the tenant and impact everyone else. Since the license is per user, the limit is per user too. So, all office customers get 2K each whether they use it or not.

### Best Practices

A guide to building enterprise ready flows [https://clouddamcdnprodep.azureedge.net/gdc/gdc5fzAoK/original](https://clouddamcdnprodep.azureedge.net/gdc/gdc5fzAoK/original)

- Best practices for your flow to use fewer actions:
  - If you have &#39;Do until&#39; or &#39;Apply to each&#39; loops in your flow, see if you can reduce the number of loop iterations, possibly by retrieving fewer items to iterate through.
  - Many connectors have &#39;Filter query&#39; and &#39;Top count&#39; parameters that can be used to reduce the number of items and amount of data retrieved by using OData.
  - If you have a scheduled flow that runs frequently, consider reducing the frequency. Many flows that run once per minute or hour could be revised to occur less often. Use trigger conditions to minimize the run frequency.
  - If your flow is interacting with files, be conscious of the file size and try to reduce it if possible.
  - If you need to reuse a single property returned by an action with large output size multiple times, consider using &#39;Initialize Variable&#39; to store that property, and use the variable in later actions. Even if only one property is used from an output of an earlier action, all outputs of that action that will be passed into the later action as inputs.
- Best practices to scale your flow:
  - If your flow is executing thousands of actions every day, you should consider purchasing a Per Flow license to get better throughput and higher quotas. During [transition period](#Transition_period), Per Flow plan provides the best performance quota available (500K actions/day). Please reach out to your tenant administrator to purchase the license and assign it to the flow. Once the license is purchased and assigned, the author of the flow should resave it. Alternatively, flows will be updated in the background once per week to reflect current plans.
  - Consider splitting the workload across multiple flows to achieve high scale.

FAQ

[https://docs.microsoft.com/power-platform/admin/api-request-limits-allocations#frequently-asked-questions](/power-platform/admin/api-request-limits-allocations#frequently-asked-questions)

# Free Plan

If you sign in with work or school email address, you get all[Power Automate capabilities included in Office 365.](#Office)But if you do not have a work/school account but have a non-business user account (such as an account that ends with @outlook.com or @gmail.com), you can still use Power Automate using free plan.Go to [flow.microsoft.com](https://flow.microsoft.com/) and select Try free.However, you cannot share flows using free plan.

To know which users, have free plan assigned go to [O365 Admin portal](https://admin.microsoft.com/).

Go to Billing -\&gt;Licenses to see how many free licenses are assigned vs available

![](RackMultipart20211020-4-1g0es0r_html_29f6c1107dc4f851.png)

Click on Assigned licenses to see which users have free license

Community Plan

There is a [free Community Plan to learn Power Platform](https://powerapps.microsoft.com/communityplan/). You are not allowed to use it in production but can try out things and have access to all premium connectors. You can use this free community plan also in a free [Microsoft 365 developer tenant](https://developer.microsoft.com/microsoft-365/dev-program). Business process flows and RPA flows cannot be created in environment with community plan.

# Trials

Power Automate trials are available for 90 days. There are 2 types of trials available for Power Automate.

### Admin managed trial

These trials are started by global admin in M365 Admin Center, and can be assigned to users. These are only for 30 days. Tenant admins can add a trial (subscription-based) environment to their tenant, or new customers can sign up for a new tenant and become the Global admin. For new customers, an admin-managed subscription is created with a set number of licenses (usually 25); admins control which other users get licenses assigned to them. An admin-managed subscription has an end date that can be extended once (another 30 days). Admin can get Power Automate per user trial, Power Automate attended RPA trial or Power Automate unattended RPA trial.

You can start Power Automate trials from [O365 Admin portal](https://admin.microsoft.com/). Go to Purchase services under Billing section. Search for power automate and select a plan

![](RackMultipart20211020-4-1g0es0r_html_9406c3235d4b04.png)

Click on the details of a plan and select Start free trial

![](RackMultipart20211020-4-1g0es0r_html_51fc35c9e4162caa.png)

![](RackMultipart20211020-4-1g0es0r_html_b7eedbbe2feb600f.png)

###

Once you start a trial, go to Billing-\&gt; Licenses to see 25 new licenses available to be assigned to users.

Note: Trials are different from Free licenses. Once you start a trial, the sku name might not say Trial.

![](RackMultipart20211020-4-1g0es0r_html_29f6c1107dc4f851.png)

### User trial

These trials are started by user either from [pricing](https://flow.microsoft.com/pricing/?ef_id=dd65eaf79fda13e945118bbef5cc361a:G:s&amp;OCID=AID2200054_SEM_dd65eaf79fda13e945118bbef5cc361a:G:s&amp;msclkid=dd65eaf79fda13e945118bbef5cc361a) page or from within product. This trial gives premium connector access, attended RPA and unattended RPA. This trial is for 90days. You can go to

![](RackMultipart20211020-4-1g0es0r_html_abed421320baefa8.png)

These trials can also be started by user from product. For example, when user tries to create a desktop flow without a Power Automate per user with attended RPA plan, user will be prompted to start a trial that includes usage of premium connectors, attended RPA, and unattended RPA.

![](RackMultipart20211020-4-1g0es0r_html_ec61ca9a09f3a21f.png)

### FAQ

1. How can I create an admin trial, check expiry and extend trials?

Check this document for instructions:

https://docs.microsoft.com/power-platform/admin/trial-environments#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center

2. How can admins allow/block trial licenses?

Admins can use PowerShell cmdlets to enable/disable trails. Once disabled, all existing plans of the specified type will be removed from all users in the tenant and will not be recoverable. In addition, it will block all further assignment of plans of that type. Admins can enable trials at any time.

[https://docs.microsoft.com/power-platform/admin/trial-environments#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center](/power-platform/admin/trial-environments#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center)

3. How can I convert a trial environment to prod?

You can convert either type of trial environment to a production environment by switching it to consume from paid capacity, which will keep it from being disabled and deleted. After it becomes a production environment, it will follow the paid license lifecycle.

4. Do trials work in GCC and gov clouds?

No. Trials won&#39;t work in gov clouds (GCC), and they can only purchase plans with volume discounting.

5. Can I see all trials using PowerShell cmdlet?

Viral trials cannot be blocked by PowerShell cmdlet.




[!INCLUDE[footer-include](../../includes/footer-banner.md)]