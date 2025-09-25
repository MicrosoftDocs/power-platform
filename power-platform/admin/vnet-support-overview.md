---
title: Virtual Network support overview
description: Learn about Microsoft Azure Virtual Network support for Power Platform and Dynamics 365 apps.
author: faix
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/25/2025
ms.subservice: admin
ms.author: osfaixat
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - matapg007
  - wifun
  - matapg007
---

# Virtual Network support overview

With [Azure Virtual Network](/azure/virtual-network/virtual-networks-overview) support for Power Platform, you can integrate Power Platform with resources inside your virtual network without exposing them over the public internet. Virtual Network support uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview) to manage outbound traffic from Power Platform at runtime. Using Azure Subnet delegation avoids the need for protected resources to be available over the internet to integrate with Power Platform. With virtual network support, Power Platform components can call resources owned by your enterprise inside your network, whether they're hosted in Azure or on-premises, and use plug-ins and connectors to make outbound calls.

Power Platform typically integrates with enterprise resources over public networks. With public networks, enterprise resources must be accessible from a list of Azure IP ranges or service tags, which describe public IP addresses. However, Azure Virtual Network support for Power Platform allows you to use a private network and _still_ integrate with cloud services or services that are hosted inside your enterprise network.

Azure services are protected inside a Virtual Network by [private endpoints](/azure/private-link/private-endpoint-overview). You can use [Express Route](/azure/expressroute/) to bring your on-premises resources inside the Virtual Network.

Power Platform uses the Virtual Network and subnets that you delegate to make outbound calls to enterprise resources over the enterprise private network. Using a private network eliminates the need to route the traffic over the public internet, which could expose enterprise resources.

In a Virtual Network, you have full control over the outbound traffic from Power Platform. The traffic is subject to network policies applied by your network administrator. The following diagram shows how resources inside your network interact with a Virtual Network.

:::image type="content" source="media/vnet-support/vnet-support-traffic.png" alt-text="Screenshot of how resources inside an enterprise network interact with a Virtual Network." lightbox="media/vnet-support/vnet-support-traffic.png":::

## Benefits of Virtual Network support

