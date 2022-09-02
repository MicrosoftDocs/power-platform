---
title: "Frequently asked questions about Power Automate licensing"
description: "Frequently asked questions about Power Automate licensing."
author: PriyaKodukula
ms.component: pa-admin
ms.topic: overview
ms.date: 07/22/2022
ms.author: prkoduku
ms.reviewer: MSFTMan
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

The standard user license plan for Power Automate is the Power Automate per user plan, but there is a range of other license plans a user could use. Users with the free or one of the Office 365 license plans will only be able to access standard connectors, but most of the other license plans provide access to premium connectors. For details about license plans that include Power Automate capabilities, see the [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types)Power Platform [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). For details about the limits and performance profile of license plans, see the [Power Automate Limits](/power-automate/limits-and-config).

### When should I choose Power Automate "per flow" versus "per user"?

Our recommendation, for almost all companies in almost all situations, is to buy the per user with attended Robotic Process Automation (RPA) license for every user in their organization. Optionally, purchase the unattended bot add-on for every machine that will be running unattended automation. 

The per user plan is intended for personal automation to support the broad adoption of an automation culture in an organization.

The per flow plan is intended for enterprise process automation. If a flow is providing value to a team, either every one in the team needs a per user license or the flow needs a per flow license. If a flow has per flow license, it doesn't use nor require any other license when it's run. It provides an organization with the flexibility to pay for licenses based on the number of flows it uses, instead of licensing each user accessing the flows individually with the per user plan. Larger organizations or solutions that affect many will benefit from the fixed monthly cost. It's best to use per flow license if your flow uses premium connectors and your organization has many guest users using the flow, but you don't know if the guest users home tenant provides them with premium licenses. 

### Who needs to purchase a premium license?

The per flow plan has the highest priority among all licenses, meaning, if a per flow license is assigned to a flow, the flow always uses this license.

If the flow is used for an enterprise scenario where multiple people are getting value from the flow, everyone who is benefitting from the flow needs a per user license or the flow  needs a per flow license.

If the flow doesn't have a per flow license and is a personal automation flow, the decision about which license is used is based on how the flow gets triggered.

Here's the decision tree for personal automations.

- Automated and scheduled flows always run in the context of the flow owner regardless of who started the flow or what accounts are used for connections inside of the flow. Instant flows (button, power apps, hybrid triggers) run in the context of invoking user regardless of connections the flow uses.
- If an automated/scheduled flow uses a premium connector, only the owner needs to have a premium license.
- If an instant flow has premium connectors, every user who runs the flow needs either a Power Automate premium license, a Power Apps premium license, or a Dynamics license. In such cases, instead of licensing every user, it is simpler to license the flow with a per flow license. One exception for this rule is the http trigger which runs in the context of the owner, even if it's being used in an instant flow.
- If a parent flow calls a child flow, child flow leverages the context from parent flow. For example, if the parent flow is an automated flow, and the child flow uses premium connectors and the child flow doesn't have per flow license, it will use the parent flow owner's license. If the child flow has a per flow license, it uses the per flow license and not the parent flow's license. During the [transition period](./types.md#transition-period), there is a slight difference in this behavior. The child flow owner's license will be used unless the child flow has a per flow license but after the transition period ends, the child flow owner's license will be ignored and only the parent flow owner's license is used unless the child flow has a per flow license.

A common question is, "If a flow is triggered when a list created using Microsoft Lists item is updated, and many users interact with that list, will there be a cost for each user?" The answer depends on who is getting value from the flow. 
-  If the flow uses premium connectors and the end users are getting value from the flow directly or indirecty, then every user needs a license. 
-  If the flow uses premium connectors and only the owner is getting the value from the flow, since the trigger is an automated trigger, only the owner needs a premium license.
-  If the flow does not use a premium connector such as calling Dataverse in the full production environment (not the Microsoft Teams environment), having an Office 365 license is enough.

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

Connections are independent from license checks. You can have multiple user connections in a flow, but the flow always runs in the context of primary owner/run-only user. 

### The owner of a flow left the company. How can we ensure it works without interruptions?

