---
title: Microsoft Power Apps US Government | Microsoft Docs
description: Provides information about Power Apps US Government service description, plans, and limitations.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/02/2021
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

Microsoft created Power Apps US Government in response to the unique and evolving requirements of the government public sector. 

This article provides an overview of features that are specific to Power Apps US Government. Be sure that you read the supplementary section in the Power Apps [documentation](/powerapps/powerapps-overview), as it covers information about the general Power Apps service description. Note this service is referred to as Power Apps Government Community Cloud (GCC) or Power Apps Government Community Cloud – High (GCC High).

The Power Apps US Government service description serves as an overlay to the general Power Apps service description. Microsoft defines the unique commitments of this service and the differences from Power Apps offerings from those available since October 2016.

## About Power Apps US Government environments and plans

Power Apps US Government plans are monthly subscriptions and can be licensed to an unlimited number of users.

The Power Apps GCC environment provides compliance with federal requirements for cloud services. These services  include FedRAMP High, DoD DISA IL2, and requirements for criminal justice systems (CJI data types).

Organizations that use Power Apps US Government benefit from the following unique features:

- The organization's content is physically segregated from customer data in Microsoft's commercial Power Apps services.
- The organization's content is stored within the United States.
- Access to the organization's content is restricted to screened Microsoft personnel.
- Power Apps US Government follows certifications and accreditations that are required for US public sector customers.

Beginning in September 2019, eligible customers can deploy Power Apps US Government to the "GCC High" environment. This enables single sign-on (SSO) and integration with Microsoft 365 GCC High deployments. 

Microsoft designed the platform and operational procedures to meet the requirements that align with the DISA SRG IL4 compliance framework. Microsoft expects U.S. Department of Defense contractor customers and other Federal agencies currently deploy Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option. This release enables and requires customers to deploy Azure AD Government for customer identities, in contrast to GCC that deploys public Azure AD. 

For U.S. Department of Defense contractor customers, Microsoft operates a service to enable customers to meet ITAR commitment and DFARS acquisition regulations. This policy is documented and required by their contracts with the U.S. Department of Defense.

## Customer eligibility

Power Apps US Government is available to:

- US federal, state, local, tribal, and territorial government tables
- Other tables that handle data subject to government regulations and requirements. Also the use of Power Apps US Government is appropriate to meet these requirements, subject to validation of eligibility. 

Validation of eligibility by Microsoft includes confirmation of the handling of data subject to: 

- International Traffic in Arms Regulations (ITAR)
- Law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) policy
- Other government-regulated or controlled data

Validation may require sponsorship by a government table with specific requirements for the handling of data. 

Tables with questions about eligibility for Power Apps US Government should consult their account team. Upon renewal of a customer's contract for Power Apps US Government, revalidation of eligibility is required.

## Power Apps US Government plans

Microsoft limits access to Power Apps US Government plans to the offerings listed below. Each plan offers a monthly subscription and can be licensed to an unlimited number of users:

- Power Apps per app plan for Government
- Power Apps per user plan for Government
- In addition to the standalone Power Apps plans 

Microsoft includes automate capabilities in certain Microsoft 365 US Government and Dynamics 365 US Government plans. This allows customers to extend and customize Microsoft 365 and customer engagement apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Project Service Automation. 

