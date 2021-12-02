---
title: "Understand the US Government plans available"
description: "This document lists the capabilities, requirements, and features for US Government plans for Power Virtual Agents."
keywords: "Administration, licensing, PVA, standalone, compare, comparison"
ms.date: 12/02/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "licensing, admin, ceX"
ms.collection: virtual-agent
---

# Power Virtual Agents for US Government customers

This article is for US government customers who are deploying Power Virtual Agents as a part of a Power Virtual Agents Government Community Cloud (GCC) plan. It provides you with an overview of features that are specific to these plans.

Government plans are designed for the unique needs of organizations that must meet US compliance and security standards.

We recommend that you read this topic and the [Power Virtual Agents introduction topic](fundamentals-what-is-power-virtual-agents.md).

The Power Virtual Agents US Government Service Description serves as an overlay to the general Power Virtual Agents Service Description. It defines the unique commitments and differences compared to the general Power Virtual Agents offerings that are available to our customers since December 2019.

## Power Virtual Agents US Government plans and environments

Licensing for Power Virtual Agents US Government plans is the same as for public cloud. They are available through the Volume Licensing and Cloud Solution Provider purchasing channels. For more information, see the [Assign user licenses and manage access](requirements-licensing.md) topic.

The Power Virtual Agents GCC environment is compliant with the Federal requirements for cloud services, including FedRAMP High.

In addition to the features and capabilities of Power Virtual Agents, organizations that use Power Virtual Agents US Government plans benefit from the following unique features:

-   Your organization's customer content is physically separated from customer content in non-US-Government plans for Power Virtual Agents.

-   Your organization's customer content is stored within the United States.

-   Access to your organization's customer content is restricted to screened Microsoft personnel.

-   Power Virtual Agents US Government complies with all certifications and accreditations that US Public Sector customers require.

### GCC High environment

Beginning December 2021, eligible customers can choose to deploy Power Virtual Agents US Government to the GCC High environment, which enables single sign-on and seamless integration with Office 365 GCC High deployments.  

Microsoft has designed the platform and our operational procedures to meet the requirements aligning with the DISA SRG IL4 compliance framework. We anticipate the US Department of Defense contractor customer base and other Federal agencies currently leveraging Office 365 GCC High to use the Power Virtual Agents US Government GCC High deployment option. 

This option enables and requires the customer to leverage Azure AD Government for customer identities, in contrast to GCC, which leverages the public Azure AD. 

For the US Department of Defense contractor customer base, Microsoft operates the service in a manner that enables these customers to meet ITAR commitment and DFARS acquisition regulations, as documented and required by their contracts with the US Department of Defense. A Provisional Authority to Operate has been granted by DISA.

## Customer eligibility

Power Virtual Agents US Government plans are available to:

-   \(1\) US federal, state, local, tribal, and territorial government entities, and

-   \(2\) other entities, which handle data that is subject to government regulations and requirements and where use of Power Virtual Agents US Government plans is appropriate to meet these requirements, subject to validation of eligibility. 

Microsoft's validation of eligibility includes confirmation of handling data subject to International Traffic in Arms Regulations (ITAR), law enforcement data subject to the FBI's Criminal Justice Information Services (CJIS) Policy, or other government-regulated or controlled data. Validation may require sponsorship by a government entity with specific requirements for the handling of data.

Entities with questions about eligibility for Power Virtual Agents US Government should consult their account team. Microsoft revalidates eligibility when it renews customer contracts for Power Virtual Agents US Government plans.


## Differences between customer data and customer content

