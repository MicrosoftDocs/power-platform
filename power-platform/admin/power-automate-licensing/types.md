---
title: "Types of Power Automate licenses"
description: "Types of Power Automate licenses."
author: PriyaKodukula
ms.service: power-platform
ms.subservice: admin
ms.topic: overview
ms.date: 10/31/2021
ms.author: prkoduku
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

Organizations gain rights to use Power Automate via licenses (paid or trial) that are available either as [standalone plans](#standalone-plans) or as [seeded plans](#seeded-plans).

## Standalone plans

Customers who need to create fully flexible, general-purpose workflows with either [business process automation](/power-automate/business-process-flows-overview) or [Robotic Process Automation (RPA)](/power-automate/desktop-flows/introduction) capabilities, should consider [purchasing standalone Power Automate licenses](https://flow.microsoft.com/pricing/).

Plan|Description
--------|------
Power Automate per user plan|This plan provides a user with rights to run an unlimited number of flows (within service limits) with the full capabilities of Power Automate, including [standard connectors](https://preview.flow.microsoft.com/connectors/?filter=&category=standard),[premium connectors](#premium-connectors),[business process flows](#business-process-flows), [custom connectors](#custom-connectors),[on-premises gateways](#on-premises-gateway) based on their unique needs for a monthly fixed cost for each user.
Power Automate per user with attended RPA plan|This plan spans legacy and modern applications, allowing makers to create unlimited flows for API-based automation and automate legacy applications with desktop flows [through Robotic Process Automation (RPA)](#robotic-process-automation) and AI. This plan includes all Power Automate per user plan capabilities and the ability for users to run an attended RPA bot on their workstation. Additionally, this plan includes access to [AI Builder capacity](#ai-builder-credits), supporting scenarios like forms processing, object detection, prediction, text classification, and recognition. This plan can be purchased for a monthly fixed cost for each user.
Power Automate per flow plan|  With this plan, organizations can implement flows with reserved capacity that serve a team, a department, or an entire organization without having to license each user separately. This plan starts with a fixed monthly cost for for five active flows.There is a monthly fee for each additional active flow (beyond the five flows that are included in the base fee).
Power Automate P1 and P2 plans (grand fathered)| These plans are no longer available for purchase nor via auto-renewal after December 31, 2020. Organizations with these plan licenses with renewals that are due on or after January 1, 2021 need to transition to either the Power Automate per user or per flow plan or to the Power Apps per user or per app plan to continue using the Microsoft Power Platform services. Customers with active contracts that started before January 1, 2021 with grandfathered licenses will continue to be supported until the contract end date. Contact your Microsoft account representative for more information or [purchase licenses](https://flow.microsoft.com/pricing/?ef_id=dd65eaf79fda13e945118bbef5cc361a:G:s&amp;OCID=AID2200054_SEM_dd65eaf79fda13e945118bbef5cc361a:G:s&amp;msclkid=dd65eaf79fda13e945118bbef5cc361a).

## Seeded plans

Organizations also gain rights to use Power Automate if they are licensed to use any of the following plans where Power Automate licenses are **seeded**. <!-- if they have any of the following  through other The most important concept that potentially simplifies most licensing questions is "Is power automate capabilities included with my Office 365/Dynamics 365/Power App License?" "Seeded" in this case relates specifically for "inclusion" to another license type. Power Automate rights are included in the following plans: -->

- Microsoft 365 (formerly Office 365).
- Dynamics 365 Enterprise.
- Dynamics 365 Professional.
- Dynamics 365 Team Member.
- Power Apps (Canvas and Model driven Apps)- Per App plans.
- Power Apps per user.
- Power Apps Plan 1 (grandfathered).
- Power Apps Plan 2 (grandfathered)
- Windows licenses.

When you use seeded plans, your flows must run within the context of the application in which the seeded plan is available. For example, flows included within a Dynamics/Power Apps application can connect to the following.

- To any data source within the use rights of the Dynamics 365/Power Apps app.
- Directly with the Dynamics 365/Power Apps app (via built in triggers/actions).

For example, if a flow uses [premium connectors](#premium-connectors) and it's triggered by a Power App app, any user can run the flow if they have a Power Apps license.

If the flow is isolated and has nothing to do with the application, then a standalone Power Automate license must be purchased.

You can find more details can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Compare Power Automate plans

Learn [more about license entitlements](#license-entitlements).

Here's a chart that lays out the limits that are associated with the different license plans.

![Image showing a comparison](../media/power-automate-licensing/license-comparison.png)

1. Dynamics 365 Sales Professional and Dynamics 365 Customer Service Professional.
1. Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, and Dynamics 365 Customer Engagement plan.
1. In Dataverse for Teams environments (included in [select Office licenses)](/power-platform/admin/powerapps-flow-licensing-faq#which-microsoft-365-subscriptions-include-dataverse-for-teams-and-power-virtual-agents-capabilities-with-teams) customers can use custom connectors built on Azure and Dataverse capabilities.

## Transition period

All customers are in a transition period. That means that enforcement isn't strict and limits are higher. After the transition period ends (First quarter of calendar year 2022), which will be after the full reporting is available in the Power Platform admin center, organizations will have six months to analyze their usage and purchase licenses that are appropriate before strict enforcement on license limits begins.

Here are a few things to be aware of during the transition period.

1. The transition period doesn't mean that there are no daily limits. It means that the currently enforced limits are more generous than the stated limits to prevent potential unintended impact on your apps or flows. See [Power Platform requests](#transition-period) to understand both plan limits and transition period limits. These transition period limits are applied at the flow level.
1. Since limits are more generous during the transition period, [stacking of user licenses isn't supported](/power-platform/admin/api-request-limits-allocations). If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow will use the higher plan (Dynamics 365 plan).
1. Power Platform requests capacity add-on packs are not assignable to the users or flows during the transition period. However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. If your flows are currently being throttled, purchase add-ons and create a support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.
1. Seeded license users can only use flows within the context of the app. See [the seeded plans](#seeded-plans) section to learn more. The enforcement on license limits is less strict during transition period and Microsoft recommends that you remain within your license terms to avoid any disruptions when the transition period ends.

## License entitlements

Connectors represent the app/service to which your flows connect. For example, OneDrive, SharePoint, Twitter, etc. are examples of services to which flows connect. The connectors in Power Automate are designed to *speak the language* of the apps/services to which your flows connect, as well as give Power Automate access to the account. Connectors are categorized as either [standard](#standard-connectors) or [premium connectors](#premium-connectors).

### Standard connectors

[Standard connectors](/connectors/connector-reference/connector-reference-standard-connectors) are included in your standard Microsoft 365 subscription. We are continuously adding more standard connectors.

<!--
![List of standard connectors](../media/power-automate-licensing/standard-connectors.png)
-->

### Premium connectors

Premium connectors are not included in the Microsoft 365 license but included in all [standalone plans](#standalone-plans).

Here's the full list of [premium connectors](/connectors/connector-reference/connector-reference-premium-connectors) in Power Automate.

<!--
![List of premium connectors](../media/power-automate-licensing/premium-connectors.png)
-->

### Business process flows

You can create [business process flows](/business-process-flows-overview) for a workflow to ensure that users enter data consistently and follow the same steps every time. Business process flows provide a streamlined user experience that leads people through the processes their organization has defined for interactions that need to be advanced to reach a conclusion.

### Custom connectors

You may want to communicate with apps/services that aren't available as prebuilt connectors. [Custom connectors](/connectors/custom-connectors) allow you to create (and even share) your own connectors.

### Robotic Process Automation

What if I have an application that Power Automate doesn't have a connector for, and I can't create a custom connector because the app doesn't have an API? _Robotic process automation_ (RPA) is perfect for scenarios such as this one. You can use RPA to create automation even in older systems that don't have an API. With RPA, you automate applications by teaching Power Automate to mimic the mouse movements and keyboard entries of a human user, as if a robot was using the computer. In other words, whereas digital process automation provides connectors so you can _tell_ the application what to do, with RPA, you _show_ it what to do.

### On premises gateway

The [on-premises data gateway](/power-automate/gateway-reference) acts as a bridge to provide quick and secure data transfer between on-premises data and several Microsoft cloud services. With gateways, organizations can keep databases and other data sources on-premises and securely use that on-premises data in cloud services.

### AI Builder credits

With [AI builder](/use-ai-builder), you to add intelligence to your automated processes, predict outcomes, and help improve business performance. AI Builder capacity is expressed in the form of "service credits". Service credits serve as the single (common) currency across all the scenarios that AI Builder supports. Available service credits are deducted when AI Builder services are used. For instance, you could use these credits to extract data from a few documents with _form processing_ or perform hundreds of basic OCR extractions with _text recognition_.

Different scenarios (for example, forms processing, prediction, etc.) consume service credits at different rates. Each per user with attended RPA license grants you 5000 credits, allowing you to assess the capabilities in AI Builder. Learn more about [AI builder licensing](/power-platform/admin/powerapps-flow-licensing-faq%23ai-builder).

### Dataverse database and file capacity

Data volume continues to grow exponentially as businesses advance their digital transformation journey and bring data together across their organizations. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs. Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). Power Automate standalone license customers receive a tenant-wide default entitlement for each of these three storage types. You can buy more storage in 1-GB increments. Learn more about [Dataverse capacity storage](/power-platform/admin/capacity-storage).

## Power Platform requests

To help ensure service levels, availability and quality, there are limits to the number of Power Platform requests users can make across all Power Platform products. Service limits are set against normal usage patterns in both five minute and per 24 hour intervals. Most customers will not exceed these limits.

- The 24 hour limit is based on the user or flow license. If a user has a Power Automate per user plan, they can make 40,000 Power Platform requests across all their flows of the tenant in a 24 hour period. This includes requests the platform makes to third party connectors too. The 24 hours is a sliding window, meaning anytime a flow is running, the system looks at the requests in the past 24 hours to identify if the user is at the limit. If a flow has the per flow plan, the flow can make 250,000 Power Platform requests across all users of the flow in a 24 hour period. To prevent a usage-heavy flow or user from impacting other users, this capacity is tracked based on consumption at an individual user or flow level and it cannot be pooled at any other level like environment or tenant levels. For example, two users in a tenant may have per user licenses and each gets 40,000 requests per day. If the first person uses more than 40,000 requests, their flows will slow down and will not impact the second user who only used 20,000 requests and still has 20,000 requests remaining.
- The five minute limit is 100,000 requests and it is independent of a user's license. For example, flows with a per flow license can make 250,000 requests in 24 hours but they cannot make more than 100,000 requests in five minutes.

<!--todo: Create a table to replace this image-->

![List that displays license limits](../media/power-automate-licensing/license-limits.png)

### FAQs

Here are some of the frequently asked questions about limits, and their answers.

#### What counts as Power Platform request?

Based on license plan, there are limits to the number of actions a cloud flow can run in day. These limits are different from connector throttling limits. You can see the number of actions your flow runs by selecting **Analytics** from the flow details page and looking at the **Actions** tab.

Even when the flow uses fewer Power Platform requests, you can still reach your limits if the flow runs more frequently than you expect. For example, you might create a cloud flow that sends you a push notification whenever your manager sends you an email. That flow must run every time you get an email (from anyone) because the flow must check whether the email came from your manager. The limit applies to all runs across all your flows in a 24 hour period. Here are some guidelines to estimate the request usage of a flow.

- One or more actions run as part of a flow run. A simple flow with one trigger and one action results in two "actions" each time the flow runs, consuming 2 requests.
- Every trigger/action in the flow generates Power Platform requests. All kinds of actions like connector actions, HTTP actions, built-in actions (from initializing variables, creating scopes to a simple compose action) generate Power Platform requests. For example, a flow that connects SharePoint, Exchange, Twitter, and Dataverse, all those actions are counted towards Power Platform request limits.
- Both succeeded and failed actions count towards these limits. Skipped actions are not counted towards these limits.
- Each action generates one request. If the action is in an apply to each loop, it generates more Power Platform requests as the loop executes.
- An action can have multiple expressions but it's counted as one API request.
- Retries and additional requests from pagination count as action executions as well.

Consider the following flow where every email attachment is saved to OneDrive. The trigger consumes one Power Platform request, Apply to each consumes one request, and the actions within Apply to each consume multiple requests based on the number of times the loop runs. If there are four attachments, this section consumes eight Power Platform requests (4 x 2 actions). In total, this flow consumes 10 Power Platform requests.

![An image of a sample flow](../media/power-automate-licensing/sample-flow.png)

#### Whose Power Platform request limits are used by the flow?

- If a flow has per flow license, the flow will always use the per flow limits and not the creator/owner/invoking user's limits.
- [Automated and scheduled flows](/power-automate/flow-types#cloud-flows) always use the flow creator/owner's Power Platform request limits regardless of who started the process or what accounts are used for connections inside of the process. For a solution flow, you can change the owner of the flow using [Web API](/power-automate/web-api#update-a-cloud-flow). After you change the owner, the new owner's API request limits are used. For a non-solution flow, the flow always uses the original creator's limits which can't be changed. If the original creator leaves the company, any co-owners of the flow can export and import the flow as a different owner. <!-- to do: a bunch of ads play before the video starts. Check out the[video tutorial](https://www.youtube.com/watch?v=K7_xWJvEPUc) for me details.--> After you import the flow, it becomes a new flow and starts using limits from the new owner. Alternatively, you can assign a per flow license to the flow.
- [Instant flows (button, power apps, hybrid triggers)](/power-automate/flow-types#cloud-flows) use the invoking user's limits, regardless of the connections that are used in the flow.
- If you share an automated/scheduled flow with another user and then that user triggers the same flow, it uses the limits of the original owner and not the new user's limits. But if the user then leverages the flow to make their own new flow, then that new user becomes the owner of the new flow and that flow uses the new user's limits.
- If a parent flow calls a child flow, the child flow uses the parent flow's limits. For example, if the parent flow is an automated flow, the child flow uses the parent flow creator/owner's limits.
- If the parent flow is a manual flow, the child flow uses the limits of the parent flow's invoking user.
- If the child flow has a per flow license, it uses the per flow limits and not the parent flow's limits.
- If a parent flow has a per flow license, the parent flow and all child flows use the per flow license.
- During the [transition period](#transition-period), there is a slight difference in this behavior. The child flow owner's license is used unless the child flow has a per flow license but once the transition period ends, the child flow owner's limits are ignored and only the parent flow owner's limits are used unless the child flow has a per flow license.

#### As a maker, what tools do I have to analyze my usage?

If you are experiencing delays or slowdowns when your flow runs, it's likely that you have exceeded the Power Automate limits for the day. For flows that are consistently delayed due to overages, users also receive a notification that informs them about these overages, along with tips and tricks on how to prevent delayed runs of their flows.

Here is an example of an email that was sent for a flow that was consistently exceeding action limits.

![An overage email example](../media/power-automate-licensing/email-overage-example.png)

The Power Platform admin center will soon contain reports on Power Automate requests. This reporting will help you to quickly view adoption and user metrics for your organization.

Additionally, you can see the action usage for a given flow by selecting the  **Analytics**  action from the flow properties page, and this works across all types of actions. This helps you to understand how many actions are running each day. It can help you detect inefficiencies in your workflow logic and understand usage patterns to optimize for capacity.

<!-- ![](RackMultipart20211020-4-1g0es0r_html_506275adcda597da.png) -->

![Sample of the analytics chart](../media/power-automate-licensing/analytics-chart.png)

#### As an admin, what tools do I have to analyze my environment's usage?

Once the transition period ends, admins will have two reports available in the Power Platform admin center.

- User report – This report displays the Power Platform request usage by every user in the environment, compared to their assigned limits.

- Per flow report - This report displays the Power Platform request usage by every flow in the environment that has a per flow license.

After the reports are available, users will have time to react and purchase higher licenses before enforcement begins.

#### What happens when my flow runs too many actions?

When you have a flow that runs many actions, it impacts the performance of your flow. You will see a banner on the flow if your flow is being throttled.

In the most common case, exceeding limits results in delayed runs of subsequent actions, and this will slow down the overall run time of your flow. These delays are proportional to the degree of overages caused by a flow.

Occasional overages are okay. For instance, if you exceed your daily limits by 500 actions it's not going to impact the performance of your flow, however exceeding your limit by 50,000 actions will have a significant performance impact on your flow.


#### What can I do if my flow is above limits?

Users won't be blocked from using an app or flow for occasional and reasonable overages.

Here are some things you can do if you've exceeded the limits of your license.

- Revisit your design and check for any places that can help reduce the number of actions being called. Check out [Best Practices section to create flows to use less actions](https://support.microsoft.com/topic/troubleshooting-slow-running-flows-2a51dcd6-0b21-33da-5ce8-1e908b1540ef).
- If the flow is already optimized, but it uses many actions because of the nature of the business, consider buying a higher license. The per flow plan provides the best performance quota available (250K actions/day/flow).
- Purchase the **Power Apps and Power Automate capacity add-on** for your organization. During the [transition period](#transition-period), because enforcement is currently less strict, there is no facility to assign the **Power Apps and Power Automate capacity add-on** to a user. However, Microsoft recommends that you purchase these add-ons now to remain within your license terms and create a support ticket with the flow details and add on details to get temporary relief from throttling.
- Turn on [Pay-as-you go](#pay-as-you-go) for the environment to ensure none of the flows in the environment are throttled.

If a flow is consistently above the transition period limits for 14 consecutive days, the flow is turned off and the owner is notified. You can update the flow or buy higher license, and then turn it on anytime.

#### What are connector limits and are they different from Power Platform request limits?

The connectors have separate limits as a service protection mechanism. For example, the SharePoint connector limits the number of actions at 600 per minute. A single SharePoint connection that's used across multiple flows can still only execute 600 operations per minute. Most connector pages have a [throttling section](/connectors/sharepointonline/#limits) that documents these limits. This limit is different from the request limits. For example, an Office user can run 6000 actions per day across all their flows but can still get throttled by the connector if they used more than 600 SharePoint actions in a minute despite not reaching the 6000 actions limit.

When a flow was throttled because it exceeded the connector limits, you might see a HTTP 429 (too many requests) error in your flow with error text like "Rate limit is exceeded. Try again in 27 seconds."

#### I am using COE toolkit, will the usage count towards my request limits?

Yes. Flows included in the COE toolkit also use limits from the owner. Microsoft recommends that you turn on Pay-as-you go for the environment or buy additional capacity and contact support to get temporary relief from throttling.

#### Can I use a service account and run multiple flows under it?

Yes, and if your flow runs under a service account, it is really a team/organization flow and it needs a per flow plan for every flow.

#### Can I use service principal in flows, and does it count against my request limits?

Service principal isn't supported yet but it's a top item on the backlog. When we support it, service principal flows will consume a separate quota called [non-interactive limits](/power-platform/admin/api-request-limits-allocations#requests-limits-not-based-on-licensed-users-or-flows).

#### Will desktop flows usage count consume my Power Platform request limits?

Only the desktop flow actions that are invoked from cloud flows count against the limit. Actions in the desktop flow are not counted towards request limits.

#### What happens to my Power Platform requests if I have multiple plans?

Since limits aren't strictly enforced during the transition period, [stacking of user licenses isn't supported](/power-platform/admin/api-request-limits-allocations). If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the higher plan (Dynamics 365 plan, in this example).

After the transition period ends, if a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of the requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license and a Power Apps per user license, then that user has a total of 40000 + 40000 = 80000 requests available per 24 hour period.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be the amount that the base license provides.

#### What are performance profiles and how do I know which performance profile my flow uses?

| **Performance profile** | **Plans** |
| --- | --- |
| Low | Free<br>Microsoft 365 plans<br>Power Apps Plan 1, Power Apps Per App plans<br>Power Automate Plan 1<br>All license trials<br>Dynamics 365 Team Member |
| Medium |Power Apps triggered flows, Power Apps Plan 2, Power Apps per user plan<br>Power Automate Plan 2, Power Automate per user, Power Automate per user with Attended RPA plans<br>Dynamics 365 Enterprise plans, Dynamics 365 Professional plans,  Power Apps Plan 2, Power Apps per user plan|
| High | Power Automate per flow plan |

Based on the license of the owner, a flow gets a performance profile which in turn decides the Power Platform request limits of the flow. If there are multiple licenses assigned to the owner, Power Automate picks the highest plan from the list.

| Performance profile | Limits during [transition period](#transition-period) | Limits after [transition period](#transition-period) |
| --- | --- | --- |
| Low | 10,000 | 6000 |
| Medium | 100,000 | 40,000 |
| High | 500,000 | 250,000 |

#### In an organization, eight users have Office 365 licenses and their daily Power Platform requests would be 6000 requests per user, in each 24 hour period. Does that mean that it will be pooled to the tenant level with a limit of 48000 requests in each 24 hour period (8X6000) and all users can consume from this pool?

No. Power Platform requests are not pooled at the environment nor tenant level. This ensures that a heavy user doesn't consume all the Power Platform requests of the tenant and impact everyone else. Since the license is per user, the limit is per user too. So, all Office customers get 6000 requests each, whether they use them or not.

### Best practices

A [guide to building enterprise ready flows](https://clouddamcdnprodep.azureedge.net/gdc/gdc5fzAoK/original) contains great tips and best practices.

Best practice for design. Use the fewest number of actions possible to achieve your automation.

- If you have 'Do until' or 'Apply to each' loops in your flow, see if you can reduce the number of loop iterations, possibly by retrieving fewer items to iterate through.
- Many connectors have 'Filter query' and 'Top count' parameters that you can use to reduce the number of items and the amount of data retrieved by using OData.
- If you have a scheduled flow that runs frequently, consider reducing the frequency. Many flows that run once per minute or once per hour could be revised to occur less often. Use trigger conditions to minimize the run frequency.
- If your flow is interacting with files, be conscious of the file size and try to reduce it if possible.
- If you need to reuse a single property returned by an action with large output size multiple times, consider using 'Initialize Variable' to store that property, and use the variable in later actions. Even if only one property is used from an output of an earlier action, all outputs of that action that will be passed into the later action as inputs.

Best practices to scale your flow.

- If your flow runs thousands of actions daily, you should consider purchasing a Per Flow license to get better throughput and higher quotas.Per Flow plan provides the best performance quota available (250K actions/day). Please reach out to your tenant administrator to purchase the license and assign it to the flow. Once the license is purchased and assigned, the author of the flow should save it again. Alternatively, flows will be updated in the background once per week to reflect current plans.
- Consider splitting the workload across multiple flows to achieve high scale.

### Pay-as-you-go

We revised the Power Platform request limits for all licenses in late 2021. The new limits are designed to be sufficient for most customer scenarios. For more information on Power Platform request limits, visit the [Requests limits and allocations](https://aka.ms/platformlimits) page.

For customers with extremely high scale scenarios who need to exceed these limits you can link those environments to Azure subscription. By linking the environment, users and flows in the environment can consume more than their limits without being throttled and only pay for the Power Platform requests used above those limits. Flows still need to be licensed with a base license (either Power Automate per user, Power Automate per flow, Office 365, Power Apps, or Dynamics). For example, if you have Power Automate per user license, you have a limit of 40,000 Power Platform requests/per user/day. If the user used 45,000 requests a day, the additional 5,000 requests is multiplied by a $/request rate and billed to the Azure subscription. The total amount will be summed and billed based on the customer’s Azure billing cycle. Multiple [meters](https://docs.microsoft.com/en-us/power-platform/admin/pay-as-you-go-meters?tabs=image) are turned on when you turn on Pay-as-you-go at the environment. [How to set up Pay-as-you-go](https://docs.microsoft.com/en-us/power-platform/admin/pay-as-you-go-set-up)

![An image that displays an overview of pay as you go](../media/power-automate-licensing/pay-as-you-go.png)

>[!NOTE]
>If you link an environment to an Azure subscription, this meter will not be reported or billed. Reporting and billing will be turned on by the end of calendar year 2021.

### FAQs about request limits

You can consult this [requests limits frequently asked questions](/power-platform/admin/api-request-limits-allocations#frequently-asked-questions) for more information about requests limits.

## Free plan

If you sign in with work or school email address, you get all [Power Automate capabilities included in Office 365](faqs.md). But if you have a non-business user account (such as an account that ends with @outlook.com or @gmail.com), you can still use Power Automate with the free plan. Go to [Power Automate](https://flow.microsoft.com/) and then select **Try free**.

>[!NOTE]
>You cannot share flows when you use the free plan.

To know which users have the free plan, admins can go to the [O365 Admin portal](https://admin.microsoft.com/), sign in, select **Billing** > **Licenses** to see how many free licenses are assigned vs available.

![Image of trial licenses](../media/power-automate-licensing/trial-licenses.png)

Select **Assigned licenses** to see which users have free license.

## Community plan

There is a [free community plan to learn about Power Platform](https://powerapps.microsoft.com/communityplan/). You are not allowed to use it in production but can try out things and have access to all premium connectors. You can use this free community plan also in a free [Microsoft 365 developer tenant](https://developer.microsoft.com/microsoft-365/dev-program). Business process flows and RPA flows cannot be created in an environment with community plan.

## Trials

Power Automate trials are available for 90 days. There are two types of trials available for Power Automate.

### Admin managed trial

Global admins use the Microsoft 365 admin center to start these trials and assign them to users.  These trials are for 30 days. Tenant admins can add a trial (subscription-based) environment to their tenant, or new organizations can sign up for a new tenant and become the global admin. For new organizations, an admin-managed subscription is created with a specific number of licenses (usually 25); admins control which other users get licenses assigned to them. An admin-managed subscription has an end date that can be extended once (another 30 days). Admins can get Power Automate attended RPA trial or Power Automate unattended RPA trial.

Follow these steps to get started.

1. Sign into [the Microsoft 365 admin center](https://admin.microsoft.com/).
1. Go to **Purchase services** under the **Billing** section.
1. Search for "Power Automate", and then select a plan.

   ![Select a licensing plan](../media/power-automate-licensing/select-plan.png)

1. Select the details of a plan, and then select **Start free trial**.

   ![Start a free trial](../media/power-automate-licensing/start-free-trial.png)

1. You'll see a confirmation similar to this one.

   ![Start a free trial confirmation](../media/power-automate-licensing/start-free-trial-confirmation.png)

After the free trial starts, go to **Billing** > **Licenses** to see the 25 new licenses available for you to assign to users.

<!--todo this isn't clear, PM will update in github-->
>[!NOTE]
>Trials are different from free licenses. Once you start a trial, the sku name might not say Trial.

![View trial licenses](../media/power-automate-licensing/trial-licenses.png)

### User trial

Users start these types of trials, either from the [pricing](https://flow.microsoft.com/pricing/?ef_id=dd65eaf79fda13e945118bbef5cc361a:G:s&amp;OCID=AID2200054_SEM_dd65eaf79fda13e945118bbef5cc361a:G:s&amp;msclkid=dd65eaf79fda13e945118bbef5cc361a) page or from within Power Automate. This trial gives premium connector access, attended RPA, and unattended RPA. This trial is for 90 days.

![The Power Automate pricing page](../media/power-automate-licensing/pricing.png)

User trials can also be started by user from within Power Automate. For example, when user tries to create a desktop flow without a Power Automate per user with attended RPA plan, the user is prompted to start a trial that includes usage of premium connectors, attended RPA, and unattended RPA.

![Start free trial from within Power Automate](../media/power-automate-licensing/free-trial-inline.png)

### FAQ

Here are some of the frequently asked questions about trials.

#### How can I create an admin trial, check expiry and extend trials?

Check this document for instructions:

Follow these instructions to [create an admin trial, check expiry, and extend trials](/power-platform/admin/trial-environments#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center).

#### How can admins allow or block trial licenses?

Admins can use PowerShell cmdlets to enable or disable trails. Once disabled, all existing plans of the specified type are removed from all users in the tenant. These aren't recoverable. Additionally, it will block all further assignment of plans of that type. Admins can enable trials at any time.

[Learn how to create a trial (subscription-based) environment in the Power Platform admin center](/power-platform/admin/trial-environments#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center).

#### How can I convert a trial environment to a production environment?

You can convert either type of trial environments to a production environment by switching it to consume from paid capacity, keeping it from being disabled and deleted. After it becomes a production environment, it follows the paid license lifecycle.

#### Do trials work in GCC and government clouds?

No. Trials won't work in government clouds (GCC), and they can only purchase plans with volume discounting.

#### Can I see all trials using a PowerShell cmdlet?

Viral trials cannot be blocked by PowerShell cmdlet.
