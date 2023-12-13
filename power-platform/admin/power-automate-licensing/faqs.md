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
ms.date: 07/31/2023
ms.author: prkoduku
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---


# Frequently asked questions about Power Automate licensing

Here are some frequently asked questions about Power Automate standalone licenses.

## How do Power Automate license plans work?

If a flow is set to the Power Automate process plan, then it can access premium connectors, has the highest limits, and always uses the process plan request limits, regardless of who runs the flow.

If the flow is set to the Power Automate Premium user plan, then it gets the plan of its primary owner if the flow is an automated or scheduled flow. If the flow is an instant/button flow, it uses the license of the user running the flow. If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the request limits from both plans.

The user license plan for Power Automate is the Power Automate premium plan, but users have a range of other license plan options. Users with the free plan or one of the Microsoft 365 license plans can only access standard connectors, but most of the other license plans and trials provide access to premium connectors.

To learn more about license plans that include Power Automate capabilities, go to [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types) and the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). To learn more about the limits and performance profile of license plans, go to [Limits of automated, scheduled, and instant flows](/power-automate/limits-and-config).

### When should I choose Power Automate 'Process' versus 'Premium'?

Microsoft recommends that most organizations buy the Power Automate premium license for every user in their organization. Purchase the Power Automate process license for every machine that runs unattended automation.

The Premium user plan is intended for a human user to support the broad adoption of an automation culture in an organization.

The Process plan is intended for core enterprise process automations that are typically automated back-end activities (not run manually by a person). For example, every organization needs processes for invoice processing or HR onboarding that are mandatory to the normal operation of the business. These processes can vary in size and complexity, ranging from small-scale initiatives to large-scale endeavors spanning multiple flows interconnected by shared data sources. For example, an invoice processing process has multiple flows handling an invoice from creation through approvals to payment. All the flows are part of one business process as they are all handling an invoice through multiple steps to closure.

By obtaining a Process license, organizations ensure that all the flows within the business process are appropriately licensed. This enables the deployment and management of interconnected flows as a cohesive unit, facilitating application lifecycle management (ALM) and optimized performance.

You need a Process license if your flow meets **one of the following criteria**:

- Your flows use unattended RPA (robotic process automation) to run desktop flows on machines without user interaction.
- Your flows are running under Application user (flow owner is a Service Principal). Organizations with multiple environments (Dev/Test/Prod) use DevOps pipelines to export and deploy flows into other environments for healthy ALM (application lifecycle management). They run their flows using service principal to avoid giving access to users in production environments.
- Your flows process large data or need to run frequently, thereby needing a high volume of Power Platform requests.
- Your premium flow is invoked by multiple users. In this case, either everyone needs a Premium license, or the flow needs a Process license. If a flow has a Process license, it doesn't require any user to have a license. It provides an organization with the flexibility to pay for licenses based on the number of flows. Larger organizations or solutions that affect many people can benefit from the fixed monthly cost.
- Your flow uses premium connectors, and your organization has many guest users using the flow, but you don't know if the guest users' home tenant provides them with Premium licenses.

### How many Power Automate Process licenses do I need?

- Your process has unattended RPA (robotic process automation): how many machine sessions do you need?

  Purchase one Process license for each machine. You can add more Process licenses if you need concurrent execution on the machine. All desktop flows (RPA) running on the machine and cloud flows (DPA) that are part of the business process are covered by the Process license.

- Your process only needs DPA (digital process automation): how many core business processes do you want to automate?  

  Purchase one process for every core business process. Some examples of core business processes are invoice processing or human resources (HR) onboarding. All cloud flows related to the same business process are included in the license.

### How many Process licenses do I need if I have multiple cloud flows, each of them invoking its own RPA flows in unattended mode on a machine?

With one Process license, you can run multiple cloud flows by queueing them. For example, if have four independent cloud flows, and each one of them invokes its own desktop flow running on the same machine, you can run the first one at 09:00 AM, the second one at 11:00 AM, and so on, in the same virtual machine.

In the following screenshot, all cloud flows are covered by one Process license, as they have a desktop flow running on the same machine. Any parent, child flows, in context flows of these cloud flows are also covered by the Process license on the machine.

:::image type="content" source="../media/faqs/many-flows-one-machine.png" alt-text="All cloud flows are covered by one Process license, as they have a desktop flow running on the same machine.":::

### My DPA process has multiple cloud flows. Will I need multiple Process licenses?

