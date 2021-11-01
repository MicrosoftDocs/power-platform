---
title: "Frequently asked questions about Power Automate licensing"
description: "Frequently asked questions about Power Automate licensing."
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

# Frequently asked questions about Power Automate licensing

## Power Automate license plans

Here are some frequently asked questions about Power Automate standalone licenses.

### How do Power Automate license plans work?

Each user and flow has a license plan. If a flow is set to the per-flow plan, then it has the highest limits. If a flow has per flow plan, it always uses the per flow plan request limits, regardless of how the flow is run.

If the flow is set to the per user plan, then it gets the plan of its primary owner. If a user has multiple plans, such as a Office 365 plan and a Dynamics 365 plan, the flow will use the request limits from both the plans.

The standard user license plan for Power Automate is the Power Automate per user plan, but there is a range of other license plans a user could use. Users with the free or one of the Office 365 license plans will only be able to access standard connectors, but most of the other license plans provide access to premium connectors. For details about license plans that include Power Automate capabilities, see the Power Platform [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). For details about the limits and performance profile of license plans, see the [Power Automate Limits](/power-automate/limits-and-config).

### When should I choose Power Automate "per flow" versus "per user"?

The per user plan is intended to support the broad adoption of an automation culture in an organization.

The per flow plan provides an organization with the flexibility to pay for licenses based on the number of flows it uses, instead of licensing each user accessing the flows individually with the per user plan. Larger organizations or solutions that affect many will benefit from the fixed monthly cost versus a comparable per use cost in a pure Azure function. For example, if your flow uses premium connectors and your organization has many guest users who you want them to use the flow, but you don't know if the guest users home tenant provides them with premium licenses. In this case, it is best to get a per flow license for the flow. If a flow has per flow license, it doesn't use nor require any other license when it's run.

### Who needs to purchase a premium license?

The per flow plan has the highest priority among all licenses, meaning, if a per flow license is assigned to a flow, the flow always uses this license. If the flow doesn't have a per flow license, the decision about which license is used is based on how the flow gets triggered.

Here's the decision tree.

- Automated and scheduled flows always run in the context of the flow owner regardless of who started the flow or what accounts are used for connections inside of the flow. Instant flows (button, power apps, hybrid triggers) run in the context of invoking user regardless of connections the flow uses.
- If an automated/scheduled flow uses a premium connector, only the owner needs to have a premium license. If the owner shared their flow with another user and that user triggers the same flow, it would still run in the context of original owner so other users do not need a premium license. But, if the user then uses it to make their own new flow (a second flow), then that new user becomes the owner of the second flow and would require a license to run it.
- If an instant flow has premium connectors, every user who runs the flow needs either a Power Automate premium license, a Power Apps premium license, or a Dynamics license. In such cases, instead of licensing every user, it is simpler to license the flow with a per flow license. One exception for this rule is the http trigger which runs in the context of the owner, even if it's being used in an instant flow.
- If a parent flow calls a child flow, child flow leverages the context from parent flow. For example, if the parent flow is an automated flow, and the child flow uses premium connectors and the child flow doesn't have per flow license, it will use the parent flow owner's license. If the child flow has a per flow license, it uses the per flow license and not the parent flow's license. During the [transition period](./types.md#transition-period), there is a slight difference in this behavior. The child flow owner's license will be used unless the child flow has a per flow license but after the transition period ends, the child flow owner's license will be ignored and only the parent flow owner's license is used unless the child flow has a per flow license.

A common question is, "If a flow is triggered when a SharePoint list item is updated, and many users interact with that list, will there be a cost for each user?" The answer is if the flow does not use a premium connector such as calling Dataverse in the full production environment (not the Microsoft Teams environment), having an Office 365 license is enough. If the flow uses premium connectors, since the trigger is an automated trigger, only the owner needs a premium license.

You can find out what type (automated/manual/scheduled) of you have have, select a flow to see its 'type' in the details.

![Types of flows image](../media/power-automate-licensing/flow-types.png)

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a per flow license for every environment?

Each flow exists in a specific environment. So, if a flow is imported into a different environment, it is a separate flow and needs a separate per flow license.

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a per user license for every environment?

