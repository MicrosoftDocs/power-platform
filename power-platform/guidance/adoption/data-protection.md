---
title: Establish data protection and privacy controls
description: Learn key strategies and best practices for data protection and privacy within Power Platform to ensure security and compliance.
#customer intent: As an IT admin, I want to understand data protection strategies in Power Platform so that I can ensure security and compliance.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-articl
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/01/2025
---

# Establish data protection and privacy controls

In today's digital landscape, protecting data and ensuring privacy are critical for organizations that use Power Platform to build and deploy business applications. Ensuring the security and confidentiality of sensitive data is a regulatory requirement and a critical factor in maintaining customer trust and safeguarding organizational assets.

This article explains key strategies and best practices for data protection and privacy in Power Platform.

## Data protection

Data protection involves implementing measures to secure data from unauthorized access, breaches, and other threats. Privacy focuses on ensuring that personal and sensitive information is handled in compliance with legal and regulatory requirements, and that individuals' rights to privacy are respected.

## Data residency

A Microsoft Entra tenant stores information relevant to an organization and its security. When a Microsoft Entra tenant signs up for Power Platform services, the tenant's selected country or region is mapped to the most suitable Azure geography where a Power Platform deployment exists. Power Platform stores customer data in the tenant's assigned Azure geography (home geo), unless organizations deploy services in multiple regions. Learn more about [data storage and governance in Power Platform](/power-platform/admin/security/data-storage).