With Virtual Network support, your Power Platform and Dataverse components get all the [benefits](/azure/virtual-network/subnet-delegation-overview#advantages-of-subnet-delegation) that Azure subnet delegation provides, such as:

- **Data protection**: Virtual Network allows Power Platform services to connect to your private and protected resources without exposing them to the internet.

- **No unauthorized access**: Virtual Network connects with your resources without needing Power Platform IP ranges or service tags in the connection.

## Estimating subnet size for Power Platform environments

Over the past year, telemetry data and observations indicate that production environments typically require 25 to 30 IP addresses, with most use cases falling within this range. Based on this information, we recommend allocating 25 to 30 IPs for production environments and 6 to 10 IPs for nonproduction environments, such as sandbox or developer environments. IP addresses within the subnet are primarily used by containers connected to the Virtual Network. Once the environment starts being used, a minimum of four containers will be created, which dynamically scale based on call volume, though they typically remain within the 10 to 30 container range. These containers are responsible for executing all requests for their respective environments and efficiently handling parallel connection requests.

### Planning for multiple environments

If using the same delegated subnet for multiple Power Platform environments, you may need a larger block of classless inter-domain routing (CIDR) IP addresses. Consider the recommended amount of IP addresses for production and nonproduction environments when linking environments to a single policy. Keep in mind that each subnet reserves five IP addresses, which must be factored into your estimation.

> [!NOTE]
> To enhance visibility into resource utilization, we're working on exposing delegated subnet IP consumption for enterprise policies and subnets.

### Example IP allocation

Consider a tenant with two enterprise policies. The first policy is for production environments, while the second policy is for nonproduction environments.

#### Production enterprise policy

If you have four production environments associated to your enterprise policy, each requiring 30 IPs. The total IP allocation would be as follows:

(Four environments x 30 IPs) + 5 reserved IPs = 125 IPs

This scenario requires a CIDR block of **/25**, which has capacity for 128 IPs.

#### Nonproduction enterprise policy

For a nonproduction enterprise policy with 20 developer and sandbox environments&mdash;each requiring 10 IPs&mdash;the total IP allocation would be as follows:

(Twenty environments x 10 IPs) + 5 reserved IPs = 205 IPs

This scenario would require a CIDR block of **/24**, which has capacity for 256 IPs and has enough space to add more environments to the enterprise policy.

## Supported scenarios

Power Platform enables Virtual Network support for both Dataverse plug-ins and [connectors](vnet-support-overview.md#supported-services). With this support, you can establish secured, private, outbound-connectivity from Power Platform to resources within your Virtual Network. Dataverse plug-ins and connectors enhance data integration security by connecting to external data sources from Power Apps, Power Automate, and Dynamics 365 apps. For example, you can:

- Use [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) to connect to your cloud data sources, such as Azure SQL, Azure Storage, blob storage, or Azure Key Vault. You can protect your data from data exfiltration and other incidents.
- Use [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) to securely connect to private, endpoint-protected resources in Azure, such as Web API, or any resources within your private network, such as SQL and Web API. You can protect your data from data breaches and other external threats.
- Use [Virtual Network–supported connectors](vnet-support-overview.md#supported-services) such as [SQL Server](/connectors/sql/) to securely connect to your cloud-hosted data sources, such as Azure SQL or SQL Server, without exposing them to the internet. Similarly, you can use [Azure Queue](/azure/storage/queues/) connector to establish secure connections to private, endpoint-enabled Azure Queues.
- Use [Azure Key Vault](/connectors/keyvault/) connector to securely connect to private, endpoint-protected Azure Key Vault.
- Use [custom connectors](/connectors/custom-connectors/) to securely connect to your services that are protected by private endpoints in Azure or services that are hosted within your private network.
- Use [Azure File Storage](/connectors/azurefile/) to securely connect to private, endpoint-enabled Azure file storage.
- Use [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/) to securely fetch resources over Virtual Networks from various web services, authenticated by Microsoft Entra ID or from an on-premises web service.

### Limitations

- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins) that use connectors aren't supported until those connector types are updated to use subnet delegation.
- You use copy, backup, and restore [environment lifecycle operations](/dynamics365/fin-ops-core/dev-itpro/power-platform/environment-lifecycle-core-concepts#terminology-differences-between-lifecycle-services-and-power-platform-admin-center) on virtual network-supported Power Platform environments. The restore operation can be performed within the same virtual network, and across different environments, provided they're connected to the same virtual network. Additionally, the restore operation is permissible from environments that don't support virtual networks to those that do.

## Supported regions

Confirm that your Power Platform environment and enterprise policy are in supported Power Platform and Azure regions. For example, if your Power Platform environment is in the United States, then your Virtual Network and subnets must be in the **eastus** and **westus** Azure regions.

| Power Platform region | Azure region |
|-----------------------|--------------|
| United States | eastus, westus |
| South Africa  | southafricanorth, southafricawest |
| UK | uksouth, ukwest |
| Japan | japaneast, japanwest |
| India | centralindia, southindia |
| France | francecentral, francesouth |
| Europe | westeurope, northeurope |
| Germany | germanynorth, germanywestcentral |
| Switzerland | switzerlandnorth, switzerlandwest |
| Canada | canadacentral, canadaeast |
| Brazil | brazilsouth |
| Australia | australiasoutheast, australiaeast |
| Asia | eastasia, southeastasia |
| UAE | uaenorth |
| Korea | koreasouth, koreacentral |
| Norway | norwaywest, norwayeast |
| Singapore | southeastasia |
| Sweden | swedencentral |
| Italy | italynorth |

## Supported services

The following table lists the services that support Azure subnet delegation for Virtual Network support for Power Platform.

| Area      | Power Platform services | Virtual Network support availability|
|-----------|-------------------------|-------------------------|
| Dataverse | [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) | Generally available |
| Connectors | <ul><li>[SQL Server](/connectors/sql/)</li><li>[Azure SQL Data Warehouse](/connectors/sqldw/)</li><li>[Azure Queues](/connectors/azurequeues/)</li><li>[Custom connectors](/connectors/custom-connectors/)</li><li>[Azure Key Vault](/connectors/keyvault/)</li><li>[Azure File Storage](/connectors/azurefile/)</li><li>[Azure Blob Storage](/connectors/azureblob/)</li><li>[HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/)</li></ul> | Generally available |
| Connectors | <ul><li>[Snowflake](/connectors/snowflakeip/)</li><li>[Databricks](/connectors/databricks/)</li><li>[AI search](/microsoft-copilot-studio/knowledge-azure-ai-search)</li></ul> | Generally available |

## Supported environments

Virtual Network support for Power Platform isn't available for all [Power Platform environments](/power-platform/admin/environments-overview). The following table lists which environment types support Virtual Network.

| Environment type              | Supported |
|-------------------------------|-----------|
| Production                    | Yes       |
| Default                       | Yes       |
| Sandbox                       | Yes       |
| Developer                     | Yes       |
| Trial                         | No        |
| Microsoft Dataverse for Teams | No        |

## Considerations to enable Virtual Network support for Power Platform Environment

When you use Virtual Network support in a Power Platform environment, all supported services, like Dataverse plug-ins and connectors, execute requests at runtime in your delegated subnet and are subject to your network policies. The calls to publicly available resources would start to break.

> [!IMPORTANT]
> Before you enable the virtual environment support for Power Platform environment, make sure you check the code of the plug-ins and the connectors. The URLs and connections need to be updated to work with private connectivity.

For example, a plug-in might try to connect to a publicly available service, but your network policy doesn't allow public internet access within your Virtual Network. The call from the plug-in is blocked in accordance with your network policy. To avoid the blocked call, you can host the publicly available service in your Virtual Network. Alternatively, if your service is hosted in Azure, you can use a private endpoint on the service before you turn on Virtual Network support in the Power Platform environment.

## FAQ

### What's the difference between a Virtual Network data gateway and Azure Virtual Network support for Power Platform?

A [Virtual Network data gateway](/data-integration/vnet/data-gateway-architecture#hardware) is a managed gateway that allows you to access Azure and Power Platform services from within your Virtual Network without having to set up an on-premises data gateway. For example, the gateway is optimized for ETL (extract, transform, load) workloads in Power BI and Power Platform dataflows.

Azure Virtual Network support for Power Platform uses an Azure subnet delegation for your Power Platform environment. Subnets are used by workloads in the Power Platform environment. Power Platform API workloads use Virtual Network support because the requests are short-lived and optimized for a large number of requests.

### What are the scenarios where I should use Virtual Network support for Power Platform and the virtual network data gateway?
Virtual Network support for Power Platform is the only supported option for all the scenarios for outbound connectivity from Power Platform except [Power BI](/power-bi/fundamentals/power-bi-overview) and [Power Platform dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365).

[Power BI](/data-integration/vnet/use-data-gateways-sources-power-bi) and [Power Platform dataflows](/data-integration/vnet/data-gateway-power-platform-dataflows) continue to use [virtual network (vNet) data gateway](/data-integration/vnet/overview).

### How do you ensure that a virtual network subnet or data gateway from one customer isn't used by another customer in Power Platform?

- Virtual Network support for Power Platform uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview).

- Each Power Platform environment is linked to one virtual network subnet. Only calls from that environment are allowed to access that virtual network.

- Delegation allows you to designate a specific subnet for any Azure platform as a service (PaaS) that needs to be injected into your virtual network.

### Does Virtual Network support Power Platform failover?

Yes, you need to delegate the Virtual Networks for both Azure regions that are associated to your Power Platform region. For example, if your Power Platform environment is in **Canada**, you need to create, delegate, and configure Virtual Networks in **CanadaCentral** and **CanadaEast**.

### How can a Power Platform environment in one region connect to resources hosted in another region?

A Virtual Network linked to a Power Platform environment must reside in the [Power Platform environment's region](/power-platform/admin/regions-overview#what-regions-are-available). If the Virtual Network is in a different region, create a Virtual Network in the Power Platform environment's region and use [Virtual Network peering](/azure/virtual-network/virtual-network-peering-overview) on both Azure region's subnet delegated Virtual Networks to bridge the gap with the Virtual Network in the separate region.

### Can I monitor outbound traffic from delegated subnets?

Yes. You can use Network Security Group and firewalls to monitor outbound traffic from delegated subnets. Learn more in [Monitor Azure Virtual Network](/azure/virtual-network/monitor-virtual-network).

### Can I make internet-bound calls from plug-ins or connectors after my environment is subnet-delegated?

Yes. You can make internet-bound calls from plug-ins or connectors, but the delegated subnet must be configured with an [Azure NAT gateway](/azure/nat-gateway/nat-overview).

### Can I update the subnet IP address range after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

No, not while the feature is used in your environment. You can't change the IP address range of the subnet after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies." If you do this, the delegation configuration is broken and the environment stops working. To change the IP address range, you must [remove the delegation feature from your environment](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#9-remove-subnet-injection-from-an-environment), make the necessary changes, and then turn on the feature for your environment.

### Can I update the DNS address of my Virtual Network after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

No, not while the feature is used in your environment. You can't change the DNS address of the Virtual Network after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies." If you do this, the change isn't picked up in our configuration and your environment may stop working. To change the DNS address, you must [remove the delegation feature from your environment](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#9-remove-subnet-injection-from-an-environment), make the necessary changes, and then turn on the feature for your environment.

### Can I use the same enterprise policy for multiple Power Platform environments?

Yes. You can use the same enterprise policy for multiple Power Platform environments. However, there's a limitation that [early release cycle environments](early-release.md) can't be used with the same enterprise policy as other environments.

### My Virtual Network has a custom DNS configured. Does Power Platform use my custom DNS?

Yes. Power Platform uses the custom DNS configured in the Virtual Network that holds the delegated subnet to resolve all endpoints. After the environment is delegated, you can update plug-ins to use the correct endpoint so that your custom DNS can resolve them.

### My environment has ISV-provided plug-ins. Would these plug-ins run in the delegated subnet?

Yes. All customer plug-ins and ISV plug-ins can run, using your subnet. If the ISV plug-ins have outbound connectivity, those URLs might need to be listed in your firewall.

### My on-premises endpoint TLS certificates aren't signed by well-known root certification authorities (CA). Do you support unknown certificates?

No. We must ensure the endpoint presents a TLS certificate with the complete chain. It's not possible to add your custom root CA to our list of well-known CAs.

### What's the recommended setup of a Virtual Network within a customer tenant?

We don't recommend any specific topology. However, our customers widely use the [Hub-spoke network topology in Azure](/azure/architecture/networking/architecture/hub-spoke).

### Is linking an Azure subscription to my Power Platform tenant necessary to activate Virtual Network?

Yes, to enable Virtual Network support for Power Platform environments, it's essential to have an Azure subscription associated with the Power Platform tenant.

### How does Power Platform use Azure subnet delegation?

When a Power Platform environment has a delegated Azure subnet assigned, it uses Azure Virtual Network injection to inject the container at runtime into a delegated subnet. During this process, a network interface card (NIC) of the container is allocated an IP address from the delegated subnet. The communication between the host (Power Platform) and the container occurs through a local port on the container, and the traffic flows over Azure Fabric.

### Can I use an existing Virtual Network for Power Platform?

Yes, you can use an existing Virtual Network for Power Platform, if a single, new subnet within the Virtual Network is delegated specifically to Power Platform. The delegated subnet has to be dedicated for subnet delegation and can't be used for other purposes.

### Can I reuse the same delegated subnet in multiple enterprise policies?

No. Reusing the same subnet in multiple enterprise policies isn't supported. Each Power Platform enterprise policy must have its own unique subnet for delegation.

### What is a Dataverse plug-in?

A Dataverse plug-in is a piece of custom code that can be deployed in a Power Platform environment. This plug-in can be configured to run during events (such as a change in data) or triggered as a Custom API. Learn more: [Dataverse Plug-ins](/power-apps/developer/data-platform/plug-ins)

### How does a Dataverse plug-in run?

A Dataverse plug-in operates within a container. When a Power Platform environment is assigned a delegated subnet, an IP address from that subnet's address space is allocated to the network interface card (NIC) of the container. Communication between the host (Power Platform) and the container occurs through a local port on the container, and the traffic flows over Azure Fabric.

### Can multiple plug-ins run within the same container?

Yes. In a given Power Platform or Dataverse environment, multiple plug-ins can operate within the same container. Each container consumes one IP address from the subnet address space, and each container can run multiple requests.

### How does the infrastructure handle an increase in concurrent plug-in executions?

As the number of concurrent plug-in executions increases, the infrastructure automatically scales out or in to accommodate the load. The subnet delegated to a Power Platform environment should have enough address spaces to handle the peak volume of executions for the workloads in that Power Platform environment.

### Who controls the Virtual Network and network policies associated with it?

As a customer, you have ownership and control over the Virtual Network and its associated network policies. On the other hand, Power Platform uses the allocated IP addresses from the delegated subnet within that Virtual Network.

### Do [Azure-aware plug-ins](/power-apps/developer/data-platform/write-custom-azure-aware-plugin) support Virtual Network?
No, [Azure-aware plug-ins](/power-apps/developer/data-platform/write-custom-azure-aware-plugin) don't support Virtual Network.

## Next steps

[Set up Virtual Network support](vnet-support-setup-configure.md)

## Related content

 [Troubleshoot Virtual Network issues](/troubleshoot/power-platform/administration/virtual-network)
