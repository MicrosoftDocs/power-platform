---
title: Security in Microsoft Power Platform
description: Learn how Microsoft Power Platform keeps your data secure.
ms.date: 02/14/2022
ms.service: power-platform
ms.topic: overview
ms.custom: "admin-security"
ms.collection: get-started
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Security in Microsoft Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Platform puts the power to quickly and easily create end-to-end solutions in the hands of non-professional and professional developers alike. Security is critical for these solutions. Power Platform is built to provide industry-leading protection.

Organizations are accelerating their transition to the cloud, incorporating advanced technologies in operations and business decision-making. More employees are working remotely. Customer demand for online services is soaring. Traditional on-premise application security is no longer enough. Organizations looking for a cloud-native, multi-tiered, defense-in-depth security solution for their business intelligence data turn to Power Platform. National security agencies, financial institutions, and health care providers trust Power Platform with their most sensitive information.

Microsoft has made massive investments in security since the mid-2000s. More than 3,500 Microsoft engineers work to proactively address the ever-shifting threat landscape. Microsoft security starts at the on-chip BIOS kernel and extends all the way up to the user experience. Today, our security stack is the most advanced in the industry. Microsoft is broadly viewed as the global leader in the fight against malicious actors. Billions of computers, trillions of logins, and zettabytes of data are entrusted to Microsoft's protection.

Power Platform builds on this strong foundation. It uses the same security stack that earned Azure the right to serve and protect the world's most sensitive data, and integrates with Microsoft 365's most advanced information protection and compliance tools. Power Platform delivers end-to-end protection designed around our customers' most challenging concerns in the cloud era:

- How can we control who can connect, where they connect from, and how they connect? How can we control the connections?
- How is our data stored? How is it encrypted? What controls do we have on our data?
- How can we control and protect our sensitive data? How can we ensure our data can't leak outside the organization?
- How can we audit who can do what? How can we react quickly if we detect suspicious activity?

## Governance

The Power Platform service is governed by the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31) and the [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx). For the location of data processing, refer to the Microsoft Online Services Terms and the [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581).

