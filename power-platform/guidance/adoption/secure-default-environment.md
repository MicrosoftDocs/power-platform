---
title: Secure the default environment
description: Learn how to secure the default environment in Microsoft Power Platform.
author: rranjit83
ms.author: rranjit
ms.reviewer: matp
ms.topic: how-to
ms.date: 04/11/2023
ms.custom: bap-template
ms.subservice: guidance
---

# Secure the default environment

Every employee in your organization has access to the default Power Platform environment. As a Power Platform admin, you need to consider ways to secure that environment while keeping it accessible for makers' personal productivity uses. This article provides suggestions.

## Assign administrator roles judiciously

Consider whether your admin users need to have the Power Platform administrator role. Would the environment admin or system administrator role be more appropriate? In any case, limit the more powerful Power Platform admin role to just a few users. [Learn more about administering Power Platform environments](/power-platform/admin/environments-administration).

## Communicate intent

One of the key challenges for the Power Platform Center of Excellence (CoE) team is to communicate the intended uses of the default environment. Here are some recommendations.

### Rename the default environment

The default environment is created with the name ***TenantName* (default)**. You can [change the environment name](/power-platform/admin/edit-properties-environment) to something more descriptive, like *Personal Productivity Environment*, to clearly call out the intent.

### Use the Power Platform hub

