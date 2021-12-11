---
title: "Overview: Security in Microsoft Power Platform | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 12/08/2021
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Overview: Security in Microsoft Power Platform

> **Working notes**
> 
> This is the first page people will read so we should:
> - Start by highlighting how much we care about security and how Power Platform has the best-in-class security
> - Add info about Power Platform components and talk about the types/levels of security that can be implemented 
> - Explain the architecture for:
>    - Power Platform as a whole
>    - Each Power Platform component


The Microsoft Power Platform enables both non-professional and professional developers to quickly and easily create end to end solutions. These solutions may include applications, databases, and workflows both for small work groups or the entire organization. Security is critical for these solutions and the Power Platform is built to provide industry-leading complete protection.  

As organizations accelerate their transition their work to the cloud, we see a massive increase in remote working, increased customer demand for online services, and increased use of advanced technologies in operations and business decision-making.  The Power Platform enables these scenarios with applications on the cloud in a secure way. 

Traditional on-premise application security will not suffice.  Organizations must look for a cloud-native, multi-tiered, defense-in-depth security solution for their business intelligence data.
The Power Platform was built to provide industry-leading complete protection for data. Today many national security agencies, financial institutions, and health care providers entrust it with their most sensitive information.

It all starts with the foundation. After a rough period in the early 2000s, Microsoft made massive investments to address its security vulnerabilities, and in the following decades built a very strong security stack that goes as deep as the machine on-chip bios kernel and extends all the way up to end-user experiences. These deep investments continue and today over 3,500 Microsoft engineers are engaged in building and enhancing Microsoft's security stack and proactively addressing the ever-shifting threat landscape. With billions of computers, trillions of logins, and countless zettabytes of information entrusted to Microsoft's protection, the company now possesses the most advanced security stack in the tech industry and is broadly viewed as the global leader in the fight against malicious actors.

The Power Platform builds on this very strong foundation. It uses the same security stack that earned Azure the right to serve and protect the world's most sensitive data, and it integrates with the most advanced information protection and compliance tools of Microsoft 365. On top of this it delivers security through multi-layered security measures, resulting in end-to-end protection designed to deal with the unique challenges of the cloud era.

To provide an end-to-end solution for protecting sensitive assets, the product team addressed challenging customer concerns on multiple simultaneous fronts:

*	How do we control who can connect, where they connect from, and how they connect? How can we control the connections?
*	How is the data stored? How is it encrypted? What controls do I have on my data?
*	How do I control and protect my sensitive data? How do I ensure this data cannot leak outside the organization?
*	How do I audit who conducts what operations? How do I react quickly if there's suspicious activity on the service?

This article provides a comprehensive answer to all these questions. The Power Platform includes several services.  Some of the security concepts are broadly used by all the services and some are specific to individual services.  

## Common security topics 

Security toptics that are common to all of Power Platform include: 

* Power Platform service architecture - how the main flows in the system work.
* Authentication to the service for Power Platform services
* Data connections including authentication   
* Data at rest and encryption

The Power Apps service is governed by the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31), and the [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx). For the location of data processing, refer to the Location of Data Processing terms in the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31) and to the [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581). 