Core business processes can vary in size and complexity, ranging from small-scale initiatives to large-scale endeavors spanning multiple flows interconnected by shared data sources. For example, the invoice processing process has multiple flows handling an invoice from creation through approvals to payment. All the flows are part of one business process as they are all handling an invoice through multiple steps to closure. You only need one Process license for a core business process. This encourages microservices architecture best practices where flows can be small with fine-grained functionality resulting in better maintainability.

Identify the flow that starts the process and assign a Process license to that flow. Parent and child flows of the flow with Process license are covered by the Process license. These flows can be in the same solution or in a different solution. 

Non-parent/child flows can manually be associated to the flow with a Process license. These flows must be in the same solution and use the same data sources. 

The flows organized as parent, child flows, in context flows are all treated as one process with one Process license assigned to the main flow and share Power Platform Request limits of the Process license. 

### My solution has multiple processes. Do I need multiple Process licenses?

Yes. A solution can have multiple processes with a Process license assigned to each of them.

### Who needs to purchase a Premium license?

- The Power Automate Process plan has the highest priority among all licenses. This means if a Process license is assigned to a flow, the flow always uses this license and doesn't need an owner or running user to have a Premium license.
- Automated and scheduled flows always run in the context of the flow owner regardless of who starts the flow or what accounts are used for connections inside of the flow. Instant flows (button, hybrid triggers) run in the context of the user who invokes them, regardless of the connections used in the flow. If an automated or scheduled flow uses a premium connector, only the owner needs to have a Premium license.
- If an instant flow has premium connectors, every user who runs the flow needs a Power Automate Premium license. In such cases, instead of licensing every user, you can license the flow with a Process license. 
- If the flow doesn't use a premium connector, you don't need a Premium license. You can use a Microsoft 365 license.

To find out what type (automated/manual/scheduled) of flow you have, select a flow to see its 'type' in the details.

:::image type="content" source="../media/power-automate-licensing/flow-types.png" alt-text="Screenshot of types of flows.":::

- If the flow is in context of Power Apps or Dynamics 365 apps, and is an automated flow, the flow must be associated to the app created using Power Apps or a Dynamics 365 app and the owner needs Power Apps Premium license, or a Dynamics 365 license.
- If the flow is in context of a Power Apps or Dynamics 365 app, and is an instant flow, every user running the flow needs a Power Apps Premium license, or a Dynamics 365 license.
- If a parent flow calls a child flow, the child flow leverages the context from the parent flow. For example, if the following criteria are met, it uses the parent flow owner's license:
    - If the parent flow is an automated flow, and
    - The child flow uses premium connectors, and
    - The child flow doesn't have a Process license. If the child flow has a Process license, it uses the Process license and not the parent flow's license.

