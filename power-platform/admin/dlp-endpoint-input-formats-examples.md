---
title: "Endpoint input formats and examples   | MicrosoftDocs"
description: Endpoints have to be entered in all possible formats in order to block makers from using them while creating apps and flows.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Endpoint input formats and examples 

Each connector has a different notion of what an endpoint means. Further, some endpoints can be defined in multiple formats. Therefore, endpoints have to be entered in all possible formats in order to block makers from using them while creating apps and flows. Admins can either enter the full endpoint name or use pattern matching with "`*`" when creating an endpoint filtering rule. These rules are entered and presented in an ordered list of endpoint patterns, meaning that they will be evaluated in ascending order of the Order #. Note that the last rule for any given connector is always "`*`" Allow or Deny (Allow by default, which can be changed to “Deny”). Below is guidance on how to enter connector endpoints while creating rules to allow or deny them. 

## SQL Server 

SQL Server connection endpoints have to be listed in `<Server_name, database_name>` format. A few things to keep in mind: 

- Server name can be entered in various formats by makers. Therefore, in order to truly address an endpoint, it has to be entered in all possible formats. For example, on-prem instances can be in `<machine_name\named_instance, database_name>` or `<IP address, custom port, database_name>` format. In this case, you will have to apply allow or block rules in both formats for an endpoint. For example,
  - “Block” “WS12875676\Servername1,MktingDB” 
  - “Block” “11.22.33.444,1401,MktingDB” 

- There is no special logic to handle relative addresses such as localhost. Therefore, if you block " `*localhost*` ", it will block makers from using any endpoints by using localhost as part of the SQL Server endpoint. However, it won’t stop them from accessing the endpoint using the absolute address unless the absolute address has also been blocked by the admin. 

Below are examples of a few scenarios: 

- Allow only Azure SQL Server instances: 
  1. “Allow” “`*`.database.windows.net`*`” 
  2. “Deny” “`*`” 

- Allow only specific IP range (note that the IP addresses that are not allowed can still be entered by maker using `<machine_name\named_instance>` format): 
  1. “Allow” “11.22.33`*`” 
  2. “Deny” “`*`” 

## Dataverse 

Dataverse endpoints are represented by the environment ID (also known as the org ID); for example, contoso.crm.dynamics.com. Please note that only the regular Dataverse connector is currently in scope for endpoint filtering. Dataverse dynamics and Dataverse current connectors are not in scope. Also, the local instance of Dataverse (also known as the current environment) can never be blocked for use within an environment. This means that within any given environment, makers can always access the Dataverse current environment. Therefore, a rule that says the following: 

1. “Allow” “contoso.crm.dynamics.com” 
2. “Deny” “`*`” 

Actually means: 

1. “Allow” “Dataverse current environment” 
2. “Allow” “contoso.crm.dynamics.com” 
3. “Deny” “`*`” 

“Allow” “Dataverse current environment” is always implicitly the first rule in the Dataverse endpoint filtering list for any given environment. 

Below are examples of a few scenarios: 

- Block Dataverse instances from a specific geography in a specific cloud : 
  1. “Deny” “`*`.crm2.dynamics.com” 
  2. “Allow” “`*`” 

- Allow only Dataverse instances that have “contoso” in the name: 
  1. “Allow” “`*`contoso`*`” 
  2. “Deny” “`*`” 

## Azure Blob Storage 

Azure Blob Storage endpoints are represented by the Azure storage account name. 

### SMTP 

SMTP endpoints are represented in `<SMTP server address, port number>` format. 

Below is an example scenario: 

1. “Deny” “smtp.gmail.com,587” 
2. “Allow” “`*`” 

### HTTP with Azure AD, HTTP Webhook, and HTTP connectors 

The endpoints for all HTTP connectors are represented by a URL pattern. "Get Web Resource" action of HTTP with Azure AD connector is out of scope. 

Below is an example scenario: 

Allow access to only Azure subscriptions page within https://management.azure.com/ 

1. “Allow” https://management.azure.com/subscriptions* 
2. “Deny” https://management.azure.com/* 
3. “Deny” “`*`” 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