For multinational companies with employees and customers distributed around the world, you can create and manage environments specific to your global regions. You can [create an environment in a different region](/power-platform/admin/regions-overview) than where your tenant resides. Local environments can provide quicker data access for users in that region. Learn more about the features of multiple environments in [a multi-environment deployment](/power-platform/admin/multiple-online-environments-tenants#a-multi-environment-deployment).

## Data segregation

Power Platform runs on Azure, so it's a multitenant service by nature. Multiple customers' deployments and virtual machines share the same physical hardware. Azure uses logical isolation to separate each customer's data. This approach provides the scale and economic benefits of multitenant services while ensuring customers can't access one another's data.

Learn more: [Azure customer data protection](/azure/security/fundamentals/protection-customer-data)

## Data encryption

Data is an organization's most valuable asset, and encryption is the strongest line of defense in a layered data security strategy. Microsoft business cloud services and products use encryption to safeguard customer data and help you maintain control over it.

Power Platform encrypts data both at rest and in transit with a strong Microsoft-managed key by default.

Learn more:

- [About data encryption](/power-platform/admin/about-encryption)
- [Data protection](/power-platform/admin/wp-compliance-data-privacy#data-protection)

For organizations needing more control over data security and compliance, customer-managed keys (CMK) protect data in transit and at rest while giving organizations control over their encryption keys for enhancing data security. All customer data stored in Power Platform is encrypted at-rest with strong Microsoft-managed encryption keys by default. Microsoft stores and manages the database encryption key for your data so you don't have to. However, Power Platform provides this customer-managed encryption key (CMK) for your added data protection control where you can self-manage the database encryption key that is associated with your Microsoft Dataverse environment. This lets you rotate or swap the encryption key on demand and prevent Microsoft's access to your customer data by revoking key access to our services at any time.

Learn more:

- [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
- [Lock environments by revoking key vault and/or key permission access](/power-platform/admin/cmk-lock-unlock)

## Data loss prevention (DLP) policies

Power Platform data loss prevention (DLP) policies are rules and guidelines designed to protect sensitive data within the Power Platform environment. These policies help prevent unauthorized sharing and transfer of data by controlling how data can flow between different connectors and environments.

Establishing a Power Platform data loss prevention (DLP) policy strategy is crucial to protect sensitive information, ensure regulatory compliance, and mitigate the risks of data breaches, and unauthorized data sharing:

Learn more:

- [Data Loss Prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention)
- [Implement a DLP strategy](dlp-strategy.md)

## Cross-tenant inbound and outbound restrictions

[Tenant isolation](/power-platform/admin/cross-tenant-restriction) is a security feature that helps you control and restrict how connectors that use Microsoft Entra ID authentication can access data from other tenants. This feature is useful for organizations that need to maintain strict data boundaries between various subsidiaries or external partners.

By default, tenant isolation is off, and connectors access data across tenants unless other data policies are in place. Tenant isolation applies to all connectors that use Microsoft Entra ID authentication.

When configuring tenant isolation, consider the specific data access requirements and collaboration needs of each tenant. Ensure that the isolation settings align with your organization's security policies and compliance requirements. Regularly review and update the isolation configurations to adapt to changing business needs and security threats. Properly configuring tenant isolation helps prevent unauthorized data access, reduces the risk of data breaches, and ensures that sensitive information remains within the intended boundaries.

## Network security

Power Platform service architecture lets you build end-to-end business app solutions that use data from both internal and external services with connectors. Many solutions also connect to your organization’s on-premises and cloud resources. In this section, we explore the network security features of Power Platform and help you learn how to fit Power Platform services and solutions into your network security design.

### Network service tags

Power Platform is a cloud-based service requiring connectivity to the internet. Microsoft publishes a set of IPs, host names, and service tags representing Power Platform services for you to allow access to. To reduce the risk of attacks, configure these values in firewalls or add them to browser proxy settings to access the respective endpoints.

A service tag represents a group of IP address prefixes from a given Azure service. Microsoft manages the address prefixes encompassed by the service tag and automatically updates the service tag as addresses change, minimizing the complexity of frequent updates to network security rules.

Refer to the [full list of available service tags](/azure/virtual-network/service-tags-overview#available-service-tags) to configure your network security rules.

Connectors require access to the outbound IP addresses in your datacenter region. If your environment or firewall blocks these addresses, the connectors won't function. While most connectors use HTTPS port 443, some might use other protocols. Check the specific requirements for the connectors you use. IP addresses and service tags vary by region and environment where the app or flow is located. Refer to the [full list of Power Platform IP addresses and service tags](/connectors/common/outbound-ip-addresses#power-platform) to correctly set up your allowlist.

### Connecting to data sources

Power Platform connects and authenticates to data sources using various connectors that facilitate seamless integration with external systems and services.

Learn more: [Connecting and authenticating to data sources](/power-platform/admin/security/connect-data-sources)

### Virtual Network support

With [Azure Virtual Network](/azure/virtual-network/virtual-networks-overview) support for Power Platform, you can integrate Power Platform with resources inside your virtual network without exposing them over the public internet. Virtual Network support uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview) to manage outbound traffic from Power Platform at runtime. Using Azure subnet delegation avoids the need for protected resources to be available over the internet to integrate with Power Platform. With virtual network support, Power Platform components can call resources owned by your enterprise inside your network, whether they're hosted in Azure or on-premises, and use plug-ins and connectors to make outbound calls.

To mitigate the risk of data exfiltration through plug-ins and connectors, you can use network security to protect both inbound and outbound traffic. Power Platform supports Virtual Network (vNet) integration for both [connectors and Dataverse plug-ins including Microsoft Copilot Studio integrations](/power-platform/admin/vnet-support-overview#supported-services), providing private, outbound connectivity from Power Platform to resources within your vNet. 

### IP firewall for Power Platform environments

The [IP firewall](/power-platform/admin/ip-firewall) feature in Power Platform provides an additional layer of security by controlling inbound traffic to your Power Platform environments. This feature allows administrators to define and enforce IP-based access controls, ensuring that only authorized IP addresses can access the environment. When enabled, the IP firewall evaluates the IP address of each request in real time and allows or denies access based on the configured IP ranges.

For example, if you enable the IP firewall and restrict access to Dataverse to only your office network IP addresses, users can't access Dataverse from other locations. The IP firewall also prevents token replay attacks, ensuring that access tokens can't be used from unauthorized network locations. Any such request fails. Since the IP firewall operates at the network layer, it impacts both apps and APIs that use Dataverse. You can configure the IP firewall for each environment, allowing you to determine which environments require stricter protection. For example, you might permit unrestricted access to your development environments while limiting access to your test and production environments.

### Prevent session hijacking exploits in Dataverse

Prevent session hijacking exploits in Dataverse with [IP address-based cookie binding](/power-platform/admin/block-cookie-replay-attack). Let's say that a malicious user copies a valid session cookie from an authorized computer that has cookie IP binding enabled. The user then tries to use the cookie on a different computer to gain unauthorized access to Dataverse. In real time, Dataverse compares the IP address of the cookie's origin against the IP address of the computer making the request. If the two are different, the attempt is blocked, and an error message is shown.

### Connect to on-premise resources

The [on-premises gateway](/power-platform/admin/onpremises-data-gateway-management) lets Power Platform cloud apps and automations use on-premises resources securely. You can use a gateway to connect to on-premises data from sources like a file system, DB2, Oracle, SAP ERP, SQL Server, and SharePoint. The gateway uses [Azure Relay](/azure/azure-relay/relay-what-is-it) to allow access to on-premises resources securely. Azure Relay can securely expose services inside your network to the public cloud without having to open a port on your firewall. The gateway uses these outbound ports: TCP 443, 5671, 5672, and 9350–9354. The gateway doesn't require inbound ports.

One gateway can allow multiple users to access multiple data sources. You can [control who can install an on-premises data gateway](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) in your tenant, but not at the environment level. 

The following gateway roles manage the security of the gateway and its connections:

- **Admin**: Any user who installs a gateway is automatically assigned the admin role. An admin can manage and update the gateway, create connections to data sources, manage access to all connections, and manage other users on the gateway.
- **Connection creator**: You can create and test connections on the gateway, but you can't manage or update it or add or remove other users.
- **Connection creator with sharing**: You have the same permissions as a connection creator, plus you can share the gateway with other users.

For connections that you create for Power Apps and Power Automate, you can limit the connection types that are available to users when you assign the role. Use standard network controls on the gateway server to limit the data sources the gateway can access. Clustering gateways can make them more reliable and faster for critical business needs. Use different clusters for different purposes, such as supporting the application lifecycle, dividing your organization, or isolating services. This approach helps you meet different compliance or security requirements for different data sources.

With virtual network data gateways, Power BI and Power Platform dataflows can connect to data services in an Azure Virtual Network without needing an on-premises data gateway on a virtual machine inside the virtual network. Find [supported data services for Power BI datasets](/data-integration/vnet/use-data-gateways-sources-power-bi#supported-azure-data-services) and [supported data sources for Power Platform dataflows](/data-integration/vnet/data-gateway-power-platform-dataflows#supported-data-sources).

[Azure ExpressRoute](/power-platform/guidance/expressroute/overview) offers an advanced way to connect your on-premises network to Microsoft cloud services using private connectivity. You can use one ExpressRoute connection to access multiple online services, such as Power Platform, Dynamics 365, Microsoft 365, and Azure, without traversing the public internet. ExpressRoute requires careful planning and configuration, and costs more for the ExpressRoute service and the connectivity provider.

## Manage Microsoft access to customer data with Customer Lockbox

[Customer Lockbox](/power-platform/admin/about-lockbox) lets you give temporary, just-in-time access to your environments for Microsoft engineers to help solve critical support requests.

Lockbox has these core capabilities:

- Administrators can choose which Microsoft Dataverse databases need to be protected by lockbox.
- On the rare occasion that Microsoft needs to temporarily access data in a lockbox-protected database to resolve a critical issue, administrators are notified and can visit the Power Platform admin center to approve or reject the request.

Once access is granted to Microsoft, any action taking place in the lockbox-protected database during the temporary access period is recorded and made available to your organization as SQL audit logs. You can export these logs to an Azure data lake for further analysis.

## Control which apps are allowed in your environment

Protect against data exfiltration by controlling which apps can run in your Dataverse environment. These safeguards prevent unauthorized removal of sensitive information, helping your business maintain continuity and comply with regulations. Learn more about [app access control](/power-platform/admin/control-app-access-environment).

## Protect sensitive information with data masking

For scenarios that use personally identifiable information such as credit card numbers or social security numbers, create [data masking rules](/power-platform/admin/create-manage-masking-rules) to protect your organization's and customer's sensitive data. With data masking, also referred to as de-identification or obfuscation, sensitive data is replaced with masked strings to hide the original values remain hidden. Only authorized users can access unmasked data, one record at a time, ensuring that data is treated with utmost sensitivity. Safeguard your data by using an existing, predefined rule, or create your own as a solution.

## Use Microsoft Purview for data discovery and classification

The integration of [Microsoft Purview with Microsoft Dataverse](/purview/register-scan-dataverse) enables powerful security capabilities. With the Microsoft Purview Data Map, you benefit from automated data discovery and sensitive data classification, gain a deeper understanding of your business applications data estate, safeguard your data, and enhance your risk and compliance posture.

With Microsoft Purview, you can create an up-to-date view of all your data sources, including the data in your Power Platform Dataverse environments. Microsoft Purview sorts your data assets by built-in or custom categories to help you understand what data your makers have in their Dataverse environments. For example, Microsoft Purview tells you if a maker has added sensitive data like government IDs or credit card numbers. Then you can either tell the maker how to change the data to follow your policies or use safeguards to secure it.

## Dataverse security

One key feature of Dataverse is its flexible security model, which you can adapt to various business needs. The Dataverse security model is only available when you have a Dataverse database in your environment. As a security professional, you might create the entire security model yourself, but you might need to check that it meets your organization’s data security requirements.

Dataverse uses [security roles](/power-platform/admin/security-roles-privileges) to group privileges. You can assign these roles to users or to Dataverse teams and business units. Users who belong to a team or a business unit inherit the role of that group. A key concept of Dataverse security is that privileges are cumulative and additive. If you grant broad access to some data, you can’t restrict access to a specific part of it later. Dataverse teams can be associated with either Microsoft Entra ID security groups or Microsoft 365 groups. When the association is established, the system automatically manages the members of the Dataverse team. The first time a user uses an app that depends on this security, the system adds them to the Dataverse team.

Dataverse security roles can act as if they were assigned directly to the user. This setup gives the user privileges at the user level through their membership in a Dataverse team. To simplify setup, share a canvas app with a Microsoft Entra ID security group and select the Dataverse security roles needed to use the app. The system creates a Dataverse team for you and associates it with the Microsoft Entra ID security group. The new team also gets the Dataverse security roles you select. This approach simplifies the admin experience and helps you manage user security with less manual work.

Dataverse security is a complex topic and requires collaboration between the application makers, the security team, and the user admin team. You should plan and communicate any major changes before you apply them to your environment.

Learn more about [security concepts in Dataverse](/power-platform/admin/wp-security-cds).

## Privacy

Your data is your business, and you can access, modify, or delete it at any time. Microsoft won't use your data without your agreement. With your consent, we use your data to provide only the services you choose. We process your data based on your agreement and in accordance with our strict policies and procedures. We don't share your data with advertiser-supported services, nor do we use it for any purposes like marketing research or advertising. Learn more about how [Microsoft categorizes data in the delivery of online services](https://www.microsoft.com/trust-center/privacy/customer-data-definitions?rtc=1).

We believe you should have control over your data. Learn how we [handle data requests from government and law enforcement agencies](https://www.microsoft.com/trust-center/privacy).

As a customer, you're responsible for data classification, identity management, and assigning appropriate security roles to protect data.

Learn more about [Microsoft privacy](https://privacy.microsoft.com/).

## Conclusion

In conclusion, ensuring robust data protection within Power Platform is a shared responsibility between customers and Microsoft. It involves a thorough evaluation of all available security features and selecting configurations that align with your organization's security policies and compliance requirements. By assessing the specific needs and risks associated with your environment, you can implement tailored security measures that protect sensitive data, prevent unauthorized access, and maintain regulatory compliance. Regular reviews and updates to security configurations are needed to adapt to evolving threats and changing business needs. 

## Next steps

Review the detailed articles in this series to further enhance your security posture:

- [Detect threats to your organization](threat-detection.md)
- [Implement a DLP strategy](dlp-strategy.md)
- [Configure identity and access management](conditional-access.md)
- [Meet compliance requirements](compliance.md)
- [Secure the default environment](secure-default-environment.md)

[!INCLUDE [guidance-adoption-security-review.checklist](../../includes/guidance-adoption-security-review.checklist.md)]