The [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is the primary resource for Power Platform compliance information. Learn more at [Microsoft Compliance Offerings](/compliance/regulatory/offering-home).

The Power Platform service follows the Security Development Lifecycle (SDL). The SDL is a set of strict practices that support security assurance and compliance requirements. Learn more at [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices).

## Common Power Platform security concepts

Power Platform includes several services. Some of the security concepts we'll cover in this series apply to all of them. Other concepts are specific to individual services. Where security concepts are different, we'll call them out.

Security concepts that are common to all Power Platform services include:

- The Power Platform service architecture, or how information flows through the system
- [Authenticating to Power Platform services](./authenticate-services.md), or how users gain access to services
- [Connecting and authenticating to data sources](./connect-data-sources.md), or how services connect to data sources and users gain access to data
- [Data storage in Power Platform](./data-storage.md), or how data is protected whether it's at rest or in transit between systems and services

## The Power Platform service architecture

Power Platform services are built on Azure, Microsoft's cloud computing platform. The Power Platform service architecture is composed of four components:

- Web front-end cluster
- Back-end cluster
- Premium infrastructure
- Mobile platforms

### Web front-end cluster

Applies to Power Platform services that display a web UI. The web front-end cluster serves the application or service home page to the user's browser. It uses Microsoft Entra to authenticate clients initially, and provide tokens for subsequent client connections, to the Power Platform back-end service.

  :::image type="content" source="./media/WFEcluster.png" alt-text="A diagram that illustrates how the Power Platform web front-end cluster works with the Azure App Service Environment, ASP.NET, and Power Platform service back-end clusters.":::

A web front-end cluster consists of an ASP.NET website that runs in the Azure App Service Environment. When a user visits a Power Platform service or application, the client's DNS service may get the most appropriate (usually nearest) datacenter from the Azure Traffic Manager. For more information, see [Performance traffic-routing method for Azure Traffic Manager](/azure/traffic-manager/traffic-manager-routing-methods#performance-traffic-routing-method).

The web front-end cluster manages the login and authentication sequence. It obtains a Microsoft Entra access token after the user is authenticated. The ASP.NET component parses the token to determine which organization the user belongs to. The component then consults the Power Platform global back-end service to specify to the browser which back-end cluster houses the organization's tenant. Subsequent client interactions occur with the back-end cluster directly, without the need for the web front-end intermediary.

The browser fetches static resources, such as .js, .css, and image files, mainly from an Azure Content Delivery Network (CDN). Sovereign Government cluster deployments are an exception. For compliance reasons, these deployments omit the Azure CDN. Instead, they use a web front-end cluster from a compliant region to host static content.

### Power Platform back-end cluster

The back-end cluster is the backbone of all the functionality available in a Power Platform service. It consists of service endpoints, background working services, databases, caches, and other components.

The back-end is available in most Azure regions, and is deployed in new regions as they become available. One region can host multiple clusters. This configuration allows Power Platform services unlimited horizontal scaling after a single cluster's vertical and horizontal scaling limits are reached.

Back-end clusters are stateful. A back-end cluster hosts all the data of all the tenants assigned to it. The cluster that contains the data of a specific tenant is referred to as the tenant’s home cluster. Information about an authenticated user's home cluster is provided by the Power Platform global back-end service to the web front-end cluster. The web front-end uses the information to route requests to the tenant’s home back-end cluster.

Tenant metadata and data are stored within cluster limits. The exception is data replication to a secondary back-end cluster that's located in a paired region in the same Azure geography. The secondary cluster serves as a failover if there's a regional outage, and is passive at any other time. Micro-services running on different machines in the cluster's virtual network also serve back-end functionality. Only two of these micro-services are accessible from the public Internet:

- Gateway Service
- Azure API Management

:::image type="content" source="./media/backendClusterGatewayAPI.png" alt-text="A diagram of Power Platform back-end services showing three major pieces: API and Gateway services, which are accessible from the public Internet, and a collection of micro-services, which are private.":::

### Power Platform Premium infrastructure

Power Platform Premium provides access to an expanded set of connectors as a paid service. Power Platform makers aren't restricted in using premium connectors, but app users are. That is, users of an app that includes premium connectors must have the correct license to access them. The Power Platform back-end service determines whether a user has access to premium connectors.

### Mobile platforms

Power Platform supports Android, iOS, and Windows (UWP) applications. Security considerations for mobile apps fall into two categories:

- Device communication
- The application and data on the device

#### Device communication

Power Platform mobile apps use the same connection and authentication sequences used by browsers. Android and iOS apps open a browser session in the app. Windows apps use a broker to establish a communication channel with the Power Platform services for the sign-in process.

The following table shows certificate-based authentication (CBA) support for mobile apps:

|CBA support |iOS |Android |Windows |
| - | - | - | - |
|Sign in to service |Supported |Supported |Not supported |
|SSRS ADFS on-prem (connect to SSRS server) |Not supported |Supported |Not supported |
|SSRS App Proxy |Supported |Supported |Not supported |

Mobile apps actively communicate with the Power Platform services. App usage statistics and similar data are transmitted to services that monitor usage and activity. No customer data is included.

#### The application and data on the device

The mobile app and the data it requires are stored securely on the device. Microsoft Entra and refresh tokens are stored using industry-standard security measures.

Data cached on the device includes app data, user settings, and dashboards and reports accessed in previous sessions. The cache is stored in a sandbox in internal storage. The cache is accessible only to the app and can be encrypted by the OS.

- iOS: Encryption is automatic when the user sets a passcode.
- Android: Encryption can be configured in settings.
- Windows: Encryption is handled by BitLocker.

[Microsoft Intune](https://www.microsoft.com/cloud-platform/microsoft-intune) file-level encryption can be used to enhance data encryption. Intune is a software service that provides mobile device and application management. All three mobile platforms support Intune. With Intune enabled and configured, data on the mobile device is encrypted, and the Power Platform app can't be installed on an SD card.

Windows apps also support [Windows Information Protection (WIP)](/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip).  

Cached data is deleted when the user:

- uninstalls the app
- signs out of the Power Platform service
- fails to sign in after changing a password or a token expires

Geolocation is enabled or disabled explicitly by the user. If enabled, geolocation data isn't saved on the device and isn't shared with Microsoft.

Notifications are enabled or disabled explicitly by the user. If notifications are enabled, Android and iOS don't support geographic data residency requirements.

The Power Platform mobile services don't access other application folders or files on the device.

Some token-based authentication data is available to other Microsoft apps, such as Authenticator, to enable single sign-on. This data is managed by the Microsoft Entra Authentication Library SDK.

### Related articles

[Authenticating to Power Platform services](./authenticate-services.md)  
[Connecting and authenticating to data sources](./connect-data-sources.md)  
[Data storage in Power Platform](./data-storage.md)  
[Power Platform security FAQs](./faqs.md)  

### See also

- [Security in Microsoft Dataverse](../wp-security.md)  
- [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31)
- [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx)
- [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581)
- [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices)
- [Performance traffic-routing method for Azure Traffic Manager](/azure/traffic-manager/traffic-manager-routing-methods#performance-traffic-routing-method)
- [Microsoft Intune](https://www.microsoft.com/cloud-platform/microsoft-intune)
- [Windows Information Protection (WIP)](/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip)