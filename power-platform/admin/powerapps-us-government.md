---
title: Power Apps US Government | Microsoft Docs
description: Provides information about Power Apps US Government service description, plans, and limitations.
author: carrema
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/10/2026
ms.subservice: admin
ms.author: macarrer
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.contributors:
 - heortaol
 - nyarbrough
 - jordanchodak
---

# Power Apps US Government

In response to the unique and evolving requirements of the United States public sector, Microsoft created Power Apps US Government, which consists of several plans for US government organizations. This section provides an overview of features that are specific to Power Apps US Government. Read this supplementary section alongside the Power Apps [documentation](/powerapps/powerapps-overview), which covers information about the general Power Apps service description. For brevity, this service is commonly referred to as Power Apps Government Community Cloud (GCC), or Power Apps Government Community Cloud – High (GCC High), or Power Apps Department of Defense (DoD).

The Power Apps US Government service description is designed to serve as an overlay to the general Power Apps service description. It defines the unique commitments of this service and the differences from Power Apps offerings that have been available to our customers since October 2016.

## About Power Apps US Government environments and plans

Power Apps US Government plans are monthly subscriptions and can be licensed to an unlimited number of users.

The Power Apps GCC environment provides compliance with federal requirements for cloud services, including FedRAMP High, DoD DISA IL2, and requirements for criminal justice systems (CJI data types).

In addition to the features and capabilities of Power Apps, organizations that use Power Apps US Government benefit from the following features unique to Power Apps US Government:

- Your organization's customer content is physically segregated from customer content in Microsoft's commercial Power Apps services.
- Your organization's customer content is stored within the United States.
- Access to your organization's customer content is restricted to screened Microsoft personnel.
- Power Apps US Government complies with certifications and accreditations that are required for US public sector customers.

Beginning September 2019, eligible customers can choose to deploy Power Apps US Government to the "GCC High" environment, which enables single sign-on and seamless integration with Microsoft 365 GCC High deployments. Microsoft designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate our US Department of Defense contractor customer base and other Federal agencies currently using Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option, which enables and requires the customer to use Microsoft Entra Government for customer identities, in contrast to GCC which uses Public Microsoft Entra ID. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense. A Provisional Authority to Operate has been granted by DISA.

Beginning April 2021, eligible customers can choose to deploy Power Apps US Government to the "DoD" environment, which enables single sign-on and seamless integration with Microsoft 365 DoD deployments. Microsoft designed the platform and our operational procedures in accordance with the DISA SRG IL5 compliance framework.  A Provisional Authority to Operate has been granted by DISA.

## Customer eligibility

Power Apps US Government is available to (1) US federal, state, local, tribal, and territorial government entities and (2) other entities that handle data subject to government regulations and requirements where use of Power Apps US Government is appropriate to meet these requirements, subject to validation of eligibility. Microsoft validates eligibility by confirming that the entity handles data subject to International Traffic in Arms Regulations (ITAR), law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) policy, or other government-regulated or controlled data. Validation might require sponsorship by a government entity with specific requirements for handling data. 

Entities with questions about eligibility for Power Apps US Government should consult their account team. You must revalidate eligibility when renewing a customer's contract for Power Apps US Government.

Power Apps US Government DoD is available only to DoD entities.

## Power Apps US Government plans

You can access Power Apps US Government plans through the following offerings. Each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- Power Apps per app plan for Government
- Power Apps per user plan for Government
- In addition to the standalone plans, certain Microsoft 365 US Government and Dynamics 365 US Government plans include Power Apps and Power Automate capabilities. By using these plans, you can extend and customize Microsoft 365, Power Platform, and Dynamics 365 apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Project Service Automation). 