During the [transition period](types.md#transition-period), the parent flow license is not inherited by the child flow. The child flow uses the owner's license. However, after the transition period ends, only the parent flow license (owner's license/parent flow's Process license) will be used, unless the child flow has a Process license.

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a Process license for every environment?

Each flow exists in a specific environment. This means if a flow is imported into a different environment, each instance is a separate flow and needs a separate license. Parent flows, child flows, and all the flows that are tagged as in context of the flow are treated as one flow and one Process license covers the usage of all of them in one environment.   

### We have three environments (development, test, and production) to align with best practices and we need flows in several environments. Do we need to buy a Premium license for every environment?

The Power Automate Premium license is a user level license. All user level licenses (Power Automate Premium, Microsoft 365, Dynamics 365) are tenant level licenses. The user can use the flow in all environments without having to buy a separate license.

### Can a Power Automate Hosted RPA add-on be used as a Power Automate Unattended RPA add-on?

Yes, you can use the Power Automate Hosted RPA add-on capacity in two ways:
- For hosted machines and hosted machine groups
- To run desktop flows (RPA) in unattended mode that can be applied to a local, remote desktop, or other virtualized environment

### Can Microsoft 365 customers create solution-aware flows and child flows?

Yes. Microsoft 365 customers can create solution-aware flows if the environment in which they create the solution-aware flow has a Dataverse database attached to it. The default environment gets a Dataverse database by default. The admin must attach a Dataverse instance to non-default environments. Admins need at least a 1 GB tenant level Dataverse database capacity available to create a new environment.

The first subscription of Power Apps, Power Automate, Power Virtual Agents, Dynamics 365 Sales, Customer Service, and Field Service adds a one-time default capacity limit of 10 GB for the tenant. When you add subscriptions to the tenant, additional Dataverse capacity may accrue to the tenant. For example, if a new customer purchases a Power Automate premium plan, the tenant receives 10 GB of default Dataverse database capacity. And if the tenant buys 10 Power Automate Premium licenses, the tenant gets 10.5 GB (10 GB plus 10 times 50 MB).

### I use multiple user connections in my premium flow. Which user needs a Premium license to run the flow?

Connections are independent from license checks. You can have multiple user connections in a flow, but the flow always runs in the context of primary owner/run-only user/Process license. 

### The owner of a flow left the organization. How can we ensure it works without interruptions?

If the flow is a solution-aware flow, you can [change the owner](/power-automate/change-cloud-flow-owner) in Power Automate, or use [Power Automate Web API](/power-automate/web-api#update-a-cloud-flow) to ensure the flow works without interruptions. If the flow is a non-solution-aware flow, any co-owners can add it to a solution and then change the owner. If not, assign a Power Automate Process license to the flow to ensure it continues to run. Alternatively, any co-owners of the flow can export and import the flow. When imported, the flow will be a new flow, and the co-owner now becomes the owner of the flow. The flow uses the license of the new owner.

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 14 days if no action is taken.

### The owner of the flow no longer has a Premium license, but the flow is a premium flow. What happens?

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 14 days if no action is taken.

### Do guest users (not from your tenant) need a license to use Power Automate?

Yes. The guest user must have a Power Automate license assigned through one of the following tenants:

- The tenant that hosts the flow. You can assign them admin trials for temporary access or standalone licenses.

- The home tenant of the guest user.

For example, if a guest user has a Power Automate premium  license assigned in the home tenant, they can use premium features in the guest tenant that hosts the flow. 

Power Automate—included with Office, Power Automate premium, Power Apps premium, and Dynamics 365 user plans—will have the following characteristics:

- In the Azure public cloud, these plans are recognized across tenants in guest scenarios because they aren't bound to a specific environment.

- In Azure national or sovereign clouds, these plans are recognized across tenants in guest scenarios. More information: [National clouds](/azure/active-directory/develop/authentication-national-cloud), [Azure geographies](https://azure.microsoft.com/global-infrastructure/geographies/#geographies)

- Licenses aren't recognized across tenants in different Azure clouds.

### What Power Automate capabilities are included in Windows licenses?

Windows 11 users can try desktop flows in attended RPA for personal productivity in the default environment. They can't share the desktop flows or create desktop flows in a different environment other than the default environment. Windows users don't have access to cloud flows. To get full cloud flows and RPA features, purchase the Power Automate premium plan.

Windows 11 users can search for "Power Automate" in the Windows search bar. The Power Automate app for the desktop downloads automatically and then launches the first time you select its icon.

### Can Windows 10 and Windows Server 2016 users use Power Automate for desktop?

Yes, they can use Power Automate for the desktop (they have usage rights for it) but they'll have to download it from the download center.

## Legacy license questions

Starting August 1, 2023, Power Automate per flow ($100 per flow/month, with a minimum purchase of 5 licenses) and the Power Automate unattended RPA add-on ($150 per bot/month and required licensing prerequisites) will be removed from the pricing page. They will be removed from the price list on February 1, 2024. Power Automate process, an all-encompassing license that is easier to manage, licenses a single "automation" bot that can be used for unattended robotic process automation (unattended RPA), or cloud flows using digital process automation (DPA) and can be accessed by unlimited users in the organization. Power Automate Process is priced at $150 per bot/month.

### How is Process license different from per flow license 

For unattended RPA, previously customers needed to buy a per flow license for the cloud flow and an unattended RPA add-on. Now they can purchase a Process license for every RPA session on a machine. All the cloud flows invoking desktop flows on the machine are included as part of the Process license. 

For cloud flows, one per flow license allows a parent flow and its child flows. One Process license allows the parent flow, its child flows and any flows that are tagged as in context of the flow. Per flow had a minimum of 5 packs to be purchased to get started. There is no minimum purchase quantity requirement for Process license.

### How is Power Automate Premium license different from Power Automate per user with attended RPA license?

Power Automate premium offer includes all the benefits of Power Automate per user with attended RPA offered at $40 per user/month, plus the Process Mining visualize and analyze processes capabilities and is offered at $15 per user/month.

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
- Power Platform request limits: Power Apps premium gets 40,000 requests/day (100,000 requests/day during the [transition period](./types.md#transition-period)) and Power Apps per app gets 6,000 requests/day (10,000 requests/day during the [transition period](./types.md#transition-period)).
- Power Apps premium gets 250 MB Dataverse database capacity and 2 GB Dataverse file capacity. Power Apps per app gets 50 MB Dataverse database capacity and 400 MB Dataverse file capacity. Flows invoked by the app created using Power Apps that handle complex objects will consume this storage limit. For example, if a flow parses a 100-page document and makes updates to it, the storage it needs to retain the document in run history for future troubleshooting will consume this limit.

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

## Enforcement

### Why is my flow turned off?

To learn more, go to [When premium flows are turned off due to license issues](when-flows-are-turned-off.md).

This link also provides information about the types of enforcements, and how to identify flows that need Premium licenses to avoid interruptions due to enforcement.

### I have many environments. How can I get the flows that need my attention across tenant?

If the number of environments in the tenant is less than 500, use the following script to get all the flows that need licenses across the tenant:

```powershell
$environments = Get-AdminPowerAppEnvironment

$allFlows = @()
foreach ($env in $environments) {
    Write-Host "Getting flows at risk of suspension for environment $($env.DisplayName)..."
    $flows = Get-AdminFlowAtRiskOfSuspension -EnvironmentName $env.EnvironmentName
    Write-Host "Found $($flows.Count) flows at risk of suspension."
    $allFlows += $flows
}
```

#### Write all flows to a CSV file

$allFlows | Export-Csv -Path "flows.csv" -NoTypeInformation

Write-Host "All flows at risk of suspension written to flows.csv"

If there are more than 500 environments in the tenant, raise a support ticket so our support team can run the report for you. 

### I assigned a license but I still see the flow in flows that need my attention in PowerShell. Why?
Once a license is assigned/flow is associated to an app, edit and save the flow. It can take up to 24 hours for the PowerShell to refresh and remove the flow from the PowerShell response.

### I assigned a license but I still see the banners that my flows need attention in Power Automate portal. Why?
Once a license is assigned/flow is associated to an app, it may take up to seven (7) days for the premium license to appear in the Power Automate portal. To refresh the latest license status, edit and save a flow.

### How can I easily determine if my flow is in context of a Power Apps/Dynamics 365 app?

Is the flow created to support the Power Apps/Dynamics 365 app? Can the flow be deleted if the corresponding apps are deleted? Is the flow talking to the same data sources as the app? If so, the flow is in context.

### How can I associate in-context flows to Power Apps/Dynamics 365 apps? 

Flows created to support apps built with Power Apps/Dynamics 365  must run within the context of the app. This means the flow must use the same data sources for triggers or actions as the app. If automated or scheduled cloud flows are created to support the app and are in context of an app, link the flow to the apps using a [PowerShell script](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app). Once the flow is linked, a dependency is established between the app and the flow and they can be managed together. If the linked app is deleted or unused, the flow will be turned off.

Makers can also associate their flows to apps from the Power Automate portal. To learn more, go to [Associate flows to apps](/power-automate/associate-flow-to-app).

### Power Automate capabilities included with per app plans

A Power Apps per app plan gives users the ability to run Power Automate flows that use premium features. The flows either need to be triggered by Power Apps or associated to an app through PowerShell or the Power Automate portal.

To learn more, go to [Associate in context flows to an app](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app).

## Multiplexing

Multiplexing refers to the use of hardware or software that a customer uses to pool connections, reroute information, or reduce the number of users that directly access or use the Power Apps, Power Automate, and the Power Virtual Agents service. 

### Is it recommended to use multiplexing to reduce the number of licenses?

Using multiplexing as a mechanism to reduce the number of licenses to be purchased is a license violation. To learn more, go to the multiplexing guidance from [Client Access License (CAL) Requirements](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/Licensing_Brief_PLT_Multiplexing.pdf).

Here are a few examples of what multiplexing is or isn't:

1. If the premium flow is only moving data from Dataverse into a shared location or sending an email to colleagues, it doesn't fall under multiplexing because the users consume the data, rather than trigger the flow.

1. If a premium flow triggers when a new item is added to a SharePoint list, saves the details in Dataverse, and then sends an email to the owner of the flow, multiple people can upload items into the list but the email is only sent to the owner. In this case, only the owner needs a license because they're the only person who gets value from the flow.

1. If the flow mentioned in number two sends an email to the user who uploads the item, both the owner and the user need a Premium license. In this case, the user  indirectly triggers the flow (by uploading an item into SharePoint) and gets value from the flow in the form of an email. Failure to license all the users falls under multiplexing.  

### I have multiple flows running under a shared service account. What licenses do I need?

- **Service account**: Microsoft Entra user account used as a service account. Service accounts are a special type of account that's intended to represent a nonhuman entity, such as an application, API, or other service. User accounts, used as a service account by sharing credentials with other users, pose a security risk and it's difficult to track who made changes to a flow if multiple people have access to the service account. Managing their passwords is also a challenge.  When creating service accounts, provide only the permissions that are required for the task. Evaluate existing service accounts to see if you can reduce privileges. Limit the number of people who have access to the service account to minimize security risks. You can also create different accounts for different scenarios to minimize the exposure. Service accounts are not recommended as a best practice. In some scenarios, service accounts are used to remove the dependency from the flow to the original owner. In such cases, use Service principal to resolve security threats.

- **Service principal**: Microsoft Entra service principal functions as the identity of the application instance. Service principals define who can access the application and what resources the application can access. A service principal is created in each tenant where the application is used and references the globally unique application object. 

- **Non-interactive users**: Dataverse supports non-interactive users for activities like background processes that migrate data between databases. These don't require a user to interact with the service. There's a maximum limit of seven (7) non-interactive users per tenant. Non-interactive users aren't yet supported by Power Automate.

- **Human users**: These are the human synchronized users from Microsoft Entra ID.

This guidance is specific to flows that run under a service account as the owner of the flow. 

If you want to run your flow under a service account, here is how to avoid multiplexing: 

- If the flow only uses standard connectors and no premium features, all the users who have the credentials of the service account can have a Microsoft/Office 365 license, Power Automate Free, or any Power Automate Premium license. 

- If the flow uses premium features (premium connectors, Robotic Process Automation, custom connectors, on-premises gateway, business process flows): 
  - The service account is used by a limited set of users. In this case, licensing all the users and the service account is enough. 
  - The service account is used by many users. In this case, it's recommended to assign a Process license to the flow to ensure any new users adding to the account are automatically compliant. 

- If the flow is a manually or app-triggered flow/Dataverse ‘Run as user’ flow, all users who run the flow will need a Premium license or the flow needs a Process license. Check out this FAQ on [who needs to purchase a Premium license](faqs.md#who-needs-to-purchase-a-premium-license).

- Premium flow is in context (the flow shares the data sources of the app) of an app created using Power Apps/Dynamics 365 app: 
  - All the users who have the credentials for the service account and the service account need a Power Apps/Dynamics 365 license. 
  - If they don’t have a Power Apps/Dynamics 365 license, all the users and the service account need Power Automate user licenses.
  - Alternatively, the flow can be licensed with a Process license and none of the users/service account needs a license.

- Multiple users sharing credentials of a service account and using premium flows with one Power Automate premium license assigned to the service account is considered multiplexing and the flow isn't compliant.

> [!NOTE]
> The guidance is specific to service accounts used as flow owners or run-only users. Flows using service accounts as connections or co-owners aren't impacted by this guidance. We recommend running the flows with service principal as the owner instead of service account to avoid security risks.
>
> This is guidance only and not hard enforcement. Admins are responsible for licensing all the flows correctly to stay compliant.

### There's a premium flow that sends approval requests to a set of users and then waits for the users to approve or reject the request before it continues running.  Do the approvers need a Premium license?

Users who respond to approval requests don't need a Premium license.

### Automated flow - User builds a flow that triggers when an item is added to a list created using Microsoft Lists and updates a SQL database (Premium). Multiple people can add items to the list created using Microsoft Lists. Do users need a Premium license?

The flow runs in the context of the owner's license for automated or scheduled flows and the invoking user's license for instant, Power Apps, or Dataverse-triggered flows. So, the person who added the item to the list created using Microsoft Lists doesn't need a Premium license.

### We have an instant flow with run-only users and it uses premium connectors. The maker shares that flow with their team and allows them to run that flow. Does everyone need a Premium license?

Everyone who invokes the flow needs a Premium license because it's an instant flow.

### I have a child flow that has premium connectors and it's invoked by multiple parent flows that don't have premium connectors. Do all parent flows need to be licensed, or is licensing the child flow enough?

You can either license the parent flow or license the child flow with a Process license. However, if the parent flow also has a premium connector, the parent flow owner must have a Premium license or the parent flow must have the Process license.

### My flow uses connections from multiple users. Do I need to license all of them?

Who needs a license is independent from whose connections are used in the flow. Automated or scheduled flows always run under the owner's license and manual flows or  apps always run under the user who triggers the flow.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]