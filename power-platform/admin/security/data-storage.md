---
title: Data storage and governance in Power Platform
description: Learn how data is stored and governed in Power Platform.
ms.date: 04/17/2025
ms.service: power-platform
ms.topic: concept-article
ms.custom: 
  - "admin-security"
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors: 
- alaug
ms.contributors:
- alaug
- nyarbrough
- jacobstokes
---
# Data storage and governance in Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The Power Platform processes both **personal data** and **customer data**. Learn more about personal data and customer data at the [Microsoft Trust Center](https://www.microsoft.com/trustcenter).

## Data residency

A Microsoft Entra tenant houses information that's relevant to an organization and its security. When a Microsoft Entra tenant signs up for Power Platform services, the tenant's selected country or region is mapped to the most suitable Azure geography where a Power Platform deployment exists. Power Platform stores customer data in the tenant's assigned Azure geography, or *home geo*, except where organizations deploy services in multiple regions.

Some organizations have a global presence. For example, a business may be headquartered in the United States but do business in Australia. It may need certain Power Platform data to be stored in Australia to comply with local regulations. When Power Platform services are deployed in more than one Azure geography, it's referred to as a *multi-geo* deployment. In this case, only metadata related to the environment is stored in the home geo. All metadata and product data in that environment is stored in the remote geo.

Power Platform services are available in specific Azure geographies. For more information about where Power Platform services are available, where your data is stored and replicated to for resiliency, and how it's used, go to [Microsoft Trust Center](https://www.microsoft.com/trustcenter). Commitments concerning the location of customer data at rest are specified in the Data Processing Terms of the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31). Microsoft also provides data centers for [sovereign entities](../regions-overview.md).

## Data handling

This section outlines how Power Platform stores, processes, and transfers customer data.

### Data at rest

Unless otherwise stated in documentation, customer data remains in its original source (for example, Dataverse or SharePoint). A Power Platform app is stored in Azure Storage as part of an environment. Data used in mobile apps is encrypted and stored in SQL Express. In most cases, apps use Azure Storage to persist Power Platform service data and Azure SQL Database to persist service metadata. Data that's entered by app users is stored in the respective data source for the service, such as Dataverse.

All data persisted by Power Platform is encrypted by default using Microsoft-managed keys. Customer data stored in Azure SQL Database is fully encrypted using Azure SQL's Transparent Data Encryption (TDE) technology. Customer data stored in Azure Blob storage is encrypted using Azure Storage Encryption.

### Data in processing

Data is in processing when it's being used as part of an interactive scenario, or when a background process, such as a refresh, touches it. Power Platform loads data in processing into the memory space of one or more service workloads. To facilitate the workload's functionality, data that's stored in memory isn't encrypted.

### Data in transit

Power Platform requires all incoming HTTP traffic to be encrypted using TLS 1.2 or higher. Requests that try to use TLS 1.1 or lower are rejected.

## Advanced security features

Some of Power Platform's advanced security features have specific licensing requirements.

### Service tags

A service tag represents a group of IP address prefixes from a specified Azure service. You can use service tags to define network access controls on Network Security Groups or Azure Firewall.

Service tags help to minimize the complexity of frequent updates to network security rules. You can use service tags in place of specific IP addresses when you create security rules that, for example, allow or deny traffic for the corresponding service.

Microsoft manages the address prefixes encompassed by the service tag, and automatically updates the service tag as addresses change. For more information, see [Azure IP Ranges and Service Tags - Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519).

### Data loss prevention

Power Platform has an extensive set of [Data Loss Prevention (DLP) features](../prevent-data-loss.md) to help you manage the security of your data.  

## Storage Shared Access Signature (SAS) IP restriction

> [!NOTE]
> Prior to activating either of these SAS features, customers must first allow access to the `https://*.api.powerplatformusercontent.com` domain or most SAS functionalities won't work.