For more information about the differences in functionality between these groups of licenses, see the [Power Apps licensing information](https://powerapps.microsoft.com/pricing/) page. You can get Power Apps US Government through the Volume Licensing and Cloud Solution Provider purchasing channels. The Cloud Solution Provider program isn't currently available for GCC High customers.

## What is customer data and customer content?

Customer data, as defined in the Online Services Terms, means all data, including all text, sound, video, or image files, and software, that customers provide to Microsoft by using the Online Service, or that customers provide on their behalf. Customer content refers to a specific subset of customer data that users directly create, such as content stored in databases through entries in the [Microsoft Dataverse](/powerapps/maker/common-data-service/data-platform-intro) entities (for example, contact information). Content is considered confidential information and in normal service operation isn't sent over the internet without encryption.

For more information on how Power Apps protects customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of Power Apps US Government, the Power Apps service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

In addition to the logical separation of customer content at the application layer, the Power Apps US Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that's separate from the infrastructure used for commercial Power Apps customers. This infrastructure includes Azure services in the Azure Government cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Customer content located within the United States

Power Apps US Government services are provided from datacenters physically located in the United States. Power Apps US Government customer content is stored at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to Power Apps US Government customer content by Microsoft administrators is restricted to personnel who are U.S. citizens. These personnel undergo background investigations in accordance with relevant government standards.

Power Apps support and service engineering staff don't have standing access to customer content hosted in Power Apps US Government. Any staff who request temporary permission elevation that grants access to customer content must first pass the following background checks.

| **Microsoft personnel screening and background checks** <sup>1</sup>     | **Description** |
|---------|----------------------------------------------------------------------------------|
| U.S. Citizenship  | Verification of U.S. citizenship   |
| Employment History Check  | Verification of seven (7) year employment history   |
| Education Verification | Verification of highest degree attained  |
| Social Security Number (SSN) Search   | Verification that the provided SSN is valid      |
| Criminal History Check  | A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level  |
| Office of Foreign Assets Control List (OFAC) | Validation against the Department of Treasury list of groups with whom U.S. persons aren't allowed to engage in trade or financial transactions|
| Bureau of Industry and Security List (BIS) | Validation against the Department of Commerce list of individuals and entities barred from engaging in export activities   |
| Office of Defense Trade Controls Debarred Persons List (DDTC) | Validation against the Department of State list of individuals and entities barred from engaging in export activities related to the defense industry  |
| Fingerprinting Check | Fingerprint background check against FBI databases  |
| CJIS Background Screening | State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that signed up for the Microsoft CJIS IA program |
| Department of Defense IT-2 | Staff requesting elevated permissions to customer data or privileged administrative access to Dept of Defense SRG L5 service capacities must pass Department of Defense IT-2 adjudication based on a successful OPM Tier 3 investigation |

<sup>1</sup> Applies only to personnel with temporary or standing access to customer content hosted in Power Apps US Government environments (GCC, GCC High, and DoD).

## Certifications and accreditations

Power Apps US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. This design infers alignment to [DoD DISA IL2](/compliance/regulatory/offering-dod-il2). FedRAMP artifacts are available for review by federal customers who must comply with FedRAMP. Federal agencies can review these artifacts to support their review to grant an Authority to Operate (ATO). 

> [!NOTE]
> Power Apps is authorized as a service within the Azure Government FedRAMP ATO. For more information, including how to access the FedRAMP documents, see the FedRAMP Marketplace: https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government

Power Apps US Government has features designed to support customer's CJIS Policy requirements for law enforcement agencies. Visit the Power Apps US Government products page in Trust Center for more detailed information related to certifications and accreditations.

Microsoft designed the platform and operational procedures to meet the requirements that align with the DISA SRG IL4 and IL5 compliance frameworks and received requisite DISA Provisional Authorities to Operate. We anticipate our US Department of Defense contractor customer base and other federal agencies currently using Microsoft 365 GCC High to use the Power Apps US Government GCC High deployment option, which enables and requires the customer to use Microsoft Entra Government for customer identities, in contrast to GCC which uses Public Microsoft Entra ID. For our US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations. Likewise, we expect our US Department of Defense customer base currently using Microsoft 365 DoD to use the Power Apps US Government DoD deployment option.  

## Power Apps US Government and other Microsoft services

Power Apps US Government includes several features that allow users to connect to and integrate with other Microsoft enterprise service offerings such as Microsoft 365 US Government, Dynamics 365 US Government, and Microsoft Power Automate US Government. Power Apps US Government is deployed within Microsoft datacenters in a manner consistent with a multitenant, public cloud deployment model. However, client applications including but not limited to the web-user client, Power Apps mobile applications, or any third-party client application that connects to Power Apps US Government aren't part of Power Apps US Government's accreditation boundary and government customers are responsible for managing them.

Power Apps US Government uses the Microsoft 365 customer administrator UI for customer administration and billing. Power Apps US Government maintains the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Power Apps US Government uses Azure (including Azure Government and Azure DoD) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (AD FS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on, any customer content that's temporarily cached is located in the United States.

## Power Apps US Government and third-party services

Power Apps US Government provides the ability to integrate third-party applications into the service through [connectors](/connectors/index). These third-party applications and services might involve storing, transmitting, and processing your organization's customer data on third-party systems that are outside of the Power Apps US Government infrastructure and therefore aren't covered by the Power Apps US Government compliance and data protection commitments.

Review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

## Power Apps US Government and Azure services

Power Apps US Government services are deployed to Microsoft Azure Government. Microsoft Entra isn't part of the Power Apps US Government accreditation boundary, but it relies on a customer's [Microsoft Entra ID](https://azure.microsoft.com/services/active-directory/) tenant for customer tenant and identity functions, including authentication, federated authentication, and licensing.

When a user in an organization that uses AD FS tries to access Power Apps US Government, the user is redirected to a sign-in page hosted on the organization's AD FS server.
The user provides their credentials to the organization's AD FS server. The organization's AD FS server tries to authenticate the credentials by using the organization's Active Directory infrastructure.

If authentication succeeds, the organization's AD FS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user's identity and group membership.

The customer's AD FS server signs this ticket by using one half of an asymmetric key pair and then sends the ticket to Microsoft Entra through encrypted Transport Layer Security (TLS). Microsoft Entra ID validates the signature by using the other half of the asymmetric key pair and then grants access based on the ticket.

The user's identity and group membership information stay encrypted in Microsoft Entra ID. In other words, only limited user-identifiable information is stored in Microsoft Entra ID.

You can find full details of the Microsoft Entra security architecture and control implementation in the Azure SSP.  End users don't interact directly with Microsoft Entra ID.

## Power Apps US Government service URLs

Use a different set of URLs to access Power Apps US Government environments. The following table shows the URLs. The commercial URLs are also shown for contextual reference, in case they're more readily familiar to you.

| **Commercial version URL**     | **US Government version URL**         |
|--------------------------------|---------------------------------------|
| <https://make.powerapps.com>    | <https://make.gov.powerapps.us> (GCC)<br/><https://make.high.powerapps.us> (GCC High)<br /> <https://make.apps.appsplatform.us> (DoD)  |
| <https://create.powerapps.com> | <https://make.gov.powerapps.us> (GCC)<br /><https://make.high.powerapps.us> (GCC High) <br />  <https://make.apps.appsplatform.us> (DoD) |
| <https://flow.microsoft.com/connectors> | <https://gov.flow.microsoft.us/connectors><br /><https://high.flow.microsoft.us/connectors> (GCC High) <br /><https://flow.appsplatform.us> (DoD)  |
| <https://admin.powerplatform.microsoft.com> | <https://gcc.admin.powerplatform.microsoft.us><br /><https://high.admin.powerplatform.microsoft.us> (GCC High) <br /><https://admin.appsplatform.us> (DoD)|
| <https://apps.powerapps.com> | <https://play.apps.appsplatform.us> (GCC)<br /> <https://apps.high.powerapps.us> (GCC High)<br /><https://play.apps.appsplatform.us> (DoD) |


For customers that implement network restrictions, ensure your end-users' access points can access the following domains:

**GCC Customers:**

*.microsoft.us  
*.powerapps.us  
*.azure-apihub.us  
*.azure.net  
*.azure.us  
*.azureedge.net  
*.azureedge.us  
*.azurefd.net  
*.usgovcloudapi.net   
*.microsoftonline.com  
*.microsoft.com  
*.windows.net  
*.crm9.dynamics.com  
*.dynamics365portals.us
*.gov.powerplatformusercontent.mi

To enable access to environments that users and administrators might create within your tenants, as well as other Azure services used by the platform, refer to the [Required IP Ranges](https://www.microsoft.com/download/details.aspx?id=57063):

- GCC and GCC High: Focus on AzureCloud.usgovtexas and AzureCloud.usgovvirginia
- DoD: Focus on USDoD East and USDoD Central

**GCC High and DoD Customers:**

*.microsoft.us  
*.powerapps.us  
*.azure-apihub.us  
*.azure.net  
*.azure.us  
*.azureedge.net  
*.azureedge.us  
*.azurefd.net  
*.usgovcloudapi.net  
*.microsoftonline.us  
*.microsoftdynamics.us (GCC High)  
*.crm.microsoftdynamics.us (GCC High)  
*.high.dynamics365portals.us (GCC High)
*.high.powerplatformusercontent.microsoft.us (GCC High)
*.appsplatform.us (DoD)
*.crm.appsplatform.us (DoD)  
*.appsplatformportals.us (DoD)
*.appsplatformusercontent.us (DoD)

To enable access to environments that users and administrators might create within your tenant and other Azure services used by the platform, refer to the [Required IP Ranges](https://www.microsoft.com/download/details.aspx?id=57063).

- GCC and GCC High: Focus on AzureCloud.usgovtexas and AzureCloud.usgovvirginia
- DoD:  Focus on USDoD East and USDoD Central 

## Regional Discovery Service is deprecated

Effective March 2, 2020, Microsoft deprecated the *regional* [Discovery Service](/powerapps/developer/common-data-service/org-service/discovery-service). For more information, see [Regional Discovery Service is deprecated](../important-changes-coming.md#regional-discovery-service-is-deprecated) 

## Connectivity between Power Apps US Government and public Azure Cloud Services

Azure is distributed among multiple clouds. By default, tenants can open firewall rules to a cloud-specific environment, but cross-cloud networking is different and requires opening specific firewall rules to communicate between services. If you're a Power Apps customer, and you have existing SQL environments in the Azure public cloud that you need to access, you must open specific firewall rules in SQL to the Azure Government cloud IP space, for the following datacenters:

- USGov Virginia
- USGov Texas
-    US DoD East
-    US DoD Central

Refer to the Azure IP Ranges and [Service Tags – US Government Cloud document](https://www.microsoft.com/download/details.aspx?id=57063), focusing attention on AzureCloud.usgovtexas, AzureCloud.usgovvirginia, and the US DoD East and US DoD Central datacenters. Also, note that these IP ranges are required for your end users to access the service URLs.

## Configure mobile clients

To sign in by using the Power Apps mobile client, complete a few extra configuration steps. 

1. On the sign-in page, select the gear icon in the lower-right corner.
2. Select **Region** settings.
3. Select one of the following options:
   - **GCC: US Government GCC**
   - **GCC High: US Government GCC High**
   - **DoD:  US Government DOD**
4. Select **OK**.
5. On the sign-in page, select **Sign in**.

The mobile application now uses the US Government Cloud domain.

## On-premises data gateway configuration

Install an [on-premises data gateway](/powerapps/maker/canvas-apps/gateway-management) to transfer data quickly and securely between a canvas app that you build in Power Apps and a data source that's not in the cloud, such as an on-premises SQL Server database or an on-premises SharePoint site.

If your organization (tenant) already configured and successfully connected the on-premises data gateway for Power BI US Government, the process and configuration that your organization executed to enable that connection also enable on-premises connectivity for Power Apps. 

Previously, US Government customers needed to contact support before configuring their first on-premises data gateway, because support needed to add the tenant to the allow list for gateway use. This step is no longer necessary. If you encounter any issues configuring or using the on-premises data gateway, contact support for assistance.

## Telemetry for Power Apps

Add the following URLs to the allow list to ensure communication through firewalls and other security mechanisms for Power Apps telemetry information:

- **GCC and GCC High**: `https://tb.pipe.aria.microsoft.com/Collector/3.0` and `https://tb.events.data.microsoft.com/OneCollector/1.0/`
- **DoD**: `https://pf.pipe.aria.microsoft.com/Collector/3.0` and `https://pf.events.data.microsoft.com/OneCollector/1.0/`

If you're filtering endpoints by IP ranges, ensure that you unblock the OneDsCollector service tag. 

## Power Apps US Government feature limitations

Microsoft strives to maintain functional parity between the commercially available service and the services that it enables through the US Government clouds. These services are referred to as Power Apps Government Community Cloud (GCC) and GCC High. To check Power Apps availability in various geographies and clouds, see the [Product and feature availability](/dynamics365/get-started/product-availability).

There are exceptions to the principle of maintaining product functional parity within the US Government clouds. For more information about feature availability, download this file: [Business Applications US Government - Availability Summary](https://aka.ms/BAPFunctionalParity).


## Requesting support

Having a problem with your service? You can create a support request to get the issue resolved.  
  
More information: [Contact Technical Support](get-help-support.md)

### Related content
[Microsoft Power Automate US Government](/power-automate/us-govt) <br />
[Dynamics 365 US Government](./microsoft-dynamics-365-government.md)
