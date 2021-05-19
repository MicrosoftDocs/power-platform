---
title: "Dynamics 365 US Government overview"
description: "Learn about features that are specific to Microsoft Dynamics 365 US Government." 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/19/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Dynamics 365 US Government 

Microsoft has responded to the unique and evolving requirements of the public sector by creating Microsoft Dynamics 365 US Government. This release is available to qualified United States government entities.
 
Dynamics 365 US Government includes a continuity of protected environments that were originally branded Microsoft CRM Online Government. This release includes protections available to the government community cloud, under the new brand. The brand represents four discrete functions: Sales, Customer Service, Field Service, and Project Service Automation. 

This section provides an overview of features specific to Dynamics 365 US Government. Note that the apps listed below do not provide the compliance commitments or acquisition regulations documented in the Service Description.

- Microsoft Dynamics 365 Business Central
- Microsoft Dynamics 365 Marketing
- Microsoft Dynamics 365 Finance and Operations
- Microsoft Dynamics 365 Retail
- Microsoft Dynamics 365 Talent
- Microsoft Dynamics 365 Customer Service Insights
- Microsoft Dynamics 365 Market Insights
- Microsoft Dynamics 365 Sales Insights

## About Dynamics 365 US Government environments and plans

Dynamics 365 US Government has been generally available to customers through deployment into the Government Community Cloud (GCC) since January 2015. Including other compliance commitments and reviews as documented in the Microsoft Trust Center, the service received several agency Authorities to Operate (ATOs) since that time. It was the first Cloud Solution Provider (CSP) to achieve a FedRAMP Joint Application Board Provisional Authority to Operate (JAB P-ATO) through the JAB Accelerated Process. In March 2018, the service level was granted a FedRAMP JAB High P-ATO.  

Beginning in April 2019, eligible customers can choose to deploy Dynamics 365 US Government to the “GCC High” environment. This enables single sign-on (SSO) and seamless integration with Microsoft 365 GCC High deployments.  

Microsoft designed the platform and operational procedures to meet the requirements that align with the DISA SRG IL4 compliance framework. Anticipated U.S. Department of Defense contractor customer base and other Federal agencies currently leverage Microsoft 365 GCC High to use the Dynamics 365 US Government GCC High deployment option. This enables and requires customers to implement Azure AD Government for customer identities. Also this in contrast to GCC, which applies global Azure AD. For U.S. Department of Defense contractor customer base, Microsoft operates the service in a manner that enables customers to meet ITAR commitment and DFARS acquisition regulations. This is documented and required by most contracts with the US Department of Defense.

Dynamics 365 US Government plans are available to qualified government and private entities and is limited to the following: 

- U.S. federal, state, local, tribal, and territorial government tables
- Private tables using Dynamics 365 US Government to provide solutions to a government table, or a qualified member of the cloud community
- Private tables with customer data subject to government regulations that use of Dynamics 365 US Government, or an  appropriate service that meets the regulatory requirements

Access to Dynamics 365 US Government plans is restricted to the offerings described below. Microsoft offers each of these releases as a monthly subscription, which can be licensed to an unlimited number of users.

### Dynamics 365 US Government – GCC User Subscription Licenses

- Dynamics 365 Customer Engagement Plan GCC (existing enrollments only)
- Dynamics 365 Field Service GCC
- Dynamics 365 Case Management GCC
- Dynamics 365 Customer Service GCC
- Dynamics 365 Customer Service Professional GCC
- Dynamics 365 Sales GCC
- Dynamics 365 Sales Professional GCC
- Dynamics 365 Project Service GCC
- Dynamics 365 Team Member GCC
- Dynamics 365 ProDirect Support GCC
- Dynamics 365 Enhanced Support GCC
- Dynamics 365 Remote Assist GCC
- Dynamics 365 Guides GCC

### Dynamics 365 US Government – GCC AddOns

- Additional Portal for Government
- Extra Portal Page Views for Government
- Additional production Instance for Government
- Additional Non-production Instance for Government
- Additional Database Storage for Government

### Dynamics 365 US Government – GCC High User Subscription Licenses

- Dynamics 365 Customer Engagement Plan GCC High (existing enrollments only)
- Dynamics 365 Field Service GCC High
- Dynamics 365 Case Management GCC High
- Dynamics 365 Customer Service GCC High
- Dynamics 365 Customer Service Professional GCC High
- Dynamics 365 Sales GCC High
- Dynamics 365 Sales Professional GCC High
- Dynamics 365 Project Service GCC High
- Dynamics 365 Team Member GCC High
- Dynamics 365 ProDirect Support GCC High
- Dynamics 365 Enhanced Support GCC High
- Dynamics 365 Remote Assist GCC High

### Dynamics 365 US Government – GCC High AddOns

- Additional Portal for Government – GCC High
- Additional Portal Page Views for Government – GCC High
- Additional production Instance for Government – GCC High
- Additional Non-production Instance for Government – GCC High
  
### Subscription Availability

