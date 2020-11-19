---
title: Microsoft Power Apps US Government | Microsoft Docs
description: Provides information about Power Apps US Government service description, plans, and limitations.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/28/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Microsoft Power Apps US Government 

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

In response to the unique and evolving requirements of the United States public sector, Microsoft has created Power Apps US Government, which consists of several plans for US government organizations. This section provides an overview of features that are specific to Power Apps US Government. It is recommended that you read this supplementary section alongside the Power Apps [documentation](https://docs.microsoft.com/powerapps/powerapps-overview), which covers information about the general Power Apps service description. For brevity, this service is commonly referred to as Power Apps Government Community Cloud (GCC) or Power Apps Government Community Cloud – High (GCC High).

The Power Apps US Government service description is designed to serve as an overlay to the general Power Apps service description. It defines the unique commitments of this service and the differences from Power Apps offerings that have been available to our customers since October 2016.

## About Power Apps US Government environments and plans

Power Apps US Government plans are monthly subscriptions and can be licensed to an unlimited number of users.

The Power Apps GCC environment provides compliance with federal requirements for cloud services, including FedRAMP High, DoD DISA IL2, and requirements for criminal justice systems (CJI data types).

In addition to the features and capabilities of Power Apps, organizations that use Power Apps US Government benefit from the following features unique to Power Apps US Government:

- Your organization's customer content is physically segregated from customer content in Microsoft's commercial Power Apps services.
- Your organization's customer content is stored within the United States.
- Access to your organization's customer content is restricted to screened Microsoft personnel.
- Power Apps US Government complies with certifications and accreditations that are required for US public sector customers.

Beginning September, 2019, eligible customers may now choose to deploy Power Apps US Government to the "GCC High" environment, which enables single sign-on and seamless integration with Microsoft 365 GCC High deployments. Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate our US Department of Defense contractor customer base and other Federal agencies currently leveraging Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC which leverages Public Azure AD. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense.

## Customer eligibility

Power Apps US Government is available to (1) US federal, state, local, tribal, and territorial government entities and (2) other entities that handle data that is subject to government regulations and requirements and where use of Power Apps US Government is appropriate to meet these requirements, subject to validation of eligibility. Validation of eligibility by Microsoft will include confirmation of handling data subject to International Traffic in Arms Regulations (ITAR), law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) policy, or other government-regulated or controlled data. Validation might require sponsorship by a government entity with specific requirements for the handling of data. 

Entities with questions about eligibility for Power Apps US Government should consult their account team. Upon renewal of a customer's contract for Power Apps US Government, revalidation of eligibility is required.

## Power Apps US Government plans

Access to Power Apps US Government plans is restricted to the following offerings; each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- Power Apps per app plan for Government
- Power Apps per user plan for Government
- In addition to the standalone plans, Power Apps and Power Automate capabilities are also included in certain Microsoft 365 US Government and Dynamics 365 US Government plans, allowing customers to extend and customize Microsoft 365 and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Project Service Automation). 

