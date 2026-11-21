---
title: Create cross-tenant isolation reports
description: Learn how to use the Power Platform API to create cross tenant isolation reports.
author: laneswenka
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: reference
ms.date: 11/18/2026
ai-usage: ai-generated
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- mihaelablendea 
---

# Tutorial: Create cross-tenant isolation reports

This tutorial demonstrates how to use the programmability tools to create cross-tenant isolation reports. A cross-tenant connection report shows the external tenants that connections in your tenant reach, or that reach into your tenant. Use these reports to identify the tenants to add to your allow list before you restrict cross-tenant connections. For more information about tenant isolation, see [Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md).

In this tutorial, learn how to:

> [!div class="checklist"]
> + Sign in
> + Create a report
> + List all reports for the tenant
> + Fetch a single report
> + Understand what the report contains
> + Locate the environment for a reported connection

## Prerequisites

- An account with an admin role for your tenant, such as Power Platform administrator. The cross-tenant connection report endpoints don't support role-based access control (RBAC) in the Power Platform admin center. For more information, see [Known limitations](programmability-extensibility-overview.md#known-limitations).
- To use Power Automate or Azure Logic Apps, a connection to the [Power Platform for Admins V2](/connectors/powerplatformadminv2/) connector.
- To use the Power Platform CLI or PowerShell, the latest version of the [Microsoft Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli). The PowerShell scripts use it to get an access token.
- To use PowerShell, PowerShell 7 or Windows PowerShell 5.1.
- To use the C# or Python SDK, an [app registration configured for the Power Platform API](programmability-authentication-v2.md) and the SDK package for your language:
  - **C#**: the [Microsoft.PowerPlatform.Management](https://www.nuget.org/packages/Microsoft.PowerPlatform.Management/) NuGet package. To install it, run `dotnet add package Microsoft.PowerPlatform.Management`.
  - **Python**: the [powerplatform-management](https://pypi.org/project/powerplatform-management/) PyPI package. To install it, run `pip install powerplatform-management`.

## Sign in

Sign in before you create or fetch reports. If you use Power Automate or Azure Logic Apps, skip this section. The connector uses the connection that you created.

# [Power Platform CLI](#tab/pacCLI)

> [!NOTE]
> The `pac governance` commands that this tutorial uses are in preview.

Create an authentication profile, and sign in with your admin account. The `pac governance` commands in this tutorial use the selected authentication profile.

```powershell
pac auth create
```

If you already have authentication profiles, run `pac auth list` to view them, and then run `pac auth select --index <index>` to select the profile for your tenant. For more information, see [pac auth](../developer/cli/reference/auth.md).

# [PowerShell](#tab/PowerShell)

> [!NOTE]
> The PowerShell scripts in this tutorial require the [Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli). The scripts use the [pac auth token](../developer/cli/reference/auth.md#pac-auth-token) command to get an access token for the Power Platform API.

If you don't have a Power Platform CLI authentication profile for your tenant, create one and sign in:

```powershell
pac auth create
```

Then run the following script in your PowerShell session. It gets an access token for the Power Platform API from the selected authentication profile. The scripts in the rest of this tutorial use the `$headers`, `$apiBaseUrl`, and `$apiVersion` variables that this script sets.

```powershell
$apiBaseUrl = "https://api.powerplatform.com"
$apiVersion = "2024-10-01"

# Get an access token for the Power Platform API from the selected authentication profile.
# The pattern extracts the token from the command output.
$tokenOutput = pac auth token | Out-String
$accessToken = [regex]::Match($tokenOutput, 'eyJ[\w-]+\.[\w-]+\.[\w-]+').Value
$headers = @{ Authorization = "Bearer $accessToken" }
```

> [!TIP]
> If a request fails, run `$Error[0].ErrorDetails.Message` to see the error that the API returned. Access tokens expire after a period of time. If a request returns a `401 Unauthorized` error, run the script again to get a new token.

# [C#](#tab/CSharp)

Create a client by using your app registration's client ID. A browser window opens for you to sign in. The C# examples in the rest of this tutorial use the `client` and `apiVersion` variables.

```csharp
using Microsoft.PowerPlatform.Management;
using Microsoft.PowerPlatform.Management.Models;

// Create an interactive client by using your app registration's client ID.
var factory = new ServiceClientFactory();
var client = factory.Create("<client-id>");
var apiVersion = "2024-10-01";
```

# [Python](#tab/Python)

Create a client by using your app registration's client ID. A browser window opens for you to sign in. The Python examples in the rest of this tutorial use the imports, the `API_VERSION` constant, and the `client` variable from this example.

The Python examples use `await`. Run them in an environment that supports top-level `await`, such as a Jupyter notebook or the `python -m asyncio` console, or place them inside an `async` function.

```python
from azure.identity import InteractiveBrowserCredential
from kiota_abstractions.base_request_configuration import RequestConfiguration
from kiota_authentication_azure.azure_identity_authentication_provider import (
    AzureIdentityAuthenticationProvider,
)
from kiota_http.httpx_request_adapter import HttpxRequestAdapter
from mspp_management.service_client_base import ServiceClientBase
from mspp_management.governance.cross_tenant_connection_reports.cross_tenant_connection_reports_request_builder import (
    CrossTenantConnectionReportsRequestBuilder,
)
from mspp_management.governance.cross_tenant_connection_reports.item.with_report_item_request_builder import (
    WithReportItemRequestBuilder,
)
from mspp_management.models.cross_tenant_connection_report_status import (
    CrossTenantConnectionReport_status,
)

API_VERSION = "2024-10-01"

# Sign in interactively by using your app registration's client ID.
credential = InteractiveBrowserCredential(client_id="<client-id>")
auth_provider = AzureIdentityAuthenticationProvider(
    credentials=credential,
    scopes=["https://api.powerplatform.com/.default"],
)
adapter = HttpxRequestAdapter(authentication_provider=auth_provider)
client = ServiceClientBase(adapter)
```

---

To sign in as a service principal, or to learn more about app registrations, see [Authentication](programmability-authentication-v2.md).

## Create a report

Create a report for your tenant by using Power Automate, Azure Logic Apps, the Power Platform CLI, PowerShell, or the C# or Python SDK.

> [!NOTE]
> You can create one report per tenant per calendar day. If your tenant already has a report for the current day, the request returns that report instead of creating a new one.

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, and search for **Generate or fetch a cross-tenant connection report** in the **Power Platform for Admins V2** connector. The action doesn't require any parameters.

:::image type="content" source="media/tutorial-tenantisolation-flow1.png" alt-text="Cross-tenant connection report create screenshot.":::

# [Power Platform CLI](#tab/pacCLI)
Use the following command to create the report.

```powershell
pac governance create-cross-tenant-connection-report
```

Power Platform CLI reference: [pac governance create-cross-tenant-connection-report](../developer/cli/reference/governance.md#pac-governance-create-cross-tenant-connection-report)

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to create the report.

```powershell
# Create a cross-tenant connection report, or get today's report if it already exists.
$report = Invoke-RestMethod -Method Post -Uri "$apiBaseUrl/governance/crossTenantConnectionReports?api-version=$apiVersion" -Headers $headers -Body ""
$reportId = $report.reportId

Write-Host "Cross-tenant connection report $reportId has status $($report.status)."
```

Power Platform API reference: [Create Cross-Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/create-cross-tenant-connection-report)

# [C#](#tab/CSharp)
Use the following C# code to create the report.

```csharp
// Create a cross-tenant connection report, or get today's report if it already exists.
var report = await client.Governance.CrossTenantConnectionReports.PostAsync(config =>
{
    config.QueryParameters.ApiVersion = apiVersion;
});
var reportId = report.ReportId.ToString();

Console.WriteLine($"Cross-tenant connection report {reportId} has status {report.Status}.");
```

# [Python](#tab/Python)
Use the following Python code to create the report.

```python
# Create a cross-tenant connection report, or get today's report if it already exists.
post_config = RequestConfiguration(
    query_parameters=CrossTenantConnectionReportsRequestBuilder.CrossTenantConnectionReportsRequestBuilderPostQueryParameters(
        api_version=API_VERSION
    )
)
report = await client.governance.cross_tenant_connection_reports.post(request_configuration=post_config)
report_id = str(report.report_id)

print(f"Cross-tenant connection report {report_id} has status {report.status.value}.")
```

---

Save the `reportId` value. You use it to fetch the report later in this tutorial.

## List all reports for the tenant

List the reports for your tenant to find report IDs and check the status of each report.

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, and search for **List cross-tenant connection reports for a tenant**. The action doesn't require any parameters.

:::image type="content" source="media/tutorial-tenantisolation-flow2.png" alt-text="List cross-tenant connection reports for a tenant screenshot.":::

# [Power Platform CLI](#tab/pacCLI)
Use the following command to list all available reports for your tenant. To choose the columns in the table output, add `--columns` with a comma-separated list of response properties, such as `--columns reportId,status,startDate,endDate`.

```powershell
pac governance list-cross-tenant-connection-reports
```

Power Platform CLI reference: [pac governance list-cross-tenant-connection-reports](../developer/cli/reference/governance.md#pac-governance-list-cross-tenant-connection-reports)

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to list all available reports for your tenant.

```powershell
# Get all cross-tenant connection reports for the tenant, following each page of results.
$reports = @()
$uri = "$apiBaseUrl/governance/crossTenantConnectionReports?api-version=$apiVersion"
while ($uri)
{
    $page = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers
    $reports += $page.value
    $uri = $page.'@odata.nextLink'
}

$reports | Format-Table reportId, requestDate, startDate, endDate, status
```

Power Platform API reference: [List Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports/list-cross-tenant-connection-reports)

# [C#](#tab/CSharp)
Use the following C# code to list all available reports for your tenant.

```csharp
// Get all cross-tenant connection reports for the tenant, following each page of results.
var reports = new List<CrossTenantConnectionReport>();
var page = await client.Governance.CrossTenantConnectionReports.GetAsync(config =>
{
    config.QueryParameters.ApiVersion = apiVersion;
});
while (page != null)
{
    reports.AddRange(page.Value ?? new List<CrossTenantConnectionReport>());
    page = string.IsNullOrEmpty(page.OdataNextLink)
        ? null
        : await client.Governance.CrossTenantConnectionReports.WithUrl(page.OdataNextLink).GetAsync();
}

foreach (var item in reports)
{
    Console.WriteLine($"{item.ReportId}  {item.RequestDate}  {item.StartDate}  {item.EndDate}  {item.Status}");
}
```

# [Python](#tab/Python)
Use the following Python code to list all available reports for your tenant.

```python
# Get all cross-tenant connection reports for the tenant, following each page of results.
list_config = RequestConfiguration(
    query_parameters=CrossTenantConnectionReportsRequestBuilder.CrossTenantConnectionReportsRequestBuilderGetQueryParameters(
        api_version=API_VERSION
    )
)
reports = []
page = await client.governance.cross_tenant_connection_reports.get(request_configuration=list_config)
while page:
    reports.extend(page.value or [])
    page = (
        await client.governance.cross_tenant_connection_reports.with_url(page.odata_next_link).get()
        if page.odata_next_link
        else None
    )

for item in reports:
    print(item.report_id, item.request_date, item.start_date, item.end_date, item.status.value)
```

---

## Fetch a single report

Reports are generated asynchronously. A new report starts with a status of `Received` or `InProgress`, and its connections are available after its status changes to `Completed`. If the status is still `Received` or `InProgress`, wait, and then fetch the report again. If the status is `Failed`, create the report again later.

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, and search for **Get a cross-tenant connection report by report ID for a tenant**. Provide the report ID from earlier steps. Check that the **status** output is **Completed** before you use the **connections** output.

:::image type="content" source="media/tutorial-tenantisolation-flow3.png" alt-text="Get a cross-tenant connection report by report ID for a tenant screenshot.":::

# [Power Platform CLI](#tab/pacCLI)
Use the following command to fetch a single report for your tenant. Replace `<report-id>` with the `reportId` value from the create or list step. To see the complete response, including the `connections` array, add `--json`.

```powershell
pac governance get-cross-tenant-connection-report --report-id "<report-id>"
```

Power Platform CLI reference: [pac governance get-cross-tenant-connection-report](../developer/cli/reference/governance.md#pac-governance-get-cross-tenant-connection-report)

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to fetch a single report for your tenant. When the report is complete, the script collects every page of connections in the report.

```powershell
# Replace with the reportId value from the create or list step.
$reportId = "<report-id>"

# Get one cross-tenant connection report for the tenant.
$report = Invoke-RestMethod -Method Get -Uri "$apiBaseUrl/governance/crossTenantConnectionReports/$($reportId)?api-version=$apiVersion" -Headers $headers
Write-Host "Report $($report.reportId) covers $($report.startDate) to $($report.endDate) and has status $($report.status)."

if ($report.status -eq "Completed")
{
    # Collect every page of connections in the report.
    $connections = @($report.connections)
    $nextLink = $report.'@odata.nextLink'
    while ($nextLink)
    {
        $page = Invoke-RestMethod -Method Get -Uri $nextLink -Headers $headers
        $connections += $page.connections
        $nextLink = $page.'@odata.nextLink'
    }

    $connections | Format-Table tenantId, connectionType, connectionId
}
```

Power Platform API reference: [Get Cross-Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/get-cross-tenant-connection-report)

# [C#](#tab/CSharp)
Use the following C# code to fetch a single report for your tenant. When the report is complete, the code collects every page of connections in the report.

```csharp
// Replace with the reportId value from the create or list step.
var reportId = "<report-id>";

// Get one cross-tenant connection report for the tenant.
var report = await client.Governance.CrossTenantConnectionReports[reportId].GetAsync(config =>
{
    config.QueryParameters.ApiVersion = apiVersion;
});
Console.WriteLine($"Report {report.ReportId} covers {report.StartDate} to {report.EndDate} and has status {report.Status}.");

if (report.Status == CrossTenantConnectionReport_status.Completed)
{
    // Collect every page of connections in the report.
    var connections = new List<CrossTenantConnection>(report.Connections ?? new List<CrossTenantConnection>());
    var nextLink = report.OdataNextLink;
    while (!string.IsNullOrEmpty(nextLink))
    {
        var page = await client.Governance.CrossTenantConnectionReports[reportId].WithUrl(nextLink).GetAsync();
        connections.AddRange(page.Connections ?? new List<CrossTenantConnection>());
        nextLink = page.OdataNextLink;
    }

    foreach (var connection in connections)
    {
        // The SDK returns connectionId in the AdditionalData dictionary.
        connection.AdditionalData.TryGetValue("connectionId", out var connectionId);
        Console.WriteLine($"{connection.TenantId}  {connection.ConnectionType}  {connectionId}");
    }
}
```

# [Python](#tab/Python)
Use the following Python code to fetch a single report for your tenant. When the report is complete, the code collects every page of connections in the report.

```python
# Replace with the reportId value from the create or list step.
report_id = "<report-id>"

# Get one cross-tenant connection report for the tenant.
get_config = RequestConfiguration(
    query_parameters=WithReportItemRequestBuilder.WithReportItemRequestBuilderGetQueryParameters(
        api_version=API_VERSION
    )
)
report_builder = client.governance.cross_tenant_connection_reports.by_report_id(report_id)
report = await report_builder.get(request_configuration=get_config)
print(f"Report {report.report_id} covers {report.start_date} to {report.end_date} and has status {report.status.value}.")

if report.status == CrossTenantConnectionReport_status.Completed:
    # Collect every page of connections in the report.
    connections = list(report.connections or [])
    next_link = report.odata_next_link
    while next_link:
        page = await report_builder.with_url(next_link).get()
        connections.extend(page.connections or [])
        next_link = page.odata_next_link

    for connection in connections:
        # The SDK returns connectionId in the additional_data dictionary.
        print(connection.tenant_id, connection.connection_type.value, connection.additional_data.get("connectionId"))
```

---

## Understand what the report contains

Each report includes the following properties:

+ `reportId`: the identifier of the report.
+ `status`: the generation status of the report: `Received`, `InProgress`, `Completed`, or `Failed`.
+ `requestDate`: the date when the report was requested.
+ `startDate` and `endDate`: the reporting window that the report covers.
+ `connections`: the cross-tenant connections observed during the reporting window.
+ `@odata.nextLink`: when present, the URL of the next page of connections in the report.

Every entry in the `connections` array describes a cross-tenant connection and includes:

+ `tenantId`: the external tenant that the connection reaches.
+ `connectionType`: the direction of the connection, either `outbound` (from your tenant to the external tenant) or `inbound`.
+ `connectionId`: the identifier of the connection. This value matches the connection's `name` (the last segment of the connection's resource ID) in the environment where the connection lives.

> [!NOTE]
> The report logs cross-tenant connection **attempts** observed during the reporting window, not only connections that currently exist. The report includes attempts that were **blocked by tenant isolation** on your tenant or on the target tenant. As a result, a `connectionId` in the report might not correspond to a connection that exists in any of your environments today. You can't locate blocked connection attempts (and connections that were later deleted) by using the steps in the next section.

## Locate the environment for a reported connection

A report identifies each connection by `connectionId`, but it doesn't include the environment where the connection lives. To find the environment, enumerate the environments in your tenant, list each environment's connections, and match on the connection `name`.

Use the following PowerShell script to search your environments for a reported `connectionId`. The script uses the variables from the PowerShell sign-in script. Enumerate your environment IDs however you prefer—for example, from the [Power Platform admin center](https://aka.ms/ppac)—and provide the `connectionId` values from the report. The script ignores hyphens and letter case when it compares values, so differences in identifier formatting don't prevent a match.

```powershell
# The connectionId values from the report that you fetched earlier.
# To search for every connection in that report, use: $reportConnectionIds = $connections.connectionId | Select-Object -Unique
$reportConnectionIds = @('<connection-id-1>', '<connection-id-2>')

# The environments in your tenant to search.
$environmentIds = @('<environment-id-1>', '<environment-id-2>')

foreach ($environmentId in $environmentIds)
{
    try
    {
        # List the connections in the environment.
        $uri = "$apiBaseUrl/connectivity/environments/$environmentId/connections?api-version=$apiVersion"
        $environmentConnections = (Invoke-RestMethod -Method Get -Uri $uri -Headers $headers).value

        foreach ($connectionId in $reportConnectionIds)
        {
            # The report's connectionId matches the end of the connection's 'name'.
            $normalizedId = $connectionId -replace '-', ''
            $matchingConnections = $environmentConnections | Where-Object { ($_.name -replace '-', '') -like "*$normalizedId" }
            foreach ($connection in $matchingConnections)
            {
                Write-Host "connectionId $connectionId is in environment $environmentId (connector: $($connection.properties.apiId), display name: $($connection.properties.displayName))"
            }
        }
    }
    catch
    {
        Write-Host "Couldn't list connections for environment ${environmentId}: $($_.Exception.Message)"
    }
}
```

If a reported `connectionId` isn't found in any environment, it was most likely a blocked attempt (see the previous note) or a connection that was deleted after the report was generated.

Power Platform API reference: [List connections in an environment](/rest/api/power-platform/connectivity/connections/list-connections)

## Related content

- [Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md)
- [Authentication](programmability-authentication-v2.md)
- [Power Platform for Admins V2 connector reference](/connectors/powerplatformadminv2/)
- [Power Platform API reference - Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports)
- [Power Platform API reference - Connectivity](/rest/api/power-platform/connectivity/connections)
