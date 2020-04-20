---
title: "Data loss prevention policies  | MicrosoftDocs"
description: About Data loss prevention policies.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Data loss prevention policies

[Jim note: I have not yet scrubbed this content.]

Your organization's data is likely one of the most important assets you are responsible for safeguarding as an administrator. The ability to build apps and automation that uses the data allows your company to be successful. Power Apps and Power Automate allow rapid build and rollout of these high-value applications that allow users to measure and act on the data in real time. Applications and automation are increasingly becoming more connected across multiple data sources and multiple services. Some of these services might be external third-party services and might even include some social networks. Users will often have good intentions but might overlook the potential for exposure from data leakage to services and audiences that shouldn't have access to the data.

Data loss prevention (DLP) policies that help protect organizational data from unintended exposure are available for administrators to create. They can act as guardrails to help prevent users from unintentionally exposing the data. DLP policies can be scoped at the environment level or tenant level offering flexibility to craft policies that are sensible and strike the right balance between protection and productivity. For tenant level policies you can define the scope to be – all environments, only selected environments or all but excluded environments. Environment level policies can be defined for one environment at a time. 

DLP policies enforce rules of what connectors can be used together by classifying connectors as either ‘Business’ or ‘Non-business’. Simply, if you put a connector in the ‘Business’ group, it can only be used with other connectors from that group in the same app or flow. Sometimes you may want to altogether block the usage of certain connectors by classifying them as ‘Blocked’.

> [!NOTE]
> Connector blocking capability using a 3-way classification – Business, Non-Business, Blocked as well as DLP UX support in Power Platform Admin Center are currently in Public Preview. There is also the new DLP Powershell support for 3-way DLP classification which is also in Public Preview. Legacy DLP support for 2-way classification along with UX and PS support for 2-way classification – Business, Non-Business is currently in General Availability and will continue to be available until the 3-way policy is upgraded to General Availability. 

## Connector classification
Data groups are a simple way to categorize connectors within a data loss prevention (DLP) policy. The three data groups available are the ‘Business’ data group, ‘Non-business’ data group and ‘Blocked’ data group. 

A good way to categorize connectors is to place them in groups, based on the business centered or personal use centered services that they connect to in context of your organization. Connectors that host business use data should be classified as ‘Business’ and connectors that host personal use data should be classified as ‘Non-Business’. Any connectors that you want to restrict usage of across one or more environments, should be classified as ‘Blocked’

When a new policy is created, by default all connectors are placed into the ‘Non-business’ group. From there they can be moved to ‘Business’ or ‘Blocked’ based on your preference. You manage the connectors in a data group when you create or modify the properties of a DLP policy from the admin center. For step by step instructions on how to create a DLP policy refer to this <link TBD>. You can also change the initial classification of connectors by editing your DLP policy. For step by step instructions on how to edit a DLP policy refer to this <link TBD>.

> [!NOTE]
> Until recently, some HTTP connectors were not readily available for DLP configuration using DLP UX and Powershell. This has recently been fixed as of May 2020 and following HTTP connectors can now be classified using DLP UX and Powershell like any other Power Platform connector – ‘HTTP’, ‘HTTP Webhook’, ‘When a HTTP request is received’. 
>
> ‘Content Conversion’ connector is an integral feature of power platform and used to converts an HTML document to plain text. It is applicable for both Business and Non-Business scenarios and does not store any data context of the content converted through it. It is therefore not available for classification through DLP policies.

### How data is shared among data groups
Data cannot be shared among connectors located in different groups. For example, if you place SharePoint and Salesforce connectors in the ‘Business’ group and you place Gmail in the ‘Non-business’ group, makers cannot create a PowerApp or PowerAutomate resource that uses both SharePoint and Gmail connector. This in turn restricts data flows between these two services using Power Platform. 

While data cannot be shared among services in different groups, you can share data among the services within a specific group. So, going back to the earlier example, since SharePoint and Salesforce were placed in the same data group, makers can create a PowerApp or PowerAutomate resource that uses both SharePoint and Salesforce connectors together. This in turn allows data flows between these two services using Power Platform.

