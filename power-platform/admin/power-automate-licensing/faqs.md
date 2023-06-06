---
title: Frequently asked questions about Power Automate licensing
description: Learn the answers to frequently asked Power Automate questions.
author: PriyaKodukula
contributors:
  - PriyaKodukula
  - thomasjeffries11
  - v-aangie
ms.component: pa-admin
ms.topic: faq
ms.date: 05/23/2023
ms.author: prkoduku
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Frequently asked questions about Power Automate licensing

Here are some frequently asked questions about Power Automate standalone licenses.

## How do Power Automate license plans work?

Each user and flow has a license plan. If a flow is set to the per flow plan, then it has the highest limits. If a flow has the per flow plan, it always uses the per flow plan request limits, regardless of how the flow is run.

If the flow is set to the per user plan, then it gets the plan of its primary owner. If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the request limits from both plans.

The standard user license plan for Power Automate is the Power Automate per user plan, but users have a range of other license plan options. Users with the free plan or one of the Microsoft 365 license plans can only access standard connectors, but most of the other license plans provide access to premium connectors.

To learn more about license plans that include Power Automate capabilities, go to [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types) and the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). To learn more about the limits and performance profile of license plans, go to [Limits for automated, scheduled, and instant flows](/power-automate/limits-and-config).

### When should I choose Power Automate 'per flow' versus 'per user'?

Microsoft recommends that most organizations buy the per user with an attended robotic process automation (RPA) license for every user in their organization. Optionally, purchase the unattended bot add-on for every machine that runs unattended automation. 

The per user plan is intended for personal automation to support the broad adoption of an automation culture in an organization.

The per flow plan is intended for enterprise process automation. If a flow provides value to a team, either everyone in the team needs a per user license or the flow needs a per flow license. If a flow has a per flow license, it doesn't use or require any other license when it runs. It provides an organization with the flexibility to pay for licenses based on the number of flows it uses. It does this instead of licensing each user who accesses the flows individually with the per user plan. Larger organizations or solutions that affect many can benefit from the fixed monthly cost. It's best to use the per flow license if your flow meets the following criteria:

- It uses premium connectors, and
- Your organization has many guest users using the flow, but
- You don't know if the guest users' home tenant provides them with premium licenses.

### Who needs to purchase a premium license?

The per flow plan has the highest priority among all licenses.This means if a per flow license is assigned to a flow, the flow always uses this license.

If the flow is used for an enterprise scenario where multiple people get value from the flow, everyone who benefits from the flow needs a per user license or the flow  needs a per flow license.

If the flow doesn't have a per flow license and it's a personal automation flow, the decision about which license is used is based on how the flow gets triggered.

Here's the decision tree for personal automations.

- Automated and scheduled flows always run in the context of the flow owner regardless of who starts the flow or what accounts are used for connections inside of the flow. Instant flows (button, hybrid triggers) run in the context of the user who invokes them, regardless of the connections the flow uses.

- If an automated or scheduled flow uses a premium connector, only the owner needs to have a premium license.

- If an instant flow has premium connectors, every user who runs the flow needs either a Power Automate premium license, a Power Apps premium license, or a Dynamics 365 license. In such cases, instead of licensing every user, it's simpler to license the flow with a per flow license. One exception to this rule is that the HTTP trigger runs in the context of the owner, even if it's used in an instant flow.

- If a parent flow calls a child flow, the child flow leverages the context from the parent flow. For example, if the following criteria are met, it uses the parent flow owner's license:

    - If the parent flow is an automated flow, and
    - The child flow uses premium connectors, and
    - The child flow doesn't have a per flow license.

If the child flow has a per flow license, it uses the per flow license and not the parent flow's license. During the [transition period](./types.md#transition-period), there's a slight difference in this behavior. The child flow owner's license will be used unless the child flow has a per flow license. However, after the transition period ends, the child flow owner's license is be ignored. Only the parent flow owner's license is used unless the child flow has a per flow license.

A common question is, "If a flow is triggered when a Microsoft Lists item is updated, and many users interact with that list, is there a cost for each user?" The answer depends on who is getting value from the flow.

