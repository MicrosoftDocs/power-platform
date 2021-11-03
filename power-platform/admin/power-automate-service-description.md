---
title: Power Automate US Government
description: Provides information about Power Automate US Government service description, plans, and limitations
author: msftman
ms.service: power-platform
ms.subservice: admin
ms.component: pa-admin
ms.topic: article
ms.date: 10/27/2021
ms.author: deonhe
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
search.audienceType: 
  - admin
---

# Power Automate US Government

In response to the unique and evolving requirements of the United States public sector, Microsoft has created Power Automate US Government plans. This section provides an overview of features that are specific to Power Automate US Government. We recommend that you read this supplementary section as well as the Power Automate service [getting started](/power-automate/getting-started) topic. For brevity, this service is commonly referred to as Power Automate Government Community Cloud (GCC), Power Automate Government Community Cloud – High (GCC High), or Power Automate Department of Defense (DoD).

The Power Automate US Government Service Description serves as an overlay to the general Power Automate Service Description. It defines the unique commitments and differences compared to the general Power Automate offerings that have been available to our customers since October 2016.

## About Power Automate US Government environments and plans

Power Automate US Government plans are monthly subscriptions and it can be licensed to an unlimited number of users.

The Power Automate GCC environment is compliant with the Federal requirements for cloud services, including FedRAMP High, and DoD DISA IL2. It is also compliant with the criminal justice systems (CJI data types) requirements.

In addition to the features and capabilities of Power Automate, organizations that use Power Automate US Government benefit from the following unique features:

- Your organization's customer content is physically separated from customer content in commercial offering of Power Automate.

- Your organization's customer content is stored within the United States.

- Access to your organization's customer content is restricted to screened Microsoft personnel.

- Power Automate US Government complies with all certifications and accreditations that US Public Sector customers require.

Beginning September 2019, eligible customers can choose to deploy Power Automate US Government to the **GCC High** environment, which enables single sign-on and seamless integration with Microsoft Office 365 GCC High deployments. 

Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate the US Department of Defense contractor customer base and other Federal agencies currently leveraging Office 365 GCC High to use the Power Automate US Government GCC High deployment option. This option enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC, which leverages the public Azure AD. For the US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense. A Provisional Authority to Operate has been granted by DISA.

Beginning April, 2021, eligible customers may now choose to deploy Power Automate US Government to the "DoD" environment, which enables single sign-on and seamless integration with Microsoft 365 DoD deployments. Microsoft has designed the platform and operational procedures in accordance with the DISA SRG IL5 compliance framework. DISA has granted a Provisional Authority to Operate.


## Customer eligibility

Power Automate US Government is available to (1) US federal, state, local, tribal, and territorial government entities, and (2) other entities, which handle data that is subject to government regulations and requirements and where use of Power Automate US Government is appropriate to meet these requirements, subject to validation of eligibility. Microsoft's validation of eligibility includes confirmation of handling data subject to International Traffic in Arms Regulations (ITAR), law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) Policy, or other government-regulated or controlled data. Validation may require sponsorship by a government entity with specific requirements for the handling of data.

Entities with questions about eligibility for Power Automate US Government should consult their account team. Microsoft re-validates eligibility when it renews customer contracts for Power Automate US Government.

>[!NOTE]
>Power Automate US Government DoD is only available to DoD entities.

## Power Automate US Government plans

Access to Power Automate US Government plans is restricted to the offerings described in the following section; each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- Power Automate per flow plan for Government
- Power Automate per user plan for Government

- In addition to the standalone plans, Microsoft 365 US Government and Dynamics 365 US Government plans also include the Power Apps and Power Automate capabilities, allowing customers to extend and customize Microsoft 365 and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Project Service Automation). 

