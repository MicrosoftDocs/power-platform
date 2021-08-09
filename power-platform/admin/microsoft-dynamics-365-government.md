---
title: "Dynamics 365 US Government overview"
description: "Learn about features that are specific to Microsoft Dynamics 365 US Government as public sector customers deploy into government community cloud (GCC)." 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/09/2021
ms.subservice: admin
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

In response to the unique and evolving requirements of the United States public sector, Microsoft has created Microsoft Dynamics 365 US Government that is available to qualified government tables in the United States. On October 11, 2016, Microsoft announced the next generation of intelligent business applications in the cloud under the brand Microsoft Dynamics 365. To this end, Microsoft Dynamics 365 US Government entails a continuity of the protected environment that was originally branded Microsoft CRM Online Government where the protections afforded to the government community cloud under the new brand are now represented by six discrete functions: 

- Sales
- Customer Service
- Field Service 
- Project Service Automation
- Finance
- Supply Chain Management

## About Dynamics 365 US Government environments and products

Select Dynamics 365 US Government products are Generally Available to customers through deployment into the Government Community Cloud (GCC).  Among other compliance commitments and reviews as documented in the Microsoft Trust Center, the service has received several agency Authority to Operate (ATOs) since it was originally launched in January, 2015. Microsoft is the first Cloud Solution Provider (CSP) to achieve a FedRAMP Joint Application Board Provisional Authority to Operate (JAB P-ATO) through the JAB Accelerated Process. In March, 2018, the service impact level was granted a FedRAMP JAB High P-ATO.

As of April, 2019, eligible customers may choose to deploy select Dynamics 365 US Government products to the “**GCC High**” environment, which enables single sign-on and seamless integration with Microsoft 365 GCC High deployments. Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate our US Department of Defense contractor customer base and other Federal agencies currently leveraging Microsoft 365 GCC High to use the Dynamics 365 US Government GCC High deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC which leverages Public Azure AD. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense.

Beginning April, 2021, eligible customers may choose to deploy select Dynamics 365 US Government products to the “**DoD**” environment, which enables single sign-on and seamless integration with Microsoft 365 DoD deployments. Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL5 compliance framework. We anticipate our US Department of Defense customer base and other Federal agencies currently leveraging Microsoft 365 DoD to use the Dynamics 365 US Government DOD deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities.  Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense.

Select Dynamics 365 US Government products are available to qualified government and private entities, limited to (i) United States (US) federal, state, local, tribal, and territorial government entities; (ii) private entities using Dynamics 365 US Government to provide solutions to a government entities or a qualified member of the cloud community; and (iii) private entities with customer data subject to government regulations for which the use of Dynamics 365 US Government is the appropriate service to meet the regulatory requirements.  The following Dynamics 365 US Government products are available:

|GCC  |GCC High  |DoD  |
|---------|---------|---------|
|Dynamics 365 Sales Enterprise and Professional     |Dynamics 365 Sales Enterprise and Professional         |Dynamics 365 Sales Enterprise and Professional         |
|Dynamics 365 Customer Service Enterprise and Professional     | Dynamics 365 Customer Service Enterprise and Professional        |Dynamics 365 Customer Service Enterprise and Professional         |
|Dynamics 365 Field Service      | Dynamics 365 Field Service         |Dynamics 365 Field Service          |
|Dynamics 365 Project Service Automation     |Dynamics 365 Project Service Automation         | Dynamics 365 Project Service Automation        |
|Dynamics 365 Finance     | Dynamics 365 Finance        |         |
|Dynamics 365 Supply Chain Management     | Dynamics 365 Supply Chain Management        |         |
|Dynamics 365 Customer Service OmniChannel     |Dynamics 365 Customer Service OmniChannel         |         |

### Subscription Availability

Eligible customers can purchase available User Subscription and AddOns through the following purchasing channels:

- GCC: Volume Licensing (VL) and Cloud Solution Provider (CSP)
- GCC High: Volume Licensing (VL)
- DoD:  Volume Licensing (VL)

Products currently included in an Enterprise Agreement (EA) can also be obtained through Reservation either through a qualified reseller or through the Volume Licensing Service Center (VLSC). When a reservation is placed, the requested subscription is added to the established customer Tenant that same day, and the customer is billed a prorated amount based on the currently established Enterprise Agreement from the first of the month following activation of the reservation as part of the next anniversary or renewal payment cycle. 

Please work with your reseller or Microsoft account manager for more information and guidance.

### What is “customer data” and “customer content?”

This section describes Dynamics 365 Government commitments that apply to customer content and to customer data.

Customer data, as defined in the Online Service Terms, means all data, including all text, sound, video, or image files, and software, that are provided to Microsoft by, or on behalf of, Customer through use of the Online Service. Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in Dynamics 365 tables (e.g. contact information). Content is generally considered confidential information, and in normal service operation, is not sent over the Internet without encryption.

