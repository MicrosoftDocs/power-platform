---
title: Export Monitor metrics by using the API
description: Learn how to export daily Power Platform Monitor metric aggregates with a REST API, retrieve every page, and retain the data in your own store.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/05/2026
author: arjunmayur
ms.author: arjunmayur
ms.reviewer: ellenwehrle
search.audienceType:
  - admin
---

# Export Monitor metrics by using the API

Use the Monitor metrics export REST API to retrieve daily metric aggregates for Power Platform resources in OpenTelemetry Protocol JSON (OTLP JSON) format. Store the exported data in a destination that you manage, then use it for historical reports, shared operational insights, or analysis alongside your other data.

The API supports all existing products in Monitor. Any script or client that can make authenticated REST requests can retrieve the data. You don't need a specific command-line interface (CLI) or connector. However, a PAC CLI command is also available to use. 

> [!IMPORTANT]
> **Draft — API contract validation required.** This article describes the current export requirements. The endpoint, authentication details, product identifiers, date-boundary semantics, and response examples still require final release validation. The examples are implementation drafts, not a live-tested customer integration. This article doesn't announce a release date or general availability.

## Why export Monitor metrics?

Use exported aggregates to:

- Retain a historical record beyond Monitor's 30-day retention window in your own storage.
- Share insights with authorized IT and Operations colleagues who don't have access to Monitor.
- Combine Monitor metrics with deployment history, service inventory, or other operational data to build custom views.
- Use OpenTelemetry-compatible pipelines with tools such as Datadog or Splunk, subject to the destination's configuration and historical-data support.

This is a historical pull workflow; it isn't a real-time feed or a replacement for a live telemetry service. Build dashboards against your stored data, not continuous queries to the export API.

## Prerequisites

Before you start, ensure you have the following:

- A tenant administrator account authorized to use the export API. Export is currently available to tenant admins only. Environment administrator support is planned but isn't currently available.
- The environment ID, the product and sub-product type (for example, *Power Apps* and *canvas app*), and an explicit list of 1–10 resource IDs for that environment and type.
- A historical start date and end date within the last 30 days of the export date. Only daily aggregates that are at least one day old are eligible; current-day data isn't available.
- An authenticated REST client and a bearer access token obtained through a supported authentication flow. The PowerShell example requires PowerShell 7.
- A protected storage location and a plan for scheduling, retrying, ingesting, retaining, and controlling access to the exports.

For authentication concepts, see [Power Platform API authentication](../programmability-authentication-v2.md) and the [Power Platform API permission reference](../programmability-permission-reference.md). These general references don't establish the export API's final permission or token configuration. Confirm the exact tenant-role names, token audience, OAuth scopes or application permissions, consent requirements, and supported authentication flow before running the examples. Don't assume that a service principal, managed identity, reader role, or environment admin can call this endpoint.

## Supported products and required inputs

The route supports all existing products in Monitor. The following list shows product labels, **not API identifier spellings**.

| Product | Resource types in Monitor |
|---|---|
| Power Apps | Canvas apps, model-driven apps, and code apps |
| Power Automate | Cloud flows and desktop flows |
| Microsoft Copilot Studio | Agents |

The route uses `resourceType` and `resourceSubType` to identify the selected product and type. Don't derive these values from the display labels. The canvas example uses `PowerApp` and `CanvasApp`, which you see in a demo request; the complete identifier matrix still needs publication validation.

| Input | Where to provide it | Requirement |
|---|---|---|
| Environment ID | `{environmentId}` in the route | One environment per request. Copy the ID, not the display name. |
| Product identifier | `{resourceType}` in the route | Use the approved API identifier for the product. |
| Product-type identifier | `{resourceSubType}` in the route | Use the approved API identifier for the resource type. |
| Resource IDs | Root-level `resourceIds` array in the JSON body | Supply 1–10 distinct IDs. Every resource must belong to the selected environment and product/type. |
| Start date | `timeRange.startDate` in the JSON body | Use `YYYY-MM-DD`. Select a historical date within the available 30-day window. |
| End date | `timeRange.endDate` in the JSON body | Use `YYYY-MM-DD`, later than the start date. Exclude current-day data. |
| Access token | `Authorization: Bearer` request header | Use a token for the supported export authentication flow. Keep it secret. |

