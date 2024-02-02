---
title: Virtual Network support for Power Platform overview
description: "Learn more about Azure Virtual Network support for Power Platform."
ms.date: 2/1/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesh.pandey
search.audienceType: admin
ms.custom: "admin-security"
---

# Virtual Network support for Power Platform overview (Preview)

The [Virtual Network](/azure/virtual-network/virtual-networks-overview) (VNet) support for Power Platform helps you integrate from Microsoft Cloud services to resources within your virtual network without the need of exposing your resources over public internet. VNet support for Power Platform is using [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview) to manages outbound traffic at runtime from Power Platform. Therefore, you don't need to route outbound traffic from Power Platform services to the internet.

vNet support for Power Platform is optimized to handle API (Application Programming Interface) workloads i.e. to handle high request volume, low execution time for requests and [VNet Data Gateway](https://learn.microsoft.com/en-us/data-integration/vnet/overview) is optimized to handle ETL (Extract, Transform, Load) workloads i.e. to handle low request volume, high execution time for requests.

vNet support for Power Platform is the only recommended option to secure outbound connectivity from Power Platform services except [Power BI](https://learn.microsoft.com/en-us/data-integration/vnet/use-data-gateways-sources-power-bi) and [Power Platform dataflows](https://learn.microsoft.com/en-us/data-integration/vnet/data-gateway-power-platform-dataflows) (PPDF). Power BI and PPDF will continue to use vNet Data Gateway.

Using Virtual Network, you can:

- Integrate Dataverse and Power Platform with your own services within your network.

  For example, Dataverse or Power Platform components can call resources owned by your enterprise . These resources can be either Azure-hosted or on-premises.
- Use plug-ins or connectors to make outbound calls.

  For example, a call from a Dataverse plug-in is made to a Snowflake instance hosted on Azure.

## Private networks

With public networks, enterprise resources must be accessible from a list of Azure IP ranges or service tags, which describe public IP addresses. These integrations happen on the public internet infrastructure. But a virtual network allows you to use a private network, while still integrating with cloud services.

Azure services are protected within a virtual network through [private endpoints](/azure/private-link/private-endpoint-overview). You can bring your on-premise resources to the virtual network through [Express Route](/azure/expressroute/), which allows you to protect and monitor the entire virtual network.

In a virtual network, you have full control over the egress traffic from Power Platform. The traffic is subjected to network policies applied by your network administrator.

:::image type="content" source="media/vnet-support/vnet-support-traffic.png" alt-text="Screenshot that shows how a virtual network interacts with resources." lightbox="media/vnet-support/vnet-support-traffic.png":::

## Virtual network benefits

 With Virtual Network support, you get all the [benefits](/azure/virtual-network/subnet-delegation-overview#advantages-of-subnet-delegation) that Azure subnet delegation provides.

- **Data protection**: Virtual Network allows Power Platform services to connect to your private and protected resources without exposing them to the internet.

- **No unauthorized access**: Virtual Network connects with your resources without needing Power Platform IP ranges or service tags in the connection.

## Scenarios using Virtual Network support

With a virtual network, you can use secured, private, outbound connectivity with partner software. For example, Dataverse plug-ins enhance data integration security with external data sources from your Power Apps, Power Automate, and Dynamics 365 apps.

### Private connections to data sources

- Use Dataverse plug-ins to connect to your on-premises data sources such as SQL server, Oracle, or SAP. You protect your data from data breaches and other external threats.

- Use other partner plug-ins to connect to your cloud data sources such as Azure SQL, Azure Storage, blob storage, or Azure Key Vault. You protect your data from data exfiltration and other incidents.

### Secure access using connectors (coming soon)

With these connectors in a virtual network, use Power Platform to securely access services or manipulate and protect data from your apps. You can connect from Power Apps, Power Automate, and Dynamics 365 Apps.

- **Azure SQL**: Protects your data from data exfiltration and other external threats.

- **Azure File Storage** or **Blob Storage**: Protects your data from data breaches and other incidents.

- **Azure Key Vault**: Doesn't expose secrets to the internet and protects your data from data leaks and other risks.

- **Http with Microsoft Entra ID**: Authenticates with Azure AD and protects your data from external attacks and data leaks.

- **Azure Queue**: Doesn't expose endpoints to the public internet.

- **Custom**: Connects any service hosted within your virtual network.

## Supported regions

Confirm that your Power Platform environment and enterprise policy are in supported Power Platform and Azure regions, respectively. For example, if your Power Platform environment is in the United States, then your virtual network, subnets and enterprise policy must be either in the `eastus` or `westus` Azure region.

| Power Platform region | Azure region                      |
|-----------------------|-----------------------------------|
| United States         | eastus, westus                    |
| South Africa          | eouthafricanorth, southafricawest |
| Uk                    | uksouth, ukwest                   |
| Japan                 | japaneast, japanwest              |
| India                 | centralindia, southindia          |
| France                | francecentral, francesouth        |
| Europe                | westeurope, northeurope           |
| Germany               | germanynorth, germanywestcentral  |
| Switzerland           | switzerlandnorth, switzerlandwest |
| Canada                | canadacentral, canadaeast         |
| Brazil                | brazilsouth, southcentralus       |
| Australia             | australiasoutheast, australiaeast |
| Asia                  | eastasia, southeastasia           |
| UAE                   | uaecentral, uaenorth              |
| Korea                 | koreasouth, koreacentral          |
| Norway                | norwaywest, norwayeast            |
| Singapore             | southeastasia                     |
| Sweden                | swedencentral                     |

## Supported services

The current status of services onboarded to the Azure subnet delegation for Virtual Network support for Power Platform.
<!-- "COMING SOON" CAN HAVE NEGATIVE RAMIFICATIONS -->
| Area       | Power Platform Services                                                   | vNet support                  |
|------------|---------------------------------------------------------------------------|-------------------------------|
| Dataverse  | Dataverse Plug-ins                                                        | Public preview                |
| Connectors | Azure SQL                                                                 | Coming soon                   |
|            | Azure Queue                                                               | Coming soon                   |
|            | Azure Key Vault                                                           | Coming soon                   |
|            | Http with Microsoft Entra ID                                              | Coming soon                   |
|            | Custom                                                                    | Coming soon                   |
|            | Azure File Storage                                                        | Coming soon                   |
|            | Azure Blob Storage                                                        | Coming soon                   |
|            | SFTP-SSH                                                                  | Coming soon                   |
|            | Azure SQL Data Warehouse                                                  | Coming soon                   |


## Licensing requirements

Licensing requirements for Virtual Network support for Power Platform will be announced when the service is closer to general availability.

## How to enable Virtual Network support on a Power Platform environment

When you enable Virtual Network support in a Power Platform environment, all supported services, like a Dataverse plug-ins or a SQL connector, execute requests at runtime in your delegated subnet. Once enabled, your services are subjected to your network policies.

For example, a SQL connector might try to connect to SQL through the public internet, but your network policy doesn't allow public connections to the SQL server in your virtual network. The call from the SQL connector fails.

To avoid a failed connection, you can add your SQL server to your virtual network. Alternatively, if the server is in Azure, you can enable a private endpoint on Azure SQL before you enable your virtual network support in a Power Platform environment.

### Prerequisites

Before enabling Virtual Network support in Power Platform:

- Review your apps, flows and plug-ins code to ensure that they connect over your virtual network. Ensure they're not calling endpoints available over the public internet.

- If your apps, flow, and plug-ins need to connect to public endpoints, ensure that your firewall or network configuration allows such calls.

## Setup and configuration

[Setup and configure Azure Virtual Network support for Power Platform](https://microsoft.sharepoint.com/:w:/t/CDS-Sandbox/Ea8ss50L1opIppTmEZAbDgEBwYjvdh4vx0EICTGcG_qAiQ?e=IWriek).

## FAQ

### 1. What's the difference between a virtual network data gateway and Azure Virtual Network support in Power Platform?

#### Virtual network data gateway

The virtual network data gateway is a managed gateway that allows you to access Azure and Power Platform services from within your virtual network without an on-premises data gateway. You don't need to set up an on-premises virtual network data gateway. For more information, see [Virtual network data gateway architecture](/data-integration/vnet/data-gateway-architecture#hardware).

A virtual network data gateway continues to support ETL (extract, transform, load) workloads, for example Power BI and Power Platform dataflows. A virtual network data gateway is optimized for ETL workloads.

#### Azure Virtual Network support

Virtual Network support in Power Platform uses an Azure subnet delegation for your Power Platform environment. Subnets are used by workloads within the environment.

Virtual Network support is used for Power Platform API workloads as the requests are short lived and optimized for a large number of requests.

### 2. How can you ensure a virtual network subnet or data gateway from one customer isn't used by another customer in Power Platform?

Virtual Network support in Power Platform ensures that one customer cannot access the subnets of other customers by having following measures in place:

- Virtual Network support in Power Platform uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview).

- Every Power Platform environment is linked to a particular vNet/subnet. Only calls from that environment are allowed to access that vNet.

- Azure Subnet delegation is a feature that allows you to designate a specific subnet for an Azure PaaS (platform as a service) service of your choice that needs to be injected into your virtual network. When you delegate the subnet to an Azure service (Power Platform Enterprise Policy), you allow that service to establish some basic network configuration rules for the subnet, which help the Azure service operate their instances in a stable manner. No other azure service can have access to this subnet. Even if someone tries to delegate a subnet which is used by other azure service, it will fail.

### 3. Does it support failover?

   Yes, vNet support in Power Platform supports failover. It will be mandatory for you to delegate a primary and failover vNet and Subnets during the configuration in public preview.

### 4. How can Power Platform Environment in one region connect to resources hosted in another region?

   vNet linked to Power Platform environment must reside in the [Power Platform environment's regions](/power-platform/admin/regions-overview#what-regions-are-available). If an existing vNet is in other region, one will need to create a new vNet in environment region and then use [vNet peering](/azure/virtual-network/virtual-network-peering-overview) between vNet across regions.

### 5. Will I be able to monitor egress traffic from these delegated subnets?  
    Yes, you can use NSGs (National Security Group) and /or firewalls to monitor egress traffic from delegated subnets.

### 6. How many IPs does Power Platform require in the subnet to be delegated?  
    We currently request at least /24 CIDR (Classless Inter-domain Routing) (255 IPs) in the subnet that will be delegated to Power Platform. If you are planning to delegate the same subnet to multiple environments, then you may need to provision more IPs within that subnet.

### 7. Will I be able to make internet bound calls from plugins once my environment is subnet delegated?  
    You will be able to make internet bound calls from plugins **<u>only</u>** if the subnet is configured with a [NAT Gateway](/azure/nat-gateway/nat-overview)

### 8. Can I use vNet Data Gateway for SQL connector and Custom Connector?

   vNet using Azure Subnet Delegation is only supported option for SQL and Custom Connectors for outbound connectivity from Power Platform.

### 9. Can I update the subnet IP address range after it has been delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

   No, you cannot update the IP address range of the subnet once it has been delegated to "Microsoft.PowerPlatform/enterprisePolicies".

   Dataverse Plugin and Subnet Delegation Specific questions

### 10. My Vnet has custom DNS (Domain Name Service) configured. Will Power Platform use that?  

   Yes, Power Platform will use the custom DNS configured within the VNET (Virtual network) that holds the delegated subnet to resolve all the endpoints. This means that once the environment is delegated, you may need to update plugin code/ connector code to use the correct URL of the endpoint so that your custom DNS is able to resolve them.

### 11. My environment has ISV provided plugins. Would they also be subjected to run in the delegated subnet?  

   Yes, all customer plugins and ISV plugins will be run using your subnet. So, if the ISV plugins have outbound connectivity, those URLs might need to be allow listed in your firewall.

### 12. I am planning to use this feature to connect to my on-premises endpoints and those endpoints TLS (Transport Layer Security) certificates are not signed by well-known Root CA (certification authorities). Do you support such scenarios?

   No, even though the plugins/ connectors are running within customer subnet, we still need to ensure that the endpoint presents a TLS certificate with the complete chain and the Root CA is well-known and it is not possible to add your custom Root CA to our list of well-known CAs (certification authorities).

### 13. Is there any recommendation on setup of vNet 's within customer tenant?

   No, we do not recommend any specific topology, however Hub and spoke topology is widely used by our customers.
