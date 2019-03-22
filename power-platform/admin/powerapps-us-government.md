---
title: Microsoft PowerApps US Government | Microsoft Docs
description: Provides information about PowerApps US Government service description, plans, and limitations.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/21/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Microsoft PowerApps US Government

In response to the unique and evolving requirements of the United States public sector, Microsoft has created PowerApps US Government, which consists of several plans for US government organizations. This section provides an overview of features that are specific to PowerApps US Government. It is recommended that you read this supplementary section alongside the PowerApps [documentation](https://docs.microsoft.com/powerapps/powerapps-overview), which covers information about the general PowerApps service description. For brevity, this service is commonly referred to as PowerApps Government Community Cloud (GCC).


The PowerApps US Government service description is designed to serve as an overlay to the general PowerApps service description. It defines the unique commitments of this service and the differences from PowerApps offerings that have been available to our customers since October 2016.

## About PowerApps US Government environments and plans

PowerApps US Government plans are monthly subscriptions and can be licensed to an unlimited number of users.

The PowerApps GCC environment provides compliance with federal requirements for cloud services, including FedRAMP High, DoD DISA IL2, and requirements for criminal justice systems (CJI data types).

In addition to the features and capabilities of PowerApps, organizations that use PowerApps US Government benefit from the following features unique to PowerApps US Government:

- Your organization's customer content is physically segregated from customer content in Microsoft's commercial PowerApps services.

- Your organization's customer content is stored within the United States.

- Access to your organization's customer content is restricted to screened Microsoft personnel.

- PowerApps US Government complies with certifications and accreditations that are required for US public sector customers.

## Customer eligibility

PowerApps US Government is available to (1) US federal, state, local, tribal, and territorial government entities and (2) other entities that handle data that is subject to government regulations and requirements and where use of PowerApps US Government is appropriate to meet these requirements, subject to validation of eligibility. Validation of eligibility by Microsoft will include confirmation of handling data subject to International Traffic in Arms Regulations (ITAR), law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) policy, or other government-regulated or controlled data. Validation might require sponsorship by a government entity with specific requirements for the handling of data. 

Entities with questions about eligibility for PowerApps US Government should consult their account team. Upon renewal of a customer's contract for PowerApps US Government, revalidation of eligibility is required.

## PowerApps US Government plans

Access to PowerApps US Government plans is restricted to the following offerings; each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- PowerApps/Flow Plan 1 US Government

- PowerApps/Flow Plan 2 US Government

- In addition to the standalone plans, PowerApps and Microsoft Flow capabilities are also included in certain Office 365 US Government and Dynamics 365 US Government plans, allowing customers to extend and customize Office 365 and Dynamics 365. Please note that this licensing will automatically show up and be available in customer tenants around mid-April.