- If the flow uses premium connectors and the end users get value from the flow directly or indirectly, then every user needs a license.

- If the flow uses premium connectors and only the owner gets value from the flow, only the owner needs a premium license. This is because the trigger is an automated trigger.

- If the flow doesn't use a premium connector, such as calling Dataverse in the full production environment (not the Microsoft Teams environment), having a Microsoft 365 license is enough.

To find out what type (automated/manual/scheduled) of flow you have, select a flow to see its 'type' in the details.

:::image type="content" source="../media/power-automate-licensing/flow-types.png" alt-text="Screenshot of types of flows.":::

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a per flow license for every environment?

Each flow exists in a specific environment. This means if a flow is imported into a different environment, each instance is a separate flow and needs a separate per flow license.

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a per user license for every environment?

The per user license is a user level license. All user level licenses (per user, Microsoft 365, Dynamics 365) are tenant level licenses. The user can use the flow in all environments without having to buy a separate license.

### Can Power Automate Hosted RPA add-on be used as a Power Automate Unattended RPA add-on?

Yes, you can use the Power Automate Hosted RPA add-on capacity in two ways:
- For hosted machines and hosted machine groups
- To run desktop flows (RPA) in unattended mode that can be applied to a local, remote desktop, or other virtualized environment

### When five flows are purchased as part of the per flow pack, do I have to assign them all to the same environment?

No, these licenses can be assigned to different environments.

### Can Microsoft 365 customers create solution-aware flows and child flows?

Yes. Microsoft 365 customers can create solution-aware flows if the environment in which they create the solution-aware flow has a Dataverse database attached to it. The default environment gets a Dataverse database by default. The admin must attach a Dataverse instance to non-default environments. Admins need at least a 1 GB tenant level Dataverse database capacity available to create a new environment.

The first subscription of Power Apps, Power Automate, Power Virtual Agents, Dynamics 365 Sales, Customer Service, and Field Service adds a one-time default capacity limit of 10 GB for the tenant. When you add subscriptions to the tenant, additional Dataverse capacity may accrue to the tenant. For example, if a new customer purchases a Power Automate per user plan, the tenant receives 10 GB of default Dataverse database capacity. And if the tenant buys 10 Power Automate per user licenses, the tenant gets 10.5 GB (10 GB plus 10 times 50 MB).

### I use multiple user connections in my premium flow. Which user needs a premium license to run the flow?

Connections are independent from license checks. You can have multiple user connections in a flow, but the flow always runs in the context of primary owner/run-only user. 

### The owner of a flow left the organization. How can we ensure it works without interruptions?