For more than 10 resources, divide the explicit resource list into batches of at most 10. Use separate requests for different environments or product/type pairs, and retrieve every page for each batch. An omitted or empty list doesn't mean all resources in an environment.

## Export the metrics

### 1. Select a historical interval

Choose the daily aggregates you need, considering their minimum age and processing time. The examples use UTC dates with an inclusive start and an exclusive end: `2026-10-20` through `2026-10-27` selects October 20–26, seven daily intervals.

This example assumes an export on **November 3, 2026**. Its selected days are within the preceding 30 days and are more than one day old. Replace the dates when you run an export; these fixed dates aren't a rolling lookback.

> [!NOTE]
> UTC inclusive-start/exclusive-end boundaries are the draft contract used in this article and require final confirmation. At least one day old doesn't mean that a day's aggregates are guaranteed to be complete at midnight or exactly 24 hours later. Allow for processing time and verify the latest complete interval before scheduling production exports.

### 2. Prepare authentication and the request

Obtain a bearer token by using the supported Power Platform API authentication flow for an authorized tenant admin. Supply the token securely to your REST client. Don't save it in source code, export files, completion manifests, or diagnostic logs.

The current draft route template is:

```http
POST https://api.powerplatform.com/monitoringhub/environments/{environmentId}/resourceType/{resourceType}/resourceSubType/{resourceSubType}/exports/metrics?api-version=1
Authorization: Bearer <access-token>
Content-Type: application/json
Accept: application/json
```

**Canvas example — release validation pending.** The following URL combines the current global host, environment-scoped route with the canvas identifier pair observed in a demo. This composed customer endpoint hasn't been validated end to end. The GUIDs are placeholders; replace them with your own IDs.

```http
POST https://api.powerplatform.com/monitoringhub/environments/11111111-1111-1111-1111-111111111111/resourceType/PowerApp/resourceSubType/CanvasApp/exports/metrics?api-version=1
```

Send this JSON request body:

```json
{
  "resourceIds": [
    "22222222-2222-2222-2222-222222222222",
    "33333333-3333-3333-3333-333333333333"
  ],
  "timeRange": {
    "startDate": "2026-10-20",
    "endDate": "2026-10-27"
  }
}
```

The `resourceIds` array is at the root of the request, not inside a `scope` object. This example doesn't use relative lookback values or metric-name filters.

### 3. Retrieve every response page

The draft paging contract uses the `x-ms-continuation` HTTP header. Keep the route and JSON body unchanged throughout a paging sequence.

1. Send the first POST request without an `x-ms-continuation` request header.
2. Check that the response is successful and contains the expected JSON metrics envelope. Save it as a separate page in staging storage.
3. Read the response's `x-ms-continuation` header. If it contains a nonempty value, send that value in the same header on the next POST request.
4. Repeat until the response header is absent or empty. Only then mark page retrieval complete.

Treat a continuation value as opaque and sensitive. Don't modify, decode, log, or reuse it with a different request. Stop if a value repeats, a request fails, or a response can't be validated. An empty data page isn't a reason to stop if a continuation value is present.

Completion of pagination means that you retrieved the response pages for that request. It doesn't prove that every expected resource or daily aggregate was available. Reconcile the returned coverage before you use the data.

### 4. Inspect the OTLP metrics payload

A metrics page uses the OTLP JSON `ExportMetricsServiceRequest` structure. The following is a **structure-only illustration**, not a captured API response or an approved metric registry. `example.resource.id` and `example.metric` are placeholder names. The empty data-point array avoids implying an actual measurement.

```json
{
  "resourceMetrics": [
    {
      "resource": {
        "attributes": [
          {
            "key": "example.resource.id",
            "value": {
              "stringValue": "22222222-2222-2222-2222-222222222222"
            }
          }
        ]
      },
      "scopeMetrics": [
        {
          "scope": { "name": "example.scope" },
          "metrics": [
            {
              "name": "example.metric",
              "gauge": { "dataPoints": [] }
            }
          ]
        }
      ]
    }
  ]
}
```

