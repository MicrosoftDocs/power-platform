---
title: "Secure the default Power Platform environment"
description: "Guidance for securing the Power Platform default environment."
author: Mattp123
manager: tapanm
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/04/2022
ms.author: matp 
ms.service: powerapps
---
# Secure the default environment

This document covers the areas to focus on as you think through the security of your default environment.

## Managing Administrators

In large organizations, you might want to assign the Environment Admin/System Admin role to a few users instead of assigning the Power Platform Administrator role.

Additional information:

[Environment Overview](/power-platform/admin/environments-overview)

[Environment Administration](https://docs.microsoft.com/power-platform/admin/environments-administration)

## Communicating Intent

One of the key challenges of the CoE team is communicating how they want the employees to use the Default Environment. This section highlights a few ways in which you can communicate with makers across the organization

### Renaming Default Environment

One of the first things a Power Platform CoE can do is to rename their Default Environment. The default environment is created with the following name: TenantName (default). A Power Platform admin can change the name of the default environment to something more descriptive like "Personal Productivity Environment" clearly calling out the intent. 

Additional information: 
[Edit properties of an environment - Power Platform | Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/admin/edit-properties-environment)

### Power Platform Hub

In addition to renaming the Default Environment, the Power Platform CoE team should setup a central Wiki which contains information about the organization's Power Platform service. This can include but not limited to:

-   Personal Productivity Use cases

-   How to build apps/flows?

-   Where to build apps and flow?

-   How to reach out to the CoE support team?

-   Rules around integrating with external services

The [Microsoft Power Platform Hub](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/wiki-community#get-started-with-the-power-platform-hub-template) is a SharePoint communication site designed to provide you with a starting point of content and page templates as you're setting up your internal Power Platform communication site.


### Customizing Power Platform Messages

When a maker creates an app which violates the DLP Policy, you can customize the displayed error message to display the URL to your organization's specific Power Platform Wiki. You can also add your Power Platform team's contact email address. This redirects makers or users to your Power Platform Wiki. This is very critical for default environment since all the employees in an organization have access to it. As the CoE team refines the DLP policy over time, you might inadvertently break some existing apps. Ensuring that the DLP policy violation messages contain contact details or URL will provide a way forward for the makers.

The following Power Shell scripts allow you to customize these messages:

  <table style="width:100%">
    <th>Command</th>
    <th>Description</th>

  <tr>
  <td>New-PowerAppDlpErrorSettings</td>
  <td>Set Governance Message</td>
  </tr>
  <tr>
  <td>Set-PowerAppDlpErrorSettings</td>
  <td>Update Governance Message</td>
  </tr>
  </table>
  
Additional Information: 
[Power Platform Governance Error Message Commands](https://learn.microsoft.com/en-us/power-platform/admin/powerapps-powershell#governance-error-message-content-commands)

## Sharing

Environment makers can distribute the apps they build in an environment to other users in your organization by sharing the app with individual users or security groups. In addition the platform allows a maker to share an application with  ["Everyone" in the organization](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/share-app).

If your organization would like to use a gated process around widely used applications to enforce mandates such as:
 - Security Review Policy
 - Business Review Policy
 - ALM Requirements
 - User Experience / Branding

you should consider disabling the Share with Everyone feature in Power Platform. Once restricted, only a small group of administrators are allowed to share an application with “Everyone” in the organization.

To prevent sharing apps with everyone in the organization:

1.  Use [Get-TenantSettings](https://learn.microsoft.com/en-us/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings?view=pa-ps-latest) to retrieve the list of tenant settings for your organization. This cmdlet will return an object with tenant settings.

![Output from the Get-TenantSettings powershell cmdlet displaying the different attributes](./media/securedefaultenvimage1.png)

Within the powerPlatform.PowerApps object you can find three flags:

![Displays the attributes of the the $settings.powerPlatform.PowerApps](./media/securedefaultenvimage2.png)

2.  Use the following command to get the settings object and set the variable to share with everyone to false.

```powershell
$settings=Get-TenantSettings 
$settings.powerPlatform.powerApps.disableShareWithEveryone=$true 
```

3.  Use the Set-TenantSettings with the settings object to prevent makers from sharing their apps with everyone in the organization.

```powershell
  Set-TenantSettings \$settings
```
Once these commands are run, only admins will have the privilege of sharing an app with Everyone in the organization. Makers will be limited to sharing the app with a Security Group or individuals.

## DLP Policy for Default Environment

This section covers the recommended configuration when setting up a default environment DLP policy.

Related resources: [Create a data loss prevention (DLP) policy](https://docs.microsoft.com/power-platform/admin/create-dlp-policy)

### Block new connectors in default environment

New connectors which are added to the platform are added to the Non-business group by default. You can configure it such that new connectors land in either the Business or Blocked data group. For the default environment DLP, it is recommended that the default data group (usually, Non-Business) is set to Blocked. This ensures that if any new connector is introduced, it will remain unusable until a Tenant Admin manually unblocks that connector.

### Prebuilt Connectors

To restrict the access of the employees to only the basic non-blockable connectors and prevent access to the rest of the connectors, classify the Prebuilt connectors as follows:

1.  Move all the connectors which cannot be blocked to the Business data group.

2.  Move all the block-able connectors to the Blocked data group.

### Custom Connectors

Custom connectors allow you to create a connector for their own home grown services. These services are generally intended for technical consumers like developers. It is  prefered to reduce the footprint of APIs (built by the organization) that can be called/invoked from apps or flows in the default environment. To ensure that makers cannot create and use custom connectors for APIs, create a rule to block all URL patterns. If there are APOs that you would like your default environment users to have access to (for example: a service that returns a published list of holidays for the organization), you can configure multiple rules classifying different URL patterns into the Business and Non-Business data groups. Ensure that connections always use the HTTPS protocol. You can read more about configuring DLP policy for custom connectors here: [DLP policy for Custom Connectors](https://learn.microsoft.com/en-us/power-platform/admin/dlp-custom-connector-parity)

## Securing Integration with Exchange

Power Automate allows you to build automation at scale via low code. This allows any employee in an organization to build large-scale, secure, and scalable workflows. Connectors allow you to create workflows that connect to different systems.

[Office 365 Outlook connector](https://docs.microsoft.com/en-us/connectors/office365/) is one of the standard connectors that cannot be blocked. This connector allows an employee to send, delete, and reply to email messages in the mailboxes they have access to. The risk with this connector is also one of its most powerful capabilities: the ability to send an email. A citizen developer might inadvertently end up creating a flow that sends out an email blast. This section addresses how to mitigate this risk.

The Microsoft Exchange Administrator in your organization can set up rules in the Exchange Server to prevent emails from being sent from apps. It's also possible to exclude specific flows or apps from the rules set up to block outgoing emails. You can combine this rule with an "Allowed List" of email addresses to ensure that outbound mails from Power Apps/Flow can only be sent from a small group of mailboxes.

Whenever an app or flow sends an email (via the Office 365 Outlook connector), it will insert specific SMTP headers in the email. These headers contain reserved phrases that can be used to identify if the email originated from a flow or an app.

The SMTP header inserted into an email sent from a flow looks like the example below:

```
 x-ms-mail-application: Microsoft Power Automate; 
 User-Agent: azure-logic-apps/1.0 (workflow 2321aaccfeaf4d7a8fb792e29c056b03;version 08585414259577874539) microsoft-flow/1.0
 x-ms-mail-operation-type: Send
 x-ms-mail-environment-id: 0c5781e0-65ec-ecd7-b964-fd94b2c8e71b 
```
Header Details:
<!--TODO: Edit from here-->
1.  \"x-ms-mail-application\" header can have the following values depending on the service used:

<table>
<th>Service</th>
<th>Value</th>
<tr>
  <td>Power Automate</td>
  <td>Microsoft Power Automate; User-Agent: azure-logic-apps/1.0 (workflow &lt;GUID&gt;; version &lt;version number&gt;) microsoft-flow/1.0</td>
</tr>
<tr>
  <td>Power Apps</td>
  <td>Microsoft Power Apps; User-Agent: PowerApps/ (; AppName= &lt;app name&gt;)</td>
</tr>
<tr>
  <td>Power Automate</td>
  <td>Microsoft Power Automate; User-Agent: azure-logic-apps/1.0 (workflow &lt;GUID&gt;; version &lt;version number&gt;) microsoft-flow/1.0</td>
</tr>
</table>

2.  \"x-ms-mail-operation-type\" header can the following values depending on the action being performed:

  <table>
<th>Value</th>
<th>Description</th>
<tr>
  <td>Reply</td>
  <td>For reply email operations</td>
</tr>
<tr>
  <td>Forward</td>
  <td>For forward email operations</td>
</tr>
<tr>
  <td>Send</td>
  <td>For send email operations (including SendEmailWithOptions and SendApprovalEmail)</td>
</tr>
</table>

3.  \"x-ms-mail-environment-id\" will contain the Environment Id value. The presence of this header depends on the product you are using:

    -   In Power Apps, it will always be present.

    -   In Power Automate, it will be present only in connections created after July 2020.

    -   In Logic Apps, it will never be present.

### Potential Exchange Rules for the Default Environment

Some email actions you might want to block:

1.  Block outbound emails to external recipients

**Rule:** Block all outbound emails sent to external recipients from Power Automate and Power Apps. This rule will ensure that citizen developers do not send out emails to external recipients (such as partners, vendors or clients) from apps or flows.

2.  Block outbound forwarding

**Rule**: Block all outbound emails forwarded to external recipients from Power Automate and Power Apps where the sender is not from a "Allowed list" of mailboxes

This rule will ensure that users cannot create a flow which will automatically forward inbound emails to an external recipient.

Some potential exceptions for the above rules to add flexibility:

1.  Exempt specific apps and flows

Add an exemption list to the rules above so that approved apps or flows can send emails to external recipients.

2.  Organization-Level Allow List

In this scenario it would make sense to move the solution into a dedicated environment. If several flows in the environment have to send outbound emails, you can create a blanket exception rule to allow outbound emails from that environment. Of course it goes without saying that the maker and admin permission on that environment has to be tightly controlled and limited.

## Cross Tenant Isolation

Microsoft Power Platform has a system of connectors based on Azure Active Directory (Azure AD) that enable authorized Azure AD users to connect apps and flows to data stores. Tenant isolation allows admins to effectively govern the movement of data from Azure AD authorized data sources to and from their tenant.

Tenant Isolation is applied at the tenant level and impacts all environments in the tenant, including the default environment. Since all employees are makers in the default environment, configuring a robust tenant isolation policy is critical to securing the default environment.

As a recommended practice explicitly configure the tenants that your employees can connect to. All the other tenants should be covered by default rules which block both inbound and outbound flow of data.

**Note** that Power Platform tenant isolation is different from Azure AD-wide tenant restriction because it doesn\'t impact Azure AD-based access outside of Power Platform.

**Note** that Power Platform tenant isolation works only for connectors using Azure AD-based authentication, such as the Office 365 Outlook and SharePoint connectors.

Learn more

[Restrict cross-tenant inbound and outbound access (preview) - Power Platform \| Microsoft Docs](https://docs.microsoft.com/power-platform/admin/cross-tenant-restrictions)

[Get-PowerAppTenantIsolationPolicy (Microsoft.PowerApps.Administration.PowerShell) \| Microsoft Docs](https://docs.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/get-powerapptenantisolationpolicy?view=pa-ps-latest)