For compliance information, the [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is the primary resource for Power Apps. The Power Apps team is working hard to bring its customers the latest innovations and productivity. Learn more about compliance in the [Microsoft compliance offerings](https://docs.microsoft.com/en-us/compliance/regulatory/offering-home).

The Power Apps service follows the Security Development Lifecycle (SDL), strict security practices that support security assurance and compliance requirements. The SDL helps developers build more secure software by reducing the number and severity of vulnerabilities in software, while reducing development cost. Learn more at [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices).


## Power Platform service architecture

Power Platform services are built on Azure, Microsoft's cloud computing platform. Power Platform services are currently deployed in many datacenters around the world – there are many active deployments made available to customers in the regions served by those datacenters and an equal number of passive deployments that serve as backups for each active deployment.


   ![Power Platform service architecture.](./media/PowerPlatformBasicArch.png "Various front-end technologies (web front end, mobile, embedded, and other) flowing to the Power Platform back-end clusters.")


### Web front-end cluster (WFE)
For Power Platform services that display UI, the WFE cluster provides the user's browser with the initial HTML page contents on site load and manages the initial connection and authentication process using Azure Active Directory (Azure AD) to authenticate clients and provide tokens for subsequent client connections to the Power Apps back-end service.

  ![Web front end cluster.](./media/WFEcluster.png "Web front-end cluster (WFE) depends on the Azure App Service environment which in turn depends on ASP.NET.  WFE talks to the Power Platform service back-ends.")

A WFE cluster consists of an ASP.NET website running in the Azure App Service Environment. When users attempt to connect to a Power Platform service, the client's DNS service may communicate with the Azure Traffic Manager to find the most appropriate (usually nearest) datacenter with the Power Platform service's deployment. For more information about this process, see Performance traffic-routing method for Azure Traffic Manager.

The WFE cluster assigned to the user manages the login and authentication sequence (described later in this article) and obtains an Azure AD access token once authentication is successful. The ASP.NET component within the WFE cluster parses the token to determine which organization the user belongs to, and then consults the Power Platform service back-end global service. The WFE specifies to the browser which back-end cluster houses the organization's tenant. 

Once a user is authenticated, subsequent client interactions for customer data occur with the back-end  cluster directly without the WFE being an intermediator for those requests.
Static resources such as *.js, *.css, and image files are mostly stored on Azure Content Delivery Network (CDN) and retrieved directly by the browser. 

Note that Sovereign Government cluster deployments are an exception to this rule, and for compliance reasons will omit the CDN and instead use a WFE cluster from a compliant region for hosting static content.
### Power Platform back-end clusters (BE)
The back-end cluster for a given Power Platform service is the backbone of all the functionality available in the service. It consists of several service endpoints consumed by Web Front End and API clients as well as background working services, databases, caches, and various other components.
The back end is available in most Azure regions, and is deployed in new regions as they become available. A single Azure region hosts one or more back-end clusters that allow unlimited horizontal scaling of the Power Apps service once the vertical and horizontal scaling limits of a single cluster are exhausted.

Each back-end cluster is stateful and hosts all the data of all the tenants assigned to that cluster. A cluster that contains the data of a specific tenant is referred to as the tenant’s home cluster. An authenticated user's home cluster information is provided by Global Service and used by the Web Front End to route requests to the tenant’s home cluster.

Each back-end cluster consists of multiple virtual machines combined into multiple resizable-scale sets tuned for performing specific tasks, stateful resources such as SQL Azure databases, storage accounts, service buses, caches, and other necessary cloud components.

Tenant metadata and data are stored within cluster limits except for data replication to a secondary back-end cluster in a paired Azure region in the same Azure geography. The secondary back-end cluster serves as a failover cluster in case of regional outage, and is passive at any other time.
The back-end (“BE”) functionality is also serviced by micro-services running on different machines within the cluster’s virtual network that are not accessible from the outside, except for two components that can be accessed from the public internet:

*	Gateway Service
*	Azure API Management

  ![Backend with API and Gateway services.](./media/backendClusterGatewayAPI.png "Back end services diagram showing three major pieces:  API and Gateway services which are accessible from the outside and the collection of microservices which are private.")

### Power Platform Premium infrastructure
Power Apps Premium offers access to a set of connectors as a premium offering.  Power Apps authors are not restricted in the use of these connectors but users of an app are.  These connectors include, for instance, Dataverse and Microsoft SQL Azure.  End users of a Power App must have the correct license to access these premium connectors. The Power Apps Back-end service determines if a user has access to premium connectors or not.

### Mobile
Mobile supported on the three primary mobile platforms: Android, iOS, and Windows (UWP). Security considerations for mobile apps fall into two categories:

* Device communication
* The application and data on the device

For device communication, all Power Platform mobile applications communicate with the service and use the same connection and authentication sequences used by browsers. The mobile applications for iOS and Android bring up a browser session within the application itself, while the Windows mobile app brings up a broker to establish the communication channel with Power Platform services (for the sign-in process).

The following table shows certificate-based authentication (CBA) support for mobile, based on mobile device platform:

|CBA support	|iOS	|Android	|Windows |
---- | ---- | ---- | ---- 
Sign in to service	| Supported	| Supported	| Not supported
SSRS ADFS on-prem (connect to SSRS server)	|Not supported	|Supported	|Not supported
SSRS App Proxy	|Supported	|Supported	|Not supported


Mobile apps actively communicate with the Power Platform services. Telemetry is used to gather mobile app usage statistics and similar data, which is transmitted to services that are used to monitor usage and activity; no customer data is sent with telemetry.

Power Platform services securely store data on the device that facilitates use of the mobile app:
* Azure AD and refresh tokens are stored in a secure mechanism on the device, using industry-standard security measures.
* Data and settings (key-value pairs for user configuration) are cached in storage on the device, and can be encrypted by the OS. In iOS this is automatically done when the user sets a passcode. In Android this can be configured in the settings. In Windows it is accomplished by using BitLocker.
* For Android and iOS apps, the data and settings (key-value pairs for user configuration) are cached in storage on the device in a sandbox and internal storage which is accessible only to the app. For the Windows app, the data is only accessible by the user (and system admin).
* Geolocation is enabled or disabled explicitly by the user. If enabled, geolocation data is not saved on the device and is not shared with Microsoft.
* Notifications are enabled or disabled explicitly by the user. If enabled, Android and iOS do not support geographic data residency requirements for notifications.

Data encryption can be enhanced by applying file-level encryption via Microsoft Intune, a software service that provides mobile device and application management. All three platforms for which Power Platform Mobile apps are available support Intune. With Intune enabled and configured, data on the mobile device is encrypted, and the Power Platform application itself cannot be installed on an SD card. Learn more about [Microsoft Intune](https://www.microsoft.com/cloud-platform/microsoft-intune). The Windows app also supports [Windows Information Protection (WIP)](https://docs.microsoft.com/en-us/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip).

In order to implement SSO, some secured storage values related to the token-based authentication are available for other Microsoft 1st party apps (such as Microsoft Authenticator) and are managed by the Azure Active Directory Authentication Library (ADAL) SDK.

Mobile cached data is deleted when the app is removed, when the user signs out of the Power Platform service for Mobile, or when the user fails to sign in (such as after a token expiration event or password change). The data cache includes dashboards and reports previously accessed from the Power Apps Mobile app.

Power Platform Mobile services do not access other application folders or files on the device.

## Authentication to Power Platform services

User authentication to the Power Platform services consists of a series of requests, responses, and redirects between the user's browser and the Power Platform service or the Azure services used by the Power Platform. That sequence describes the process of user authentication in Power Platform services, which follows the [Azure Active Directory's auth code](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) grant flow. For more information about options for an organization's user authentication models (sign-in models), see [Choosing a sign-in model for Microsoft 365](https://www.microsoft.com/en-us/microsoft-365/blog/2014/05/13/choosing-a-sign-in-model-for-office-365/).

### End user authentication steps to the Power Platform

The user authentication sequence for the Power Platform services occurs as described in the following steps, which are illustrated in the image that follows. 
1.	A user initiates a connection to a Power Platform service from a browser, either by typing in the Power Apps address in the address bar or by selecting Sign in from a Power Platform service (e.g., Power Apps landing page.) The connection is established using TLS 1.2 and HTTPS. All subsequent communication between the browser and the Power Apps service uses HTTPS.
2.	The Azure Traffic Manager checks the user's DNS record to determine the most appropriate (usually nearest) datacenter where the Power Platform service is deployed and responds to the DNS with the IP address of the WFE cluster to which the user should be sent.
3.	WFE then redirects the user to the Microsoft Online Services login page.
4.	After the user has been authenticated, the login page redirects the user to the previously determined nearest Power Platform service WFE cluster with an auth code.
5.	The WFE cluster checks with the Azure AD service to obtain an Azure AD security token by using the auth code. When Azure AD returns the successful authentication of the user and returns an Azure AD security token, the WFE cluster consults the Power Platform Global Service, which maintains a list of tenants and their Power Platform back-end cluster locations and determines which Power Platform back-end service cluster contains the user's tenant. The WFE cluster then returns an application page to the user's browser with the session, access, and routing information required for its operation.
6.	When the client's browser requires customer data, it will send requests to the back-end cluster address with the Azure AD access token in the Authorization header. The Power Platform back-end cluster reads the Azure AD access token and validates the signature to ensure that the identity for the request is valid. The Azure AD access token has a default lifetime of 1 hour, and to maintain the current session the user's browser will make periodic requests to renew the access token before it expires.


  ![End user authentication sequence.](./media/EndUserAuthSequence.png " End user authentication sequence to the Power Platform services with browser, Azure traffic Manager, Azure CDN, the Web Front end (WFE) Azure Active Directly, and the Power Apps back-end cluster.  Authentication to back-end data sources is separate.")

The user authentication sequence when a Power Platform service is embedded in SharePoint, Power BI, or Teams is slightly more complicated as these services perform some of the steps and some steps still remain with the Power Platform service. 


## Connecting and authenticating to data sources

Connecting and authenticating to an external data source is an explicit and separate step from authenticating to a Power Platform service. The credentials may be the same for both steps but they may explicitly vary as well depending on your needs for your application.  

Additionally, while the specific pattern of how a Power Platform service connects to external data sources may vary, the general pattern is the same.  It can be very important to understand the specifics of how a Power Platform service connects and authenticates depending on your usage pattern. Details on how each Power Platform service varies is called out below.

### Dataverse
Generally, Power Platform services use connectors to work with external data sources.  However, Power Apps connects directly to Dataverse. No connectors are involved. Power Apps does store consent to work with other Dataverse environments in the Power Apps RP.  Similarly, Power Automate first authenticates via API Hub but all data interactions after that are direct to Dataverse.  Both Power Apps and Power Automate support legacy connectors that access Dataverse via connectors [e.g., via D365 and CDS]. 

Below is a image that illustrates how Power Apps works with Dataverse.

![Power Apps connection to Dataverse.](./media/PowerAppToDataverse.png "Diagram showing that Power Apps connects directly to Dataverse.  Power Apps back-end cluster works directly with Dataverse.  No explicit separate connection is made.  Consent to working with other environments is stored in the Power Apps RP.")

### Connectors
Power Platform services use connectors to work with all other data sources. The sequence of operations in working with a connector is:

1.	Power Platform service requests a connection of the Power Apps RP service.  Power Apps RP requests API Hub to create and store the connection and credentials. (Arrows 1 - 2)
2.	When a user requests data via a query, having previously secured an authenticated connection, the request goes directly to APIM. (Arrows 3 - 6)
3.	APIM uses the consent service to get user permission to access the data source.  For Power Apps, the consent triple (Connection, Application, User) is stored in Power Apps RP so that when the user requests data again we do not again prompt for consent. Note that consent for a given connection application combination does not give consent for all applications.  Each application connection consent per user is separate. For Power Automate this is the double (Connection, User).  Consent is not required for subsequent use of the connection. 
4.	The data query is passed on to the connector which then passes it on to the actual data source. (Arrows 7 - 8)
5.	The data result is passed to the connector and then back to the Power Platform service back end cluster. (Arrows 9 - 10)
 
![Power Platform connector model.](./media/generaldataconnection.png "Power Platform connector model.  Power Platform back end cluster services works with external services such as API Hub/APIM to reach connectors that retrieve data.")


### Authentication to data sources
Again, authentication of an end user to a Power Apps app data source is a separate and distinct step from authentication to the Power Apps service. First each user authenticates to the Power Apps service and then the credentials required by the connector are used to authenticate to the data source. In all cases credentials are stored and managed by the API Hub credentials service.  It is important to note that some connector types support more than one authentication method. Authentication to a data source in for a Power Platform service is then specific to each data source instance and is based on the authentication choice made when creating the connection for the service. 

For Power Apps, there are two types of Power Apps data source authentication: explicit and implicit. And it’s important to know the difference to keep your data secure.  Explicit authentication means that only the end user’s credentials will be used to access the data source. Implicit authentication means that the credentials the author used when creating the connection for the Power Apps will be used. The most secure connection type is explicit and we recommend it. [Canvas Apps SQL Server security ](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/connections/sql-server-security). 


### See also
[Add related articles]