| OTLP field | How to use it |
|---|---|
| `resourceMetrics` | Groups metrics by resource. Preserve the resource identity and attributes. |
| `scopeMetrics` | Groups metrics by instrumentation scope. |
| `metrics` | Contains metric names, units when present, and the instrument-specific payload. Use the released metric definitions to interpret values. |
| `dataPoints` | Contains aggregate measurements, not individual app sessions, flow runs, or raw events. |
| `startTimeUnixNano`, `timeUnixNano` | Timestamp fields, when present. Preserve their decimal-string encoding and precision; don't replace historical timestamps with ingestion time. |
| `asInt` | A 64-bit integer value encoded as a decimal string in OTLP JSON. Don't convert it through a floating-point type. |
| `asDouble`, `attributes` | A numeric value and dimensions, when present. Preserve dimensions when identifying a time series. |

This metrics API doesn't export logs, recommendation text, or triggered-alert records. Don't concatenate separate JSON page objects into a single JSON document. Keep each page intact, or use a deliberate downstream packaging format that your ingestion pipeline supports.

## PowerShell example: save a complete paginated export

After validating the draft contract, save the following script as `Export-MonitorMetrics.ps1`. Pass an access token as a `SecureString` from your supported authentication flow. Token acquisition is separate from export; this script doesn't configure authentication or imply support for an unattended identity.

The script checks input syntax, duplicate IDs, and the broad 30-day source-history window, not just the interval's length. These checks don't establish the service's exact minimum-age or completeness boundary, authorization, resource membership, or approved product identifiers. Confirm eligible complete days before you run it. The script accepts `{}` and `{"resourceMetrics":[]}` as candidate empty envelopes; the final empty-result contract still needs confirmation. Neither shape ends paging by itself. It writes original JSON pages to a unique `.partial-` directory and adds a completion manifest and renames the directory only after pagination ends. The manifest records retrieval, not ingestion success or complete metric coverage.