The [Microsoft Power Platform hub](/power-platform/guidance/adoption/wiki-community#get-started-with-the-power-platform-hub-template) is a SharePoint communication site template. It provides a starting point for a central source of information for makers about your organization's use of Power Platform. Starter content and page templates make it easy to offer makers information like:

- Personal productivity use cases
- How to build apps and flows
- Where to build apps and flows
- How to reach out to the CoE support team
- Rules around integrating with external services

Add links to any other internal resources your makers might find helpful.

## Limit sharing with everyone

Makers can [share their apps](/power-apps/maker/canvas-apps/share-app) with other individual users, security groups, and, by default, everyone in the organization. You should consider using a gated process around widely used apps to enforce policies and requirements like these:

- Security review policy
- Business review policy
- Application Lifecycle Management (ALM) requirements
- User experience and branding requirements

Consider also disabling the **Share with Everyone** feature in Power Platform. With that restriction in place, only a small group of administrators may share an application with everyone in the environment. Here's how.

1. Run the [Get-TenantSettings cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings?view=pa-ps-latest&preserve-view=true) to get the list of your organization's tenant settings as an object.

   The `powerPlatform.PowerApps` object includes three flags:

   :::image type="content" source="media/securedefaultenvimage2.png" alt-text="Screenshot of three flags in the $settings.powerPlatform.PowerApps object.":::

1. Run the following PowerShell commands to get the settings object and set the variable to share with everyone to false.

   ```powershell
   $settings=Get-TenantSettings 
   $settings.powerPlatform.powerApps.disableShareWithEveryone=$true 
   ```

1. Run the `Set-TenantSettings` cmdlet with the settings object to prevent makers from sharing their apps with everyone in the tenant.

   ```powershell
     Set-TenantSettings $settings
   ```

## Establish a data loss prevention policy

Another way to secure the default environment is to [create a data loss prevention (DLP) policy](/power-platform/admin/create-dlp-policy) for it. Having a DLP policy in place is especially critical for the default environment because all employees in your organization have access to it. Here are some recommendations to help you enforce the policy.

### Customize the DLP governance message

Customize the error message that's displayed if a maker creates an app that violates your organization's DLP policy. Direct the maker to your organization's Power Platform Hub and provide your CoE team's email address.

As the CoE team refines the DLP policy over time, you might inadvertently break some apps. Make sure the DLP policy violation message contains contact details or a link to more information to provide a way forward for makers.

Use the following PowerShell cmdlets to customize the [governance policy message](/power-platform/admin/powerapps-powershell#governance-error-message-content-commands):

| Command | Description |
|---------|---------|
| Set-PowerAppDlpErrorSettings | Set governance message |
| Set-PowerAppDlpErrorSettings | Update governance message |

### Block new connectors in the default environment

By default, all new connectors are placed in the Non-business group of your DLP policy. You can always [change the default group to either Business or Blocked](/power-platform/admin/prevent-data-loss#change-the-default-data-group). For a DLP policy that is applied to the default environment, we recommend that you configure the Blocked group as the default to make sure that new connectors remain unusable until they have been reviewed by one of your administrators.

### Limit makers to prebuilt connectors

Restrict makers to only basic, nonblockable connectors to prevent access to the rest.

1. Move all the connectors that can't be blocked to the business data group.

1. Move all the blockable connectors to the blocked data group.

### Limit custom connectors

Custom connectors integrate an app or flow with a home-grown service. These services are intended for technical users like developers. It's a good idea to reduce the footprint of APIs built by your organization that can be invoked from apps or flows in the default environment. To prevent makers from creating and using custom connectors for APIs in the default environment, create a rule to block all URL patterns.

To allow makers to access some APIs (for example, a service that returns a list of company holidays), configure multiple rules that classify different URL patterns into the business and nonbusiness data groups. Make sure that connections always use the HTTPS protocol. [Learn more about DLP policy for custom connectors](/power-platform/admin/dlp-custom-connector-parity).

## Secure integration with Exchange

The [Office 365 Outlook connector](/connectors/office365/) is one of the standard connectors that [can't be blocked](#block-new-connectors-in-the-default-environment). It allows makers to send, delete, and reply to email messages in the mailboxes they have access to. The risk with this connector is also one of its most powerful capabilities&mdash;the ability to send an email. For instance, a maker might create a flow that sends an email blast.

Your organization's Exchange administrator can set up rules on the Exchange server to prevent emails from being sent from apps. It's also possible to exclude specific flows or apps from the rules set up to block outgoing emails. You can combine these rules with an allowed list of email addresses to make sure that email from apps and flows can only be sent from a small group of mailboxes.

When an app or flow sends an email using the Office 365 Outlook connector, it inserts specific SMTP headers in the message. You can use reserved phrases in the headers to identify whether an email originated from a flow or app.

The SMTP header inserted in an email sent from a flow looks like the following example:

```
 x-ms-mail-application: Microsoft Power Automate; 
 User-Agent: azure-logic-apps/1.0 (workflow 2321aaccfeaf4d7a8fb792e29c056b03;version 08585414259577874539) microsoft-flow/1.0
 x-ms-mail-operation-type: Send
 x-ms-mail-environment-id: 0c5781e0-65ec-ecd7-b964-fd94b2c8e71b 
```

Header details

The following table describes the values that can appear in the x-ms-mail-application header depending on the service used:

| Service | Value |
|---------|---------|
| Power Automate | Microsoft Power Automate; User-Agent: azure-logic-apps/1.0 (workflow &lt;GUID&gt;; version &lt;version number&gt;) microsoft-flow/1.0 |
| Power Apps | Microsoft Power Apps; User-Agent: PowerApps/ (; AppName= &lt;app name&gt;) |

The following table describes the values that can appear in the x-ms-mail-operation-type header depending on the action being performed:

| Value | Description |
|---------|---------|
| Reply | For reply email operations |
| Forward | For forward email operations |
| Send | For send email operations including, SendEmailWithOptions and SendApprovalEmail |

The x-ms-mail-environment-id header contains the environment ID value. The presence of this header depends on the product you're using:

- In Power Apps, it's always present.
- In Power Automate, it's present only in connections created after July 2020.
- In Logic Apps, it's never present.

### Potential Exchange rules for the default environment

Here are some email actions you might want to block using Exchange rules.

- Block outbound emails to external recipients: Block all outbound emails sent to external recipients from Power Automate and Power Apps. This rule prevents makers from sending emails to partners, vendors, or clients from their apps or flows.

- Block outbound forwarding: Block all outbound emails forwarded to external recipients from Power Automate and Power Apps where the sender isn't from an allowed list of mailboxes. This rule prevents makers from creating a flow that automatically forwards inbound emails to an external recipient.

### Exceptions to consider with email block rules

Here are some potential exceptions to the Exchange rules to block email to add flexibility:

- Exempt specific apps and flows: Add an exemption list to the rules suggested earlier so that approved apps or flows can send email to external recipients.

- Organization-level allowlist: In this scenario, it makes sense to move the solution into a dedicated environment. If several flows in the environment have to send outbound emails, you can create a blanket exception rule to allow outbound emails from that environment. The maker and admin permission on that environment must be tightly controlled and limited.

## Apply cross-tenant isolation

Power Platform has a system of connectors based on Microsoft Entra that enable authorized Microsoft Entra users to connect apps and flows to data stores. Tenant isolation governs the movement of data from Microsoft Entra authorized data sources to and from their tenant.

Tenant isolation is applied at the tenant level and affects all environments in the tenant, including the default environment. Since all employees are makers in the default environment, configuring a robust tenant isolation policy is critical to securing the environment. We recommended that you explicitly configure the tenants that your employees can connect to. All the other tenants should be covered by default rules that block both inbound and outbound flow of data.

Power Platform tenant isolation is different from Microsoft Entra ID-wide tenant restriction. It doesn't affect Microsoft Entra ID-based access outside of Power Platform. It works only for connectors using Microsoft Entra ID-based authentication, such as the Office 365 Outlook and SharePoint connectors.

### See also

[Restrict cross-tenant inbound and outbound access (preview)](/power-platform/admin/cross-tenant-restrictions)

[Get-PowerAppTenantIsolationPolicy (Microsoft.PowerApps.Administration.PowerShell)](/powershell/module/microsoft.powerapps.administration.powershell/get-powerapptenantisolationpolicy?view=pa-ps-latest&preserve-view=true)