The key point being that - connectors in a specific group can share data, while connectors in different groups cannot share data through Power Platform.

### The impact of blocked data group
Data cannot be altogether restricted to flow to a specific service by marking that connector as ‘Blocked’. For example, if you place Facebook and Twitter in the Blocked group, makers cannot create a PowerApp or PowerAutomate resource that uses Facebook connector. This in turn restricts data flows to this service using Power Platform. 

> [!NOTE]
> ‘Standard’ licensed connectors where the service/stack is owned by Microsoft cannot be classified as ‘Blocked’ ‘through DLP policies. They can however be classified into Business or Non-Business. These connectors are either enterprise class services such as O365 with not additional licensing implications or are public facing cloud services hosted by Microsoft that do not store data such as Bing Search or are private use only Microsoft services such as Outlook.com that only support MSA (private account) login through connector surface. Privacy policy statement for Microsoft hosted public services can be found here - https://privacy.microsoft.com. Full list of connectors that cannot be blocked can be found here - <link TBD>
>
> Common data service connectors are the only Premium connectors that cannot be blocked. CDS is an integral part of Power Platform, hence the exception.

### List of connectors that cannot be blocked

[table coming]

### Custom connector classification
By default, custom connectors are not part of the standard configuration capabilities of DLP policies from Power Platform Admin Center UX. They can however be set up for DLP across ‘Business’, ‘Non-Business’ and ‘Blocked’ categories using DLP Powershell commands listed here - <Add example here using help from Geoffrey>. 

Unlike standard and premium connectors which are available to all environments in the tenant, custom connectors are scoped specific to an individual environment. Therefore, tenant level DLP policies cannot be used to manipulate custom connectors. They are only available to categorize for environment level DLP policies. Using PowerShell, you can configure DLP to include these connectors. Once added, these will then be manageable in the Admin Portal.

> [!NOTE]
> Only Custom Connectors stored in a tenant’s default environment will be displayed with its given icon and display name in the policy editor. All other custom connectors will be displayed with the default connector icon and their internal name.

### Default data group for new connectors
Additionally, one data group must be designated as the default group to auto classify an new connectors added to Power Platform after your policy has been created. Initially, the No business data allowed group is the default group for new connectors and all services are in the data group. An administrator can change the default data group to the business data only data group. For step by step instructions on how to change the default data group settings for DLP policy refer to this <link TBD>.

> [!NOTE]
> Any new services that are added to Power Apps will be placed in the designated default group. For this reason, we recommend you keep the Non-business as the default group and manually add services into the Business or Blocked group after your organization has evaluated the impact of allowing business data to be shared with the new service.




## Policy scope
### Tenant-level policies
### Environment-level policies

## Combined effect of multiple DLP policies
### Blocked data group
### Business and Non-Business data groups

## Impact of DLP policies on apps and flows
### Design-time impact on apps and flows
### Run-time impact on apps and flows

## Strategies for creating DLP policies

## The DLP process

The following are the steps you follow to create a DLP policy.

1. Assign the policy a name
2. Classify connectors
3. Define scope
4. Select environments
5. Review settings

For a description of these steps, see [Create a data loss prevention (DLP) policy](create-dlp-policy.md).

## Known issues

### Cloud PKI Management
Cloud PKI Management is wrongfully marked as exempt from blocking. It is not a Microsoft owned service and will be available for blocking after this known issue is fixed.

### LinkedIn and Microsoft Staffhub
LinkedIn and Microsoft Staffhub are wrongfully marked as available for blocking. They are Microsoft owned standard connectors and will be exempt from blocking after this known issue is fixed.


## Legacy DLP policy support

## Center of Excellence support for DLP

<!-- 
## What policies do we already have?

From the Power Apps admin center (admin.powerapps.com) you can see the current policies you have in place in your tenant. This should be your first stop as a new administrator to understand what is currently active.

> [!div class="mx-imgBorder"] 
> ![Data policies](media/data-policies.png "Data policies")

## Creating new DLP Policies