```powershell
#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$EnvironmentId,
    [Parameter(Mandatory)][string]$ResourceType,
    [Parameter(Mandatory)][string]$ResourceSubType,
    [Parameter(Mandatory)][string[]]$ResourceIds,
    [Parameter(Mandatory)][string]$StartDate,
    [Parameter(Mandatory)][string]$EndDate,
    [Parameter(Mandatory)][securestring]$AccessToken,
    [string]$OutputRoot = './monitor-exports'
)
$ErrorActionPreference = 'Stop'
foreach ($segment in @($EnvironmentId, $ResourceType, $ResourceSubType)) {
    if ([string]::IsNullOrWhiteSpace($segment) -or $segment -match '[\s/?#]') {
        throw 'Provide nonempty IDs and route identifiers, not URLs or labels.'
    }
}
if ($AccessToken.Length -eq 0) { throw 'Supply a nonempty access token.' }
if ($ResourceIds.Count -lt 1 -or $ResourceIds.Count -gt 10) {
    throw 'Supply 1-10 distinct resource IDs.'
}
$ids = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase)
foreach ($id in $ResourceIds) {
    $parsed = [guid]::Empty
    if (-not [guid]::TryParseExact($id, 'D', [ref]$parsed) -or
        $parsed -eq [guid]::Empty -or -not $ids.Add($parsed.ToString('D'))) {
        throw 'Resource IDs must be distinct, nonempty GUIDs.'
    }
}
$culture = [System.Globalization.CultureInfo]::InvariantCulture
$style = [System.Globalization.DateTimeStyles]::None
$start = [datetime]::ParseExact($StartDate, 'yyyy-MM-dd', $culture, $style)
$end = [datetime]::ParseExact($EndDate, 'yyyy-MM-dd', $culture, $style)
$today = [datetime]::UtcNow.Date
if ($start -ge $end -or $start -lt $today.AddDays(-30) -or $end -gt $today) {
    throw 'Use start < end, within the last 30 UTC days, excluding today.'
}
# Date checks do not establish the latest complete daily interval.
$envPath = [uri]::EscapeDataString($EnvironmentId)
$typePath = [uri]::EscapeDataString($ResourceType)
$subPath = [uri]::EscapeDataString($ResourceSubType)
$uri = "https://api.powerplatform.com/monitoringhub/environments/$envPath" +
    "/resourceType/$typePath/resourceSubType/$subPath/exports/metrics?api-version=1"
$body = @{
    resourceIds = @($ResourceIds)
    timeRange = @{ startDate = $StartDate; endDate = $EndDate }
} | ConvertTo-Json -Depth 5 -Compress
$root = [System.IO.Path]::GetFullPath($OutputRoot)
[void][System.IO.Directory]::CreateDirectory($root)
$run = [guid]::NewGuid().ToString('N')
$staging = Join-Path $root ".partial-$run"
$ready = Join-Path $root "export-$run"
[void][System.IO.Directory]::CreateDirectory($staging)
$seen = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::Ordinal)
$files = [System.Collections.Generic.List[string]]::new()
$next = $null
$page = 0
try {
    do {
        $page++
        $headers = @{ Accept = 'application/json' }
        if ($next) { $headers['x-ms-continuation'] = $next }
        $request = @{
            Uri = $uri; Method = 'Post'; Headers = $headers
            Authentication = 'Bearer'; Token = $AccessToken
            ContentType = 'application/json'; Body = $body
            MaximumRedirection = 0; SkipHttpErrorCheck = $true
            ErrorAction = 'Stop'
        }
        $response = Invoke-WebRequest @request
        if ([int]$response.StatusCode -ne 200) {
            throw 'Unexpected HTTP status; export remains incomplete.'
        }
        $document = $response.Content | ConvertFrom-Json -AsHashtable -Depth 100
        if ($document -isnot [System.Collections.IDictionary] -or
            $document.Contains('error') -or $document.Contains('resourceLogs') -or
            ($document.Count -gt 0 -and (-not $document.Contains('resourceMetrics') -or
            $document.resourceMetrics -isnot [array]))) {
            throw 'Expected an OTLP JSON metrics envelope.'
        }
        # Envelope check only; validate the released OTLP schema downstream.
        $name = 'page-{0:D5}.json' -f $page
        [System.IO.File]::WriteAllText((Join-Path $staging $name),
            $response.Content, [System.Text.UTF8Encoding]::new($false))
        $files.Add($name)
        $values = @($response.Headers['x-ms-continuation'] |
            Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) })
        if ($values.Count -gt 1) { throw 'Ambiguous continuation header.' }
        $next = if ($values.Count -eq 1) { [string]$values[0] } else { $null }
        if ($next -and -not $seen.Add($next)) {
            throw 'Repeated continuation value; export remains incomplete.'
        }
    } while ($next)
    $manifest = @{
        retrievalComplete = $true; completedUtc = [datetime]::UtcNow.ToString('o')
        environmentId = $EnvironmentId; resourceType = $ResourceType
        resourceSubType = $ResourceSubType; resourceIds = @($ResourceIds)
        startDate = $StartDate; endDate = $EndDate
        pageCount = $page; pages = @($files.ToArray())
    } | ConvertTo-Json -Depth 5
    [System.IO.File]::WriteAllText((Join-Path $staging 'manifest.json'),
        $manifest, [System.Text.UTF8Encoding]::new($false))
    [System.IO.Directory]::Move($staging, $ready)
} catch {
    # Don't print the request, token, continuation, or raw response/error body.
    throw 'Export stopped. Do not ingest partial output. Review and retry safely.'
}
Write-Output "All response pages saved to: $ready"
```

Example invocation after a supported authentication flow securely populates `$AccessToken` as a `SecureString`:

```powershell
# Historical example only: update the dates and IDs before use.
$params = @{
    EnvironmentId = '11111111-1111-1111-1111-111111111111'
    ResourceType = 'PowerApp'
    ResourceSubType = 'CanvasApp'
    ResourceIds = @('22222222-2222-2222-2222-222222222222')
    StartDate = '2026-10-20'
    EndDate = '2026-10-27'
    AccessToken = $AccessToken
}
./Export-MonitorMetrics.ps1 @params
```

Configure consumers to ignore `.partial-` directories and to process only completed `export-` directories with a manifest. Keep staging and ready storage on the same filesystem, and verify rename and watcher behavior for your storage service. A failed run remains isolated; don't promote it manually as a complete export. This sample stops on failure rather than implementing a retry policy.

### Optional: retrieve the first page with curl

For a one-page inspection in a Bash-compatible shell, save the request JSON as `request.json`. Supply `ACCESS_TOKEN` securely and set `EXPORT_URL` to the validated canvas URL with your environment ID. The command deliberately doesn't follow redirects.

```bash
# ACCESS_TOKEN is supplied securely; don't echo it or enable shell tracing.
# EXPORT_URL is the validated HTTPS export URL, not a continuation value.
curl --request POST "$EXPORT_URL" \
  --proto '=https' --max-redirs 0 --fail-with-body \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data-binary @request.json \
  --dump-header first-page.headers \
  --output first-page.json
```

Inspect the status, body, and `x-ms-continuation` response header. Curl doesn't make a redirect or an incomplete export successful. **This command retrieves only the first page.** Use the paging procedure or PowerShell example to retrieve the full export. Protect and remove `first-page.headers` when no longer needed because it can contain a continuation value. Use your client's secret-handling controls; command arguments and shell diagnostics can expose expanded tokens.

## Store, ingest, and share the data

You own the storage, scheduler, retry policy, ingestion pipeline, downstream permissions, and retention policy. Monitor returns the data; it doesn't provision your destination or continuously deliver exports to it.

### Build a historical-data pipeline

1. Preserve the original response pages and a retrieval manifest in protected storage.
2. Validate the OTLP metrics schema and compare returned resources, dates, and metrics with the coverage you expected. Keep missing data distinct from zero.
3. Configure a metrics receiver or adapter for the saved OTLP JSON pages and an exporter for your destination. Set the destination endpoint and credentials through its supported secret mechanism.
4. Verify that the destination accepts historical timestamps, metric types, units, and dimensions. Check its retention and backfill limits before a large import.
5. Test a small completed export and reconcile values and timestamps at the destination. Only then expand the resource inventory and schedule.

OpenTelemetry supports interoperability with platforms such as Datadog and Splunk, but it doesn't guarantee automatic ingestion, universal native file import, or a configuration-free integration. A receiver, exporter, or transformation might be required for your chosen destination. An export endpoint that returns an OTLP payload isn't itself a configured ingestion pipeline.

### Retain history and recover from failures

Schedule exports often enough to leave time for retries before data ages out of Monitor's 30-day window. Keep a record of successfully ingested intervals separately from retrieval completion. Alert your operators when scheduled runs fail or expected daily coverage is missing.

For transient failures, use bounded exponential backoff with jitter and honor `Retry-After` when the service returns it. Don't retry invalid inputs or authorization failures indefinitely. If you must restart a paging sequence, begin a new staging run with the same scope and interval while that data remains available. Don't combine an abandoned sequence with a new one unless you have validated reconciliation logic.

Design ingestion to tolerate repeated exports and overlapping recovery intervals. Deduplicate by stable environment/resource identity, metric identity, dimensions, and aggregation window rather than display names alone. Confirm the behavior if a later export revises a previously stored value.

Preserve aggregate semantics. Don't average daily P75 values to calculate a weekly P75, or average rates without the necessary denominators and an approved aggregation method. Daily aggregates aren't raw observations from which every statistic can be reconstructed.

### Control access to exported copies

Apply your organization's data classification, encryption, audit, and least-privilege access policies to export files and derived reports. Grant authorized colleagues access in your destination system. Sharing an exported copy doesn't grant access to the Power Platform admin center (PPAC), Monitor, or the export API. Review destination access and retention independently of Power Platform roles, and delete stored copies when your policy requires it.

