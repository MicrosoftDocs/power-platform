---
title: "Apply data loss prevention policies to chatbots"
description: "Use and configure DLP policies with PowerShell cmdlets to help prevent accidental data exfiltration or data loss."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: admin, dlp
ms.service: power-virtual-agents
ms.collection: virtual-agent
---


# Configure data loss prevention for Microsoft Copilot Studio chatbots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Organizational data is the most important asset administrators are responsible for safeguarding. The ability to build automation to use that data is a large part of their company's success.

Users can rapidly build and roll out their high-value bots for their end-users. They can connect connect their bots with many data sources and services. Some of these sources and services might be external, third-party services, and might even include some social networks.

Users generally have good intentions, but they can easily overlook the potential for exposure. This sort of exposure can result from data leakage or connections to services and audiences that shouldn't have access to the data.

Administrators can govern chatbots in your organization using data loss prevention (DLP) policies with existing and Microsoft Copilot Studio connectors. DLP policies are created in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). To create a DLP policy, you need to be a [tenant admin](/power-platform/admin/use-service-admin-role-manage-tenant) or have the [Environment Admin role](/power-platform/admin/environments-overview#environment-permissions).

## Prerequisites

- Review concepts about [DLP policies](/power-platform/admin/wp-data-loss-prevention)

## Microsoft Copilot Studio connectors

Microsoft Copilot Studio connectors can be classified within a DLP policy under the following data groups, which are presented in the Power Platform admin center when reviewing DLP policies:

- Business
- Non-business
- Blocked

You can use the connectors in DLP policies to protect your organization's data from any malicious or unintentional data exfiltration by your chatbot makers.

> [!IMPORTANT]
> The connectors need to be in a single data group as data can't be shared among connectors that are in different groups.

The following Microsoft Copilot Studio connectors are available in the Power Platform admin center.

:::image type="content" source="media/admin-data-loss-prevention/image1.png" alt-text="Screenshot of a list of the connectors available for Microsoft Copilot Studio":::

| Connector name | Description |
|-------------------------|-------------------------|
| Skills with Microsoft Copilot Studio | Block bot makers from using skills in Microsoft Copilot Studio chatbots. </br>See [Example 1: Use DLP to block skills in Microsoft Copilot Studio chatbots](dlp-example-1.md) and [Example 2: Use DLP to block HTTP requests from Microsoft Copilot Studio chatbots](dlp-example-2.md) for more details. |
| Chat without Microsoft Entra ID authentication in Microsoft Copilot Studio | Block bot makers from publishing chatbots that aren't configured for authentication. </br>[Bot users will require authentication](configuration-end-user-authentication.md) to chat with the chatbot. </br>See [Example 3: Use DLP to require end-user authentication for Microsoft Copilot Studio chatbots](dlp-example-3.md) for more details. |
| Microsoft Teams channel in Microsoft Copilot Studio | Block bot makers from enabling or using the Teams channel. |
| Direct Line channels in Microsoft Copilot Studio | Block any Direct Line channel. </br>For example, the Demo website, Custom website, and Mobile app channels would be blocked. |
| Facebook channel in Microsoft Copilot Studio | Block bot makers from enabling or using the Facebook channel. |
| Omnichannel in Microsoft Copilot Studio | Block bot makers from enabling or using the Omnichannel channel. |

## Example DLP policy configurations

To help you get started with Microsoft Copilot Studio chatbot governance, we created the following examples that detail different scenarios:

- [Example: Use DLP to require end-user authentication for Microsoft Copilot Studio chatbots](dlp-example-3.md)
- [Example: Use DLP to block Power Platform Connectors](dlp-example-4.md)
- [Example: Use DLP to block HTTP requests from Microsoft Copilot Studio chatbots](dlp-example-2.md)
- [Example: Use DLP to block skills in Microsoft Copilot Studio chatbots](dlp-example-1.md)




## Use PowerShell to enable and administer DLP enforcement for chatbots in your organization

You can configure whether DLP policies should be applied to your chatbots with the [`PowerAppDlpErrorSettings`](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlperrorsettings) and `PowerVirtualAgentsDlpEnforcement` PowerShell cmdlets.

You can:

- Confirm if DLP is enabled for bots in your tenant
- Enable or disable DLP in an auditing mode (`-Mode SoftEnabled`) so bot makers can see errors, but aren't prevented from performing actions that would be blocked if DLP enforcement was fully enabled.
- Enable or disable DLP enforcement, which will show DLP enforcement errors, and prevent bot makers from publishing DLP-affected bots or configuring DLP-related settings.
- Exempt specific bots from DLP enforcement.
- Add and update the learn-more and contact email links that are shown to bot makers when they encounter DLP in the Microsoft Copilot Studio web and Teams apps.

> [!IMPORTANT]
> Before using the PowerShell cmdlets, or the example scripts shown here, ensure you [Install all necessary modules using PowerShell](/power-platform/admin/powerapps-powershell#installation).
>  
> You need to be a [tenant admin](/power-platform/admin/use-service-admin-role-manage-tenant) to use the cmdlets.

Typically, you would use these cmdlets in accordance with a DLP rollout process, which might consist of the following steps, in order:

1. Add or update the learn-more and admin contact email links that are shown in DLP errors for bot makers.

1. Determine which (if any) bots currently have DLP policy enforcement enabled.

1. Use auditing or "soft" mode so makers can see DLP errors in the Microsoft Copilot Studio web and Teams apps.

1. Mitigate risk by contacting makers and informing them about the best course of action for their app or flow.

1. Enable DLP enforcement for chatbots to prevent DLP-affected tasks and features.

You may also decide to exempt one or more bots from DLP policy enforcement, depending on the bot's use case and requirements.

### Add and update the learn-more and admin contact email links

You can configure an email and learn-more link using the `Set-PowerAppDlpErrorSettings` PowerShell cmdlet. Your bot makers will see this information when they experience DLP errors.

:::image type="content" source="media/admin-data-loss-prevention/image2.png" alt-text="Screenshot of the Microsoft Copilot Studio web app showing a DLP related error  with error text highlighted ":::

To add the email and learn-more link for the first time, run the following PowerShell script, replacing the values for the `<email>`, `<URL>`, and `<tenant ID>` parameters with your own.

```PowerShell
$ContactDetails = [pscustomobject] @{
    Enabled=$true
    Email="<email>"
}
$ErrorMessageDetails = [pscustomobject] @{
    Enabled=$true
    Url="<URL>"
}
$ErrorSettingsObj = [pscustomobject] @{
    ErrorMessageDetails=$ErrorMessageDetails
    ContactDetails=$ContactDetails
}
New-PowerAppDlpErrorSettings -TenantId "<tenant ID>" -ErrorSettings $ErrorSettingsObj
```

To update an existing configuration, use the same PowerShell script, and replace `New-PowerAppDlpErrorSettings` with `Set-PowerAppDlpErrorSettings`.

> [!CAUTION]
> These settings apply to all Power Platform apps within the specified tenant.

### Enable and configure DLP enforcement for chatbots

You can enable, disable, configure, and audit DLP enforcement within Microsoft Copilot Studio with the `PowerVirtualAgentsDlpEnforcement` cmdlet.

In any of the following examples, replace (or declare) `<tenant ID>` with your tenant's ID.

You can scope to bots created after a certain date by replacing `<date>` with a date in the format `MM-DD-YYYY`. To remove the scope, delete the `-OnlyForBotsCreatedAfter` parameter and its value.

#### Confirm DLP enforcement for chatbots

By default, DLP enforcement for chatbots is disabled in all tenants.

You can run the following PowerShell cmdlet to check if DLP for Microsoft Copilot Studio is enabled for a tenant.

```PowerShell
Get-PowerVirtualAgentsDlpEnforcement -TenantId <tenant ID>
```

> [!NOTE]
> If you haven't configured Microsoft Copilot Studio DLP, the results from the cmdlet will be empty.

#### Use auditing or "soft" mode to see DLP errors in the Microsoft Copilot Studio web or Teams apps

Run the following PowerShell script to enable DLP policies in auditing mode. Bot makers will see DLP-related errors when configuring bots in the Microsoft Copilot Studio web and Teams apps, but they won't be blocked from performing DLP-related actions. They can also publish bots as usual.

```PowerShell
Set-PowerVirtualAgentsDlpEnforcement -TenantId <tenant ID> -Mode SoftEnabled
```

To find chatbots that could be impacted by your organization's existing DLP policies, you can:

1. Use the [Center of Excellence (CoE) Starter Kit](/power-platform/guidance/coe/power-bi) to get a list of chatbots in your organization. Go to the Microsoft Copilot Studio Overview page on the CoE Dashboard to see the chatbots and environment names in your organization.

    :::image type="content" source="media/admin-data-loss-prevention/coe-dashboard.png" alt-text="Screenshot of the CoE Starter Kit dashboard opened to the Microsoft Copilot Studio overview.":::

1. Run a campaign with the bot makers in your organization to address DLP errors or updated DLP policies. You can download all DLP errors thrown by a chatbot by selecting **Download details** on the error notification banner in Microsoft Copilot Studio.

    :::image type="content" source="media/admin-data-loss-prevention/download-dlp-error-details.png" alt-text="Screenshot of the error notification banner showing the option to download details of the error.":::

#### Enable DLP enforcement for chatbots

> [!IMPORTANT]
> Before enabling DLP enforcement, ensure you know which bots will show errors to your chatbot users due to DLP policiy violations.
>  
> If you run into issues, you can exempt a bot from DLP policies or disable DLP enforcement while your makers fix the bot to comply with DLP policies.

You can run the following PowerShell command to enforce DLP policies in Microsoft Copilot Studio. Bot makers will be blocked or prevented from performing DLP-affected actions, and end users will see errors if they try to interact with the DLP-impacted features in a bot.

```PowerShell
Set-PowerVirtualAgentsDlpEnforcement -TenantId <tenant ID> -Mode Enabled -OnlyForBotsCreatedAfter <date>
```

#### Exempt a bot from DLP policies

If you've enabled DLP enforcement for your tenant but you need to exempt a bot from showing DLP errors to makers and end-users, you can run the following PowerShell script.

Make sure to replace `<environment ID>`, `<bot ID>`, `<tenant ID>`, and `<policy ID>` with the appropriate IDs for the bot you want to exempt.

>[!TIP]
> You can find the `<environment ID>` and `<bot ID>` from the chatbot's URL.
>  
> The `<policy ID>` is listed alongside the error details in the **Download details** file. You can download that file by selecting **Download details** on the error notification banner in Microsoft Copilot Studio.

```PowerShell
$environmentId = "<environment ID>" 
$botId = "<bot ID>"; 
$tenantId = "<tenant ID>" 
$policyName = "<policy ID>"

# Ensure the DLP commands are installed
if (-not (Get-Command "Get-PowerAppDlpPolicyExemptResources" -ErrorAction SilentlyContinue))
{
    Write-Host "Please ensure the Power Apps DLP commands are available: https://docs.microsoft.com/power-platform/admin/powerapps-powershell#environments-commands" -ForegroundColor Red
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
Set-PowerVirtualAgentsDlpEnforcement -TenantId <tenant ID> -Mode Disabled
```

[!INCLUDE[footer-include](includes/footer-banner.md)]