When you create a new DLP policy you first decide on the scope. If you are an environment administrator only, you will see a selection to choose one of your environments to associate with the DLP policy. If you are a Power Platform service admin, you will have the ability to apply to All Environments, Selected Environments, or All Environments EXCEPT.

For the process to create a DLP policy, see [Create a data loss prevention (DLP) policy](create-dlp-policy.md).

> [!div class="mx-imgBorder"] 
> ![New DLP policy](media/new-dlp-policy.png "New DLP policy")

Environment-only admins do have the ability to view policies created by Power Platform admins to understand what might apply to their environment.

One thing to consider is that environment-specific policies can't override tenant-wide DLP policies. For example, if you only allow use of Common Data Service connectors in an environment, an individual user who is only an environmental admin can't override that policy to allow social network connectors to be used.

## Configuring connectors for a DLP policy

By default, all connectors are considered part of the No business data allowed list and no connectors are included in the Business data only group. This effectively means that all connectors can be used with other connectors.

> [!div class="mx-imgBorder"] 
> ![Configure DLP connector](media/configure-dlp-connector.png "Configure DLP connector")

When new connectors are added, they are added to the Default category, which is No business data allowed. If you prefer, you can change which category is considered the default, and then all new connectors will be classified in that category by default.

> [!div class="mx-imgBorder"] 
> ![Set as default group](media/set-default-group.png "Set as default group")

Typically, though, most companies will want to treat new connectors as No business data allowed until they evaluate if it is appropriate to use with what they have classified as business data.

As an example, let's say we were to create a new tenant-wide DLP policy that had just Common Data Service added to the Business data only and all others in No business data allowed. Let's look at a few application examples and the outcome of this policy.

|Connectors used in application or flow  |Impact of DLP  |
|---------|---------|
|SharePoint and OneDrive     |This would be allowed         |
|Common Data Service     | This would be allowed        |
|Common Data Service and SharePoint     |This would not be allowed         |
|SharePoint and Twitter     |This would be allowed         |
|SharePoint, Twitter, and Common Data Service     |This would not be allowed         |

> [!div class="mx-imgBorder"] 
> ![Example DLP policy](media/example-dlp-policy.png "Example DLP policy")


## Impact of a change in DLP policy on existing apps and flows
Consider the following table.

> [!div class="mx-tableFixed"]
> |         |New  |Existing  |
> |---------|---------|---------|
> |**Power Apps**   | Users trying to create a new Power App that violates DLP policies will not be allowed to do so.        | Power Apps do not enforce new DLP policies after the app has been created and published. The Power Apps app won't check for DLP policy violations until the maker edits the canvas app again, removes one of the connections, and attempts to re-add it since DLP policies only restrict users from adding new connections.        |
> |**Power Automate**     | Users will not be allowed to create a new Flow that violates a DLP policy.        |When a flow executes the trigger, the Power Automate runtime checks to see if the flow is compliant with all existing DLP policies. If it violates any DLP policy, then the flow will be disabled.         |

Users creating or editing a resource impacted by the DLP policy will see a message about the DLP policy conflict. As an administrator, you should have a process and plan in place to handle these types of support needs if you are using DLP policies.

> [!div class="mx-imgBorder"] 
> ![DLP policy conflict](media/dlp-policy-conflict.png "DLP policy conflict")

Using the DLP Editor in the [Center of Excellence Starter Kit](../guidance/coe/starter-kit.md), you can see the impact a change of DLP policies would have on existing apps and can mitigate the risk by reaching out to the maker.

> [!div class="mx-imgBorder"] 
> ![DLP Editor](media/dlp-editor.png "DLP Editor")

DLP policies created for a connector do not understand that that connector could be configured to talk to dev, test, production, and so on. When you configure a DLP policy, it is all or nothing. So, if you want to allow the connector to talk to a test database in the test environment, but not allow it to connect to the production database in that same test environment, then DLP policies won't help you restrict that. DLP policies are connector-aware, but do not control the connections that are made using the connector.

## Custom connector and HTTP  