The per user license is a user level license. All user level licenses (per user, Office 365, Dynamics) are tenant level licenses. The user can use the flow in all environments without having to buy a separate license.

### When five flows are purchased as part of per flow pack, do I have to assign them all to same environment?

No, these licenses can be assigned to different environments.

### Can Office 365 customers create solution flows and child flows?

Yes. Office 365 customers can create solution flows if the environment in which they create the solution flow has a Dataverse database attached to it. The default environment gets a Dataverse database by default. The admin must attach a Dataverse instance to non-default environments. Admins need at least 1GB tenant level Dataverse database capacity available to be able to create a new environment.

The first subscription of Power Apps or Power Automate or Power Virtual Agents or Dynamics 365 Sales, Customer Service, and Field Service adds a one-time default capacity limit of 10GB for the tenant. When you add subscriptions to the tenant, additional Dataverse capacity may accrue to the tenant. For example, if a new customer purchases a Power Automate per user plan, the tenant receives 10GB of default Dataverse database capacity. And if the tenant buys 10 Power Automate per user licenses, the tenant gets 10.5GB (10GB+10*50MB).

### I use multiple user connections in my premium flow. Which user needs a premium license to run the flow?

Connections are independent from license checks. You can have multiple user connections in a flow, but the flow always checks licenses of primary owner/run-only user. The co-owner's license isn't considered.

### The owner of a flow left the company, and the flow doesn't have co-owners. How can we ensure it works without interruptions?

