---
title: Configure connector endpoint filtering (preview)
description: Learn how to use connector endpoint filtering as part of a data loss prevention policy to govern the endpoints makers can connect to in Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/31/2023
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
ms.custom:
  - "admin-security"
  - bap-template
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Configure connector endpoint filtering (preview)

> [!Important]
> [!Include [preview](../includes/cc-preview-features-definition.md)]

Use connector endpoint filtering as part of a data loss prevention (DLP) policy to govern the endpoints makers can connect to when they build apps, flows, and chatbots with the following connectors:

- HTTP
- HTTP with Azure Active Directory (Azure AD)
- HTTP Webhook
- SQL Server
- Azure Blob Storage
- SMTP

When makers try to connect to a blocked endpoint, they encounter a DLP error message.

:::image type="content" source="media/EF_CloudFlow.png" alt-text="Screenshot showing a DLP error message triggered by an endpoint filtering rule.":::

## Add endpoint filtering rules to your DLP policies

1. Sign in to the Power Platform admin center.
1. In the left side panel, select **Policies**.
1. [Create](create-dlp-policy.md) or [edit](prevent-data-loss.md#edit-a-dlp-policy) a policy.
1. On the **Prebuilt connectors** page, if the value of the **Endpoint configurable** column is **Yes**, select the connector, and then select **Configure connector** > **Connector endpoints (preview)**.

    You can select **Configure connector** in the command bar at the top of the page or on the **More actions** (**&hellip;**) menu. **Configure connector** is available for blockable connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

    :::image type="content" source="media/dlp-configure-connector-connector-endpoints.png" alt-text="Screenshot of the Prebuilt connectors page showing endpoint configuration options.":::

1. To add an endpoint rule, select **+ Add endpoint**.
1. Enter a server name, database name, or URL pattern endpoint.
1. Select **Allow** or **Deny** as the action to enforce.
1. Use the **Order** list or the arrows in the **Move up** and **Move down** columns to change the order of the rules.
1. Select **Save**.

Rules are evaluated in the order they appear in the list. New rules are added as the second-to-the-last row. The last row is always a rule for the wildcard character (`*`), which applies to all endpoints in the connector. By default, the `*` pattern is allowed for new DLP policies, but you can change it to **Deny**.

:::image type="content" source="media/dlp-delete-pattern.png" alt-text="Screenshot of the Configure endpoints page.":::

To delete a rule, select it, and then select **Delete**.

## Known limitations

- Endpoint filtering rules aren't enforced on environment variables, custom inputs, and dynamically bound endpoints at runtime. Only static endpoints that are known and selected when an app, flow, or chatbot is designed are enforced.

  The previous statements imply that connector endpoint filtering rules for SQL Server and Azure Blob Storage aren't enforced if the connections are authenticated with Azure AD. In the following two screenshots, a maker has built a cloud flow that defines the SQL Server and database in variables, and then uses those variables as input to the connection definition. The endpoint filtering rules aren't evaluated, and the cloud flow can execute successfully.

  :::image type="content" source="media/EF_KnownLimitation_1.png" alt-text="Screenshot of a Power Automate design canvas showing a cloud flow that uses variables to connect to SQL.":::

  :::image type="content" source="media/EF_KnownLimitation_2.png" alt-text="Screenshot of a Power Automate design canvas showing the cloud flow after a successful run.":::

- Some apps that were published before October 1, 2020, need to be republished before connector action rules and endpoint rules for DLP policies are enforced. Run the following script to identify apps that must be republished.

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

## Endpoint formats and examples

Each connector has a different notion of what an endpoint means, and some endpoints can be defined in multiple formats. Therefore, endpoints have to be entered in all possible formats to block makers from using them in their apps and flows.

You can either enter the full endpoint name or use pattern matching with the wildcard character (`*`) in your endpoint filtering rules. The following guidance offers some examples.

### SQL Server

SQL Server connection endpoints have to be listed in `<Server_name, database_name>` format.

Makers can specify the server name in different formats. To truly address an endpoint, create rules that encompass all possible formats.

For example, on-premises instances can be formatted as `<machine_name\named_instance, database_name>` or `<IP address, custom port, database_name>`. The following examples block both formats:

- Block `WS12875676\Servername1,MktingDB`
- Block `11.22.33.444,1401,MktingDB`

There's no special logic to handle relative addresses like `localhost`. If you block `*localhost*`, it blocks makers from using any endpoints that use `localhost` as part of the SQL Server endpoint. However, it doesn't stop them from accessing the endpoint by using the absolute address, unless you've also blocked the absolute address.

Example: Allow only Azure SQL Server instances:

  1. Allow `*.database.windows.net*`
  2. Deny `*`

Example: Allow only a specific IP range:

  1. Allow `11.22.33*`
  2. Deny `*`

A maker can still use the `<machine_name\named_instance>` format to enter IP addresses that aren't allowed.

### Dataverse

Dataverse endpoints are represented by the [organization ID](determine-org-id-name.md); for example, `7b97cd5c-ce38-4930-9497-eec2a95bf5f7`.

Endpoint filtering is only available for the regular Dataverse connector, not for Dataverse dynamics and Dataverse current connectors. Also, the local instance of Dataverse, also known as the current environment, can never be blocked. In any environment, makers can always access the Dataverse current environment.

Therefore, the following rules:

1. Allow `7b97cd5c-ce38-4930-9497-eec2a95bf5f7`
2. Deny `*`

&hellip;actually mean:

1. Allow `Dataverse current environment`
2. Allow `7b97cd5c-ce38-4930-9497-eec2a95bf5f7`
3. Deny `*`

**Allow `Dataverse current environment`** is always implicitly the first rule in the Dataverse endpoint filtering list for any environment.

### Azure Blob Storage

Azure Blob Storage endpoints are represented by the Azure storage account name.

### SMTP

SMTP endpoints are represented in `<SMTP server address, port number>` format; for example, `smtp.gmail.com,587`.

### HTTP with Azure AD, HTTP Webhook, and HTTP connectors

The endpoints for all HTTP connectors are represented by a URL pattern.

Endpoint filtering isn't available for the **Get web resource** action of the HTTP with Azure AD connector.

Example: Allow access to only the Azure subscriptions page in `https://management.azure.com/`:

1. Allow `https://management.azure.com/subscriptions*`
2. Deny `https://management.azure.com/*`
3. Deny `*`

## Use PowerShell to manage endpoint filtering

### Configure endpoint filtering rules for a policy

The connector configurations object contains the endpoint filtering rules for a policy. It has the following structure:

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

- The last rule for each connector should always be applied to URL `*`, to make sure the rules cover all URLs.
- Populate the order property of the rules for each connector with numbers 1 to N, where N is the number of rules for the connector.

### Retrieve connector configurations for a DLP policy

```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
```

### Create connector configurations for a DLP policy

```powershell
New-PowerAppDlpPolicyConnectorConfigurations
```

### Update connector configurations for a DLP policy

```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
```

The following example accomplishes several goals.

- For the SQL Server connector:

  - Deny database "testdatabase" of server "myservername.database.windows.net"
  - Allow all other databases of server "myservername.database.windows.net"
  - Deny all other servers
  
- For the SMTP connector:

  - Allow Gmail (server address: smtp.gmail.com, port: 587)
  - Deny all other addresses
  
- For the HTTP connector:

  - Allow endpoints `https://mywebsite.com/allowedPath1` and `https://mywebsite.com/allowedPath2`
  - Deny all other URLs

In the cmdlet, *PolicyName* refers to the unique GUID. Run the **Get-DlpPolicy** cmdlet to retrieve the DLP GUID.

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
