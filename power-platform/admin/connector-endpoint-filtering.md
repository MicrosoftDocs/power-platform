---
title: Connector endpoint filtering (preview)
description: Learn how to configure connector endpoint filtering in DLP policies to control app, flow, and chatbot connections.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/19/2025
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
  - nimoutzo
ms.custom:
  - admin-security
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/29/2025
search.audienceType:
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Connector endpoint filtering (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
[This article is pre-release documentation and is subject to change.]

Connector endpoint filtering allows admins to govern which specific endpoints makers can connect to when building apps, flows, or chatbots. It's configured within a data loss prevention (DLP) policy, and it's exclusively available for the following connectors:

- HTTP
- HTTP with Microsoft Entra ID (AD)
- HTTP Webhook
- SQL Server (includes using SQL Server Connector to access Azure Synapse data warehouse)
- Azure Blob Storage
- SMTP
- Browser Automation
- UI automation

When a maker tries to connect their app, flow, or chatbot to a blocked endpoint, they encounter a DLP error message.

> [!WARNING]
> Endpoint filtering rules aren't enforced on environment variables, custom inputs, or any endpoint that is dynamically created at run-time. Only static endpoints are evaluated in the app, flow, or chatbot designers. For more information, see [Known limitations](#known-limitations).

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]

## Add endpoint filtering rules to your DLP policies

The **Endpoint configurable** column, on the **Prebuilt Connectors** page in **Data Policies**, indicates whether the endpoint filtering capability is supported for the connector.

:::image type="content" source="media/dlp-endpoint-configurable-prebuilt-connectors.png" alt-text="Endpoint configurable in the Prebuilt Connectors page.":::

If the value of the **Endpoint configurable** column is **Yes**, you can use this capability by right-clicking and then selecting **Configure connector** > **Connector endpoints**.

:::image type="content" source="media/dlp-configure-connector-connector-endpoints.png" alt-text="Configure connector > Connector endpoints.":::

This opens a side panel where you can specify an ordered list of Allow or Deny URL patterns. The last row in the list will always be a rule for the wildcard character (`*`), which applies to all endpoints in that connector. By default, the `*` pattern is set up as Allow for new DLP policies, but you can tag this as Allow or Deny.

:::image type="content" source="media/dlp-specify-ordered-list-allow-deny-url-patterns.png" alt-text="Specify an ordered list of Allow and Deny URL patterns for custom connectors.":::

### Add new rules
You can add new rules by selecting **Add endpoint**. New rules are added to the end of the pattern list as the second-to-the-last rule. This is because `*` will always be the last entry in the list. However, you can update the order of the patterns by using the **Order** drop-down list or selecting **Move up** or **Move down**. 

:::image type="content" source="media/dlp-add-endpoint-new-rules.png" alt-text="Select Add endpoint to add new rules.":::

After a pattern has been added, you can edit or delete these patterns by selecting a specific row and then selecting **Delete**. 

:::image type="content" source="media/dlp-delete-pattern.png" alt-text="Delete a pattern.":::

After saving your connector endpoint filtering rules and the DLP policy in which they're defined, they become instantly enforced on the targeted environments. Below is an example where a maker tried to connect their cloud flow to an HTTP endpoint that isn't allowed.

:::image type="content" source="media/EF_CloudFlow.png" alt-text="DLP error because of endpoint filtering rules.":::

## Known limitations

- Endpoint filtering rules aren't enforced on environment variables, custom inputs, and dynamically bound endpoints during runtime. Only static endpoints known and selected when building an app, flow, or chatbot during design time are enforced. This implies that connector endpoint filtering rules for SQL Server and Azure Blob Storage aren't enforced if the connections are authenticated with Microsoft Entra ID. In the two screenshots below, a maker has built a cloud flow that defines the SQL Server and database inside variables, and then uses those variables as input to the connection definition. Therefore, the endpoint filtering rules aren't evaluated and the cloud flow can execute successfully.

    :::image type="content" source="media/EF_KnownLimitation_1.png" alt-text="Cloud flow uses variables to connect to SQL.":::

    :::image type="content" source="media/EF_KnownLimitation_2.png" alt-text="Cloud flow runs successfully.":::