Customer data, as defined in the [Online Service Terms](https://www.microsoft.com/licensing/product-licensing/products?rtc=2#coreui-contentrichblock-4khwhqo), means all data, including all text, sound, video, image files, and software that is provided to Microsoft by, or on behalf of, customers using an Online Service.

Customer content refers to a specific subset of customer data that has been directly created by users, such as content stored in databases through entries in the [Dataverse](/powerapps/maker/common-data-service/data-platform-intro) entities (for example, contact information). Content is generally considered confidential information, and in normal service operations, is not sent through the Internet without encryption.

For more information on how Power Virtual Agents protects customer data, see the [Microsoft Online Services Trust Center](https://www.microsoft.com/trustcenter/cloudservices/business-application-platform/default.aspx).

## Data segregation for Government Community Cloud

When provisioned as part of Power Virtual Agents US Government plans, the Power Virtual Agents service is offered in accordance with the National Institute of Standards and Technology (NIST).

In addition to the logical separation of customer content at the application layer, the Power Virtual Agents US Government service provides your organization with a secondary layer of physical segregation for customer content by using infrastructure that is separate from the infrastructure used for commercial Power Virtual Agents customers. This type of usage includes using Azure services in Azure's Government Cloud. To learn more, see [Azure Government](https://azure.microsoft.com/global-infrastructure/government/).

## Customer content located within the United States

The Power Virtual Agents US Government service runs in datacenters physically located in the United States and stores customer content at rest in datacenters physically located only in the United States.

## Restricted data access by administrators

Access to Power Virtual Agents US Government customer content by Microsoft administrators is restricted to personnel who are US citizens. These personnel undergo background investigations in accordance with relevant government standards.

Power Virtual Agents support and service engineering staff do not have standing access to customer content hosted in the Power Virtual Agents US Government service. Any staff who requests temporary permission elevation which would grant access to customer content must first have passed the following background checks.

| Microsoft Personnel Screening and Background Checks&nbsp;<a href="#AccFn1" id="AccRef1"><sup>1</sup></a> | Description                                                                                                                                                                                                   |
|------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| U.S. citizenship                                                 | Verification of U.S. citizenship                                                                                                                                                                              |
| Employment history check                                         | Verification of seven (7) year employment history                                                                                                                                                             |
| Education verification                                           | Verification of highest degree attained                                                                                                                                                                       |
| Social Security number (SSN) search                              | Verification that the SSN the employees provides is valid                                                                                                                                                     |
| Criminal history check                                           | A seven (7) year criminal record check for felony and misdemeanor offenses at the state, county, and local level and at the federal level                                                                     |
| Office of Foreign Assets Control list (OFAC)                     | Validation against the Department of Treasury list of groups with whom U.S. persons are not allowed to engage in trade or financial transactions                                                              |
| Bureau of Industry and Security list (BIS)                       | Validation against the Department of Commerce list of individuals and entities barred from engaging in export activities                                                                                      |
| Office of Defense Trade Controls Debarred Persons list (DDTC)    | Validation against the Department of State list of individuals and entities barred from engaging in export activities related to the defense industry                                                         |
| Fingerprinting check                                             | Fingerprint background check against FBI databases                                                                                                                                                            |
| CJIS background screening                                        | State-adjudicated review of federal and state criminal history by state CSA appointed authority within each state that has signed up for the Microsoft CJIS IA program                                        |
| Department of Defense IT-2                                       | Staff who request elevated permissions to customer data or privileged administrative access to DoD SRG L5 service capacities must pass DoD IT-2 adjudication, based on a successful OPM Tier 3 investigation. |

<a href="#AccRef1" id="AccFn1">1.</a> Applies only to personnel with temporary or standing access to customer content hosted in Power Virtual Agents US Government (GCC and GCC High)

## Certifications and accreditations

Power Virtual Agents US Government plans are designed to support the Federal Risk and Authorization Management Program (FedRAMP) accreditation at a High Impact level.  FedRAMP artifacts are available for review by federal customers who are required to comply with FedRAMP. Federal agencies can peruse these artifacts in support of their review to grant an Authority to Operate (ATO).

>[!NOTE]
>Power Virtual Agents is authorized as a service within the Azure Government FedRAMP ATO.  
>For more information, including how to access the FedRAMP documents, review the [FedRAMP Marketplace](https://marketplace.fedramp.gov/#!/product/azure-government-includes-dynamics-365?sort=productName&productNameSearch=azure%20government).

Power Virtual Agents US Government plans have features designed to support customers' CJIS Policy requirements for law enforcement agencies. 

## Power Virtual Agents US Government and other Microsoft services

Power Virtual Agents US Government plans include several features that allow users to connect to, and integrate with, other Microsoft enterprise service offerings such as Power Apps and Power Automate US Government.

Power Virtual Agents US Government services run within Microsoft datacenters in a manner consistent with a multi-tenant, public cloud deployment model; however, client applications are limited to the web-user client and are not available in Microsoft Teams. Government customers are responsible for managing client applications.

Power Virtual Agents US Government plans use the Office 365 customer administrator UI for customer administration and billing.

The Power Virtual Agents US Government service maintains the actual resources, information flow, and data management, while relying on Office 365 to provide the visual styles that are presented to the customer administrator through their management console. For purposes of FedRAMP ATO inheritance, Power Virtual Agents US Government plans use Azure (including Azure for Government) ATOs for infrastructure and platform services, respectively.

If you adopt the use of Active Directory Federation Services (ADFS) 2.0 and set up policies to help ensure your users connect to the services through single sign-on, any customer content that is temporarily cached will be in the United States.

## Power Virtual Agents US Government and third-party services

Power Virtual Agents US Government plans provide the ability to integrate third-party applications into the service through Power Automate Cloud Flow which uses [Connectors](/connectors/index) and [Skills](advanced-use-skills.md). These third-party applications and services might involve storing, transmitting, and processing your organization's customer data on third-party systems that are outside of the Power Virtual Agents US Government infrastructure and therefore are not covered by the Power Virtual Agents US Government compliance and data protection commitments.

>[!IMPORTANT]
>Review the privacy and compliance statements provided by the third parties when assessing the appropriate use of these services for your organization.

[Governance Considerations](/power-platform/admin/governance-considerations) can help your organization bring awareness about the capabilities available across several related themes, such as architecture, security, alert and action, and monitoring.

## Power Virtual Agents US Government and Azure Services

The Power Virtual Agents US Government services are deployed to Microsoft Azure Government. Azure Active Directory (Azure AD) is not part of the Power Virtual Agents US Government accreditation boundary, but takes reliance on a customer's [Azure AD](https://azure.microsoft.com/services/active-directory/) tenant for customer tenant and identity functions, including authentication, federated authentication, and licensing.

When a user of an organization employing ADFS attempts to access the Power Virtual Agents US Government service, the user is redirected to a login page hosted on the organization's ADFS server.

The user provides credentials to their organization's ADFS server. The organization's ADFS server attempts to authenticate the credentials using the organization's Active Directory infrastructure.

If authentication is successful, the organization's ADFS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user's identity and group membership.

The customer's ADFS server signs this ticket using one half of an asymmetric key pair and then sends the ticket to Azure AD via encrypted TLS. Azure AD validates the signature using the other half of the asymmetric key pair and then grants access based on the ticket.

The user's identity and group membership information remain encrypted in Azure AD. In other words, only limited user-identifiable information is stored in Azure AD.

You can find full details of the Azure AD security architecture and control implementation in the Azure SSP.

The Azure AD account management services are hosted on physical servers managed by the Microsoft Global Foundation Services (GFS). Network access to these servers is controlled by GFS-managed network devices using rules set by Azure. Users do not interact directly with Azure AD.

## Power Virtual Agents US Government service URLs

You use a different set of URLs to access Power Virtual Agents US Government environments, as shown in the following table. The table also includes the commercial URLs for contextual reference.

| Commercial version | US Government version |
|-------------------------|-------------------------|
| [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com) | [https://gcc.powerva.microsoft.us](https://gcc.powerva.microsoft.us) (GCC) </br></br>[https://high.powerva.microsoft.us](https://high.powerva.microsoft.us) (GCC High)|
| [https://flow.microsoft.com](https://flow.microsoft.com/) | [https://gov.flow.microsoft.us](https://gov.flow.microsoft.us/) (GCC)</br></br>[https://high.flow.microsoft.us](https://high.flow.microsoft.us/) (GCC High) </br></br>[https://flow.appsplatform.us](https://flow.appsplatform.us) (DoD) |
| [https://make.powerapps.com](https://make.powerapps.com/) | [https://make.gov.powerapps.us](https://make.gov.powerapps.us/) (GCC)<br /></br>[https://make.high.powerapps.us](https://make.high.powerapps.us/) (GCC High)<br /></br>[https://make.apps.appsplatform.us](https://make.apps.appsplatform.us/) (DoD) |
| [https://flow.microsoft.com/connectors](https://flow.microsoft.com/connectors) | [https://gov.flow.microsoft.us/connectors](https://gov.flow.microsoft.us/connectors)<br /></br>[https://high.flow.microsoft.us/connectors](https://high.flow.microsoft.us/connectors) (GCC High)<br /></br>[https://flow.appsplatform.us](https://flow.appsplatform.us/) (DoD) |
| [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com/) | [https://gcc.admin.powerplatform.microsoft.us](https://gcc.admin.powerplatform.microsoft.us/)<br /></br>[https://high.admin.powerplatform.microsoft.us](https://high.admin.powerplatform.microsoft.us/) (GCC High)<br /></br>[https://admin.appsplatform.us](https://admin.appsplatform.us/) (DoD) |


For those customers that implement network restrictions, ensure access to the following domains is made available to your end users' access points:

### GCC customers:

-   *.azure.net*
-   *.azure.us*
-   *.azure-apihub.us*
-   *.azureedge.net*
-   *.crm9.dynamics.com*
-   *.microsoft.com*
-   *.microsoft.us*
-   *.microsoftonline.com*
-   *.usgovcloudapi.net*
-   *.windows.net*


Refer to the [IP ranges](https://www.microsoft.com/download/confirmation.aspx?id=57063) for *AzureCloud.usgovtexas* and*AzureCloud.usgovvirginia* to enable access to Dataverse instances that users and administrators may create within your tenant.

### GCC High Customers:

-    *.microsoft.us*
-    *.azure-apihub.us*
-    *.azure.us*
-    *.usgovcloudapi.net*
-    *.microsoftonline.us*
-    *.azureedge.net*
-    *.azure.net*
-    *.crm.microsoftdynamics.us(GCC High)*
-    *\*.high.dynamics365portals.us (GCC High)*
-    *\*.crm.appsplatform.us (DoD)*
-    *\*.appsplatformportals.us (DoD)*  

Also, refer to the [IP ranges](https://www.microsoft.com/download/confirmation.aspx?id=57063) to enable you to access other Dataverse environments that users and administrators may create within your tenant and other Azure services that the platform leverages, including:

-    GCC and GCC High: Focus on *AzureCloud.usgovtexas* and *AzureCloud.usgovvirginia*.


## Connectivity between Power Virtual Agents US Government and public Azure Cloud services

Azure is distributed among multiple clouds. By default, tenants are allowed to open firewall rules to a cloud-specific instance, but cross-cloud networking is different and requires opening specific firewall rules to communicate between services. If you are a Power Virtual Agents customer and you have existing SQL instances in Azure public cloud which you need to access, you must open specific firewall ports in SQL to the Azure Government Cloud IP space for the following datacenters:

-   USGov Virginia

-   USGov Texas


Refer to the [Azure IP Ranges and Service Tags - US Government Cloud](https://www.microsoft.com/download/confirmation.aspx?id=57063) document, focusing attention on *AzureCloud.usgovtexas*, and*AzureCloud.usgovvirginia*. Also note that these are the IP ranges required for your end users to have access to the service URLs.



## Power Virtual Agents US Government feature limitations

Some of the features available in the commercial version of Power Virtual Agents are not available to Power Virtual Agents US Government customers. The Power Virtual Agents team is actively working on making these features available to US Government customers and will update this article when these features become available.

Feature or capability | Available in GCC | Available in GCC High
|-|-|-|
[Power Virtual Agents Analytics](analytics-overview.md)&nbsp;<a id="LimsRef1" href="#LimsFn1"><sup>1</sup></a>| &#X2716;</br>No | &#X2716;</br>No
[Power Virtual Agents Microsoft Teams app experience](teams/fundamentals-what-is-power-virtual-agents-teams.md) | &#X2716;</br>No | &#X2716;</br>No
[Teams channel in the Power Virtual Agents web app](publication-add-bot-to-microsoft-teams.md) | &#X2714;</br>Yes | &#X2716;</br>No
[Skills](configuration-add-skills.md) | &#X2714;</br>Yes | &#X2716;</br>No
[Transfer to agents](configuration-hand-off-omnichannel.md) | &#X2714;</br>Yes | &#X2716;</br>No


<a id="LimsFn1" href="#LimsRef1">1. </a>Alternatively, you can create [Custom Analytics using a Power BI dashboard (blog)](https://powervirtualagents.microsoft.com/blog/custom-analytics-solution-for-power-virtual-agents/).


## Requesting support

Having a problem with your service? You can create a support request to get the issue resolved.

More information: [Contact Technical Support](/power-platform/admin/get-help-support)