If the flow is a solution flow, you can [change the owner](/power-automate/change-cloud-flow-owner) in Power Automate portal, or use [Power Automate Web API](/power-automate/web-api#update-a-cloud-flow) to ensure the flow works without interruptions. If the flow is a non-solution flow, you cannot change the owner, assign a per flow license to the flow to ensure it continues to run. Alternatively, any co-owners of the flow can export and import the flow. When imported, the flow will be a new flow and the co-owner will now become the owner of the flow. And the flow will use the license of the new owner. 

### The owner of the flow no longer has a premium license, but the flow is a premium flow. What happens?

The flow will be downgraded to lower performance and all flow owners will be notified and the flow will be turned off in 30 days if no action is taken.

### Do guest users (not from your tenant) need a license to use Power Automate?
Yes. The guest user must have a Power Automate license assigned through one of the following tenants:
- The tenant hosting the flow. You can assign them admin trials for temporary access or standalone licenses.
- The home tenant of the guest user.

For example, if a guest user has a Power Automate per user license assigned in the home tenant, they can use premium features in the guest tenant that is hosting the flow. 
Power Automate, included with Office, Power Automate per user, per user with attended RPA, Power Apps per user, and Dynamics user plans, will have the following characteristics:
- In the Azure public cloud, the above plans are recognized across tenants in guest scenarios because they aren't bound to a specific environment.
- In Azure national or sovereign clouds, the above plans are recognized across tenants in guest scenarios. More information: [National clouds](/azure/active-directory/develop/authentication-national-cloud), [Azure geographies](https://azure.microsoft.com/global-infrastructure/geographies/#geographies)
 - Licenses are not recognized across tenants in difference Azure clouds.

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
  
- Access to [premium connectors](./types.md#premium-connectors) is not included except in Dataverse for Teams environments. Learn more about [Dataverse for Teams capabilities](../pricing-billing-skus.md#dataverse-capabilities-with-microsoft-365-licenses)
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
- [Power Platform request](./types.md#power-platform-requests) limits: Dynamics Team member gets 6K requests/day (25K requests/day during the [transition period](./types.md#transition-period)), Dynamics professional gets 40K requests/day (100K requests/day during [transition period](./types.md#transition-period)) and Dynamics Enterprise gets 40K requests/day (100K requests/day during [transition period](./types.md#transition-period)).

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
- Power Apps per user gets 250MB Dataverse database capacity and 2GB Dataverse file capacity. Power Apps per app gets 50MB Dataverse database capacity and 400MB Dataverse file capacity. Flows invoked by the app created using Power Apps that handle complex objects will consume this storage limit. For example, if a flow parses a 100-page document and makes updates to it, the storage it needs to retain the document in run history for future troubleshooting will consume this limit.

The following Power Automate capabilities aren't included in Power Apps licenses.

- [Robotic process automation](./types.md#robotic-process-automation)
- [AI Builder capacity](./types.md#ai-builder-credits)

Flows that use the Power Apps license must run within the context of the app created using Power Apps, which uses the same data sources for triggers or actions as the app created using Power Apps. If your app created using Power Apps consumes standalone flows that aren't related to the app created using Power Apps, you must purchase a standalone Power Automate license.

#### Example of Power Automate use within an app created using Power Apps context

A user with a standalone Power Apps license runs an app that uses a SQL database as the data source. The app created using Power Apps also includes flows that do the following.

- Read from or write to a SQL database.

- Use a built-in Power Apps trigger or action, for example, to send a push notification to the app created using Power Apps.

#### Example of Power Automate use outside of an app created using Power Apps context

The same user ([in the example above](#example-of-power-automate-use-within-an-app-created-using-power-apps-context)) now also wants to use a flow that updates an Oracle database and also has the following properties. 

- It's completely unrelated to the app created using Power Apps

- It doesn't interact in any way with the app created using Power Apps (or its data sources).

In this example, the app created using Power Apps is being used outside the context of Power Apps so the user needs a standalone Power Automate license.


## Multiplexing

### What is multiplexing, and is it recommended to use multiplexing to reduce the number of licenses?

Multiplexing refers to the use of hardware or software that a customer uses to pool connections, reroute information, or reduce the number of users that directly access or use the Power Apps, Power Automate, and the Power Virtual Agents service. Using multiplexing as a mechanism to reduce the number of licenses to be purchased is a license violation. For more details, refer to the multiplexing guidance from [Client Access License (CAL) Requirements](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/Licensing_Brief_PLT_Multiplexing.pdf).

Examples of multiplexing:
1. User creates a flow to export data from Dataverse into an external storage and sends the data over to collegues in an email. The collegues consume/edit the data.Flow imports the data back into Dataverse. In this case, the user and all the collegues need a license as Power Automate is performing all the steps in the data distribution. 
2. If the flow is only moving data into shared location and the user is manually sending an email to the collegues, it doesnt fall under multiplexing. 
3. If a premium flow triggers when a new item is added to a sharepoint list and saves the details in Dataverse and sends an email to the owner of the flow. Multiple people can upload items into the list but the email is only sent to the owner. In this case, only owner needs a license as he/she is the only person getting value from the flow. 
4. If the above flow sends an email to the owner and the user who uploaded the item, both the owner and user needs a premium license. Failure to license all the users fall under multiplexing.  

### I have multiple flows running under a shared service account. What licenses do I need?
Definitions: 
 - **Service account**: Azure Active Directory (Azure AD) user account used as a service account. Service accounts are a special type of account that are intended to represent a non-human entity such as an application, API, or other service. User accounts, used as a service account by sharing credentials with other users, are difficult to track and managing their passwords is a challenge. In some scenarios, service accounts are used to remove the dependency from the flow to the original owner. When creating service accounts, provide only the permissions that are required for the task. Evaluate existing service accounts to see if you can reduce privileges. It is recommended to limit the number of people who have access to the service account to minimize security risks. You can also create different accounts for different scenarios to minimize the exposure. 
 - **Service Principal**: Azure AD service principal functions as the identity of the application instance. Service principals define who can access the application and what resources the application can access. A service principal is created in each tenant where the application is used and references the globally unique application object. Power Automate doesn't yet support a flow to run under Service Principal; the [feature](/power-platform-release-plan/2022wave1/power-automate/ownership-supported-service-principals) is coming soon. 
 - **Non-interactive users**: Dataverse supports non-interactive users for activities like background processes that migrate data between databases. These do not require a user to interact with the service. There is a maximum limit of 7 non-interactive users per tenant. Non-interactive users are not yet supported by Power Automate. 
 - **Normal users**: These are the regular synchronized users from Azure AD.

Guidance: This guidance is specific to flows that run under a service account as the owner of the flow. If you want to run your flow under a service account, here are the best practices:
 - If the flow only uses standard connectors and no premium features, all the users who have the credentials of the service account can have Microsoft/Office 365 license, Power Automate Free, or any Power Automate premium license. 
   - If the flow uses premium features (premium connectors, Robotic process Automation, custom connectors, on prem gateway, Business process flows): 
   - The service account is used by a limited set of users. In this case, licensing all the users and the service account is enough. 
   - The service account is used by many users. In this case, it is recommended to assign a per flow license to the flow to ensure any new users adding to the account are automatically compliant. 
 - If the flow is a manual/app triggered flow/Dataverse ‘Run as user’ flow, all users who run the flow will need a premium license or the flow needs a per flow license. Check out this FAQ on [who needs to purchase a premium license](faqs.md#who-needs-to-purchase-a-premium-license).   
 - Premium flow is in context (the flow shares the data sources of the app) of an app created using Power Apps/Dynamics App: 
   - All the users who has credentials of the service account and the service account need a Power Apps/Dynamics 365 license. 
   - If they don’t have a Power Apps/Dynamics 365 license, all the users and the service account need Power Automate user licenses.
   - Alternatively, the flow can be licensed with a per flow license and none of the users/service account needs a license. 
  - Multiple users sharing credentials of a service account and using premium flows with one premium per user license assigned to the service account is considered multiplexing and the flow is not compliant. 

> [!NOTE]
> The guidance is specific to service accounts used as flow owners or run only users. Flows using service accounts as connections or co-owners are not impacted by this guidance. 
> 
> This is guidance only and not hard enforcement. Admins are responsible for licensing all the flows correctly to stay compliant. 


### There's a premium flow that sends approval requests to a set of users and then waits for the users to approve or reject the request before it continues running.  Do the approvers need a premium license?

Every user benefiting from the flow needs a license. But, if the flow is a personal automation where only the owner is benefiting from the flow, users who respond to approval requests don't need a premium license. 

### **Automated flow** - User builds a flow that triggers when an item is added to a list created using Microsoft Lists and updates a SQL db (Premium). Multiple people can add items to the list created using Microsoft Lists.

It depends on who is getting the value from the flow. If the users are getting value from the flow directly or indirectly, they need a premium license. If the flow is for personal automation, the flow runs in the context of owner's license for Automated/Scheduled flows and invoking user's license for Instant/Power Apps/Dataverse triggered flows. So, the person who added the item to list created using Microsoft Lists do not need a premium license.

### We have an instant flow with run-only users and it uses premium connectors. The maker shares that flow with their team and allows them to run that flow.

Everyone who invokes the flow need a premium license because it is an instant flow.

### I have a child flow that has premium connectors and is invoked by multiple parent flows that don't have premium connectors. Do all parent flows need to be licensed, or is licensing the child flow enough?

You can either license the parent flow or license the child flow with a per flow license. However, if the parent flow also has a premium connector, the parent flow owner must have a premium license or the parent flow must have the per flow license.


### My flow uses connections of multiple users. Do i need to license all of them?

Who needs a license is independent from whose connections are used in the flow. Automated/scheduled flows always run under the owner's license and manual/power apps flows always run under the users who ran the flow. 


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