If the flow is a solution flow, you can change the owner using [Power Automate Web API](/power-automate/web-api#update-a-cloud-flow) to ensure the flow works without interruptions. If the flow is a non-solution flow, you cannot change the owner, but any co-owners of the flow can export and import by a different owner. Check out this [video tutorial](https://www.youtube.com/watch?v=K7_xWJvEPUc).

### The owner of the flow no longer has a premium license, but the flow is a premium flow. What happens?

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 30 days if no action is taken.

### Can I assign licenses to guest users?

Yes. If you want to give access to external users (not from your tenant), you can assign them admin trials for temporary access or standalone licenses.

### What Power Automate capabilities are included in Windows licenses?

Windows 11 users can try desktop flows in attended RPA for personal productivity in the default environment. They can't share the desktop flows or create desktop flows in a different environment other than default environment. Windows users do not have access to cloud flows. To get full cloud flows and RPA features, purchase the Power Automate per user with attended RPA plan.

Windows 11 users can search for "Power Automate" in the Windows search bar. The Power Automate Desktop app downloads automatically and then launches the first time you select its icon.

### Can Windows 10, Windows server 2016 users use Power Automate for desktop?

Yes, they can use Power Automate for desktop (ie. they have usage rights for it) but they'll have to download it from the download center.

## Office 365 license questions

Here are some frequently asked questions about using Power Automate with a Office 365 license.

### What Power Automate capabilities are included in Office 365 licenses

Limited Power Automate use rights are included with select Office 365 licenses to allow users to customize and extend Office 365 for personal productivity scenarios. For enterprise scenarios, Office recommends [standalone licenses](./types.md#standalone-plans).

Office 365 licenses include the following Power Automate capabilities.
  
- Create and execute Automated/Scheduled/Button flows
- Access to [standard connectors](./types.md#standard-connectors)
- 2K Power [platform requests/day](./types.md#power-platform-requests) (10K requests/day during [transition period](./types.md#transition-period))
  
The following Power Automate capabilities are not included.
  
- Access to [premium connectors](./types.md#premium-connectors) is not included except in Dataverse for Teams environments. Learn more about [Dataverse for Teams capabilities](/power-platform/admin/pricing-billing-skus#dataverse-capabilities-with-microsoft-365-licenses)
- [Business process flows](./types.md#business-process-flows)
- [Custom connectors](./types.md#custom-connectors)
- [On premises gateways](./types.md#on-premises-gateway)
- [Robotic process automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)
  
The following Office 365 licenses include Power Automate capabilities.
  
- Office 365 E1
- Office 365 E3
- Office 365 E5
- Office 365 F3
- Office 365 Business Basic
- Office 365 Business Standard
- Office 365 Business Premium
- Office 365 F1
- Office 365 F3,
- Office 365 E3,
- Office 365 E5
- Windows 10 Pro
- Windows Enterprise E3
- Windows Enterprise E5
- Office 365 A1 for Faculty
- Office 365 A1 for Students
- Office 365 A1 Plus for Faculty
- Office 365 A1 Plus for Students
- Office 365 A3 for Faculty
- Office 365 A3 for Students,
- Office 365 A3 for Student Use Benefit
- Office 365 A5 for Faculty
- Office 365 A5 for Students
- Office 365 A5 for Student Use Benefit

## Dynamics 365 license questions

The following questions are related to Dynamics 365 licensing and Power Automate use rights.

### What Power Automate capabilities are included in Dynamics licenses?

Dynamics licenses include following Power Automate capabilities.

- Create and execute automated, scheduled, or button flows
- Access to [standard connectors](./types.md#standard-connectors)
- Access to [premium connectors](./types.md#premium-connectors) within app context
- [Business process flows](./types.md#business-process-flows) within app context
- [Custom connectors](./types.md#custom-connectors) within app context
- [On premises gateways](./types.md#on-premises-gateway) within app context
- [Power Platform request](./types.md#power-platform-requests) limits: Dynamics Team member gets 5K requests/day (25K requests/day during the [transition period](./types.md#transition-period)), Dynamics professional gets 10K requests/day (100K requests/day during [transition period](./types.md#transition-period)) and Dynamics Enterprise gets 20K requests/day (100K requests/day during [transition period](./types.md#transition-period)).

The following Power Automate capabilities aren't included in Dynamics licenses.

- [Robotic process automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)

When you use a Dynamics license with Power Automate, your flows must run within the context of the Dynamics application, which refers to using the same data sources for triggers or actions as the Dynamics application. If your flow consumes standalone Power Automate actions unrelated to the Dynamics application(s) you will need to purchase standalone Power Automate licenses.

#### Example of Dynamics license using Power Automate within a Dynamics application context

Your company connected Azure DevOps with Dynamics CRM to escalate support cases and create work items to get problems resolved faster. As part of the Dynamics license, Power Automate rights are included for flows in the following scenarios.

- Read from or write to Azure DevOps

- Use a built-in Dataverse trigger and/or action

#### Example of Dynamics license using Power Automate outside a Dynamics application context

The same user ([in the previous Dynamics example](#example-of-dynamics-license-using-power-automate-within-a-dynamics-application-context)) now also wants to use a flow that updates an Oracle database. This flow has the following properties.

- It's completely unrelated to the Dynamics app.

- It doesn't interact in any way with the Dynamics app (or its data sources).

In this scenario, the user requires a standalone Power Automate license.

The following Dynamics licenses include Power Automate capabilities.

- Dynamics 365 Sales Enterprise
- Dynamics 365 Sales Professional
- Dynamics 365 Customer Service Enterprise
- Dynamics 365 Customer Service Professional
- Dynamics 365 Field Service
- Dynamics 365 Project Operations
- Dynamics 365 Team Members
- Dynamics 365 Finance
- Dynamics 365 Supply Chain Management
- Dynamics 365 Commerce
- Dynamics 365 Human Resources
- Dynamics 365 Operations – Activity
- Dynamics 365 Business Central
- Dynamics 365 Business Central Team Members.

## Power Apps license questions

The following questions are related to Power Apps licensing and Power Automate use rights.

### What Power Automate capabilities are included in Power Apps licenses?

Power Apps licenses include following Power Automate capabilities.

- Create and execute automated, scheduled, button flows
- Access to [standard connectors](./types.md#standard-connectors)
- Access to [premium connectors](./types.md#premium-connectors) within app context
- [Business process flows](./types.md#business-process-flows) within app context
- [Custom connectors](./types.md#custom-connectors) within app context
- [On premises gateways](./types.md#on-premises-gateway) within app context
- Power Platform request limits: Power Apps per user gets 5K requests/day (25K requests/day during [transition period](./types.md#transition-period)) and Power Apps per app gets 1K requests/day (10K requests/day during [transition period](./types.md#transition-period)).
- Power Apps per user gets 250MB Dataverse database capacity and 2GB Dataverse file capacity. Power Apps per app gets 50MB Dataverse database capacity and 400MB Dataverse file capacity. Flows invoked by Power Apps apps that handle complex objects will consume this storage limit. For example, if a flow parses a 100-page document and makes updates to it, the storage it needs to retain the document in run history for future troubleshooting will consume this limit.

The following Power Automate capabilities aren't included in Power Apps licenses.

- [Robotic process automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)

Flows that use the Power Apps license must run within the context of the Power Apps app, which uses the same data sources for triggers or actions as the Power Apps app. If your Power Apps app consumes standalone flows that aren't related to the Power Apps app, you must purchase a standalone Power Automate license.

#### Example of Power Automate use within a Power Apps app context

A user with a standalone Power Apps license runs an app that uses a SQL database as the data source. The Power Apps app also includes flows that do the following.

- Read from or write to a SQL database.

- Use a built-in Power Apps trigger or action, for example, to send a push notification to the Power Apps app.

#### Example of Power Automate use outside of a Power Apps app context

The same user ([in the example above](#example-of-power-automate-use-within-a-power-apps-app-context)) now also wants to use a flow that updates an Oracle database and also has the following properties.

- It's completely unrelated to the Power Apps app

- It doesn't interact in any way with the Power Apps app (or its data sources).

In this example, the Power Apps app is being used outside the context of Power Apps so the user needs a standalone Power Automate license.

#### I have a Power App app that's invoked by multiple users and the app in turn calls a flow with premium features. Can I buy a per flow plan for the flow and enable all users to get premium value?

You can either license all users with premium licenses or license the flow with a per flow license.

## Multiplexing

### What is multiplexing, and is it recommended to use multiplexing to reduce the number of licenses?

Multiplexing refers to the use of hardware or software that a customer uses to pool connections, reroute information, or reduce the number of users that directly access or use the Power Apps, Power Automate, and the Power Virtual Agents service. Using multiplexing as a mechanism to reduce the number of licenses to be purchased is a license violation. For more details, refer to the multiplexing guidance from [Client Access License (CAL) Requirements](https://download.microsoft.com/download/8/7/3/8733d036-92b0-4cb8-8912-3b6ab966b8b2/multiplexing.pdf).

## Per user plan

### I have a flow that my team uses but it runs on a per user license. Is that okay?

It is okay, since you have a per user license, all your flows use capacity from your Power Platform limits. If more and more users start using the flow and you reach limits, all your flows will slow down. If a flow is throttled for 14 consecutive days, it will be turned off.

## Approvals

### There's a premium flow that sends approval requests to a set of users and then waits for the users to approve or reject the request before it continues running. Today, Power Automate only looks for owner's license and doesn't look for approver's license. Do the approvers need a premium license?

The approvals connector is a standard connector. Users who respond to approval requests aren't considered to be the invoking users. Their Office 365 license is enough and they don't need a premium license.

### **Automated flow** - User builds a flow that triggers when an item is added to a SharePoint list and updates a SQL db (Premium). Multiple people can add items to the SharePoint list.

Flow runs in the context of owner's license for Automated/Scheduled flows and invoking user's license for Instant/Power Apps/Dataverse triggered flows. So, the person who added the item to SharePoint list do not need a premium license.

## Instant flows

### We have an instant flow with run-only users and it uses premium connectors. The maker shares that flow with their team and allows them to run that flow.

Everyone who invokes the flow need a premium license because it is an instant flow.

## Child flows

### I have a child flow that has premium connectors and is invoked by multiple parent flows that don't have premium connectors. Do all parent flows need to be licensed, or is licensing the child flow enough?

You can either license the parent flow or license the child flow with a per flow license. However, if the parent flow also has a premium connector, the parent flow owner must have a premium license.

<!-- ### **Automated flow with Dataverse trigger** – Dataverse triggers allow flows to use the invoker's connection. Since it is an automated flow, flow only looks for creator/owner's license -->

## Shared flows

### **My flow is shared with multiple users who view and edit the flow**. Do co-owners need premium license to edit the flows?

Co-owners don't need a premium license as the flow only runs in the context of creator or owner/run-only user.

### A premium flow consolidates Azure Dev Ops items, generates a report, and then sends an email to the entire organization. The users in the organization get value from the flow but do not interact with the flow directly.

As the users are not invoking the flow, they do not need any license (neither premium nor seeded).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]