Eligible customers can purchase the above SKUs through the following purchasing channels:

- GCC:  Volume Licensing (VL) and Cloud Solution Provider (CSP)
- GCC High:  Volume Licensing (VL)

GCC SKUs currently included in an Enterprise Agreement (EA) can also be obtained through a Reservation. Choose either a qualified reseller or through the Volume Licensing Service Center (VLSC). 

When a customer places a reservation, Microsoft adds the requested subscription to the established customer Tenant on the same day. Then, the customer is billed a prorated amount based on the currently established Enterprise Agreement from the first of the month following activation of the reservation. This is part of the next anniversary or renewal payment cycle. Reservations are currently not available for GCC High subscriptions. For GCC High, follow the standard add on ordering process with your reseller.

Orders placed for GCC High must be followed-up with a request to the Microsoft GCC High-order processing team using the following online form: https://aka.ms/m365usgovtenantrequest. Contact your reseller or Microsoft account manager for more information and guidance.   

## What is “customer data” and “customer content?”  
 This section describes [!INCLUDE[pn_CRM_Online_Government_shortest](../includes/pn-crm-online-government-shortest.md)] commitments that apply to customer content and to customer data.  
  
 Customer data, as defined in the Online Service Terms, means all data, including all text, sound, video, or image files, and software. These are provided to Microsoft by, or on behalf of, Customer through use of the Online Service. Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] tables (for example, contact information). Content is considered confidential information, and in normal service operation, is not sent over the Internet without encryption.  
  
 For more information on the [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] protection of customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/dynamics365).  
  
## Data segregation for Government Community Cloud  
 When provisioned as part of [!INCLUDE[pn_CRM_Online_Government_shortest](../includes/pn-crm-online-government-shortest.md)], the [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.  
  
 In addition to the logical separation of customer content at the application layer, the [!INCLUDE[pn_CRM_Online_Government_shortest](../includes/pn-crm-online-government-shortest.md)] service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] customers. This includes using Azure services in Azure’s Government Cloud. To learn more, see [Azure Government](https://azure.microsoft.com/features/gov/).  
  
## Customer content located within the United States  
Dynamics 365 US Government services are provided from datacenters physically located in the United States. Customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) customer content is stored at rest in datacenters physically located only in the US.
  
## Restricted data access by administrators  
Access to Dynamics 365 US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Dynamics 365 support and service engineering staff do not have standing access to customer content hosted in Dynamics 365 US Government. Any staff who request temporary permission elevation which would grant access to customer content must first have passed the following background checks.


|Microsoft personnel screening and background checks<sup>1</sup>  |Description  |
|---------|---------|
|U.S. Citizenship     |Verification of U.S. citizenship         |
|Employment History Check     |Verification of seven (7) year employment history         |
|Education Verification     |Verification of highest degree attained         |
|Social Security Number (SSN) Search     |Verification that the provided SSN is valid         |
|Criminal History Check     |A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level         |
|Office of Foreign Assets Control List (OFAC)     |Validation against the Department of Treasury list of groups with whom U.S. persons are not allowed to engage in trade or financial transactions         |
|Bureau of Industry and Security List (BIS)     |Validation against the Department of Commerce list of individuals and tables barred from engaging in export activities         |
|Office of Defense Trade Controls Debarred Persons List (DDTC)     |Validation against the Department of State list of individuals and tables barred from engaging in export activities related to the defense industry         |
|Fingerprinting Check     | Fingerprint background check against FBI databases        |
|CJIS Background Screening<sup>2</sup>     |State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program         |

<sup>1</sup>Applies only to personnel with temporary or standing access to customer content hosted in Dynamics 365 US Government (GCC & GCC High).

<sup>2</sup> Applies only to personnel with temporary or standing access to customer content hosted in Dynamics 365 US Government (GCC).
  
## Certifications and accreditations  
Dynamics 365 US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can review these artifacts in support of their review to grant an Authority to Operate (ATO).  

> [!NOTE]
> Dynamics 365 has been authorized as a service within the Azure Government FedRAMP ATO.  More information, including how to access the FedRAMP documents, can be found in the FedRAMP Marketplace: https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government
  