Additional information and details regarding the differences in functionality between these groups of licenses are described in more detail here: [Power Automate licensing information](https://flow.microsoft.com/pricing/).

Power Automate US Government is available through the Volume Licensing and Cloud Solution Provider purchasing channels. The Cloud Solution Provider program is not currently available for GCC High customers.

## Differences between customer data and customer content

Customer data, as defined in the Online Service Terms, means all data, including all text, sound, video, or image files, and software that are provided to Microsoft by, or on behalf of, customers through the use of an Online Service.

Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in the [Dataverse](/powerapps/maker/common-data-service/data-platform-intro)
entities (for example, contact information). Content is generally considered
confidential information, and in normal service operations, is not sent through the Internet without encryption.

For more information on how Power Automate protects customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of Power Automate US Government, the Power Automate service is offered in accordance with the National Institute of Standards and Technology (NIST) Special Publication 800-145.

In addition to the logical separation of customer content at the application layer, the Power Automate Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial Power Automate customers. This includes using Azure services in Azure’s Government Cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Customer content located within the United States

Power Automate US Government runs in datacenters physically located in the United States and stores customer content at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to Power Automate US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Power Automate support and service engineering staff do not have standing access to customer content hosted in Power Automate US Government. Any staff who requests temporary permission elevation, which would grant access to customer content must first have passed the following background checks.

|Microsoft Personnel Screening and Background Checks <sup>1</sup>| Description|
|---------------------------------------------------------------|-----------------------------------|
| U.S. citizenship| Verification of U.S. citizenship |
| Employment history check| Verification of seven (7) year employment history|
| Education verification | Verification of highest degree attained|
| Social Security number (SSN) search| Verification that the SSN the employees provides is valid|
| Criminal history check| A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level|
| Office of Foreign Assets Control list (OFAC)| Validation against the Department of Treasury list of groups with whom U.S. persons are not allowed to engage in trade or financial transactions|
| Bureau of Industry and Security list (BIS)| Validation against the Department of Commerce list of individuals and entities barred from engaging in export activities|
| Office of Defense Trade Controls Debarred Persons list (DDTC) | Validation against the Department of State list of individuals and entities barred from engaging in export activities related to the defense industry|
| Fingerprinting check| Fingerprint background check against FBI databases|
| CJIS background screening| State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program |
Department of Defense IT-2|Staff who request elevated permissions to customer data or privileged administrative access to DoD SRG L5 service capacities must pass DoD IT-2 adjudication, based on a successful OPM Tier 3 investigation.

<sup>1</sup> Applies only to personnel with temporary or standing access to customer
content hosted in Power Automate US Governments (GCC, GCC High, and DoD).

## Certifications and accreditations

Power Automate US Government is designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level. This program infers alignment to DoD DISA IL2. FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can peruse these artifacts in support of their review to grant an Authority to Operate (ATO).

>[!NOTE]
>Power Automate is authorized as a service within the Azure Government FedRAMP ATO. For more information, including how to access the FedRAMP documents, review the [FedRAMP Marketplace](https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government).



Power Automate US Government has features designed to support customers' CJIS Policy requirements for law enforcement agencies. Visit the Power Automate US Government products page in the Trust Center for more detailed information related to certifications and accreditations.

Microsoft designed this platform and its operational procedures to meet the requirements for the DISA SRG IL4 and IL5 compliance frameworks and has received the requisite DISA Provisional Authorities to Operate. Microsoft anticipates that the US Department of Defense contractor customer base and other Federal agencies currently leveraging Microsoft Office 365 GCC High to use the Power Automate US Government GCC High deployment option, which enables and requires customers to leverage Azure AD Government for customer identities, in contrast to GCC, which leverages the public Azure AD. For the US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations. Further, Microsoft expects its US Department of Defense customers who currently use Microsoft 365 DoD to use the Power Automate US Government DoD deployment option.  

## Power Automate US Government and other Microsoft services

Power Automate US Government includes several features that allow users to connect to, and integrate with, other Microsoft enterprise service offerings such as Office 365 US Government, Dynamics 365 US Government, and Power Apps US Government.

Power Automate US Government runs within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications including, but not limited to the web-user client, Power Automate mobile application (when available), and any third-party client application that connects to Power Automate US Government, are not part of Power Automate US Government's accreditation boundary. Government customers are responsible for managing them.

Power Automate US Government leverages the Office 365 customer administrator UI for customer administration and billing.

Power Automate US Government maintains the actual resources, information flow, and data management, while relying on Office 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Power Automate US Government leverages Azure (including Azure for Government and Azure DoD) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (AD FS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on, any customer content that is temporarily cached will be located in the United States.

## Power Automate US Government and third-party services

Power Automate US Government provides the ability to integrate third-party applications into the service through [Connectors](/connectors/index). These third-party applications and services might involve storing, transmitting, and processing your organization’s customer data on third-party systems that are outside of the Power Automate US Government infrastructure and therefore are not covered by the Power Automate US Government compliance and data protection commitments.

> [!TIP]
> Review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

[Power Apps and Power Automate Governance Considerations](/power-platform/admin/governance-considerations) can help your organization bring awareness about the capabilities available across several related themes, such as architecture, security, alert and action, and monitoring.

## Configure mobile clients

Here are the steps that you must take to sign in with the Power Automate mobile client.  Currently, only the iOS version of the mobile client supports connecting to GCC environments.

1. On the sign-in page, select the gear icon in the lower-right corner.
1. Select **Region settings**.
1. Select GCC: US Government GCC
1. Select OK.
1. On the sign-in page, select **Sign in**.

The mobile application will now use the US Government Cloud.

## Power Automate US Government and Azure Services

The Power Automate US Government services are deployed to Microsoft Azure Government. Azure Active Directory (Azure AD) is not part of the Power Automate US Government accreditation boundary, but takes a reliance on a customer’s [Azure AD](https://azure.microsoft.com/services/active-directory/) tenant for customer tenant and identity functions, including authentication, federated authentication, and licensing.

When a user of an organization employing ADFS attempts to access Power Automate US Government, the user is redirected to a login page hosted on the organization’s ADFS server.

The user provides credentials to their organization's ADFS server. The organization's ADFS server attempts to authenticate the credentials using the organization’s Active Directory infrastructure.

If authentication is successful, the organization’s ADFS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user’s identity and group membership.

The customer’s ADFS server signs this ticket using one half of an asymmetric key pair and then it sends the ticket to Azure AD via encrypted TLS. Azure AD validates the signature using the other half of the asymmetric key pair and then grants access based on the ticket.

The user's identity and group membership information remain encrypted in Azure AD. In other words, only limited user-identifiable information is stored in Azure AD.

You can find full details of the Azure AD security architecture and control implementation in the Azure SSP.

The Azure AD account management services are hosted on physical servers managed by the Microsoft Global Foundation Services (GFS). Network access to these servers is controlled by GFS-managed network devices using rules set by Azure. Users do not interact directly with Azure AD.

## Power Automate US Government service URLs

You use a different set of URLs to access Power Automate US Government environments, as shown in the following table. The table includes the commercial URLs too for contextual reference, in case they are more readily familiar to you.


Commercial version | US Government version
------ | --------
[https://flow.microsoft.com](https://flow.microsoft.com) | [https://gov.flow.microsoft.us (GCC)](https://gov.flow.microsoft.us), [https://high.flow.microsoft.us (GCC High)](https://high.flow.microsoft.us), and [https://flow.appsplatform.us (DoD)](https://flow.appsplatform.us (DoD))
[https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com/) | [ https://gcc.admin.powerplatform.microsoft.us/ (GCC)](https://gcc.admin.powerplatform.microsoft.us/), [https://high.admin.powerplatform.microsoft.us/ (GCC High)](https://high.admin.powerplatform.microsoft.us/), and [https://admin.appsplatform.us](https://admin.appsplatform.us) (DoD)
[https://flow.microsoft.com/connectors](https://flow.microsoft.com/connectors) | [https://gov.flow.microsoft.us/connectors (GCC)](https://gov.flow.microsoft.us/connectors), [https://high.flow.microsoft.us/connectors (GCC High)](https://high.flow.microsoft.us/connectors), [https://flow.appsplatform.us/connectors/](https://flow.appsplatform.us/connectors/) (DoD)


For those customers that implement network restrictions, please ensure access to the following domains are made available to your end-users’ access points:

### GCC Customers:
* .microsoft.us
* .azure-apihub.us
* .azure.us
* .usgovcloudapi.net
* .microsoftonline.com
* .microsoft.com
* .windows.net
* .azureedge.net
* .azure.net
* .crm9.dynamics.com

Refer to the [IP ranges](https://www.microsoft.com/download/confirmation.aspx?id=57063) for AzureCloud.usgovtexas and AzureCloud.usgovvirginia to enable access to Dataverse instances that users and administrators may create within your Tenant. 

### GCC High Customers:
* .microsoft.us
* .azure-apihub.us
* .azure.us
* .usgovcloudapi.net
* .microsoftonline.us
* .azureedge.net
* .azure.net
* .crm.microsoftdynamics.us(GCC High)
* *.high.dynamics365portals.us (GCC High)
* *.crm.appsplatform.us (DoD)
* *.appsplatformportals.us (DoD)

Also, refer to the [IP ranges](https://www.microsoft.com/download/confirmation.aspx?id=57063) to enable you to access other Dataverse environments that users and administrators may create within your tenant and other Azure services that the platform leverages, including:

- GCC and GCC High: Focus on AzureCloud.usgovtexas and AzureCloud.usgovvirginia.
- DoD: Focus on USDoD East and USDoD Central. 

## Connectivity between Power Automate US Government and Public Azure Cloud services

Azure is distributed among multiple clouds. By default, tenants are allowed to
open firewall rules to a cloud-specific instance, but cross-cloud networking is
different and requires opening specific firewall rules to communicate between
services. If you are a Power Automate customer and you have existing SQL instances in azure public cloud, which you need to access, you must open specific firewall ports in SQL to the Azure Government Cloud IP space for the following
datacenters:

- USGov Virginia
- USGov Texas
- US DoD East
- US DoD Central


Refer to the [Azure IP Ranges and Service Tags – US Government
Cloud](https://www.microsoft.com/download/confirmation.aspx?id=57063) document,
focusing attention on AzureCloud.usgovtexas, and AzureCloud.usgovvirginia, and/or US DoD East, and US DoD Central as noted previously in this article. Also note that these are the IP ranges required for your end-users to have access to the service URLs.

## On-premises Data Gateway configuration

Install an [on-premises data gateway](/power-automate/gateway-manage) to transfer data quickly and securely between a canvas app that's built in Power Automate and a data source that isn't in the cloud. Examples include on-premises SQL Server databases or on-premises SharePoint sites.

If your organization (tenant) has configured and successfully connected the nn-premises data gateway for PowerBI US Government, then the process your organization followed to enable that also enables on-premises connectivity for Power Automate.

Formerly, US Government customers needed to contact support before configuring their first on-premises data gateway, because support would need to give permission to the tenant to allow gateway use. This is no longer necessary. If you encounter any issues configuring or using the on-premises data gateway, you may contact support for assistance.

## Power Automate US Government feature limitations

Some of the features available in the commercial version of Flow are not available in Flow US Government customers. The Power Automate team is actively working on making these features available to US Government customers and will update this article when these features become available.

- [AI Builder](/ai-builder/) is not yet available in DoD tenants.

- [Approvals](/power-automate/modern-approvals) are available, subject to the following: 
  * There is no actionable approval support. Approval emails will contain links to the Power Automate approvals center for users to respond.
  * There is no markdown support for approval email.
  * Approvals are not available in DoD tenants. 

- [Submitting Templates](/power-automate/publish-a-template)

- [Connectors](/connectors/index) – The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, contact support and we will review your request.

>[!NOTE]
>Third-party connectors will not be added to GCC High nor DoD. 

Microsoft is investigating the data loss prevention (DLP) feature, considering the possibility for connectors to be *blocked by default*. Until this is possible, third-party connectors pose a measurable threat to organizations relying on the GCC High environment to maintain requisite data exfiltration controls.

- [Power BI](/connectors/powerbi/) – Power Automate US Government doesn’t support Power BI.

- [Power Platform admin center](/power-platform/admin/admin-documentation) – You can use the admin center to [open support tickets](/power-platform/admin/get-help-support), but other functionality is currently not available in US Government tenants.
- [Desktop flows](/power-automate/desktop-flows/overview) - To install the on-premises data gateway in DoD, go to **Data > Gateways** in the left navigation, and then select **New gateway**. 

### See also
[Desktop flows](/power-automate/desktop-flows/overview). 





[!INCLUDE[footer-include](../includes/footer-banner.md)]