For more information on the Dynamics 365 protection and treatment of customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/dynamics365).

### Data segregation for Government Community Cloud

When provisioned as part of Dynamics 365 Government, the Dynamics 365 service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

In addition to the logical separation of customer content at the application layer, the Dynamics 365 Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial Dynamics 365 customers. This includes using Azure services in Azure’s Government Cloud and Azure’s Department of Defense Cloud. To learn more, see [Azure Government](https://azure.microsoft.com/features/gov/).

### Customer content located within the United States

Dynamics 365 US Government services are provided from datacenters physically located in the United States. Customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service,  Dynamics 365 Project Service Automation, Dynamics 365 Finance, and Dynamics 365 Supply Chain Management) customer content is stored at rest in datacenters physically located only in the US.

### Restricted data access by administrators

Access to Dynamics 365 US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Dynamics 365 support and service engineering staff do not have standing access to customer content hosted in Dynamics 365 US Government. Any staff who request temporary permission elevation which would grant access to customer content must first have passed the following background checks.

<table>
<thead>
  <tr>
    <th colspan="2">Restricted Data Access</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><b>Microsoft personnel screening and background checks</b></td>
    <td><b>Description</b></td>
  </tr>
  <tr>
    <td>U.S. Citizenship</td>
    <td>Verification of U.S. citizenship</td>
  </tr>
  <tr>
    <td>Employment History Check</td>
    <td>Verification of seven (7) year employment history</td>
  </tr>
  <tr>
    <td>Education Verification</td>
    <td>Verification of highest degree attained</td>
  <tr>
    <td>Social Security Number (SSN) Search</td>
    <td>Verification that the provided SSN is valid</td>
  </tr>
  <tr>
    <td>Criminal History Check</td>
    <td>A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level</td>
  </tr>
  <tr>
    <td>Office of Foreign Assets Control List (OFAC)</td>
    <td>Validation against the Department of Treasury list of groups with whom U.S. persons are not allowed to engage in trade or financial transactions</td>
  </tr>
  <tr>
    <td>Bureau of Industry and Security List (BIS)</td>
    <td>Validation against the Department of Commerce list of individuals and tables barred from engaging in export activities</td>
  </tr>
  <tr>State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program
    <td>Office of Defense Trade Controls Debarred Persons List (DDTC)</td>
    <td>Validation against the Department of State list of individuals and tables barred from engaging in export activities related to the defense industry</td>
  </tr>
    <td>Fingerprinting Check</td>
    <td>Fingerprint background check against FBI databases</td>
  </tr>
  <tr>
    <td>CJIS Background Screening</td>
    <td>State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program</td>
  </tr>
  <tr>
    <td>Department of Defense IT-2</td>
    <td>Staff requesting elevated permissions to customer data or privileged administrative access must pass Department of Defense IT-2 adjudication based on a successful OPM Tier 3 investigation</td>
  </tr>
</tbody>
</table>

### Certifications and accreditations

Dynamics 365 US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can review these artifacts in support of their review to grant an Authority to Operate (ATO).

Dynamics 365 has been authorized as a service within the Azure Government FedRAMP ATO. More information, including how to access the FedRAMP documents, can be found in the [FedRAMP Marketplace](https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government).