- Some Power Apps published before October 1, 2020, need to be re-published for DLP connector action rules and endpoint rules to be enforced. The following script enables admins and makers to identify apps that must be re-published to respect these new DLP granular control rules:

    ```powershell
    Add-PowerAppsAccount

    $GranularDLPDate = Get-Date -Date "2020-10-01 00:00:00Z"

    ForEach ($app in Get-AdminPowerApp){

        $versionAsDate = [datetime]::Parse($app.LastModifiedTime)

        $olderApp = $versionAsDate -lt $GranularDLPDate

        $wasBackfilled = $app.Internal.properties.executionRestrictions -ne $null -and $app.Internal.properties.executionRestrictions.dataLossPreventionEvaluationResult -ne $null -and ![string]::IsNullOrEmpty($app.Internal.properties.executionRestrictions.dataLossPreventionEvaluationResult.lastAdvancedBackfillDate) 

        If($($olderApp -and !$wasBackfilled)){
            Write-Host "App must be republished to be Granular DLP compliant: " $app.AppName " "  $app.Internal.properties.displayName " " $app.Internal.properties.owner.email
        } 
        Else{ 
            Write-Host "App is already Granular DLP compliant: " $app.AppName 
        }
    }
    ``` 

## Endpoint input formats and examples 

Each connector has a different notion of what an endpoint means. Further, some endpoints can be defined in multiple formats. Therefore, endpoints have to be entered in all possible formats to block makers from using them while creating apps and flows. Admins can either enter the full endpoint name or use pattern matching with the wildcard character (`*`) when creating an endpoint filtering rule. These rules are entered and presented in an ordered list of endpoint patterns, meaning that they'll be evaluated in ascending order by number. The last rule for any given connector is always `*` Allow or `*` Deny. Allow is the default, which can be changed to Deny. 

The following guidance describes how to enter connector endpoints while creating rules to allow or deny them. 

### SQL Server

SQL Server connection endpoints have to be listed in `<Server_name, database_name>` format. A few things to keep in mind: 

- The server name can be entered in various formats by makers. Therefore, to truly address an endpoint, it has to be entered in all possible formats. For example, on-premises instances can be in `<machine_name\named_instance, database_name>` or `<IP address, custom port, database_name>` format. In this case, you have to apply allow or block rules in both formats for an endpoint. For example:
  - Block `WS12875676\Servername1,MktingDB` 
  - Block `11.22.33.444,1401,MktingDB`

- There's no special logic to handle relative addresses such as `localhost`. Therefore, if you block `*localhost*`, it blocks makers from using any endpoints by using `localhost` as part of the SQL Server endpoint. However, it doesn't stop them from accessing the endpoint by using the absolute address, unless the absolute address has also been blocked by the admin. 

The following are examples: 

- Allow only Azure SQL Server instances: 
  1. Allow `*.database.windows.net*` 
  2. Deny `*`

