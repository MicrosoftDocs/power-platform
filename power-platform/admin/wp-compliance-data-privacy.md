---
title: Compliance and data privacy 
description: Compliance and data privacy
author: paulliew
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/28/2026
ms.subservice: admin
ms.author: paulliew
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# Compliance and data privacy

Microsoft is committed to the highest levels of trust, transparency, standards conformance, and regulatory compliance. Microsoft’s broad suite of cloud products and services is built from the ground up to address the most rigorous security and privacy demands of customers.

To help your organization comply with national, regional, and industry-specific requirements governing the collection and use of individuals’ data, Microsoft provides the most comprehensive set of compliance offerings, including certifications and attestations, of any cloud service provider. Microsoft also provides tools for administrators to support your organization’s efforts. In this part of the document, you learn about the resources available to help you determine and achieve your own organization requirements.

## Trust Center

The [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is a centralized resource for obtaining information on Microsoft’s portfolio of products. This includes information on security, privacy, compliance, and transparency. While this content may contain some subset of this information for Power Apps, it's important to always refer to the Microsoft Trust Center for the most up-to-date authoritative information.

For quick reference, you can find the Trust Center information for the Microsoft Power Platform here: https://www.microsoft.com/trust-center/product-overview. This information includes details on Power Apps, Microsoft Power Automate, and Power BI.

## Data location

Microsoft operates multiple data centers worldwide that support the Microsoft Power platform applications. When your organization establishes a tenant, it establishes the default geographical (geo) location. In addition, when creating environments to support applications and contain Microsoft Dataverse data, you can target the environments for a specific geo. You can find a current list of the geos for the Microsoft Power Platform in the [Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/business-application-platform/data-location).

To support continuity of operations, Microsoft might replicate data to other regions within a geo, but the data doesn't move outside the geo to support data resiliency. This architecture supports the ability to fail over or recover more rapidly if there's a severe outage. Some reasonable exceptions to keeping data in the specific geo are listed on the preceding site, primarily focused on legal and support. It's also important to note that you or your users can take actions that expose data outside of the geo. Other services can also be configured to access the data and expose it outside of the geo. By default, authorized users can access the platform and your applications and data from anywhere in the world where there's connectivity.

## Data protection

Data is secured as it moves in transit between user devices and the Microsoft datacenters. Connections established between customers and Microsoft datacenters are encrypted, and all public endpoints are secured by using industry-standard TLS. TLS effectively establishes a security-enhanced browser to server connection to help ensure data confidentiality and integrity between desktops and datacenters. API access from the customer endpoint to the server is also similarly protected. Currently, TLS 1.2 (or higher) is required for accessing the server endpoints.

Data transferred through the on-premises data gateway is also encrypted. Data that users upload is typically sent to Azure Blob storage, and all metadata and artifacts for the system itself are stored in an Azure SQL database and Azure Table storage.

All environments of the Dataverse database use SQL Server Transparent Data Encryption (TDE) to perform real-time encryption of data when written to disk, also known as encryption at rest.

By default, Microsoft stores and manages the database encryption keys for your environments so you don't have to. The manage keys feature in the Power Platform admin center gives administrators the ability to self-manage the database encryption keys that are associated with environments of Dynamics 365 (online). You can read more about managing your own keys in [Manage your customer-managed encryption key](customer-managed-key.md).

## Resources to manage GDPR compliance

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

As an administrator, one of the key activities in support of privacy is related to Data Subject Rights (DSR) requests. These requests are formal requests from a data subject to a data controller (likely your organization) to act on their personal data in your systems. Data subjects have the right to obtain copies, request corrections, restrict processing of the data, delete the data, and receive copies in an electronic format so they can move it to another data controller.

The following links point to detailed information to help you respond to DSR requests depending on the features your organization is using.

|Platform Feature Area  |Link to detailed response steps  |
|---------|---------|
|Power Apps  |  [Responding to Data Subject Rights (DSR) requests to export Power Apps customer data](powerapps-privacy-export-dsr.md)      |
|Dataverse     |  [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md)     |
|Power Automate    | [Responding to Data Subject Requests for Power Automate](/power-automate/gdpr-dsr-summary)       |
|Microsoft Accounts (MSAs)     | [Respond to Data Subject Rights requests](/power-automate/gdpr-dsr-summary-msa)       |
|Customer engagement apps     | [Dynamics 365 Data Subject Requests for privacy](/compliance/regulatory/gdpr-dsr-Dynamics365)        |

## Microsoft 365 Security and Compliance Center

Use the [Microsoft Purview Compliance Manager](https://compliance.microsoft.com/homepage) to manage your compliance efforts across Microsoft cloud services in a single place. 

## Power Automate audit log events

In the compliance center Audit Log Search, administrators can search and view Power Automate events. Events include Created flow, Edited flow, Deleted flow, Edited Permissions, Deleted Permissions, Started a paid trial, and Renewed a paid trial. Using the portal, you can choose what you want to search and set a time window.

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/homepage).

1. Under **Solutions**, select **Audit**.

1. Under **Activities**, select the Power Automate activities to audit.

   :::image type="content" source="media/compliance-manager-power-automate-activities.png" alt-text="Select the Power Automate activities to audit.":::

1. Select **Search**.

1. When the search completes, select it to see the list of related activities.

1. Select a row in the list to see the activity details.

Audit data is retained for 90 days. You can export the data as CDSV, which you can move into Excel or Power BI for further analysis. For a complete walkthrough of using the audit information, see [Power Automate](https://flow.microsoft.com/blog/security-and-compliance-center/).

## Dataverse data in Microsoft 365 Copilot

Allowing Microsoft 365 Copilot and Microsoft 365 Copilot Chat to get Power Apps, Dynamics 365, and other business data improves the quality of Copilot responses by using live data from Dataverse.

Dataverse integration in Microsoft 365 Copilot sends only minimal, derived search queries to Dataverse with all user and tenant identifiers removed. Enterprise data (documents, prompts, responses) remains within the Microsoft 365 boundary and is covered by the [Data Processing Addendum](https://www.microsoft.com/licensing/docs/documents/download/MicrosoftOnlineServicesDPA(WW)(English)(Dec9,2020)(CR).docx) and [Product Terms](https://www.microsoft.com/licensing/terms/en-US/productoffering/MicrosoftPowerPlatform/OL). Customers retain full admin control to disable Dataverse search by using the [Enable Microsoft 365 admin center Copilot Dataverse settings](/power-apps/maker/data-platform/data-platform-intelligence#enable-microsoft-365-admin-center-copilot-dataverse-settings).

For more information, see [Data, Privacy, and Security for Microsoft 365 Copilot](/microsoft-365/copilot/microsoft-365-copilot-privacy).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
