---
author: Manuela Pichler
ms.date: 12/08/2023
---
# Recommendations for networking and connectivity

This guide describes the recommendations for network design. The focus is on **security controls that can filter, block, and detect adversaries crossing network boundaries** at various depths of your architecture.

You can strengthen your identity controls by implementing network-based access control measures. Along with identity-based access control, network security is a high priority for protecting assets. Proper network security controls can provide a defense-in-depth element that can help detect and contain threats, and prevent attackers from gaining entry into your workload.

**Definitions**

| **Term** | **Definition** |
|---|---|
| **East-west traffic** | Network traffic that moves within a trusted boundary. |
| **Egress flow** | Outbound workload traffic. |
| **Hostile network** | A network that isn't deployed as part of your workload. A hostile network is considered a threat vector. |
| **Ingress flow** | Inbound workload traffic. |
| **Network filtering** | A mechanism that allows or blocks network traffic based on specified rules. |
| **Network segmentation or isolation** | A strategy that divides a network into small, isolated segments, with security controls applied at the boundaries. This technique helps protect resources from hostile networks, such as the internet. |
| **Network transformation** | A mechanism that mutates network packets to obscure them. |
| **North-south traffic** | Network traffic that moves from a trusted boundary to external networks that are potentially hostile, and vice versa. |

## Key design strategies

Network security uses **obscurity to protect workload assets from hostile networks**. Resources that are behind a network boundary are hidden until the boundary controls mark the traffic as safe to move forward. Network security design is built on three main strategies:

**Segment**. This technique **isolates traffic on separate networks by adding boundaries**. The foremost security boundary is the **networking edge between your** **workload and public networks**. It's important to clearly define this perimeter so that you establish a boundary for isolating hostile networks. The controls on this edge must be highly effective, because this boundary is your first line of defense.

Virtual networks provide a logical boundary. By design, a virtual network can't communicate with another virtual network unless the boundary has been intentionally broken through peering. Your architecture should take advantage of this strong, platform-provided security measure.

You can also use other logical boundaries, such as carved-out **subnets within a virtual network**. A benefit of subnets is that you can use them to group together resources that are within an isolation boundary and have similar security assurances. You can then configure controls on the boundary to filter traffic.

**Filter**. This strategy helps ensure that **traffic that enters a boundary is expected, allowed, and safe**. From a Zero-Trust perspective, filtering explicitly verifies all available data points at the network level. You can place rules on the boundary to check for specific conditions.<br>

### Classify the traffic flows

The first step is to determine the intent and characteristics of the traffic flow for your workload architecture. Use the following questions to help classify the flow:

If the workload needs to communicate with external networks, what should the required level of proximity to those networks be?

What are the network characteristics of the flow? Are there any compliance requirements at the networking level?

There are many ways to classify traffic flows. The following sections discuss commonly used criteria.

##### Visibility from external networks

**Public**. A workload is public facing if its application and other components are reachable from the public internet. The application is exposed through one or more public IP addresses and public Domain Name System (DNS) servers.

**Private**. A workload is private if it can only be accessed through a private network such as a virtual private network (VPN). It's exposed only through one or more private IP addresses and potentially through a private DNS server.

In a private network, there's no line of sight from the public internet to the workload. For the gateway, you can use a load balancer or firewall. These options can provide security assurances.

Even with public workloads, **strive to keep as much of the workload private as possible**. This approach forces packets to cross through a private boundary when they arrive from a public network. A gateway in that path can function as a transition point by acting as a reverse proxy.

#### Traffic direction

**Ingress**. Ingress is inbound traffic that flows toward a workload or its components. To help secure ingress, apply the preceding set of key strategies. Determine what the traffic source is and whether it's expected, allowed, and safe. Attackers who scan public cloud provider IP address ranges can successfully penetrate your defenses if you don't check ingress or implement basic network security measures.

**Egress**. Egress is outbound traffic that flows away from a workload or its components. To check egress, determine where the traffic is headed and whether the destination is expected, allowed, and safe. The destination might be malicious or associated with data exfiltration risks.