This feature set is tenant-specific functionality that restricts Storage Shared Access Signature (SAS) tokens and is controlled through a menu in the [Power Platform admin center](https://admin.powerplatform.microsoft.com). This setting restricts who, based on IP (IPv4 and IPv6) can use enterprise SAS tokens. 

These settings can be found in an environment’s **Privacy + Security** settings in the admin center. You must turn on the **Enable IP address based Storage Shared Access Signature (SAS) rule** option.

Admins can allow one of these four options for this setting:

| Option | Setting                 | Description                                                                                                                    |
|--------|-------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| 1      | IP Binding Only         | This restricts SAS keys to the requester’s IP.                                                                             |
| 2      | IP Firewall Only        | This restricts using SAS keys to only work within an admin specified range.                                                |
| 3      | IP Binding and Firewall | This restricts using SAS keys to work within an admin-specified range and only to the requestor's IP.                      |
| 4      | IP Binding or Firewall  | Allows SAS keys to be used within the specified range. If the request comes from outside the range, IP Binding is applied. |

> [!NOTE]
> Admins who chose to allow IP Firewall (Option 2, 3, and 4 listed in the table above) must enter **both** the IPv4 and IPv6 ranges of their networks to ensure proper coverage of their users.

> [!WARNING]
> Option 1 and 3 use IP Binding which doesn't work correctly if customers have IP Pools, Reverse Proxy, or Network Address Translation (NAT) enabled gateways used within their networks. This results in a user's IP address changing too frequently for a requester to reliably have the same IP between the read/write operations of the SAS.
>
> Options 2 and 4 work as intended.


#### Products enforcing IP Binding when enabled:
- Dataverse
- Power Automate
- Custom Connectors
- Power Apps

#### Impact on the user experience

- **When a user, who doesn't meet an environment’s IP address restrictions, opens an app**: Users get an error message citing a generic IP issue.

- **When a user, who does meet the IP address restrictions, opens an app**: The following events occur:

  - Users may get a banner that will quickly disappear letting users know an IP setting has been set and to contact the admin for details or to refresh any pages that lose connection.
  - More significantly, due to the IP validation that this security setting uses, some functionality may perform slower than if it was turned off.


#### Update settings programatically
Admins can use automation to set and update both the IP binding vs firewall setting, the IP range that is allow-listed, and the **Logging** toggle. Learn more in [Tutorial: Create, update, and list Environment Management Settings](../programmability-tutorial-environmentmanagement-settings.md).

### Logging of SAS calls
This setting enables all SAS calls within Power Platform to be logged into Purview. This logging shows the relevant metadata for all creation and usage events and can be enabled independently of the above SAS IP restrictions. Power Platform services are currently onboarding SAS calls in 2024.

| Field name                                   | Field description                                                                                              |
|----------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| response.status_message                      | Informing if the event was successful or not: SASSuccess or SASAuthorizationError.                             |
| response.status_code                         | Informing if the event was successful or not: 200, 401, or 500.                                                |
| ip_binding_mode                              | IP binding mode set by a tenant admin, if turned on. Applies to SAS creation events only.                        |
| admin_provided_ip_ranges                     | IP ranges set by a tenant admin, if any. Applies to SAS creation events only.                                  |
| computed_ip_filters                          | Final set of IP filters bound to SAS URIs based on IP binding mode and the ranges set by a tenant admin. Applies to both SAS creation and usage events.                              |
| analytics.resource.sas.uri                   | The data that was attempting to be accessed or created.                                                        |
| enduser.ip_address                           | The public IP of the caller.                                                                                   |
| analytics.resource.sas.operation_id          | The unique identifier from the creation event. Searching by this shows all usage and creation events related to the SAS calls from the creation event. Mapped to the “x-ms-sas-operation-id” response header.                                                                                 |
| request.service_request_id                   | Unique identifier from the request or response and can be used to look up a single record. Mapped to the “x-ms-service-request-id” response header.     |
| version                                      | Version of this log schema.                                                                                    |
| type                                         | Generic response.                                                                                              |
| analytics.activity.name                      | The type of activity this event was: Creation or Usage.                                                        |
| analytics.activity.id                        | Unique ID of the record in Purview.                                                                            |
| analytics.resource.organization.id           | Org ID                                                                                                         |
| analytics.resource.environment.id            | Environment ID                                                                                                 |
| analytics.resource.tenant.id                 | Tenant ID                                                                                                      |
| enduser.id                                   | The GUID from Microsoft Entra ID of the creator from the creation event.                                       |
| enduser.principal_name                       | The UPN/email address of the creator. For usage events this is a generic response: “system@powerplatform”.     |
| enduser.role                                 | Generic response: **Regular** for creation events and **System** for usage events.                             |

### Turn on Purview audit logging
In order for the logs to show in your Purview instance, you must first opt into it for each environment that you want logs for. This setting can be updated in the Power Platform admin center by a **tenant admin**. 

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and log in with tenant admin credentials.
1. In the left navigation pane, select **Environments**.
1. Select the environment that you want to turn on admin logging for.
1. Select **Settings** in the command bar.
1. Select **Product** >  **Privacy + Security**. 
1. Under **Storage Shared Access Signature (SAS) Security Settings (Preview)**, turn on the **Enable SAS Logging in Purview** feature.

## Search audit logs
Tenant admins can use Purview to view audit logs emitted for SAS operations, and can self-diagnose errors that may be returned in IP validation issues. Logs in Purview are the most reliable solution.

Use the following steps to diagnose issues or better understand SAS usage patterns within your tenant.

1. Make sure audit logging is turned on for the environment. See [Turn on Purview audit logging](#turn-on-purview-audit-logging).
1. Go to the [Microsoft Purview compliance portal](https://compliance.microsoft.com) and log in with tenant admin credentials.
1. In the left navigation pane, select **Audit**. If this option isn't available to you, it means the logged-in user doesn't have admin access to query audit logs.
1. Pick the date and time range in UTC for when you're trying to look for logs. For example, when a 403 Forbidden error with an **unauthorized_caller** error code was returned.
1. From the **Activities - friendly names** dropdown list, search for **Power Platform storage operations** and select **Created SAS URI** and **Used SAS URI**.
1. Specify a keyword in **Keyword Search**. See [Get started with search](/purview/audit-search?tabs=compliance-portal#get-started-with-search) in the Purview documentation to learn more about this field. You may use a value from any of the fields described in the table above depending on your scenario, but below are the recommended fields to search on (in order of preference):
    - The value of **x-ms-service-request-id** response header. This filters the results to one SAS URI Creation event or one SAS URI usage event, depending on which request type the header is from. It's useful when investigating a 403 Forbidden error returned to the user. It can also be used to grab the **powerplatform.analytics.resource.sas.operation_id** value.
    - The value of **x-ms-sas-operation-id** response header. This filters the results to one SAS URI creation event and one or more usage events for that SAS URI depending on how many times it was accessed. It maps to the **powerplatform.analytics.resource.sas.operation_id** field.
    - Full or partial SAS URI, minus the signature. This might return many SAS URI creations and many SAS URI usage events, because it's possible for the same URI to be requested for generation as many times, as needed.
    - Caller IP address. Returns all creation and usage events for that IP.
    - Environment ID. This might return a large set of data that can span across many different offerings of Power Platform, so avoid if possible or consider narrowing down the search window.

    > [!WARNING]
    > We don't recommended searching for User Principal Name or Object ID, as those are only propagated to creation events, not usage events.

1. Select **Search** and wait for results to appear.

    :::image type="content" source="media/purview-search.png" alt-text="A new search":::


> [!WARNING]
> Log ingestion into Purview can be delayed for up to an hour or more, so keep that in mind when looking for most recent events.

### Troubleshooting 403 Forbidden/unauthorized_caller error
You can use creation and usage logs to determine why a call would result in a 403 Forbidden error with an **unauthorized_caller** error code.

1. Find logs in Purview as described in the previous section. Consider using either **x-ms-service-request-id** or **x-ms-sas-operation-id** from the response headers as the search keyword.
1. Open the usage event, **Used SAS URI**, and look for the **powerplatform.analytics.resource.sas.computed_ip_filters** field under **PropertyCollection**. This IP range is what the SAS call uses to determine whether the request is authorized to proceed or not.
1. Compare this value against the **IP Address** field of the log, which should be sufficient for determining why the request failed.
1. If you think the value of **powerplatform.analytics.resource.sas.computed_ip_filters** is incorrect, continue with the next steps.
1. Open the creation event, **Created SAS URI**, by searching using the **x-ms-sas-operation-id** response header value (or the value of **powerplatform.analytics.resource.sas.operation_id** field from the creation log).
1. Get the value of **powerplatform.analytics.resource.sas.ip_binding_mode** field. If it's missing or empty, it means IP binding wasn't turned on for that environment at the time of that particular request.
1. Get the value of **powerplatform.analytics.resource.sas.admin_provided_ip_ranges**. If it's missing or empty, it means IP firewall ranges weren't specified for that environment at the time of that particular request.
1. Get the value of **powerplatform.analytics.resource.sas.computed_ip_filters**, which should be identical to the usage event and is derived based on IP binding mode and admin-provided IP firewall ranges. See the derivation logic in [Data storage and governance in Power Platform](data-storage.md#storage-shared-access-signature-sas-ip-restriction).

This should give tenant admins enough information to correct any misconfiguration against the environment for IP binding settings.

> [!WARNING]
> Changes made to environment settings for SAS IP binding can take at least 30 minutes to take effect. It could be more if partner teams have their own cache.

### Related articles

[Security in Microsoft Power Platform](./overview.md)  
[Authenticating to Power Platform services](./authenticate-services.md)  
[Connecting and authenticating to data sources](./connect-data-sources.md)  
[Power Platform security FAQs](./faqs.md)  

### See also

- [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
- [Choose the region when setting up an environment](../regions-overview.md)
- [Azure IP Ranges and Service Tags - Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Data Loss Prevention (DLP) features](../prevent-data-loss.md)