More information about the differences in functionality between these groups of licenses can be found at [Power Apps licensing information](https://powerapps.microsoft.com/pricing/). Power Apps US Government is available through the Volume Licensing and Cloud Solution Provider purchasing channels. The Cloud Solution Provider program is not currently available for GCC High customers.

## What is customer data and content?

Customer data as defined in the Online Services Terms refers to all data, including text, alt text, sound, video, image files, and software. This includes date provided to Microsoft by or on for customers of the Online Service. 

Content refers to a specific subset of customer data created directly by users, such as content stored in databases through the [Microsoft Dataverse](/powerapps/maker/common-data-service/data-platform-intro) tables, for example contact information. Content that includes customer data is considered confidential information. During normal service operation, it isn't sent over the Internet without encryption.

For more information on Power Apps protection of customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of Power Apps US Government, the service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

Added to the logical separation of content at the application layer, the Power Apps US Government service provides organizations with a secondary layer of physical segregation. This is for content using an infrastructure that is separate from the one used for commercial Power Apps customers. This content includes using Azure services in the Azure Government cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Content located within the United States

Power Apps US Government services are provided from datacenters physically located in the United States. Power Apps US Government content is stored at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to Power Apps US Government content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Power Apps support and service engineering staff don't have standing access to content hosted in Power Apps US Government. Any staff who request temporary permission elevation that grants access to content must first have passed the following background checks.

| **Microsoft personnel screening and background checks** <sup>1</sup>     | **Description** |
|---------|----------------------------------------------------------------------------------|
| U.S. Citizenship  | Verification of U.S. citizenship   |
| Employment History Check  | Verification of seven (7) year employment history   |
| Education Verification | Verification of highest degree achieved  |
| Social Security Number (SSN) Search   | Verification that the provided SSN is valid      |
| Criminal History Check  | A 7-year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level  |
| Office of Foreign Assets Control List (OFAC) | Validation against the Department of Treasury list of groups with U.S. persons are not allowed to engage in trade or financial transactions|
| Bureau of Industry and Security List (BIS) | Validation against the Department of Commerce list of individuals and tables barred from engaging in export activities   |
| Office of Defense Trade Controls Debarred Persons List (DDTC) | Validation against the Department of State list of individuals and tables barred from engaging in export activities related to the defense industry  |
| Fingerprinting Check | Fingerprint background check against FBI databases  |
| CJIS Background Screening | State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program |

<sup>1</sup> Applies only to personnel with temporary or standing access to content hosted in Power Apps US Government (GCC).

## Certifications and accreditations

Power Apps US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level infers alignment to [DoD DISA IL2](https://iase.disa.mil/cloud_security/cloudsrg/Pages/ImpactLevels.aspx). FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can review these artifacts in support of their review to grant an Authority to Operate (ATO). 

> [!NOTE]
> Power Apps has been authorized as a service within the Azure Government FedRAMP ATO.  More information, including how to access the FedRAMP documents, can be found in the FedRAMP Marketplace: https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government

Power Apps US Government has features designed to support customer's CJIS Policy requirements for law enforcement agencies. Visit the Power Apps US Government products page in Trust Center for more detailed information related to certifications and accreditations.

Microsoft designed the platform and operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. Anticipated is the US Department of Defense contractor customer base and other Federal agencies currently deploying Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option. This enables and requires customers to deploy Azure AD Government for customer identities, in contrast to GCC that implements public Azure AD. For the US Department of Defense contractor customers, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations.

## Power Apps US Government and other Microsoft services

Power Apps US Government includes several features that allow users to connect to and integrate with other Microsoft enterprise service offerings such as Microsoft 365 US Government, Dynamics 365 US Government, and Microsoft Power Automate US Government. Power Apps US Government is deployed within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including but not limited to the web-user client, Power Apps mobile applications any third-party client application that connects to Power Apps US Government are not part of Power Apps US Government's accreditation boundary and government customers are responsible for managing them.

Power Apps US Government applies the Microsoft 365 customer admin UI for customer administration and billing—Power Apps US Government maintains the actual resources, information flow, and data management. This relyies on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Power Apps US Government applies Azure (including Azure Government) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (AD FS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on (SSO), any content that is temporarily cached will be located in the United States.

## Power Apps US Government and third-party services

Power Apps US Government provides the ability to integrate third-party applications into the service through [connectors](/connectors/index). These third-party applications and services might involve storing, transmitting, and processing your organization's customer data on third-party systems that are outside of the Power Apps US Government infrastructure and therefore are not covered by the Power Apps US Government compliance and data protection commitments.

Microsoft recommends that customers review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

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

Effective March 2, 2020, the *regional* [Discovery Service](/powerapps/developer/common-data-service/org-service/discovery-service) will be deprecated. More information: [Regional Discovery Service is deprecated](../important-changes-coming.md#regional-discovery-service-is-deprecated) 

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

Install an [on-premises data gateway](/powerapps/maker/canvas-apps/gateway-management) to transfer data quickly and securely between a canvas app that's built in Power Apps and a data source that isn't in the cloud, such as an on-premises SQL Server database or an on-premises SharePoint site.

If your organization (tenant) has already configured and successfully connected the on-premises data gateway for Power BI US Government, then the process and configuration your organization executed to enable that will also enable on-premises connectivity for Power Apps. However, if you are unable to connect to your tenant, you might need to go through a process to add your tenant to an approved list, which will enable this capability for your tenant. Should this occur, please open a support ticket to address your needs. The support team will follow an established process to address your request.

## Power Apps US Government feature limitations

Some of the features available in the commercial version of Power Apps are not available to Power Apps US Government customers. The Power Apps team is actively working on making the following features available to US Government customers and will update this article when these features become available:

- Embed in [Power BI](/power-bi/).

- Ability to add apps to Teams using the [Add to Teams button](/powerapps/maker/canvas-apps/embed-teams-app).

- [Connectors](https://gov.flow.microsoft.us/connectors/): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact support, and we will review your request. Note that third-party connectors will not be added to GCC High.  Features are being investigated with the Digital Loss Prevention (DLP) administration functionality that will enable Connectors to be added “blocked by default.”  Until this is possible, third-party connectors pose a measurable threat to organizations relying on the GCC High environment to maintain requisite data exfiltration controls.

- [AI Builder](/ai-builder/).
- [Geospatial features](/powerapps/maker/canvas-apps/geospatial-overview) are not available in government environments.

## Requesting support

Having a problem with your service? You can create a support request to get the issue resolved.  
  
More information: [Contact Technical Support](get-help-support.md)

### See also
[Microsoft Power Automate US Government](/flow/us-govt) <br />
[UI Flows](/power-automate/ui-flows/overview) <br />
[Dynamics 365 US Government](./microsoft-dynamics-365-government.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]