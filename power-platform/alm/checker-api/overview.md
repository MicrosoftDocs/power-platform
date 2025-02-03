---
title: "Use the Power Apps checker web API | Microsoft Docs"
description: "The Power Apps checker Web API provides a development experience that can be used across a wide variety of programming languages, platforms, and devices"
ms.custom: ""
ms.date: 05/01/2024

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 0d5f7579-304a-4d28-ba73-df30722205eb
caps.latest.revision: 1
author: "mhuguet" # GitHub ID
ms.subservice: alm
ms.author: "michu"
ms.reviewer: "pehecke"
search.audienceType: 
  - developer
---
# Use the Power Apps checker web API

The Power Apps checker web API provides a mechanism to run static analysis checks against customizations and extensions to the Microsoft Dataverse platform. It's available for makers and developers to perform rich static analysis checks on their solutions against a set of best practice rules to quickly identify problematic patterns. The service provides the logic for the [solution checker feature](/powerapps/maker/common-data-service/use-powerapps-checker) in the Power Apps maker [portal](https://make.powerapps.com) and is included as part of the automation for [applications submitted to AppSource](/powerapps/developer/common-data-service/publish-app-appsource). Interacting with the service directly in this manner allows for analysis of solutions that are included as part of on-premises (all supported versions) and online environments.

For information about using the checker service from PowerShell code, refer to [Work with solutions using PowerShell](../powershell-api.md).

> [!NOTE]
> - Use of Power Apps checker does not guarantee that a solution import will be successful. The static analysis checks performed against the solution do not know the configured state of the destination environment and import success may be dependent on other solutions or configurations in the environment. 

<a name="bkmk_altApproaches"></a>

## Alternative approaches

Before reading through the details of how to interact at the lowest level with the web APIs, consider using our PowerShell module, Microsoft.PowerApps.Checker.PowerShell, instead. It's a fully supported tool that is available in the [PowerShell Gallery](https://www.powershellgallery.com). The current restriction is that it does require Windows PowerShell. If unable to meet this requirement, then interacting with the APIs directly is the best approach.

<a name="bkmk_getStarted"></a>

## Getting started

It's important to note that a solution analysis can result in a long running process. It can typically take sixty (60) seconds to upwards of five (5) minutes depending on a various factors, such as number, size, and complexity of customizations and code. The analysis flow is multi-step and asynchronous beginning with initiating an analysis job with the status API being used to query for job completion. An example flow for an analysis is as follows: 

1. Obtain an OAuth token
2. Call upload (for each file in parallel)
3. Call analyze (initiates the analysis job)
4. Call status until finished (looping with a pause in between calls until the end is signaled or thresholds are met)
5. Download the result(s) from the provided SAS URI

A few variations are:

- Include a lookup of the ruleset or rules as a pre-step. However, it would be slightly faster to pass in a configured or hard coded ruleset ID. It is recommended that you use a ruleset that meets your needs.
- You can opt to not use the upload mechanism (see the upload for limitations).

You need to determine the following requirements:

- [Which geography?](#determine-a-geography)
- [Which version?](#versioning)
- [Which rulesets and rules?](#rulesets-and-rules)
- [What is your tenant ID?](#find-your-tenant-id)

Refer to the following articles for documentation on the individual APIs:

[Retrieve the list of rulesets](retrieve-rulesets.md)<br />
[Retrieve the list of rules](retrieve-rules.md)<br />
[Upload a file](upload-file.md)<br />
[Invoke analysis](analyze.md)<br />
[Check for analysis status](check-status.md)<br />

<a name="bkmk_geo"></a>

## Determine a geography

When you interact with the Power Apps checker service, files are temporarily stored in Azure along with the reports that are generated. By using a geography specific API, you can control where the data is stored. Requests to a geography endpoint are routed to a regional instance based on best performance (latency to the requestor). Once a request enters a regional service instance, all processing and persisted data remains within that particular region. Certain API responses return regional instance URLs for subsequent requests once an analysis job is routed to a specific region. Each geography may have a different version of the service deployed at any given point in time. Use of different service versions is due to the multi-stage safe deployment process, which ensures full version compatibility. Thus, the same geography should be used for each API call in the analysis lifecycle and may reduce overall execution time as the data may not have to travel as far over the wire. The following are the available geographies:

|Azure datacenter|Name|Geography|Base URI|
|---|---|---|---|
|Public|Preview|United States|unitedstatesfirstrelease.api.advisor.powerapps.com|
|Public|Production|United States|unitedstates.api.advisor.powerapps.com|
|Public|Production|Europe|europe.api.advisor.powerapps.com|
|Public|Production|Asia|asia.api.advisor.powerapps.com|
|Public|Production|Australia|australia.api.advisor.powerapps.com|
|Public|Production|Japan|japan.api.advisor.powerapps.com|
|Public|Production|India|india.api.advisor.powerapps.com|
|Public|Production|Canada|canada.api.advisor.powerapps.com|
|Public|Production|South America|southamerica.api.advisor.powerapps.com|
|Public|Production|United Kingdom|unitedkingdom.api.advisor.powerapps.com|
|Public|Production|France|france.api.advisor.powerapps.com|
|Public|Production|Germany|germany.api.advisor.powerapps.com|
|Public|Production|United Arab Emirates|unitedarabemirates.api.advisor.powerapps.com|
|Public|Production|Switzerland|switzerland.api.advisor.powerapps.com|
|Public|Production|South Africa|southafrica.api.advisor.powerapps.com|
|Public|Production|Korea|korea.api.advisor.powerapps.com|
|Public|Production|Norway|norway.api.advisor.powerapps.com|
|Public|Production|Singapore|singapore.api.advisor.powerapps.com|
|Public|Production|Sweden|sweden.api.advisor.powerapps.com|
|Public|Production|US Government|gov.api.advisor.powerapps.us|
|Public|Production|US Government L4|high.api.advisor.powerapps.us|
|Public|Production|US Government L5 (DOD)|mil.api.advisor.appsplatform.us|
|Public|Production|China operated by 21Vianet|china.api.advisor.powerapps.cn|

> [!NOTE]
> You may choose to use the preview geography to incorporate the latest features and changes earlier. However, note that the preview uses United States Azure regions only.

<a name="bkmk_versioning"></a>

## Versioning

While not required, it's recommended to include the api-version query string parameter with the desired API version. The current API version is 2.0 for rulesets and rules and 1.0 for all other requests. For example, the following ruleset is an HTTP request specifying to use the 2.0 API version:

`https://unitedstatesfirstrelease.api.advisor.powerapps.com/api/ruleset?api-version=2.0`

If not provided, the latest API version is used by default. Using an explicit version number is recommended as the version is incremented if breaking changes are introduced. If the version number is specified in a request, backward compatibility support in later (numerically greater) versions will be maintained.

<a name="bkmk_rules"></a>

## Rulesets and rules

Power Apps checker requires a list of rules when run. These rules can be provided in the form of individual rules or a grouping of rules, referred to as a *ruleset*. A ruleset is a convenient way to specify a group of rules instead of having to specify each rule individually. For example, the solution checker feature uses a ruleset named *Solution Checker*. As new rules are added or removed, the service includes these changes automatically without requiring any change by the consuming application. If you require that the list of rules not change automatically as described above, then the rules can be specified individually.
Rulesets can have one or more rules with no limit. A rule can be in no or multiple rulesets. You can get a list of all rulesets by calling the API as follows: `[Geographical URL]/api/ruleset`. This endpoint now requires authentication.

### Solution checker ruleset

The solution checker ruleset contains a set of impactful rules that have limited chances for false positives. If running analysis against an existing solution, it's recommended that you start with this ruleset. This ruleset is used by the [solution checker feature](/powerapps/maker/common-data-service/use-powerapps-checker).

### AppSource certification ruleset

When publishing applications on AppSource, you must get your application certified. [Applications published on AppSource](/powerapps/developer/common-data-service/publish-app-appsource) are required to meet a high quality standard. The AppSource certification ruleset contains the rules that are part of the solution checker ruleset, plus other rules to ensure only high quality applications are published on the store. Some of AppSource certification rules are more prone to false positives and may require more attention to resolve.

<a name="bkmk_tenant"></a>

## Find your tenant ID

The ID of your tenant is needed to interact with the APIs that require a token. Refer to [this article](/onedrive/find-your-office-365-tenant-id) for details on how to obtain the tenant ID. You can also use PowerShell commands to retrieve the tenant ID. The following example applies the cmdlets in the [AzureAD module](/powershell/module/azuread/).

```powershell
# Login to Microsoft Entra ID as your user
Connect-AzureAD

# Establish your tenant ID
$tenantId = (Get-AzureADTenantDetail).ObjectId
```

The tenant ID is the value of the `ObjectId` property that is returned from `Get-AzureADTenantDetail`. You may also see it after logging in using the Connect-AzureAD cmdlet in the cmdlet output. In this case, it will be named `TenantId`.

<a name="bkmk_auth"></a>

## Authentication and authorization

 Querying for rules and rulesets don't require an OAuth token, but all of the other APIs do require the token. The APIs do support authorization discovery by calling any of the APIs that require a token. The response is an unauthorized HTTP status code of 401 with a WWW-Authenticate header, the authorization URI, and the resource ID. You should also provide your tenant ID in the `x-ms-tenant-id` header. Refer to [Power Apps Checker authentication and authorization](/powershell/powerapps/get-started-powerapps-checker#powerapps-checker-authentication-and-authorization) for more information. The following is an example of the response header returned from an API request:

```http
WWW-Authenticate →Bearer authorization_uri="https://login.microsoftonline.com/0082fff7-33c5-44c9-920c-c2009943fd1e", resource_id="https://api.advisor.powerapps.com/"
```

Once you have this information, you can choose to use the Microsoft Authentication Library (MSAL) or some other mechanism to acquire the token. The following is an example of how this can be done using C# and the [MSAL .NET](https://www.nuget.org/packages/Microsoft.Identity.Client/) library:

```c#
// Substitute your own environment URL here.
string resource = "https://<env-name>.api.<region>.dynamics.com";

// Example Microsoft Entra app registration.
// For your custom apps, you will need to register them with Microsoft Entra ID yourself.
// See https://docs.microsoft.com/powerapps/developer/data-platform/walkthrough-register-app-azure-active-directory
var clientId = "51f81489-12ee-4a9e-aaae-a2591f45987d";
var redirectUri = "http://localhost"; // Loopback required for the interactive login.

var authBuilder = PublicClientApplicationBuilder.Create(clientId)
    .WithAuthority(AadAuthorityAudience.AzureAdMultipleOrgs)
    .WithRedirectUri(redirectUri)
    .Build();
var scope = resource + "/.default";
string[] scopes = { scope };

AuthenticationResult tokenResult =
     await authBuilder.AcquireTokenInteractive(scopes).ExecuteAsync();
```

For the full working code, see the Web API [QuickStart sample](https://github.com/microsoft/PowerApps-Samples/tree/master/dataverse/webapi/CSharp-NETx/QuickStart).

Once you have acquired the token, it's advised that you provide the same token to subsequent calls in the request lifecycle. However, more requests may warrant a new token be acquired for security reasons.

<a name="bkmk_transport"></a>

## Transport security
For best-in-class encryption, the checker service only supports communications using Transport Layer Security (TLS) 1.2 and greater. For guidance on .NET best practices around TLS, refer to [Transport Layer Security (TLS) best practices with the .NET Framework](/dotnet/framework/network-programming/tls).

<a name="bkmk_report"></a>

## Report format

The result of the solution analysis is a zip file containing one or more reports in a standardized JSON format. The report format is based on static analysis results referred to as Static Analysis Results Interchange Format (SARIF). There are tools available to view and interact with SARIF documents. Refer to this [web site](https://sarifweb.azurewebsites.net/) for details. The service uses version two of the [OASIS standard](https://docs.oasis-open.org/sarif/sarif/v2.0/sarif-v2.0.html).


### See also

[Retrieve the list of rulesets](retrieve-rulesets.md)<br />
[Retrieve the list of rules](retrieve-rules.md)<br />
[Upload a file](upload-file.md)<br />
[Invoke analysis](analyze.md)<br />
[Check for analysis status](check-status.md)<br />