## Limitations

- Exports contain daily metric aggregates only. They don't contain real-time, hourly, or current-day data. Configuring hourly alerts doesn't enable hourly exports.
- Data must be at least one day old and within the last 30 days of the export date. Data older than that window must already be retained in your own store.
- Each request requires one environment, one product/type pair, and 1–10 explicit resource IDs. Environment-wide wildcard and tenant-wide unfiltered requests aren't supported.
- Only tenant admins can currently export. Planned environment administrator support doesn't grant access today.
- This metrics API doesn't export logs, recommendation text, or triggered-alert records.
- Export doesn't create a datastore, schedule recurring calls, ingest data into a destination, or extend Monitor's own retention.

## Troubleshooting

The following guidance is symptom-based. It doesn't define a service error-code schema, throttle quota, continuation lifetime, or availability guarantee.

| Symptom | What to check or do |
|---|---|
| Authentication or access is rejected | Confirm the account is an authorized tenant admin, the token is current, and the approved audience, permissions, and consent match this endpoint. Environment admin or reader access alone isn't sufficient. |
| The request or resource selection is rejected | Check the validated route/version and product/type identifiers. Use an explicit root-level list of 1–10 distinct IDs from the same environment and type. Verify ID values, not display names. |
| The date range is rejected or recent days are missing | Use historical dates within the last 30 days, with start before end. Exclude today and allow for processing time. Verify the latest complete daily interval rather than assuming midnight availability. |
| The export has fewer resources or days than expected | Finish pagination, reconcile scope and returned coverage, and check whether those resources have Monitor data for the selected dates. Don't interpret absent points as zero. |
| Paging repeats, fails, or stops unexpectedly | Stop ingestion. Keep the body and route unchanged, pass the opaque continuation header correctly, and restart in a new staging run when appropriate. Don't assume a continuation token remains valid indefinitely. |
| The service throttles requests or fails temporarily | Reduce concurrency, honor `Retry-After` when present, and use bounded backoff. Leave enough time to recover within retention. |
| A redirect or non-JSON response is returned | Check the approved global endpoint and API version. Don't forward bearer tokens to a redirected host or treat an HTML sign-in page as metric data. |
| The destination shows no data or incorrect values | Check the receiver/exporter, credentials, historical timestamp limits, units, dimensions, and integer precision. Confirm that only completed exports were ingested. |
| Values are duplicated or a derived percentile is misleading | Review idempotency keys and overlap handling. Don't add the same daily point twice or average percentile aggregates. |

When escalating, include sanitized request scope, the interval, the HTTP status, the time of failure, and a correlation identifier if the service provides one. Don't include bearer tokens, continuation values, or unrestricted exported data.

## Frequently asked questions

### Do I need the Power Platform CLI or a connector?

No. Use any client that can call a REST API with the supported authentication. PowerShell and curl are examples, not product dependencies. An authentication helper, if used, obtains a token; it isn't an export command.

### Can I export every resource in an environment?

Inventory the resources you need and submit explicit batches of up to 10 IDs for each product/type. Retrieve every page for every batch. Don't omit `resourceIds` to request an entire environment.

### Can an Operations colleague without Monitor access view the data?

Yes, if your organization authorizes access to the exported copy or report in your destination. That permission doesn't allow the colleague to call the export API or open Monitor in PPAC.

### Can I recover data from more than 30 days ago?

Only from copies you already retained outside Monitor. Export doesn't restore data that has aged out of Monitor's window.

### Does an hourly alert produce an hourly export?

No. Alert configuration doesn't change export granularity. The API exports eligible daily aggregates only.

### Does a successful export mean ingestion and coverage are complete?

No. Finish all pages, validate the returned coverage, and separately verify ingestion in your destination. A completion manifest in the sample records page retrieval only.

## Related content

- [Monitor overview](monitoring-overview.md)
- [Power Platform API authentication](../programmability-authentication-v2.md)
- [Power Platform API permission reference](../programmability-permission-reference.md)