Dynamics 365 US Government has features designed to support customer’s CJIS Policy requirements for law enforcement agencies. Please visit the [Power Platform Trust Center](https://www.microsoft.com/trust-center/product-overview#office-CustomSpacingTemplate-pl2a7m4) for more detailed information related to certifications and accreditations. 

Microsoft designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. Anticipation of the US Department of Defense contractor customer base and other Federal agencies are currently deploying Microsoft 365 GCC High to use the Dynamics 365 US Government GCC High deployment option. This enables and requires customers to integrate Azure AD Government for customer identities. This is in contrast to GCC deploying Public Azure AD. For U.S. Department of Defense contractor customers, Microsoft operates the service to enable these customers to meet ITAR commitment and DFARS acquisition regulations.

## Dynamics 365 US Government and other Microsoft services

Dynamics 365 US Government includes several features that allow users to address customer calls through Skype for Business, email editing for sales materials and, in general, integration with other Microsoft enterprise service offerings such as Microsoft 365 for Government. Dynamics 365 US Government is deployed within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including but not limited to the web-user client, Dynamics 365 for tablets, Dynamics 365 for phones, Dynamics 365 for Outlook, Unified Service Desk for Dynamics 365 and any third-party client application that connects to Dynamics 365 US Government are not part of Dynamics 365 US Government's accreditation boundary and government customers are responsible for managing them.

Dynamics 365 US Government leverages the Microsoft 365 customer administrator UI for customer administration and billing.  Dynamic 365 US Government maintains the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Dynamics 365 US Government leverages Azure (including Azure Government) ATOs for infrastructure and platform services, respectively.
 
## Dynamics 365 US Government and third-party services
Customer engagement apps provide the ability to integrate third-party applications into the service. These third-party applications and services might involve storing, transmitting, and processing your organization’s customer data on third-party systems that are outside of the customer engagement apps Engagement infrastructure and therefore are not covered by the customer engagement apps compliance and data protection commitments. We recommend that you review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

## Dynamics 365 US Government and Azure Services
Azure Active Directory (Azure AD) and Azure Active Directory Government (Azure AD Government) are not part of the Dynamics 365 US Government accreditation boundary. Government customers are responsible for using ADFS to uniquely identify and authenticate their organizational users. Notwithstanding, it is important to note that Azure AD and Azure AD Government provide critical functionality to both Dynamics 365 US Government and ADFS, whose dependencies are described in detailed in the Dynamics 365 US Government SSP (Service Security Plan).

When a user of an organization employing ADFS attempts to access Dynamics 365 for Customer Engagement, the user is redirected to a login page hosted on the organization’s ADFS server. The user provides his or her credentials to their organization's ADFS server, which attempts to authenticate the credentials using the organization’s existing Active Directory infrastructure. If the credentials are authenticated, the organization’s ADFS server issues a SAML (Security Assertion Markup Language) ticket containing information about the user’s identity and group membership. 

The customer ADFS server signs this ticket using one half of an asymmetric key pair and it sends the ticket to Azure AD via encrypted TLS. Azure AD validates the signature using the other half of the asymmetric key pair and grants access based on the ticket. The user's identity and group membership information remain in an encrypted fashion in Azure AD; in other words, limited user-identifiable information is stored in Azure AD. Full details of the Azure AD security architecture and control implementation can be found in the Azure SSP and Azure Government SSP.  Users do not interact directly with Azure AD.

## Dynamics 365 US Government URLs
You use a different set of URLs to access Dynamics 365 US Government environments, as documented here:

### Dynamics 365 Instance Administration (“Instance Picker”)

- GCC: https://port.crm9.dynamics.com/G/Instances/InstancePicker.aspx
- GCC High:  https://port.crm.microsoftdynamics.us/G/Instances/InstancePicker.aspx

### Instances

- GCC: *.crm9.dynamics.com
- GCC High:  *.crm.microsoftdynamics.us

### Dynamics 365 Customer Voice

- GCC/GCC High: https://customervoice.microsoft.us

### Discovery Service (Deprecated)

- GCC: https://disco.crm9.dynamics.com/XRMServices/2011/Discovery.svc
- GCC High: https://disco.crm.microsoftdynamics.us/XRMServices/2011/Discovery.svc

### Discovery (OData V4) RESTful API

- GCC: 
    - (Deprecated) Discovery URL: https://disco.crm9.dynamics.com/api/discovery/v9.1/
    - Global discovery URL: https://globaldisco.crm9.dynamics.com/api/discovery/v2.0/
- GCC High: 
    - (Deprecated) Discovery URL: https://disco.crm.microsoftdynamics.us/api/discovery/v9.1/

### Instance WebAPI

- GCC High: https://*.api.crm9.dynamics.com/api/data/v9.1/
- GCC High: https://*.api.crm.microsoftdynamics.us/api/data/v9.1/

### Organization Service

- GCC: https://*.api.crm9.dynamics.com/XRMServices/2011/Organization.svc
- GCC High: https://*.api.crm.microsoftdynamics.us/XRMServices/2011/Organization.svc

### Microsoft Dynamics Portals

- GCC: https://*.dynamics365portals.us
- GCC High: https://*.high.dynamics365portals.us
  
## Regional Discovery Service is deprecated

Effective March 2, 2020, the *regional* [Discovery Service](/powerapps/developer/common-data-service/org-service/discovery-service) will be deprecated. More information: [Regional Discovery Service is deprecated](../important-changes-coming.md#regional-discovery-service-is-deprecated).

### See also  
[Dynamics 365 US Government - Feature availability](government-feature-availability.md)<br/>
[IP addresses and URLs](online-requirements.md#ip-addresses-and-urls)<br />
[Power Apps US Government](./powerapps-us-government.md)<br />
[Power Automate US Government](/power-automate/us-govt)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