You can also **determine your level of exposure by considering your workload's proximity to the public internet**. For example, the application platform typically serves public IP addresses. The workload component is the face of the solution.

#### Scope of influence

**North-south**. Traffic that flows between a workload network and external networks is north-south traffic. This traffic crosses the edge of your network. External networks can be the public internet, a corporate network, or any other network that's outside your scope of control.

Ingress and egress can both be north-south traffic.

As an example, consider the egress flow of a hub-spoke network topology. You can define the networking edge of your workload so that the hub is an external network. In that case, outbound traffic from the virtual network of the spoke is north-south traffic. But if you consider the hub network within your sphere of control, north-south traffic is extended to the firewall in the hub, because the next hop is the internet, which is potentially hostile.

**East-west**. Traffic that flows within a workload network is east-west traffic. This type of traffic results when components in your workload communicate with each other. An example is traffic between the tiers of an _n_-tier application. In microservices, service-to-service communication is east-west traffic.

To provide defense in depth, maintain **end-to-end control of security affordances that are included in each hop or that you use when packets cross internal segments**. Different risk levels require different risk remediation methods.

** Note**

Identity is always the primary perimeter. Access management must be applied to networking flows. 

After you classify flows, perform a segmentation exercise to identify firewall injection points on the communication paths of your network segments. When you **design your network** **defense in depth across all segments and all traffic types, assume a breach at all points**. Use a combination of various localized network controls at all available boundaries.

### Apply firewalls at the edge

Internet edge traffic is north-south traffic and includes ingress and egress. To detect or block threats, an edge strategy must mitigate as many attacks as possible to and from the internet.

For egress, **send all internet-bound traffic through a single firewall** that provides enhanced oversight, governance, and control of traffic. For ingress, force all traffic from the internet to go through a network virtual appliance (NVA) or a web application firewall.

Firewalls are usually singletons that are deployed per region in an organization. As a result, they're shared among workloads and owned by a central team. Make sure that any NVAs that you use are configured to support the needs of your workload.

We recommend that you use Azure native controls as much as possible.

In addition to native controls, you can also consider partner NVAs that provide advanced or specialized features. Partner firewall and web application firewall vendor products are available in Azure Marketplace.

The decision to use native features as opposed to partner solutions should be based on your organization's experience and requirements.

 **Tradeoff**: Partner capabilities often provide advanced features that can protect against sophisticated, but typically uncommon, attacks. The configuration of partner solutions can be complex and fragile, because these solutions don't integrate with the cloud's fabric controllers. From a cost perspective, native control is preferred because it's cheaper than partner solutions.