Dynamics 365 US Government has features designed to support customer’s CJIS Policy requirements for law enforcement agencies. See the [Power Platform Trust Center](https://www.microsoft.com/trust-center/product-overview#office-CustomSpacingTemplate-pl2a7m4) for more detailed information related to certifications and accreditations.

Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate our US Department of Defense contractor customer base and other Federal agencies currently leveraging Microsoft 365 GCC High to use the Dynamics 365 US Government GCC High deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC which leverages Public Azure AD. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations.

Eligible customers may choose to deploy select Dynamics 365 US Government Offers to the **“DoD”** environment, which enables single sign-on and seamless integration with Microsoft 365 DoD deployments. Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL5 compliance framework. We anticipate our US Department of Defense customer base and other Federal agencies currently leveraging Microsoft 365 DoD to use the Dynamics 365 US Government DOD deployment option, which enables and requires the customer to leverage Azure AD Government for customer identities.  Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense.

### Dynamics 365 US Government and other Microsoft services

Dynamics 365 US Government includes several features that allow users to address customer calls through Skype for Business, email editing for sales materials and, in general, integration with other Microsoft enterprise service offerings such as Microsoft 365 for Government. Dynamics 365 US Government is deployed within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including but not limited to the web-user client, Dynamics 365 for tablets, Dynamics 365 for phones, Dynamics 365 for Outlook, Unified Service Desk for Dynamics 365 and any third-party client application that connects to Dynamics 365 US Government are not part of Dynamics 365 US Government's accreditation boundary and government customers are responsible for managing them.

Dynamics 365 US Government leverages the Microsoft 365 customer administrator UI for customer administration and billing. Dynamic 365 US Government maintains the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Dynamics 365 US Government leverages Azure (including Azure Government) ATOs for infrastructure and platform services, respectively.

### Dynamics 365 US Government and third-party services

Customer engagement apps provide the ability to integrate third-party applications into the service. These third-party applications and services might involve storing, transmitting, and processing your organization’s customer data on third-party systems that are outside of the customer engagement apps Engagement infrastructure and therefore are not covered by the customer engagement apps compliance and data protection commitments. We recommend that you review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

### Dynamics 365 US Government and Azure Services

Azure Active Directory (Azure AD) and Azure Active Directory Government (Azure AD Government) are not part of the Dynamics 365 US Government accreditation boundary. Government customers are responsible for using ADFS to uniquely identify and authenticate their organizational users. Notwithstanding, it is important to note that Azure AD and Azure AD Government provide critical functionality to both Dynamics 365 US Government and ADFS, whose dependencies are described in detailed in the Dynamics 365 US Government SSP (Service Security Plan).

When a user of an organization employing ADFS attempts to access Dynamics 365, the user is redirected to a login page hosted on the organization’s ADFS server. The user provides his or her credentials to their organization's ADFS server, which attempts to authenticate the credentials using the organization’s existing Active Directory infrastructure. If the credentials are authenticated, the organization’s ADFS server issues a SAML (Security Assertion Markup Language) ticket containing information about the user’s identity and group membership. The customer ADFS server signs this ticket using one half of an asymmetric key pair and it sends the ticket to Azure AD via encrypted TLS. Azure AD validates the signature using the other half of the asymmetric key pair and grants access based on the ticket. The user's identity and group membership information remain in an encrypted fashion in Azure AD; in other words, limited user-identifiable information is stored in Azure AD. Full details of the Azure AD security architecture and control implementation can be found in the Azure SSP and Azure Government SSP. 

## Dynamics 365 US Government URLs

You use a different set of URLs to access Dynamics 365 US Government environments, as documented here:

### Instances
-	GCC: *.crm9.dynamics.com
-	GCC High: *.crm.microsoftdynamics.us
-	DoD: *.crm.appsplatform.us

### Dynamics 365 Customer Voice
-	GCC: https://customervoice.microsoft.us

### Discovery (OData V4) RESTful API
-	GCC:
  - (Deprecated) Discovery URL: https://disco.crm9.dynamics.com/api/discovery/v9.1/
  - Global discovery URL: https://globaldisco.crm9.dynamics.com/api/discovery/v2.0/

-	GCC High:
  - (Deprecated) Discovery URL: https://disco.crm.microsoftdynamics.us/api/discovery/v9.1/
  - Global discovery URL: https://globaldisco.crm.microsoftdynamics.us/api/discovery/v2.0/

-	DoD:
  - Global discovery https://globaldisco.crm.appsplatform.us/api/discovery/v2.0/

### Instance WebAPI
- GCC: https://*.api.crm9.dynamics.com/api/data/v9.1/
- GCC High: https://*.api.crm.microsoftdynamics.us/api/data/v9.1/
- DoD: https://*.api.crm.appsplatform.us/api/data/v9.1/

### Organization Service
- GCC: https://*.api.crm9.dynamics.com/XRMServices/2011/Organization.svc
- GCC High: https://*.api.crm.microsoftdynamics.us/XRMServices/2011/Organization.svc
- GCC DoD: https://*.api.crm.appsplatform.us/XRMServices/2011/Organization.svc

### Microsoft Dynamics Portals
- GCC: https://*.dynamics365portals.us
- GCC High: https://*.high.dynamics365portals.us
- DoD:  https://*.appsplatformportals.us

### Dynamics 365 Finance and Supply Chain Management
- GCC: https://*.operations.gov.microsoftdynamics.us

### Dynamics 365 Lifecycle Services (LCS)
- GCC: https://gov.lcs.microsoftdynamics.us

## Regional Discovery Service is deprecated

### Discovery Service (Deprecated)
- GCC: https://disco.crm9.dynamics.com/XRMServices/2011/Discovery.svc
- GCC High: https://disco.crm.microsoftdynamics.us/XRMServices/2011/Discovery.svc

Effective March 2, 2020, the regional Discovery Service will be deprecated. More information: Regional Discovery Service is deprecated.

### See also  
[Dynamics 365 US Government - Feature availability](government-feature-availability.md)<br/>
[IP addresses and URLs](online-requirements.md#ip-addresses-and-urls)<br />
[Power Apps US Government](./powerapps-us-government.md)<br />
[Power Automate US Government](/power-automate/us-govt)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
