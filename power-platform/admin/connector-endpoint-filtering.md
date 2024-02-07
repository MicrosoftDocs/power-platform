---
title: "Connector endpoint filtering (preview) | MicrosoftDocs"
description: A description goes here.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/31/2023
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Connector endpoint filtering (preview)
[This article is pre-release documentation and is subject to change.]

Connector endpoint filtering allows admins to govern which specific endpoints makers can connect to when building apps, flows, or chatbots. It is configured within a data loss prevention (DLP) policy, and it is exclusively available for six connectors: 
- HTTP
- HTTP with Microsoft Entra ID (AD)
- HTTP Webhook
- SQL Server
- Azure Blob Storage 
- SMTP 

When a maker tries to connect their app, flow, or chatbot to a blocked endpoint, they will encounter a DLP error message.

> [!WARNING]
> Endpoint filtering rules are not enforced on environment variables, custom inputs, or any endpoint that is dynamically created at run-time. Only static endpoints are evaluated in the app, flow, or chatbot designers. For more information, see [Known limitations](#known-limitations).

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

After saving your connector endpoint filtering rules and the DLP policy in which they are defined, they become instantly enforced on the targeted environments. Below is an example where a maker tried to connect their cloud flow to an HTTP endpoint that is not allowed.

:::image type="content" source="media/EF_CloudFlow.png" alt-text="DLP error because of endpoint filtering rules.":::

## Known limitations
- Endpoint filtering rules are not enforced on environment variables, custom inputs, and dynamically bound endpoints during runtime. Only static endpoints known and selected when building an app, flow, or chatbot during design time are enforced. This implies that connector endpoint filtering rules for SQL Server and Azure Blob Storage are not enforced if the connections are authenticated with Microsoft Entra ID. In the two screenshots below, a maker has built a cloud flow that defines the SQL Server and database inside variables, and then uses those variables as input to the connection definition. Therefore, the endpoint filtering rules are not evaluated and the cloud flow can execute successfully.

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

Each connector has a different notion of what an endpoint means. Further, some endpoints can be defined in multiple formats. Therefore, endpoints have to be entered in all possible formats to block makers from using them while creating apps and flows. Admins can either enter the full endpoint name or use pattern matching with the wildcard character (`*`) when creating an endpoint filtering rule. These rules are entered and presented in an ordered list of endpoint patterns, meaning that they'll be evaluated in ascending order by number. Note that the last rule for any given connector is always `*` Allow or `*` Deny. Allow is the default, which can be changed to Deny. 

The following guidance describes how to enter connector endpoints while creating rules to allow or deny them. 

### SQL Server 

SQL Server connection endpoints have to be listed in `<Server_name, database_name>` format. A few things to keep in mind: 

- The server name can be entered in various formats by makers. Therefore, to truly address an endpoint, it has to be entered in all possible formats. For example, on-premises instances can be in `<machine_name\named_instance, database_name>` or `<IP address, custom port, database_name>` format. In this case, you'll have to apply allow or block rules in both formats for an endpoint. For example:
  - Block `WS12875676\Servername1,MktingDB` 
  - Block `11.22.33.444,1401,MktingDB`

- There's no special logic to handle relative addresses such as `localhost`. Therefore, if you block `*localhost*`, it will block makers from using any endpoints by using `localhost` as part of the SQL Server endpoint. However, it won't stop them from accessing the endpoint by using the absolute address, unless the absolute address has also been blocked by the admin. 

The following are examples: 

- Allow only Azure SQL Server instances: 
  1. Allow `*.database.windows.net*` 
  2. Deny `*`

- Allow only a specific IP range: (Note that the IP addresses that aren't allowed can still be entered by the maker in `<machine_name\named_instance>` format.) 
  1. Allow `11.22.33*` 
  2. Deny `*`

### Dataverse 

Dataverse endpoints are represented by the [organization ID](determine-org-id-name.md), such as, 7b97cd5c-ce38-4930-9497-eec2a95bf5f7. Please note that only the regular Dataverse connector is currently in scope for endpoint filtering. Dataverse dynamics and Dataverse current connectors are not in scope. Also, the local instance of Dataverse (also known as the current environment) can never be blocked for use within an environment. This means that within any given environment, makers can always access the Dataverse current environment. 

Therefore, a rule that says the following:

1. Allow `7b97cd5c-ce38-4930-9497-eec2a95bf5f7`
2. Deny `*`

Actually means:
1. Allow `Dataverse current environment`
2. Allow `7b97cd5c-ce38-4930-9497-eec2a95bf5f7`
3. Deny `*`

Allow `Dataverse current environment` is always implicitly the first rule in the Dataverse endpoint filtering list for any given environment.

### Azure Blob Storage 

Azure Blob Storage endpoints are represented by the Azure storage account name. 

### SMTP 

SMTP endpoints are represented in `<SMTP server address, port number>` format. 

The following is an example scenario: 

1. Deny `smtp.gmail.com,587` 
2. Allow `*`

### HTTP with Microsoft Entra ID, HTTP Webhook, and HTTP connectors 

The endpoints for all HTTP connectors are represented by a URL pattern. The **Get web resource** action of the HTTP with Microsoft Entra connector is out of scope. 

The following is an example scenario: 

Allow access to only the Azure subscriptions page within `https://management.azure.com/`.

1. Allow `https://management.azure.com/subscriptions*`
2. Deny `https://management.azure.com/*` 
3. Deny `*`

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