If the flow is a solution-aware flow, you can [change the owner](/power-automate/change-cloud-flow-owner) in Power Automate, or use [Power Automate Web API](/power-automate/web-api#update-a-cloud-flow) to ensure the flow works without interruptions. If the flow is a non-solution-aware flow, any co-owners can add it to a solution and then change the owner. If not, assign a per flow license to the flow to ensure it continues to run. Alternatively, any co-owners of the flow can export and import the flow. When imported, the flow will be a new flow, and the co-owner now becomes the owner of the flow. The flow uses the license of the new owner.

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 14 days if no action is taken.

### The owner of the flow no longer has a premium license, but the flow is a premium flow. What happens?

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 14 days if no action is taken.

### Do guest users (not from your tenant) need a license to use Power Automate?

Yes. The guest user must have a Power Automate license assigned through one of the following tenants:

- The tenant that hosts the flow. You can assign them admin trials for temporary access or standalone licenses.

- The home tenant of the guest user.

For example, if a guest user has a Power Automate per user license assigned in the home tenant, they can use premium features in the guest tenant that hosts the flow. 

Power Automate—included with Office, Power Automate per user, per user with attended RPA, Power Apps per user, and Dynamics 365 user plans—will have the following characteristics:

- In the Azure public cloud, these plans are recognized across tenants in guest scenarios because they aren't bound to a specific environment.

- In Azure national or sovereign clouds, these plans are recognized across tenants in guest scenarios. More information: [National clouds](/azure/active-directory/develop/authentication-national-cloud), [Azure geographies](https://azure.microsoft.com/global-infrastructure/geographies/#geographies)

- Licenses aren't recognized across tenants in different Azure clouds.

### What Power Automate capabilities are included in Windows licenses?

Windows 11 users can try desktop flows in attended RPA for personal productivity in the default environment. They can't share the desktop flows or create desktop flows in a different environment other than the default environment. Windows users don't have access to cloud flows. To get full cloud flows and RPA features, purchase the Power Automate per user with attended RPA plan.

Windows 11 users can search for "Power Automate" in the Windows search bar. The Power Automate app for the desktop downloads automatically and then launches the first time you select its icon.

### Can Windows 10 and Windows Server 2016 users use Power Automate for desktop?

Yes, they can use Power Automate for the desktop (they have usage rights for it) but they'll have to download it from the download center.

## Office 365 license questions

Here are some frequently asked questions about using Power Automate with an Office 365 license.

### What Power Automate capabilities are included in Office 365 licenses?

Limited Power Automate use rights are included with select Office 365 licenses to allow users to customize and extend Office 365 for personal productivity scenarios. For enterprise scenarios, Office recommends [standalone licenses](./types.md#standalone-plans).

Office 365 licenses include the following Power Automate capabilities:
  
- Create and execute automated, scheduled, and button flows.
- Access to [standard connectors](./types.md#standard-connectors).
- 6,000 [Power Platform requests/day](./types.md#power-platform-requests). 10,000 requests/day during [transition period](./types.md#transition-period).
  
The following Power Automate capabilities aren't included:
  
- Access to [premium connectors](./types.md#premium-connectors) (except in Dataverse for Teams environments). Learn more about [Dataverse for Teams capabilities](../pricing-billing-skus.md#dataverse-capabilities-with-microsoft-365-licenses).
- [Business process flows](./types.md#business-process-flows).
- [Custom connectors](./types.md#custom-connectors).
- [On-premises gateways](./types.md#on-premises-gateway).
- [Robotic Process Automation](./types.md#robotic-process-automation).
- [AI Builder capacity](./types.md#ai-builder-credits).
  
The following Office 365 licenses include Power Automate capabilities:
  
- Office 365 E1
- Office 365 E3
- Office 365 E5
- Office 365 F3
- Office 365 Business Basic
- Office 365 Business Standard
- Office 365 Business Premium
- Office 365 F1
- Office 365 F3
- Office 365 E3
- Office 365 E5
- Windows 10 Pro
- Windows Enterprise E3
- Windows Enterprise E5
- Office 365 A1 for Faculty
- Office 365 A1 for Students
- Office 365 A1 Plus for Faculty
- Office 365 A1 Plus for Students
- Office 365 A3 for Faculty
- Office 365 A3 for Students
- Office 365 A3 for Student Use Benefit
- Office 365 A5 for Faculty
- Office 365 A5 for Students
- Office 365 A5 for Student Use Benefit

## Dynamics 365 license questions

The following questions are related to Dynamics 365 licensing and Power Automate use rights.

### What Power Automate capabilities are included in Dynamics 365 licenses?

Dynamics 365 licenses include the following Power Automate capabilities:

- Create and execute automated, scheduled, or button flows.
- Access to [standard connectors](./types.md#standard-connectors).
- Access to [premium connectors](./types.md#premium-connectors) within app context.
- [Business process flows](./types.md#business-process-flows) within app context.
- [Custom connectors](./types.md#custom-connectors) within app context.
- [On-premises gateways](./types.md#on-premises-gateway) within app context.
- [Power Platform request](./types.md#power-platform-requests) limits: Dynamics 365 Team member gets 6,000 requests/day (25,000 requests/day during the [transition period](./types.md#transition-period)), Dynamics 365 professional gets 40,000 requests/day (100,000 requests/day during the [transition period](./types.md#transition-period)), and Dynamics 365 Enterprise gets 40,000 requests/day (100,000 requests/day during the [transition period](./types.md#transition-period)).

The following Power Automate capabilities aren't included in Dynamics 365 licenses:

- [Robotic Process Automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)

When you use a Dynamics 365 license with Power Automate, your flows must run within the context of the Dynamics 365 application. This refers to using the same data sources for triggers or actions as the Dynamics 365 application. If your flow consumes standalone Power Automate actions that aren't related to the Dynamics 365 applications, you need to purchase standalone Power Automate licenses.

#### Example of Dynamics 365 license using Power Automate within a Dynamics 365 application context

Your organization has connected Azure DevOps with Dynamics 365 CRM to escalate support cases and create work items to get problems resolved faster. As part of the Dynamics 365 license, Power Automate rights are included for flows in the following scenarios:

- Read from or write to Azure DevOps.
- Use a built-in Dataverse trigger or action.

#### Example of Dynamics 365 license using Power Automate outside a Dynamics 365 application context

The same user ([in the previous Dynamics 365 example](#example-of-dynamics-365-license-using-power-automate-within-a-dynamics-365-application-context)) now also wants to use a flow that updates an Oracle database. This flow has the following properties:

- It's completely unrelated to the Dynamics 365 app.
- It doesn't interact in any way with the Dynamics 365 app (or its data sources).

In this scenario, the user requires a standalone Power Automate license.

The following Dynamics 365 licenses include Power Automate capabilities:

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
- Dynamics 365 Business Central Team Members

## Power Apps license questions

The following questions are related to Power Apps licensing and Power Automate use rights.

### What Power Automate capabilities are included in Power Apps licenses?

A limited set of Power Automate capabilities are included as part of a Power Apps license. Power Apps licenses include the following Power Automate capabilities:

- Create and execute automated, scheduled, button flows.
- Access to [standard connectors](./types.md#standard-connectors).
- Access to [premium connectors](./types.md#premium-connectors) within app context.
- [Business process flows](./types.md#business-process-flows) within app context.
- [Custom connectors](./types.md#custom-connectors) within app context.
- [On-premises gateways](./types.md#on-premises-gateway) within app context.
- Power Platform request limits: Power Apps per user gets 40,000 requests/day (100,000 requests/day during the [transition period](./types.md#transition-period)) and Power Apps per app gets 6,000 requests/day (10,000 requests/day during the [transition period](./types.md#transition-period)).
- Power Apps per user gets 250 MB Dataverse database capacity and 2 GB Dataverse file capacity. Power Apps per app gets 50 MB Dataverse database capacity and 400 MB Dataverse file capacity. Flows invoked by the app created using Power Apps that handle complex objects will consume this storage limit. For example, if a flow parses a 100-page document and makes updates to it, the storage it needs to retain the document in run history for future troubleshooting will consume this limit.

The following Power Automate capabilities aren't included in Power Apps licenses:

- [Robotic Process Automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)

#### Example of Power Automate use within an app created using Power Apps context

A user with a standalone Power Apps license runs an app that uses a SQL database as the data source. The app created using Power Apps also includes flows that do the following:

- Read from or write to a SQL database.
- Use a built-in Power Apps trigger or action—for example, to send a push notification to the app created using Power Apps.

#### Example of Power Automate use outside of an app created using Power Apps context

The same user ([in the example above](#example-of-power-automate-use-within-an-app-created-using-power-apps-context)) now also wants to use a flow that updates an Oracle database and also has the following properties: 

- It's completely unrelated to the app created using Power Apps.

- It doesn't interact in any way with the app created using Power Apps (or its data sources).

In this example, the flow created using Power Automate is being used outside the context of Power Apps so the user needs a standalone Power Automate license.

#### Second example of Power Automate use outside of an app created using Power Apps context

An environment has multiple apps. There are flows for data management that don't directly support the app but ensure the data quality. The user needs a standalone Power Automate license. 

### How can I associate in context flows to apps

Flows created to support apps built with Power Apps must run within the context of the app. This means the flow must use the same data sources for triggers or actions as the app. Flows that are triggered from the app are automatically considered as being in context of the app. If automated or scheduled cloud flows are created to support the app and are in context of an app, link the flow to the apps using a [PowerShell script](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app). Once the flow is linked, a dependency is established between the app and the flow and they can be managed together. If the linked app is deleted or unused, the flow will be turned off.

If a premium flow isn't in context of any app, you must purchase a standalone Power Automate license.

To learn more, go to [Associate flows to apps](/power-automate/associate-flow-to-app).

### How can I easily determine if my flow is in context of a Power Apps/Dynamics 365 app

Is the flow created to support the Power Apps/Dynamics 365 app? Can the flow be deleted if the corresponding apps are deleted? Is the flow talking to the same data sources as the app? If so, the flow is in context. 

### How can I identify flows that need premium licenses to avoid interruptions
Admins have a Powershell command to see the flows that need their attention like the following: 
1. Premium flows where flow owner left the organization.

1. Premium flows where the flow owner doesn't have a premium license (owner previously had a trial/license that is expired now)

1. Premium flows created by flow owner with Power Apps license but the flow isn't triggered by the Power App.

1. Premium flows created by flow owner with D365 license but the flow isn't in a Dynamics environment or the flow isn't interacting with Dynamics entities.

1. Environments where there are more per flow plans assigned to the flows than active per flow licenses assigned to the environment. 

Assign a per user license to the owner of the flow or assign a per flow license to the flow to avoid the flow being turned off. To learn more, go to [flow expiration limits](/power-automate/limits-and-config#expiration-limits).

To update the modules:
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber -Force 
 
Command: `Get-AdminFlowAtRiskOfSuspension`
 
Command example with export:

`Get-AdminFlowAtRiskOfSuspension -EnvironmentName  <ENV_NAME> -ApiVersion '2016-11-01' | Export-Csv -Path suspensionList.csv -NoTypeInformation`

Makers can find a premium icon next to the name of a premium flow.

### Power Automate capabilities included with per app plans

A Power Apps per app plan assignment doesn't give users the ability to create or own Power Automate flows that use premium features. Creating and owning flows using premium features require assignment of a Power Apps per user or Power Automate per user license. This doesn't apply for flows associated to an app.

To learn more, go to [Associate in context flows to an app](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app).

## Multiplexing

Multiplexing refers to the use of hardware or software that a customer uses to pool connections, reroute information, or reduce the number of users that directly access or use the Power Apps, Power Automate, and the Power Virtual Agents service. 

### Is it recommended to use multiplexing to reduce the number of licenses?

Using multiplexing as a mechanism to reduce the number of licenses to be purchased is a license violation. To learn more, go to the multiplexing guidance from [Client Access License (CAL) Requirements](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/Licensing_Brief_PLT_Multiplexing.pdf).

Here are a few examples of what multiplexing is or isn't:

1. If the premium flow is only moving data from Dataverse into a shared location or sending an email to colleagues, it doesn't fall under multiplexing because the users  consume the data, rather than trigger the flow. 

1. If a premium flow triggers when a new item is added to a SharePoint list, saves the details in Dataverse, and then sends an email to the owner of the flow, multiple people can upload items into the list but the email is only sent to the owner. In this case, only the owner needs a license because they're the only person who gets value from the flow.

1. If the flow mentioned in number two sends an email to the user who uploads the item, both the owner and the user need a premium license. In this case, the user  indirectly triggers the flow (by uploading an item into SharePoint) and gets value from the flow in the form of an email. Failure to license all the users falls under multiplexing.  

### I have multiple flows running under a shared service account. What licenses do I need?

- **Service account**: Azure Active Directory (Azure AD) user account used as a service account. Service accounts are a special type of account that's intended to represent a nonhuman entity, such as an application, API, or other service. User accounts, used as a service account by sharing credentials with other users, are difficult to track and managing their passwords is a challenge. In some scenarios, service accounts are used to remove the dependency from the flow to the original owner. When creating service accounts, provide only the permissions that are required for the task. Evaluate existing service accounts to see if you can reduce privileges. Limit the number of people who have access to the service account to minimize security risks. You can also create different accounts for different scenarios to minimize the exposure. 

- **Service principal**: Azure AD service principal functions as the identity of the application instance. Service principals define who can access the application and what resources the application can access. A service principal is created in each tenant where the application is used and references the globally unique application object. 

- **Non-interactive users**: Dataverse supports non-interactive users for activities like background processes that migrate data between databases. These don't require a user to interact with the service. There's a maximum limit of seven (7) non-interactive users per tenant. Non-interactive users aren't yet supported by Power Automate.

- **Normal users**: These are the regular synchronized users from Azure AD.

This guidance is specific to flows that run under a service account as the owner of the flow. If you want to run your flow under a service account, here are the best practices:

- If the flow only uses standard connectors and no premium features, all the users who have the credentials of the service account can have a Microsoft/Office 365 license, Power Automate Free, or any Power Automate premium license. 

- If the flow uses premium features (premium connectors, Robotic Process Automation, custom connectors, on-premises gateway, business process flows): 
  - The service account is used by a limited set of users. In this case, licensing all the users and the service account is enough. 
  - The service account is used by many users. In this case, it's recommended to assign a per flow license to the flow to ensure any new users adding to the account are automatically compliant. 

- If the flow is a manually or app-triggered flow/Dataverse ‘Run as user’ flow, all users who run the flow will need a premium license or the flow needs a per flow license. Check out this FAQ on [who needs to purchase a premium license](faqs.md#who-needs-to-purchase-a-premium-license).   

- Premium flow is in context (the flow shares the data sources of the app) of an app created using Power Apps/Dynamics 365 app: 
  - All the users who have the credentials for the service account and the service account need a Power Apps/Dynamics 365 license. 
  - If they don’t have a Power Apps/Dynamics 365 license, all the users and the service account need Power Automate user licenses.
  - Alternatively, the flow can be licensed with a per flow license and none of the users/service account needs a license. 

- Multiple users sharing credentials of a service account and using premium flows with one premium per user license assigned to the service account is considered multiplexing and the flow isn't compliant.

> [!NOTE]
> The guidance is specific to service accounts used as flow owners or run-only users. Flows using service accounts as connections or co-owners aren't impacted by this guidance.
>
> This is guidance only and not hard enforcement. Admins are responsible for licensing all the flows correctly to stay compliant.

### There's a premium flow that sends approval requests to a set of users and then waits for the users to approve or reject the request before it continues running.  Do the approvers need a premium license?

Every user benefiting from the flow needs a license. But, if the flow is a personal automation where only the owner is benefiting from the flow, users who respond to approval requests don't need a premium license.

### Automated flow - User builds a flow that triggers when an item is added to a list created using Microsoft Lists and updates a SQL database (Premium). Multiple people can add items to the list created using Microsoft Lists. Do users need a premium license?

It depends on who is getting the value from the flow. If the users are getting value from the flow directly or indirectly, they need a premium license. If the flow is for personal automation, the flow runs in the context of owner's license for automated or scheduled flows and the invoking user's license for instant, Power Apps, or Dataverse-triggered flows. So, the person who added the item to the list created using Microsoft Lists doesn't need a premium license.

### We have an instant flow with run-only users and it uses premium connectors. The maker shares that flow with their team and allows them to run that flow. Does everyone need a premium license?

Everyone who invokes the flow needs a premium license because it's an instant flow.

### I have a child flow that has premium connectors and it's invoked by multiple parent flows that don't have premium connectors. Do all parent flows need to be licensed, or is licensing the child flow enough?

You can either license the parent flow or license the child flow with a per flow license. However, if the parent flow also has a premium connector, the parent flow owner must have a premium license or the parent flow must have the per flow license.

### My flow uses connections from multiple users. Do I need to license all of them?

Who needs a license is independent from whose connections are used in the flow. Automated or scheduled flows always run under the owner's license and manual flows or  apps always run under the user who triggers the flow.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