Additional information about the differences in functionality between these groups of licenses is described in more detail on the [Power Apps licensing information](https://powerapps.microsoft.com/pricing/) page. Power Apps US Government is available through the Volume Licensing and Cloud Solution Provider purchasing channels. The Cloud Solution Provider program is not currently available for GCC High customers.

## What is customer data and customer content?

Customer data, as defined in the Online Services Terms, means all data, including all text, sound, video, or image files, and software, that are provided to Microsoft by, or on behalf of, customers through the use of the Online Service. Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in the [Microsoft Dataverse](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro) entities (for example, contact information). Content is generally considered confidential information and in normal service operation is not sent over the internet without encryption.

For more information on Power Apps protection of customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of Power Apps US Government, the Power Apps service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

In addition to the logical separation of customer content at the application layer, the Power Apps US Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial Power Apps customers. This includes using Azure services in the Azure Government cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Customer content located within the United States

Power Apps US Government services are provided from datacenters physically located in the United States. Power Apps US Government customer content is stored at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to Power Apps US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Power Apps support and service engineering staff do not have standing access to customer content hosted in Power Apps US Government. Any staff who request temporary permission elevation which would grant access to customer content must first have passed the following background checks.

| **Microsoft personnel screening and background checks** <sup>1</sup>     | **Description** |
|---------|----------------------------------------------------------------------------------|
| U.S. Citizenship  | Verification of U.S. citizenship   |
| Employment History Check  | Verification of seven (7) year employment history   |
| Education Verification | Verification of highest degree attained  |
| Social Security Number (SSN) Search   | Verification that the provided SSN is valid      |
| Criminal History Check  | A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level  |
| Office of Foreign Assets Control List (OFAC) | Validation against the Department of Treasury list of groups with whom U.S. persons are not allowed to engage in trade or financial transactions|
| Bureau of Industry and Security List (BIS) | Validation against the Department of Commerce list of individuals and entities barred from engaging in export activities   |
| Office of Defense Trade Controls Debarred Persons List (DDTC) | Validation against the Department of State list of individuals and entities barred from engaging in export activities related to the defense industry  |
| Fingerprinting Check | Fingerprint background check against FBI databases  |
| CJIS Background Screening | State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program |

<sup>1</sup> Applies only to personnel with temporary or standing access to customer content hosted in Power Apps US Government (GCC).

## Certifications and accreditations

Power Apps US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. This infers alignment to [DoD DISA IL2](https://iase.disa.mil/cloud_security/cloudsrg/Pages/ImpactLevels.aspx). FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can review these artifacts in support of their review to grant an Authority to Operate (ATO). 

> [!NOTE]
> Power Apps has been authorized as a service within the Azure Government FedRAMP ATO.  More information, including how to access the FedRAMP documents, can be found in the FedRAMP Marketplace: https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government

Power Apps US Government has features designed to support customer's CJIS Policy requirements for law enforcement agencies. Please visit the Power Apps US Government products page in Trust Center for more detailed information related to certifications and accreditations.

Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate our US Department of Defense contractor customer base and other Federal agencies currently leveraging Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC which leverages Public Azure AD. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations.

## Power Apps US Government and other Microsoft services

Power Apps US Government includes several features that allow users to connect to and integrate with other Microsoft enterprise service offerings such as Microsoft 365 US Government, Dynamics 365 US Government, and Microsoft Power Automate US Government. Power Apps US Government is deployed within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including but not limited to the web-user client, Power Apps mobile applications any third-party client application that connects to Power Apps US Government are not part of Power Apps US Government's accreditation boundary and government customers are responsible for managing them.

Power Apps US Government leverages the Microsoft 365 customer administrator UI for customer administration and billing—Power Apps US Government maintains the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Power Apps US Government leverages Azure (including Azure Government) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (AD FS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on, any customer content that is temporarily cached will be located in the United States.

## Power Apps US Government and third-party services

Power Apps US Government provides the ability to integrate third-party applications into the service through [connectors](https://docs.microsoft.com/connectors/index). These third-party applications and services might involve storing, transmitting, and processing your organization's customer data on third-party systems that are outside of the Power Apps US Government infrastructure and therefore are not covered by the Power Apps US Government compliance and data protection commitments.

We recommend that you review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

## Power Apps US Government and Azure services

The Power Apps US Government services are deployed to Microsoft Azure Government. Azure Active Directory (Azure AD) is not part of the Power Apps US Government accreditation boundary, but takes a reliance on a customer's [Azure AD](https://azure.microsoft.com/services/active-directory/) tenant for customer tenant and identity functions, including authentication, federated authentication, and licensing.

When a user of an organization employing AD FS attempts to access Power Apps US Government, the user is redirected to a login page hosted on the organization's AD FS server.
The user provides his or her credentials to their organization's AD FS server. The organization's AD FS server attempts to authenticate the credentials using the organization's Active Directory infrastructure.

If authentication is successful, the organization's AD FS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user's identity and group membership.

The customer's AD FS server signs this ticket using one half of an asymmetric key pair and then it sends the ticket to Azure AD via encrypted Transport Layer Security (TLS). Azure AD validates the signature using the other half of the asymmetric key pair and then grants access based on the ticket.

The user's identity and group membership information remain encrypted in Azure AD. In other words, only limited user-identifiable information is stored in Azure AD.

You can find full details of the Azure AD security architecture and control implementation in the Azure SSP.  End-users do not interact directly with Azure AD.

## Power Apps US Government service URLs

You use a different set of URLs to access Power Apps US Government environments, as shown in the following table (the commercial URLs are also shown for contextual reference, in case they are more readily familiar to you).

| **Commercial version URL**     | **US Government version URL**         |
|--------------------------------|---------------------------------------|
| <https://make.powerapps.com>    | <https://make.gov.powerapps.us> (GCC)<br/><https://make.high.powerapps.us> (GCC High)   |
| <https://create.powerapps.com> | <https://make.gov.powerapps.us> (GCC)<br /><https://make.high.powerapps.us> (GCC High)    |
| <https://flow.microsoft.com/connectors> | <https://gov.flow.microsoft.us/connectors><br /><https://high.flow.microsoft.us/connectors> (GCC High)  |
| <https://admin.powerplatform.microsoft.com> | <https://gcc.admin.powerplatform.microsoft.us><br /><https://high.admin.powerplatform.microsoft.us> (GCC High) |

For those customers that implement network restrictions, please ensure access to the following domains are made available to your end-users' access points:

**GCC Customers:**

*.microsoft.us<br/>
*.powerapps.us<br/>
*.azure-apihub.us<br/>
*.azure.us<br/>
*. usgovcloudapi.net<br/>
*.microsoftonline.com<br/>
*. microsoft.com<br/>
*.windows.net<br/>
*. azureedge.net<br/>
*. azure.net<br/>
*.crm9.dynamics.com<br/>
*.dynamics365portals.us

Please also refer to the Required IP Ranges to enable access to Dataverse environments that users and administrators may create within your tenant:

[https://www.microsoft.com/download/confirmation.aspx?id=57063](https://www.microsoft.com/download/confirmation.aspx?id=57063)  (Focus on AzureCloud.usgovtexas and AzureCloud.usgovvirginia)

**GCC High Customers:**

*.microsoft.us<br/>
*.powerapps.us<br/>
*.azure-apihub.us<br/>
*.azure.us<br/>
*. usgovcloudapi.net<br/>
*.microsoftonline.us<br/>
*. azureedge.net<br/>
*. azure.net<br/>
*.crm.microsoftdynamics.us<br/>
*.high.dynamics365portals.us

Please also refer to the Required IP Ranges to enable access to Dataverse environments that users and administrators may create within your tenant:

[https://www.microsoft.com/download/confirmation.aspx?id=57063](https://www.microsoft.com/download/confirmation.aspx?id=57063)  (Focus on AzureCloud.usgovtexas and AzureCloud.usgovvirginia)

## Regional Discovery Service is deprecated

Effective March 2, 2020, the *regional* [Discovery Service](/powerapps/developer/common-data-service/org-service/discovery-service) will be deprecated. More information: [Regional Discovery Service is deprecated](/power-platform/important-changes-coming#regional-discovery-service-is-deprecated) 

## Connectivity between Power Apps US Government and public Azure Cloud Services

Azure is distributed among multiple clouds. By default, tenants are allowed to open firewall rules to a cloud-specific environment, but cross-cloud networking is different and requires opening specific firewall rules to communicate between services. If you are a Power Apps customer, and you have existing SQL environments in the Azure public cloud that you need to access, you must open specific firewall rules in SQL to the Azure Government cloud IP space, for the following datacenters:

- USGov Virginia
- USGov Texas

Please refer to the Azure IP Ranges and [Service Tags – US Government Cloud document](https://www.microsoft.com/download/confirmation.aspx?id=57063), focusing attention on AzureCloud.usgovtexas and AzureCloud.usgovvirginia. Also note that these are the IP ranges required in order for your end users to have access to the service URLs.

## Configure mobile clients

<!-- When GCC High is enabled, instructions need to be modified for drop down in the dialog -->

To sign in with the Power Apps mobile client requires a few extra configuration steps. 

1. On the sign-in page, select the gear icon in the lower-right corner.
2. Select **Region** settings.
3. Select one of the following:
   - **GCC: US Government GCC**
   - **GCC Hight: US Government GCC High**
4. Select **OK**.
5. On the sign-in page, select **Sign in**.

The mobile application will now use the US Government Cloud domain. 

## On-premises data gateway configuration

Install an [on-premises data gateway](https://docs.microsoft.com/powerapps/maker/canvas-apps/gateway-management) to transfer data quickly and securely between a canvas app that's built in Power Apps and a data source that isn't in the cloud, such as an on-premises SQL Server database or an on-premises SharePoint site.

If your organization (tenant) has already configured and successfully connected the on-premises data gateway for Power BI US Government, then the process and configuration your organization executed to enable that will also enable on-premises connectivity for Power Apps. However, if you are unable to connect to your tenant, you might need to go through a process to add your tenant to an approved list, which will enable this capability for your tenant. Should this occur, please open a support ticket to address your needs. The support team will follow an established process to address your request.

## Power Apps US Government feature limitations

Some of the features available in the commercial version of Power Apps are not available to Power Apps US Government customers. The Power Apps team is actively working on making the following features available to US Government customers and will update this article when these features become available:

- Embed in [Power BI](https://docs.microsoft.com/power-bi/).

- Ability to add apps to Teams using the [Add to Teams button](https://docs.microsoft.com/powerapps/maker/canvas-apps/embed-teams-app).

- [Connectors](https://gov.flow.microsoft.us/connectors/): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact support, and we will review your request. Note that third-party connectors will not be added to GCC High.  Features are being investigated with the Digital Loss Prevention (DLP) administration functionality that will enable Connectors to be added “blocked by default.”  Until this is possible, third-party connectors pose a measurable threat to organizations relying on the GCC High environment to maintain requisite data exfiltration controls.

- [AI Builder](https://docs.microsoft.com/ai-builder/).

## Requesting support

Having a problem with your service? You can create a support request to get the issue resolved.  
  
More information: [Contact Technical Support](get-help-support.md)

### See also
[Microsoft Power Automate US Government](https://docs.microsoft.com/flow/us-govt) <br />
[UI Flows](https://docs.microsoft.com/power-automate/ui-flows/overview) <br />
[Dynamics 365 US Government](https://docs.microsoft.com/power-platform/admin/microsoft-dynamics-365-government)