Additional information about the differences in functionality between these groups of licenses is described in more detail on the [PowerApps licensing information](https://powerapps.microsoft.com/pricing/) page. PowerApps US Government is available through the Volume Licensing and Cloud Solution Provider purchasing channels.

## What is customer data and customer content?

Customer data, as defined in the Online Services Terms, means all data, including all text, sound, video, or image files, and software, that are provided to Microsoft by, or on behalf of, customers through the use of the Online Service. Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in the [Common Data Service](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro) entities (for example, contact information). Content is generally considered confidential information and in normal service operation is not sent over the internet without encryption.

For more information on PowerApps protection of customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of PowerApps US Government, the PowerApps service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

Microsoft refers to this offer as the Government Community Cloud (GCC).

In addition to the logical separation of customer content at the application layer, the PowerApps US Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial PowerApps customers. This includes using Azure services in the Azure Government cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Customer content located within the United States

PowerApps US Government services are provided from datacenters physically located in the United States. PowerApps US Government customer content is stored at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to PowerApps US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

PowerApps support and service engineering staff do not have standing access to customer content hosted in PowerApps US Government. Any staff who request temporary permission elevation which would grant access to customer content must first have passed the following background checks.

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

<sup>1</sup> Applies only to personnel with temporary or standing access to customer content hosted in PowerApps US Government (GCC).

## Certifications and accreditations

PowerApps US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. This infers alignment to [DoD DISA IL2](https://iase.disa.mil/cloud_security/cloudsrg/Pages/ImpactLevels.aspx). FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can review these artifacts in support of their review to grant an Authority to Operate (ATO). 

Note that, at the present time, the PowerApps US Government services are under review with FedRAMP but have been granted a Security Assessment Report (SAR) by a qualified Third Party Assessment Organization ([3PAO](https://www.fedramp.gov/3pao-requirements-update/)). As Microsoft moves to refresh FedRAMP artifacts as part of the standard audit cycles, content will be updated accordingly.

PowerApps US Government has features designed to support customer’s CJIS Policy requirements for law enforcement agencies. Please visit the PowerApps US Government products page in Trust Center for more detailed information related to certifications and accreditations.

## PowerApps US Government and other Microsoft services

PowerApps US Government includes several features that allow users to connect to and integrate with other Microsoft enterprise service offerings such as Office 365 US Government, Dynamics 365 US Government, and Microsoft Flow US Government. PowerApps US Government is deployed within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including but not limited to the web-user client, PowerApps mobile applications any third-party client application that connects to PowerApps US Government are not part of PowerApps US Government's accreditation boundary and government customers are responsible for managing them.

PowerApps US Government leverages the Office 365 customer administrator UI for customer administration and billing—PowerApps US Government maintains the actual resources, information flow, and data management, while relying on Office 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, PowerApps US Government leverages Azure (including Azure Government) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (AD FS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on, any customer content that is temporarily cached will be located in the United States.

## PowerApps US Government and third-party services

PowerApps US Government provides the ability to integrate third-party applications into the service through [connectors](https://docs.microsoft.com/connectors/index). These third-party applications and services might involve storing, transmitting, and processing your organization’s customer data on third-party systems that are outside of the PowerApps US Government infrastructure and therefore are not covered by the PowerApps US Government compliance and data protection commitments.

We recommend that you review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

## PowerApps US Government and Azure services

The PowerApps US Government services are deployed to Microsoft Azure Government. Azure Active Directory (Azure AD) is not part of the PowerApps US Government accreditation boundary, but takes a reliance on a customer’s [Azure AD](https://azure.microsoft.com/services/active-directory/) tenant for customer tenant and identity functions, including authentication, federated authentication, and licensing.

When a user of an organization employing AD FS attempts to access PowerApps US Government, the user is redirected to a login page hosted on the organization’s AD FS server.
The user provides his or her credentials to their organization's AD FS server. The organization's AD FS server attempts to authenticate the credentials using the organization’s Active Directory infrastructure.

If authentication is successful, the organization’s AD FS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user’s identity and group membership.

The customer’s AD FS server signs this ticket using one half of an asymmetric key pair and then it sends the ticket to Azure AD via encrypted Transport Layer Security (TLS). Azure AD validates the signature using the other half of the asymmetric key pair and then grants access based on the ticket.

The user's identity and group membership information remain encrypted in Azure AD. In other words, only limited user-identifiable information is stored in Azure AD.

You can find full details of the Azure AD security architecture and control implementation in the Azure SSP.  End-users do not interact directly with Azure AD.

## PowerApps US Government service URLs

You use a different set of URLs to access PowerApps US Government, as shown in the following table.

| **Commercial version URL**     | **US Government version URL**         |
|--------------------------------|---------------------------------------|
| <https://web.powerapps.com>    | <https://gov.web.powerapps.us>        |
| <https://create.powerapps.com> | <https://gov.create.web.powerapps.us> |
| <https://admin.powerapps.com>  | <https://gov.admin.powerapps.us>      |

## Connectivity between PowerApps US Government and public Azure Cloud Services

Azure is distributed among multiple clouds. By default, tenants are allowed to open firewall rules to a cloud-specific instance, but cross-cloud networking is different and requires opening specific firewall rules to communicate between services. If you are a PowerApps customer, and you have existing SQL instances in the Azure public cloud that you need to access, you must open specific firewall rules in SQL to the Azure Government cloud IP space, for the following datacenters:

- USGov Virginia

- USGov Texas

Please refer to the Azure IP Ranges and [Service Tags – US Government Cloud document](https://www.microsoft.com/download/confirmation.aspx?id=57063), focusing attention on AzureCloud.usgovtexas and AzureCloud.usgovvirginia. Also note that these are the IP ranges required in order for your end users to have access to the service URLs.

## On-premises data gateway configuration

Install an [on-premises data gateway](https://docs.microsoft.com/powerapps/maker/canvas-apps/gateway-management) to transfer data quickly and securely between a canvas app that's built in
PowerApps and a data source that isn't in the cloud, such as an on-premises SQL Server database or an on-premises SharePoint site.

If your organization (tenant) has already configured and successfully connected the on-premises data gateway for Power BI US Government, then the process and configuration your organization executed to enable that will also enable on-premises connectivity for PowerApps. However, if you are unable to connect to your tenant, you might need to go through a “whitelisting” process, which will enable this capability for your tenant. Should this occur, please open a support ticket to address your needs. The support team will follow an established process to address your request.

## PowerApps US Government feature limitations

Some of the features available in the commercial version of PowerApps are not available to PowerApps US Government customers. The PowerApps team is actively working on making the following features available to US Government customers and will update this article when these features become available:

- Embed in [SharePoint Online](https://powerapps.microsoft.com/blog/embed-powerapps-on-sharepoint-pages/), [Microsoft Teams](https://powerapps.microsoft.com/blog/powerapps-teams/), and other products.

- Creating PowerApps US Government apps from [SharePoint lists](https://support.office.com/article/Create-a-PowerApp-for-a-list-in-SharePoint-Online-9338b2d2-67ac-4b81-8e67-97da27e5e9ab).

- [Data integration and Power Query](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-cds-newentity-pq).

- [Common Data Service analytics](analytics-common-data-service.md)

- [Mobile push notifications](https://docs.microsoft.com/powerapps/maker/canvas-apps/add-notifications).

- [Connectors](https://docs.microsoft.com/connectors/index): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact support, and we will review your request.

- [Power Platform admin center](admin-documentation.md): The admin center can be used to [open support tickets](get-help-support.md), but other functionality is currently not available in US Government tenants.

- PowerApps admin link from the Office 365 Admin Center: Use [https://gov.admin.powerapps.us](https://gov.admin.powerapps.us) to reach the PowerApps admin center.

### See also

[Microsoft Flow US Government](https://docs.microsoft.com/en-us/flow/us-govt)