Any technological options that you consider should provide security controls and monitoring for both ingress and egress flows. To see options that are available for Azure, see the [Edge security](https://learn.microsoft.com/en-us/azure/well-architected/security/networking) section in this article.

### Design virtual network and subnet security

The primary objective of a private cloud is to obscure resources from the public internet. There are several ways of achieving this goal:

**Move to private IP address spaces**, which you can accomplish by using virtual networks. Minimize network line of sight even within your own private networks.

**Minimize the number of public DNS entries that you use** to expose less of your workload.

**Add ingress and egress network flow control**. Don't allow traffic that's not trusted.

##### Segmentation strategy

To minimize network visibility, **segment your network and start with least-privilege network controls**. If a segment isn't routable, it can't be accessed. Broaden the scope to include only segments that need to communicate with each other through network access.

You can segment virtual networks by creating subnets. The criteria for division should be intentional. When you collocate services inside a subnet, make sure that those services can see each other.

You can base your segmentation on many factors. For example, you can place different application tiers in dedicated segments. Another approach is to plan your subnets based on common roles and functions that use well-known protocols.

For more information, see [Segmentation strategies](https://learn.microsoft.com/en-us/azure/well-architected/security/segmentation).

##### Subnet firewalls

It's important to inspect each subnet's inbound and outbound traffic. Use the three main strategies discussed earlier in this article, in [Key design strategies](https://learn.microsoft.com/en-us/azure/well-architected/security/networking). Check whether the flow is expected, allowed, and safe. To verify this information, **define firewall rules that are based on the protocol, source, and destination** of the traffic.

On Azure, you set firewall rules in network security groups. For more information, see the [Network security groups](https://learn.microsoft.com/en-us/azure/well-architected/security/networking) section in this article.

For an example of a subnet design, see [Azure Virtual Network subnets](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-portal).

### Use controls at the component level

After you minimize the visibility of your network, map out your Azure resources from a network perspective and evaluate the flows. The following types of flows are possible:

**Planned traffic**, or intentional communication between services according to your architecture design. For example, you have planned traffic when your architecture recommends that Azure Functions pulls messages from Azure Service Bus.

**Management traffic**, or communication that happens as part of the service's functionality. This traffic isn't part of your design, and you have no control over it. An example of managed traffic is the communication between the Azure services in your architecture and the Azure management plane.

Distinguishing between planned and management traffic helps you build localized, or service-level, controls. Have a good understanding of the source and destination at each hop. Especially understand how your data plane is exposed.

As a starting point, determine whether each service is exposed to the internet. If it is, plan how to restrict access. If it isn't, place it in a virtual network.

#### Connectivity to platform as a service (PaaS) services

Consider using **private endpoints to help secure access to PaaS services**. A private endpoint is assigned a private IP address from your virtual network. The endpoint allows other resources in the network to communicate with the PaaS service over the private IP address.

Communication with a PaaS service is achieved by using the service's public IP address and DNS record. That communication occurs over the internet. You can make that communication private.

A tunnel from the PaaS service into one of your subnets creates a private channel. All communication takes place from the component's private IP address to a private endpoint in that subnet, which then communicates with the PaaS service.

In this example, the image on the left shows the flow for publicly exposed endpoints. On the right, that flow is secured by using private endpoints.

For more information, see the [Private endpoints](https://learn.microsoft.com/en-us/azure/well-architected/security/networking) section in this article.

** Note**

We recommend that you use private endpoints in conjunction with service firewalls. A service firewall blocks incoming internet traffic and then exposes the service privately to internal users who use the private endpoint.

Another advantage of using private endpoints is that you don't need to open the ports on the firewall for outbound traffic. **Private endpoints lock down all outbound traffic on the port for the public internet.** Connectivity is limited to resources within the network.

 **Tradeoff**: Azure Private Link is a paid service that has meters for inbound and outbound data that's processed. You're also charged for private endpoints.

## Power Platform facilitation

You can use the following Power Platform and Azure (?) services to add defense-in-depth capabilities to your network.

Power Platform services are built on Microsoft Azure and use internally many of the cloud computing platform’s network security capabilities. While the internal service architecture is not configurable or maintained by your organization, we have included a high-level overview so you can understand their general architecture. The Power Platform service architecture is composed of four components: 

Web front-end cluster 

Back-end cluster 

Data source connections 

Mobile platforms 

 

**Web front-end cluster** 

The web front-end cluster applies to any service that displays a web user interface. Clients of the user interface are authenticated using Microsoft Entra ID and tokens are provided for subsequent client connections to the Power Platform back-end services. 

![A diagram of a computer  Description automatically generated](media/image1.png)

When a user accesses the service, the client’s DNS service gets the most appropriate (typically nearest) datacenter from Azure Traffic Manager. Azure Traffic Manager [routing methods](https://learn.microsoft.com/en-us/azure/traffic-manager/traffic-manager-routing-methods) handle all the routing decisions for the traffic. Azure Content Delivery Network is used to deliver static resources to the user’s browser except for in sovereign government deployments. 

The token from authentication is used to determine the organization to which the user belongs. A global backend service then identifies which backend cluster houses the organization’s tenant.  

 

**Back-end cluster** 

The back-end cluster is where all the functionality available in a Power Platform service is hosted. The back-end cluster consists of service endpoints, background working services, databases, caches, and other components. These clusters are available in an Azure region and host all the data of all the tenants assigned to that cluster. 

Tenant metadata and data are stored within cluster limits. The exception is data replication to a secondary back-end cluster that's located in a paired region in the same Azure geography. The secondary cluster serves as a failover if there's a regional outage and is passive at any other time.  

Micro-services running on different machines in the cluster's virtual network also serve back-end functionality. Only the gateway service and API management are accessible from the public internet. 

![A screenshot of a computer  Description automatically generated](media/image2.png)

**Data source connections** 

Power Platform services connect to external data sources in various ways, but the general pattern is similar. From a maker’s perspective, building an app or automation, they access data and services by establishing a connection with a connector. Under the covers, Power Apps canvas and model-driven apps connect directly to Dataverse without the need for a separate connector. This allows the Power Apps back-end service to request data directly from Dataverse using a Power Apps resource provider. Power Automate authenticates using an API Hub, but all data interactions after that are also direct to Dataverse. 

![A screenshot of a computer  Description automatically generated](media/image3.png)

For other external data sources Power Platform services use connectors. The external service is accessed through an [Azure API Management (APIM)](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts) connector as illustrated in the following diagram. 

![A diagram of a computer program  Description automatically generated](media/image4.png)

Users authenticate to the Power Platform service first. Then, separately, users authenticate to a data source using the credentials the connector requires. The API Hub credentials service always stores and manages credentials. 

Authentication to a data source is specific to that data source depending on the method the maker chooses when creating the connection. There are two types of data source authentication methods with Power Apps, explicit and implicit. 

**Explicit** authentication means the app user's credentials are used to access the data source. 

**Implicit** authentication means the credentials the app maker provided when creating the connection are used. 

When possible, explicit authentication is recommended as it is more secure and does not provide the application user with the ability to have elevated permissions when using the apps. This [article](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/connections/sql-server-security) on the differences provides some good detailed examples of the two methods so you can gain a deeper understanding. 

**Mobile platforms** 

Power Platform mobile applications use the same connection and authentication sequences used by browsers. Android and iOS apps open a browser session in the app. Windows apps use a broker to establish a communication channel with the Power Platform services for the sign-in process. Certificate-based authentication is supported for Android and iOS applications. 

**Protecting Power Pages** 

Power Pages is unique from some of the other Power Platform services because it is intended to be an external facing service. Like other Power Platform services Power Pages uses Azure as its hosting platform and takes advantage of the scaling, high availability, and platform level security that offers. 

You can add an additional layer of protection by configuring the Azure Web Application Firewall to monitor, filter and block malicious requests from a Power Pages website. 

![A diagram of a diagram of a software application  Description automatically generated](media/image5.png)

Web Application Firewall is powered by Azure Front Door (AFD), and the policy is configured using an AFD profile with prevention mode enabled. In prevention mode, requests matching the rules defined in the managed rule set are blocked. 

Web Application Firewall can be enabled for production sites from the Power Platform admin center. Follow these [steps](https://learn.microsoft.com/en-us/power-pages/security/configure-web-application-firewall) to enable or disable Web Application Firewall. 

Power Pages makes available a [subset](https://learn.microsoft.com/en-us/power-pages/security/web-application-firewall-rule-groups) of the Azure-managed [DRS 2.0 rule sets](https://learn.microsoft.com/en-us/azure/web-application-firewall/afds/waf-front-door-drs?tabs=drs20). These rules are targeted to provide a higher level of protection against OWASP top 10 security risks and common attacks. 

 

**Power Platform network service tags** 

Service tags are used to represent a group of IP address prefixes from a service. Power Platform publishes service tags that can be used to define network access controls on network service groups, Azure Firewall, and user-defined routes. By using a service tag, you can minimize the impact of address changes and the complexity of frequent updates to network security rules. 

The following are the Power Platform and Dynamics 365 related service tags published: 

| **Tag** | **In/Out** | **Regional?** | **Azure Firewall** |
|---|---|---|---|
| **Dynamics365ForMarketingEmail** | Both | Yes | Yes |
| **Dynamics365BusinessCentral** | Both | No | Yes |
| **PowerBI** | Both | No | Yes |
| **PowerPlatformInfra** | Outbound | Yes | Yes |
| **PowerPlatformPlex** | Inbound | Yes | Yes |

 

You can also refer to the [full list of available service tags](https://learn.microsoft.com/en-us/azure/virtual-network/service-tags-overview) to find other service tags for the broader set of Azure services that might also be helpful in configuring your network security rules. 

If you are using connectors, your environment or firewall must allow access to the outbound IP addresses used by the connectors in your datacenter region; otherwise, requests sent by these connectors will fail. Most connectors use the HTTPS protocol and use HTTPS port 443 as the default. Some connectors use other protocols, so evaluating the actual connectors you use is important. Requests use IP addresses and service tags that depend on the region and the environment the app or flow is located. A [full list of Power Platform IP addresses and service tags](https://learn.microsoft.com/en-us/connectors/common/outbound-ip-addresses) is available to allow you to properly configure your allow list to facilitate Power Platform requests. 

 

**IP firewall for Power Platform environments** 

IP firewall is a feature you can enable and configure for Power Platform managed environments. The IP firewall protection works in real-time at the network layer. Requests are evaluated after the authentication request is completed. The IP firewall helps to protect your data by limiting user access to Dataverse from only allowed IP locations.  

![A diagram of a computer security system  Description automatically generated](media/image6.png)

You can use the IP firewall feature to help protect data from data exfiltration from unapproved network locations. For example, if the IP firewall was enabled and allowed access only to Dataverse from your office network IP addresses, a user could not access Dataverse to exfiltrate data from other locations. 

The IP firewall can also prevent token replay attacks where a user attempts to use an access token from a non-approved network location, and the request will be denied. 

Since the IP firewall works at the network layer, this will apply to both interactive applications as well as API access to Dataverse. 

IP firewall is configured at the environment level, so you have the flexibility to enable it only on specific environments that are more sensitive. For example, you might allow open access to your development environments, but your test and production environments are restricted. 

For more information on how to enable IP firewall in an environment, review the article [Enable the IP firewall](https://learn.microsoft.com/en-us/power-platform/admin/ip-firewall). 

**Protect against cookie replay** **attacks** 

Cookie replay attacks can occur when an attacker intercepts a valid cookie and uses it to impersonate the original user that created the cookie. Power Apps model-driven applications use a cookie named CrmOwinAuth and you can enable IP-based cookie binding to protect this cookie from being used in an attack. IP-based cookie binding is a feature available in managed Power Platform environments. When enabled, the IP address of the cookie’s origin is compared against the IP address of the incoming request. When a difference is encountered the incoming request is blocked, and an error message is shown. 

Not all detections of a difference in IP address are indicative of an attack. Most of the time when a difference occurs the user has a change in their network connection that resulted in a new IP address being assigned. For example, a user working at their desk in their office location goes to a meeting at a client location. If they had the application open on their laptop prior to leaving the office the cookie would be created with an office IP address. When the user connected from their client, they used the VPN which assigned an IP address from the VPN which was different. In this case the user would have to re-authenticate due to the IP address change and this feature being enabled. 

**Connecting Power Platform to on-premises resources** 

The on-premises gateway allows Power Platform cloud applications and automations to securely use on-premises resources. With a gateway, you can connect to on-premises data from sources like file system, DB2, Oracle, SAP ERP, SQL Server, SharePoint, and more. The gateway uses [Azure Relay](https://learn.microsoft.com/en-us/azure/azure-relay/relay-what-is-it) technology to securely allow access to on-premises resources. Azure Relay is able to securely expose services that run inside your organization’s network to the public cloud without having to open a port on your firewall. The gateway communicates on the following outbound ports: TCP 443, 5671, 5672, and from 9350 through 9354. The gateway doesn't require inbound ports. 

![A diagram of a cloud computing system  Description automatically generated](media/image7.png)

One gateway can allow multiple users to access multiple data sources. You can restrict access to who can install an on-premises data gateway. This restriction occurs at the tenant level, not the environment level. Gateway roles manage the security of the on-premises data gateway. The following are the three roles: 

**Admin** – Installers of a gateway are automatically assigned the admin role. An admin can manage and update the on-premises data gateway, create connections (data sources), manage users, and manage access to all connections created on the gateway. 

**Connection creator** - Allowed to create connections/data sources on the gateway and test the status of the gateway cluster and its members. A connection creator can't manage or update the gateway and can't add or remove others on the gateway. 

**Connection Creator with sharing** – This is the same as connection creator role; however, they can also share the gateway with other users as a connection creator. 

For connections created for Power Apps and Power Automate, you can limit the connection types available to those users when you assign the role. For example, you could limit it to only SQL Server. 

![A screenshot of a computer  Description automatically generated](media/image8.png)

For more granular control on what data sources the gateway can access, you can use your standard network controls to limit what the gateway server on-premises can access. 

For business-critical gateways, you can configure them as a cluster for higher availability and performance.   

![A close-up of a sign  Description automatically generated](media/image9.png)

You can also use separate clusters to support the lifecycle of the applications or segment them by the different parts of your organization. You could also use this approach to isolate services having a separate cluster to access SharePoint and one to access SQL Server. This approach can effectively handle differing compliance or data security requirements across different data sources. 

 

![A diagram of a diagram  Description automatically generated](media/image10.png)

 

**Virtual network (VNet) data gateways** 

Using virtual network data gateways allows Power BI and Power Platform Dataflows to connect to data services in an Azure VNet without needing the on-premises data gateway on a virtual machine inside the VNet.  

![VNet overview.](media/image11.png)

For Power BI, you can find a list of supported data services for Power BI datasets available in [Supported Azure data services](https://learn.microsoft.com/en-us/data-integration/vnet/use-data-gateways-sources-power-bi). A list of supported data sources for Power Platform dataflows is available in [Supported data sources](https://learn.microsoft.com/en-us/data-integration/vnet/data-gateway-power-platform-dataflows). A list of supported data sources for Power BI paginated reports is available in [Supported data sources](https://learn.microsoft.com/en-us/power-bi/paginated-reports/paginated-reports-data-sources) for Power BI paginated reports 

**Azure Private Link** 

[Azure private Link](https://learn.microsoft.com/en-us/power-bi/enterprise/service-security-private-links)<sup>2</sup> and Azure Networking private endpoints to enable Power BI to be accessed securely. Private endpoints are used to send data traffic privately using Microsoft's backbone network infrastructure instead of going across the internet. Private endpoints ensure that traffic going into your Power BI resources, such as reports or workspaces, always follow your configured private link network path.  

**Microsoft Azure ExpressRoute** 

[Microsoft Azure ExpressRoute](https://learn.microsoft.com/en-us/power-platform/guidance/expressroute/overview)<sup>3</sup> provides an advanced way to connect your on-premises network to Microsoft cloud services by using private connectivity. A single ExpressRoute connection can be used to access multiple online services, for example, Microsoft Power Platform, Dynamics 365, Microsoft 365, and Azure. Using this connectivity, a user can access Power Platform and other Microsoft cloud services without traversing the public internet. ExpressRoute requires significant planning and configuration and involves more cost for the ExpressRoute service and the connectivity provider.  

![A diagram of a computer  Description automatically generated](media/image12.png)

ExpressRoute itself doesn't encrypt or filter traffic natively (with the exception of [ExpressRoute Direct with MACsec enabled](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-about-encryption)); it simply establishes a private, rather than shared, connection directly between the Microsoft and customer datacenters through their connectivity provider. 

Any request from any Microsoft online service or Azure service to the subnet advertised through an ExpressRoute circuit will be routed via that circuit, regardless of the service or customer. Because the request is routed at the network layer, there's no application-level control to determine whether that's an appropriate requester for that destination service. 

For traffic to Microsoft services, because these are public shared services they can be accessed directly across the public internet. Access control to these services is handled through application-level authentication and authorization services. They're further protected at an infrastructure level against intrusion and threats like denial-of-service attacks. 

For traffic from Microsoft services to on-premises hosted services, the customer is responsible for providing similar protection to their own services when traffic is received across an ExpressRoute connection. 

One of the challenges you might face is wanting to use ExpressRoute for a particular Microsoft cloud service but not for others. Although the different peering options provide some level of control here, the peering itself doesn't provide granular control within services of the same peering type (for example to enable routing only to Azure virtual machines but not to Microsoft 365). It's possible, however, to use Border Gateway Protocol (BGP) communities to configure traffic for specific services only. 

This is relevant for Microsoft Power Platform services with a Microsoft 365 presence, where routing via ExpressRoute might be desirable for one service but not for both, or only for certain individual services of Microsoft 365 such as Microsoft Teams. 

Because Microsoft Power Platform services work partially as part of the Microsoft 365 service, many crossover services such as the admin portal and authentication are also required. It's not possible to protect all of these services by using ExpressRoute; the Microsoft 365 admin center, for example, isn't published across ExpressRoute. 

ExpressRoute also can’t set up between Microsoft Power Platform and Azure services. 

Depending on the connector you use with on-premises systems, implementing ExpressRoute doesn't necessarily mean that you can remove the on-premises data gateway. This is because the on-premises data gateway includes functionality that converts data. For example, with SQL Server, the on-premises data gateway converts protocol from OData requests to SQL Data Manipulation Language statements. 

Microsoft Power Platform uses Azure Content Delivery Network (CDN) to optimize performance and user experiences when using static content such as images and icons. This static content served by the Content Delivery Network can't be routed via ExpressRoute, so it will be routed directly across the public internet. However, this content uses common platform capabilities that contain no customer data; therefore, the content need not be considered a candidate for protection over private networks like ExpressRoute. For canvas apps specifically, CDN can be turned off using a setting _Load default static content_ from Content Delivery Network by system administrators in case of firewall restrictions and IP approved list related issues. This setting does not apply to model-driven apps as they do not use CDN currently. More information: Manage behavior settings 

### How does Power Platform protect against Distributed Denial of Service (DDoS) attacks?

Power Platform is built on Microsoft Azure and uses [Azure DDoS Protection](https://learn.microsoft.com/en-us/azure/ddos-protection/ddos-protection-standard-features) to guard against [DDoS attacks](https://owasp.org/www-project-automated-threats-to-web-applications/assets/oats/EN/OAT-015_Denial_of_Service.html)

Prevent injection attacks

Power Platform uses industry-standard best practices to prevent injection attacks, including:

Using safe APIs with parameterized interfaces

Applying the ever-evolving capabilities of front-end frameworks to sanitize input

Sanitizing the output with server-side validation

Using static analysis tools during build time

Reviewing the Threat Model of every service every six months whether the code, design, or infrastructure has been updated or not

### SAS IP Binding

This feature set is tenant-specific functionality that restricts Storage Shared Access Signature (SAS) tokens and is controlled through a menu in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). This setting will restrict who, based on IP, can use enterprise SAS tokens.

These settings can be found in a Dataverse environment’s **Privacy + Security** settings in the admin center. You must turn on the **Enable IP** **address based Storage Shared Access Signature (SAS) rule** option.

Admins can enable one of these four configurations for this setting:

| **Setting** | **Description** |
|---|---|
| **IP Binding Only** | This will restrict SAS keys to the requester’s IP. |
| **IP Firewall Only** | This will restrict using SAS keys to only work within an admin specified range. |
| **IP Binding and Firewall** | This will restrict using SAS keys to work within an admin-specified range and only to the requestor's IP. |
| **IP Binding or Firewall** | Allows SAS keys to be used within the specified range. If the request comes from outside the range, IP Binding will be applied |

#### Products enforcing IP Binding when enabled:

Dataverse

Power Automate

Custom Connectors

Power Apps

#### Impact on Power App experiences

Note the following impact on users:

**When a user, who doesn't meet an environment’s IP address restrictions, opens an app**: The following message is dispalyed: "This app stopped working. Try refreshing your browser." This experience will be updated to provide more contextual information to the user as to why the app couldn’t be launched.

**When a user, who does meet the IP address restrictions, opens an app**: The following will occur:

A banner with the following message is displayed: “Your organization configured IP address restrictions limiting where Power Apps is accessible. This app may not be accessible when you use another network. Contact your admin for more details.” This banner appears for a few seconds and then disappears.

The app may load slower than if IP address restrictions weren’t in place. The IP address restrictions prevents the platform from using some performance capabilities that enable faster load times.

If a user opens an app, while meeting the IP address requirements and then moves to a new network which no longer meets the IP address requirements, the user may observe app contents such as images, embedded media, and links may not load or be accessible.

## Example

Here are some examples that demonstrate the use of network controls recommended in this article.

### IT environment

This example builds on the Information Technology (IT) environment established in the [security baseline (SE:01)](https://learn.microsoft.com/en-us/azure/well-architected/security/establish-baseline). This approach provides a broad understanding of network controls applied at various perimeters to restrict traffic.

**Network attack personas**. Several personas may be considered in a network attack, including Admins, employees, customer’s clients and anonymous attackers.

**VPN access**. A bad actor might access the on-premises environment through a VPN or an Azure environment that's connected to the on-premises environment through a VPN. Configure with IPSec protocol to enable secure communication.

**Public access to the application**. Have a web application firewall (WAF) in front of the application to protect it on Layer 7 of the network OSI layer.

**Operator access**. Remote access through Layer 4 of network OSI layers must be secured. Consider using Azure Firewall with IDP/IDS features.

**DDoS protection**. Have DDoS protection for your entire VNet.

**Network topology**. A network topology such as hub-spoke, is more secure, and optimize costs. The hub network provides centralized firewall protection to all the peered spokes.

**Private endpoints**: Consider adding publically exposed services into your private network by using private endpoints. These create a Network Card (NIC) in your private VNet and bind with the Azure service.

**TLS communication**. Protect data in transit by communicating over TLS.

**Network Security Group (NSG)**: Protect segments within a VNet with NSG, a free resource that filters TCP/UDP inbound and outbound communication considering IP and port ranges. Part of NSG is the Application Security Group (ASG) that allows you to create tags for traffic rules for easier management.

**Log Analytics**. Azure resources emit telemetry that's ingested in Log Analytics then used with a SIEM solution like Microsoft Sentinel for analysis.

**Microsoft Sentinel Integration**. Log Analytics is integrated with Microsoft Sentinel and other solutions like Microsoft Defender for Cloud.

**Microsoft Defender for Cloud**. Microsoft Defender for Cloud delivers many workload protection solutions, including Network recommendations for your environment.

**Traffic Analytics**: Monitor your network controls with Traffic Analytics. This is configured through Network Watcher, part of Azure Monitor, and aggregates inbound and outbound hits in your subnets collected by NSG.

### Architecture for a containerized workload

This example architecture combines the network controls that are described in this article. The example doesn't show the complete architecture. Instead, it focuses on ingress controls on the private cloud.

**Application Gateway is a web traffic load balancer** that you can use to manage traffic to your web applications. You deploy Application Gateway in a dedicated subnet that has network security group controls and web application firewall controls in place.

Communication with all PaaS services is conducted through **private endpoints**. All endpoints are placed in a dedicated subnet. DDoS Protection helps protect all public IP addresses that are configured for a basic or higher level of firewall protection.

**Management traffic is restricted through Azure Bastion**, which helps provide secure and seamless RDP and SSH connectivity to your VMs directly from the Azure portal over TLS. Build agents are placed in the virtual network so that they have a network view to workload resources such as compute resources, container registries, and databases. This approach helps provide a secure and isolated environment for your build agents, which boosts protection for your code and artifacts.

Network security groups at the subnet level of the compute resources restrict egress traffic. Forced tunneling is used to route all traffic through Azure Firewall. This approach helps provide a secure and isolated environment for your compute resources, which boosts protection for your data and applications.

## Related links

- [IP firewall in Power Platform environments (preview) - Power Platform | Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/admin/ip-firewall)
  - [Block cookie replay attacks in Dataverse - Power Platform | Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/admin/block-cookie-replay-attack)
  - [Overview of using Azure ExpressRoute with Microsoft Power Platform - Power Platform | Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/expressroute/overview)
  - 

