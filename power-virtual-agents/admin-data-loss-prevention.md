---
title: "Apply data loss prevention policies to chatbots"
description: "Use and configure DLP policies with PowerShell cmdlets to help prevent accidental data exfiltration or data loss."
keywords: "PVA"
ms.date: 9/9/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: admin, dlp
ms.collection: virtual-agent
---


# Configure data loss prevention for Power Virtual Agents chatbots - Preview

Organizational data is the most important asset administrators are responsible for safeguarding. The ability to build automation to use that data is a large part of their company's success.

Users can rapidly build and roll out their high-value bots for their end-users and connect them with many data sources and services. Some of these might be external, third-party services and might even include some social networks.

Users generally have good intentions, but they can easily overlook the potential for exposure from data leakage to services and audiences that shouldn't have access to the data.

Administrators can govern chatbots in your organization using data loss prevention (DLP) policies with existing and Power Virtual Agents connectors. DLP policies are created in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). To create a DLP policy, you need to be a [tenant admin](/power-platform/admin/use-service-admin-role-manage-tenant) or have the [Environment Admin role](/power-platform/admin/environments-overview#environment-permissions).

## Prerequisites

-   Review concepts about [DLP policies](/power-platform/admin/wp-data-loss-prevention)

-   [Power Virtual Agents overview](fundamentals-what-is-power-virtual-agents.md)

## Power Virtual Agents connectors

Power Virtual Agents connectors can be classified within a DLP policy under the following data groups, which are presented in the Power Platform admin center when reviewing DLP policies:

-   Business

-   Non-business

-   Blocked

You can use the connectors in DLP policies to protect your organization's data from any malicious or unintentional data exfiltration by your chatbot makers.

> [!IMPORTANT]
> The connectors need to be in a single data group as data can't be shared among connectors that are in different groups.

The following Power Virtual Agents connectors are available in the Power Platform admin center.

![Screenshot of a list of the connectors available for Power Virtual Agents](media/admin-data-loss-prevention/image1.png)

| Connector name | Description |
|-------------------------|-------------------------|
| Skills with Power Virtual Agents | Block bot makers from using skills in Power Virtual Agents chatbots.</br>See [Example 1 – Use DLP to block skills in Power Virtual Agents chatbots](dlp-example-1.md) and [Example 2 – Use DLP to block HTTP requests from Power Virtual Agents chatbots](dlp-example-2.md) for more details. |
| Chat without Azure AD authentication in Power Virtual Agents | Block bot makers from configuring chatbots that aren't configured for authentication.</br>[Bot users will require authentication](configuration-end-user-authentication.md) to chat with the chatbot.</br>See [Example 3 – Use DLP to require end-user authentication for Power Virtual Agents chatbots](dlp-example-3.md) for more details. |
| Microsoft Teams channel in Power Virtual Agents | Block bot makers from enabling or using the Teams channel. |
| Direct Line channels in Power Virtual Agents | Block any Direct Line channel.</br>For example, the Demo website, Custom website, and Mobile app channels would be blocked. |
| Facebook channel in Power Virtual Agents | Block bot makers from enabling or using the Facebook channel. |
| Omnichannel in Power Virtual Agents | Block bot makers from enabling or using the Omnichannel channel. |


## Example DLP policy configurations

To help you get started with Power Virtual Agents chatbot governance, we created the following examples that detail different scenarios:

-   [Example 1 – Use DLP to block skills in Power Virtual Agents chatbots](dlp-example-1.md)
-   [Example 2 – Use DLP to block HTTP requests from Power Virtual Agents chatbots](dlp-example-2.md)
-   [Example 3 – Use DLP to require end-user authentication for Power Virtual Agents chatbots](dlp-example-3.md)

## Use PowerShell to enable and administer DLP enforcement for chatbots in your organization 

You can configure whether DLP policies should be applied to your chatbots with the [`PowerAppDlpErrorSettings`](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlperrorsettings) and `PowerVirtualAgentsDlpEnforcement` PowerShell cmdlets.

You can:

-   Confirm if DLP is enabled for bots in your tenant

-   Enable or disable DLP in an auditing mode (`-Mode SoftEnabled`) so bot makers can see errors, but are not prevented from performing actions that would be blocked if DLP enforcement was fully enabled.

-   Enable or disable DLP enforcement, which will show DLP enforcement errors, and prevent bot makers from publishing DLP-affected bots or configuring DLP-related settings.

-   Exempt specific bots from DLP enforcement.

-   Add and update the learn-more and contact email links that are shown to bot makers when they encounter DLP in the Power Virtual Agents web and Teams apps.

> [!IMPORTANT]
> Before using the PowerShell cmdlets, or the example scripts shown here, ensure you [Install all necessary modules using PowerShell](/power-platform/admin/powerapps-powershell#installation).

Typically, you would use these cmdlets in accordance with a DLP rollout process, which might consist of the following steps, in order:

1.  Add or update the learn-more and admin contact email links that are shown in DLP errors for bot makers.

1.  Determine which (if any) bots currently have DLP policy enforcement enabled.

1.  Use auditing or "soft" mode so makers can see DLP errors in the Power Virtual Agents web and Teams apps.

1.  Mitigate risk by contacting makers and informing them about the best course of action for their app or flow.

1.  Enable DLP enforcement for chatbots to prevent DLP-affected tasks and features.

You may also decide to exempt one or more bots from DLP policy enforcement, depending on the bot's use case and requirements.

### Add and update the learn-more and admin contact email links 

You can configure an email and learn-more link using the `Set-PowerAppDlpErrorSettings` PowerShell cmdlet. Your bot makers will see this information when they experience DLP errors.

![Screenshot of the Power Virtual Agents web app showing a DLP related error  with error text highlighted ](media/admin-data-loss-prevention/image2.png)

To add the email and learn-more link for the first time, run the following PowerShell script, replacing the values for the `Email`, `Url`, and `TenantId` parameters with your own.

```PowerShell
$ContactDetails = [pscustomobject] @{
    Enabled=$true
    Email="admin@contoso.org"
}
$ErrorMessageDetails = [pscustomobject] @{
    Enabled=$true
    Url="https://contoso.org/fix-chat-bot-dlp-issues"
}
$ErrorSettingsObj = [pscustomobject] @{
    ErrorMessageDetails=$ErrorMessageDetails
    ContactDetails=$ContactDetails
}
New-PowerAppDlpErrorSettings -TenantId "9f6be000-XXXX-XXXX-9000-44a0d0000ert" P-ErrorSettings $ErrorSettingsObj
```


To update an existing configuration, run the following PowerShell script, replacing the values for the `Email`, `Url`, and `TenantId` parameters with the new ones.

```PowerShell
$ContactDetails = [pscustomobject] @{
    Enabled=$true
    Email="newadmin@contoso.org"
}
$ErrorMessageDetails = [pscustomobject] @{
    Enabled=$true
    Url="https://contoso.org/fix-chat-bot-dlp-issues-v2"
}
$ErrorSettingsObj = [pscustomobject] @{
    ErrorMessageDetails=$ErrorMessageDetails
    ContactDetails=$ContactDetails
}
Set-PowerAppDlpErrorSettings -TenantId "9f6be790-XXXX-XXXX-9850-44a0d2649aef" -ErrorSettings $ErrorSettingsObj
```


### Enable and configure DLP enforcement for chatbots

You can enable, disable, configure, and audit DLP enforcement within Power Virtual Agents with the the `PowerVirtualAgentsDlpEnforcement` cmdlet.

In any of the following examples, replace (or declare) `{tenant id}` with your tenant's ID.

You can scope to bots created after a certain date by replacing `{date}` with a date in the format `MM-DD-YYYY`. To remove the scope, delete the `-OnlfyForBotsCreatedAfter` parameter and its value.

#### Confirm DLP enforcement for chatbots

By default, DLP enforcement for chatbots is disabled in all tenants.

You can run the following PowerShell script to see which bots have enforced DLP policies.

```PowerShell
Get-PowerVirtualAgentsDlpEnforcement -TenantId {tenant id} -Mode Enabled -OnlyForBotsCreatedAfter {date}
```

#### Use auditing or "soft" mode to see DLP errors in the Power Virtual Agents web or Teams apps

Run the following PowerShell script to enable DLP policies in auditing mode. Bot makers will see DLP-related errors when configuring bots in the Power Virtual Agents web and Teams apps, but will not be blocked from performing DLP-related actions, and can publish bots as usual.

```PowerShell
Set-PowerVirtualAgentsDlpEnforcement -TenantId {tenant id} -Mode SoftEnabled -OnlyForBotsCreatedAfter {date}
```

#### Enable DLP enforcement for chatbots 

You can run the following PowerShell command to enforce DLP policies in Power Virtual Agents. Bot makers will be blocked or prevented from performing DLP-affected actions, and end users will see errors if they try to interact with the DLP-impacted features in a bot.

```PowerShell 
Set-PowerVirtualAgentsDlpEnforcement -TenantId {tenant id} -Mode Enabled -OnlyForBotsCreatedAfter {date}
```

#### Exempt a bot from DLP policies

If you've enabled DLP enforcement for your tenant but you need to exempt a bot from showing DLP errors to makers and end-users, you can run the following PowerShell script.

Make sure to replace `{environment id}`, `{bot id}`, `{tenant id}`, and `{policy id}` with the appropriate IDs for the bot you want to exempt.

```PowerShell
$environmentId = "{environment id}" 
$botId = "{bot id}"; 
$tenantId = "{tenant id}" 
$policyName = "{policy id}"

# Ensure the DLP commands are installed
if (-not (Get-Command "Get-PowerAppDlpPolicyExemptResources" -ErrorAction SilentlyContinue))
{
    Write-Host "Please ensure the Power Apps DLP commands are available: https://docs.microsoft.com/en-us/power-platform/admin/powerapps-powershell#environments-commands" -ForegroundColor Red
    return;
}
# Set up the PVA resource information
$pvaResourceId = "$environmentId+$botId"
$pvaResourceType = "Bot"
$exemptBot = [pscustomobject]@{
                id = $pvaResourceId
                type = $pvaResourceType
              }
Write-Host "Getting exempt resources"
$resources = Get-PowerAppDlpPolicyExemptResources -TenantId $tenantId -PolicyName $policyName
if (-not $resources)
{
    $resources = [pscustomobject]@{  exemptResources = @($exemptBot) }
    Write-Host "No exempt resources configured yet"
}
$resources = New-PowerAppDlpPolicyExemptResources -TenantId $tenantId -PolicyName $policyName -NewDlpPolicyExemptResources $resources
Write-Host "Added bot to exempt resources"
```

#### Disable DLP enforcement for chatbots 

The following command will disable DLP enforcement in chatbots.

```PowerShell  
Set-PowerVirtualAgentsDlpEnforcement -TenantId {id} -Mode Disabled
```

[!INCLUDE[footer-include](includes/footer-banner.md)]