- Allow only a specific IP range: (Note that the IP addresses that aren't allowed can still be entered by the maker in `<machine_name\named_instance>` format.) 
  1. Allow `11.22.33*` 
  2. Deny `*`

### Dataverse 

Dataverse endpoints are represented by the [organization ID](determine-org-id-name.md), such as, 00aa00aa-bb11-cc22-dd33-44ee44ee44ee. Note that only the regular Dataverse connector is currently in scope for endpoint filtering. Dataverse dynamics and Dataverse current connectors aren't in scope. Also, the local instance of Dataverse (also known as the current environment) can never be blocked for use within an environment. This means that within any given environment, makers can always access the Dataverse current environment. 

Therefore, a rule that says the following:

1. Allow `00aa00aa-bb11-cc22-dd33-44ee44ee44ee`
2. Deny `*`

Actually means:
1. Allow `Dataverse current environment`
2. Allow `00aa00aa-bb11-cc22-dd33-44ee44ee44ee`
3. Deny `*`

Allow `Dataverse current environment` is always implicitly the first rule in the Dataverse endpoint filtering list for any given environment.

### Azure Blob Storage 

Azure Blob Storage endpoints are represented by the Azure storage account name. 

### SMTP 

SMTP endpoints are represented in `<SMTP server address, port number>` format. 

Here's an example scenario:

1. Deny `smtp.gmail.com,587`
2. Allow `*`

### HTTP with Microsoft Entra ID, HTTP Webhook, and HTTP connectors

The endpoints for all HTTP connectors are represented by a URL pattern. The **Get web resource** action of the HTTP with Microsoft Entra connector is out of scope.

Here's an example scenario:

Allow access to only the Azure subscriptions page within `https://management.azure.com/`.

1. Allow `https://management.azure.com/subscriptions*`
2. Deny `https://management.azure.com/*`
3. Deny `*`

### Browser Automation

This feature lets you control which web pages a desktop flow accesses in Power Automate for desktop. The endpoints are represented in either URL format or web page name format, and you can use wildcards for dynamic URL or page name matching. Validation occurs during "Launch Web Browser" or "Go to web page" actions before a desktop flow proceeds with browser interactions.

> [!NOTE]
> Endpoint filtering isn't validated when "Launch Web Browser" actions are configured to attach to the foreground window. In such cases, the action isn't blocked unless access to all web pages is denied.

The following is an example scenario:

Allow access to all web pages except for the URL `https://www.microsoft.com/` and any URL or web page containing the string `powerplatform`.

1. Deny `https://www.microsoft.com/`
1. Deny `*powerplatform*`
1. Allow `*`

### UI Automation

This feature enables you to define which applications and screens a desktop flow can interact with in Power Automate for desktop. Endpoints are specified using the application's process name. If the process name is not unique—such as in the case of UWP or Java applications where multiple instances may share names like ApplicationFrameHost, java, or javaw—Power Automate for Desktop filters based on both the process name and the window display name to ensure accurate targeting. Wildcards are supported for flexible matching. Validation occurs on any action within the UI automation group. It checks the Process and/or Name attributes in the selector of the targeted screen, usually the parent of the related UI elements to determine if the interaction is permitted.

Endpoint filtering rules do not apply to variables or dynamically bound endpoints. If an expression includes anything other than a literal string, filtering is bypassed—potentially allowing access to restricted connector arguments. The default policy behavior is all endpoint filtering policies include a core rule (Allow * or Deny *), defaulting to Allow * (Allow All).
- When Allow * is enabled:
  - Dynamic values are not filtered. Any dynamic expression will bypass endpoint filtering, even if specific applications are restricted.
- When Deny * is enabled:
  - All dynamic values are blocked by default, ensuring stricter enforcement.

> [!NOTE]
> - Endpoint filtering is not enforced if the relevant attributes (Process or Name) are not part of the selector.
> - Endpoint filtering is not supported for certain Windows OS UI elements, including desktop icons, taskbar buttons, and components within the Start menu.

The following is an example scenario:

To allow access to all applications and screens except those where the Process or Name attribute is either exactly `Calculator` or contains the string `Java`, you would configure the following rules:

1. Deny `Calculator`
1. Deny `*Java*`
1. Allow `*`


## PowerShell support for endpoint filtering

### Configure endpoint filtering rules for a policy

The object that contains endpoint filtering rules for a policy is referred to below as the connector configurations.

The connector configurations object has the following structure:

```powershell
$ConnectorConfigurations = @{ 
  connectorActionConfigurations = @() # used for connector action rules
  endpointConfigurations = @( # array – one entry per 
    @{  
      connectorId # string
      endpointRules = @( # array – one entry per rule 
        @{ 
          order # number 
          endpoint # string
          behavior # supported values: Allow/Deny
        }
      ) 
    }
  ) 
}
``` 

**Notes**
-	The last rule for each connector should always be applied to URL `*`, to ensure that all URLs are covered by the rules.
-	The order property of the rules for each connector should be populated with numbers 1 to N, where N is the number of rules for that connector.

**Retrieve existing connector configurations for a DLP policy**

```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
``` 

**Create connector configurations for a DLP policy**

```powershell
New-PowerAppDlpPolicyConnectorConfigurations
``` 

**Update connector configurations for a DLP policy**

```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
``` 

**Example**

Goal:

For the SQL Server connector:
  -	Deny database “testdatabase” of server “myservername.database.windows.net”
  -	Allow all other databases of server “myservername.database.windows.net”
  -	Deny all other servers

For the SMTP connector:
  -	Allow Gmail (server address: smtp.gmail.com, port: 587)
  -	Deny all other addresses

For the HTTP connector:
  -	Allow endpoints `https://mywebsite.com/allowedPath1` and `https://mywebsite.com/allowedPath2` 
  -	Deny all other URLs

> [!NOTE]
> In the following cmdlet, *PolicyName* refers to the unique GUID. You can retrieve the DLP GUID by running the **Get-DlpPolicy** cmdlet.

```powershell
$ConnectorConfigurations = @{ 
  endpointConfigurations = @(
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_sql" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "myservername.database.windows.net,testdatabase" 
          behavior = "Deny"
        }, 
        @{ 
          order = 2 
          endpoint = "myservername.database.windows.net,*" 
          behavior = "Allow"
        }, 
        @{ 
          order = 3
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    }, 
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_smtp" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "smtp.gmail.com,587" 
          behavior = "Allow"
        }, 
        @{ 
          order = 2 
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    },
    @{  
      connectorId = "http" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "https://mywebsite.com/allowedPath1" 
          behavior = "Allow"
        }, 
        @{ 
          order = 2
          endpoint = "https://mywebsite.com/allowedPath2" 
          behavior = "Allow"
        }, 
        @{ 
          order = 3
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    } 
  ) 
}
New-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $PolicyName -NewDlpPolicyConnectorConfigurations $ConnectorConfigurations
```