By default, custom connectors and the HTTP connector are not part of the standard configuration capabilities of DLP policies. Using templates or PowerShell, you can configure DLP to include these connectors. For more information, see [Introducing HTTP and Custom Connector Support for Data Loss Prevention Policies](https://flow.microsoft.com/blog/introducing-http-and-custom-connector-support-for-data-loss-prevention-policies/).

The [Center of Excellence Starter Kit](../guidance/coe/starter-kit.md) has an app that allows users to update policies for these connectors as well. This provides a UI front end to the PowerShell scripts.

> [!div class="mx-imgBorder"] 
> ![DLP Customizer](media/dlp-customizer.png "DLP Customizer")

## Strategies for creating DLP policies

As an administrator taking over an environment or starting to support use of Power Apps and Power Automate, DLP policies should be one of the first things you set up. This ensures a base set of policies is in place, and you can then focus on handling exceptions and creating targeted DLP policies that implement these exceptions once approved.

For smaller environments where the users are highly capable and are trusted, you could start out with no DLP policies, taking only the default options. This is the most flexible option and can be changed at any time. Keep in mind introducing more restrictive policies later could conflict with existing assets. These conflicts could have business impact when existing apps and flows stop working until either the app or flow is brought into compliance or the DLP policy relaxed.

For larger environments, it is recommended you have a plan in place for DLP policies. It is best to do this in conjunction with your plan for managing environments in your organization. While there is an endless combination of connectors you might have in your own environment, we will be using an example that you can tailor to fit your own needs. Let's set up a framework for a generic DLP policy template that could apply to many organizations, only modifying it for some of their specific needs.

First, let's look at our environment setup and assumptions. The following are the environments we are expecting to manage in our organization.

|Environment  |Expected Use / Policy  |
|---------|---------|
|Contoso – Default     | This is the default environment, and anyone can create apps and flows in it.        |
|Contoso Enterprise Apps     |This is a production environment with applications managed with formal review before being promoted here. This could also be more business-unit aligned, Marketing or Finance, for example.         |
|Community Plan Environments (0…N)     |These will be automatically created by any users in our org that sign up for the free Community Plan.         |
|User-Owned Environments (0…N)     |These are production or trial environments created by users with a Power Apps plan or Power Apps trial.         |

We now are going to design a tenant-wide default DLP policy. Our goal is to ensure that as people create their own environments and test and explore, they minimize the mixing of core business data without us first working with them.

Our goal is to apply this default global policy to all environments except Contoso Enterprise Applications, which we are going to manage by a separate DLP policy.

> [!div class="mx-imgBorder"] 
> ![DLP choose environment](media/dlp-choose-environment.png "DLP choose environment")

We have identified the following connectors as our initial set of Business data only connectors (remember, you can always add to this list at any time).

> [!div class="mx-imgBorder"] 
> ![Example DLP connectors](media/example-connectors.png "Example DLP connectors")

With this policy in place, any use outside of those business connectors will need to have exceptions handled and we will cover that shortly.

For the example Contoso Enterprise Applications environment, since we excluded it from our policy, we have two choices. We can either leave it wide open since we only deploy to it trusted applications that we as administrators install and configure, or we establish a DLP policy for it to match its application needs. The following new DLP policy shows how we would create a DLP specific for that environment.

> [!div class="mx-imgBorder"] 
> ![DLP choose environment](media/dlp-choose-environment-apply-selected.png "DLP choose environment")

The following is an example that might look like a super set of our global one—notice it includes some social network and third-party connectors—but since these are all trusted apps and flows, that is OK.

> [!div class="mx-imgBorder"] 
> ![Example DLP connectors](media/example-connectors-social.png "Example DLP connectors")

Now with this in place, you need a plan on how to handle exceptions. You really have three choices:

1. Deny the request.
2. Add the connector to the default DLP policy.
3. Add the users' environments to the All Except list for the Global default DLP and create a user-specific DLP policy with the exception included.

Hopefully that helps you understand how you might apply DLP policies in your organization. These are just some of the many options you could configure with DLP policies.

-->

