---
title: Encryption strategy recommendation for Power Platform workloads
description: Learn how to encrypt and protect your data. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for data encryption

**Applies to Power Platform Well-Architected Security checklist recommendation:**

|[SE:06](checklist.md)| **Encrypt data by using modern industry-standard methods to guard confidentiality and integrity. Align encryption scope with data classifications; prioritize native platform encryption methods.** |
|---|---|

If your data isn't protected, it can be maliciously modified, which leads to loss of integrity and confidentiality.

This guide describes the recommendations for encrypting and protecting your data. Encryption is the process of using cryptography algorithms to **make the data unreadable and lock the data with a key**. In the encrypted state, data can't be deciphered. It can only be decrypted by using a key that's paired with the encryption key.

**Definitions** 

| Terms | Definition |
|---|---|
| Certificates | Digital files that hold the public keys for encryption or decryption. |
| Decryption | The process in which encrypted data is unlocked with a secret code. |
| Encryption | The process by which data is made unreadable and locked with a secret code. |
| Keys | A secret code used to lock or unlock encrypted data. |

## Key design strategies

Organizational mandates or regulatory requirements might enforce encryption mechanisms. For example, there might be a requirement that data must remain only in the selected region, and copies of the data are maintained in that region.

These requirements are often the base minimum. Strive for a higher level of protection. You're responsible for **preventing confidentiality leaks and tampering of sensitive data**, whether it's external user data or employee data.

Data is an organization’s most valuable and irreplaceable asset, and encryption serves as the last and strongest line of defense in a multi-layered data security strategy. Microsoft business cloud services and products use encryption to safeguard customer data and help you maintain control over it.

### Encryption scenarios

Encryption mechanisms likely need to secure the data in three stages:

- **Data at rest** is all information that's kept in storage objects. By default, Microsoft stores and manages the database encryption key for your environments using a Microsoft-managed key. However, Power Platform provides a [customer-managed encryption key (CMK)](/power-platform/admin/customer-managed-key) for added data protection control, where you can self-manage the database encryption key.

- **Data in processing** is data that is being used as part of an interactive scenario, or when a background process, such as a refresh, touches it. Power Platform loads data in processing into the memory space of one or more service workloads. To facilitate the workload's functionality, data that's stored in memory isn't encrypted.

- **Data in transit** is information that's transferred between components, locations, or programs. Azure uses industry standard transport protocols such as Transport Layer Security (TLS) between user devices and Microsoft data centers, and within data centers themselves.

### Native encryption mechanisms

By default, Microsoft stores and manages the database encryption key for your environments using a Microsoft-managed key. However, Power Platform provides a customer-managed encryption key (CMK) for added data protection control, where you can self-manage the database encryption key. The encryption key resides in your own Azure key vault, which allows you to rotate or swap the encryption key on demand. It also allows you to prevent Microsoft's access to your customer data when you revoke the key access to our services at any time.

:::image type="content" source="images/encryption/image1.png" alt-text="Encryption of data at rest.":::

### Encryption keys

By default, Power Platform services use Microsoft-managed encryption keys to encrypt and decrypt data. Azure is responsible for key management.

You can opt for **customer-managed keys**. Power Platform still uses your keys, but you're accountable for key operations.

## Power Platform facilitation

The following sections describe Power Platform features and capabilities you can use to encrypt your data.

### Customer managed key

All customer data stored in Power Platform is encrypted using a strong Microsoft-managed encryption key by default. Organizations with data privacy and compliance requirements to secure their data and manage their own keys can use the customer managed key capability. The customer managed key provides added data protection where you self-manage the data encryption key associated with your Dataverse environment. Using this capability enables you to rotate or swap encryption keys on demand. Also, it prevents Microsoft from being able to access your data when you revoke the key from the service. For more information, see [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key).

### Data residency

An Azure Active Directory (Azure AD) tenant houses information that's relevant to an organization and its security. When an Azure AD tenant signs up for Power Platform services, the tenant's selected country or region is mapped to the most suitable Azure geography where a Power Platform deployment exists. Power Platform stores customer data in the tenant's assigned Azure geography, or *home geo*, except where organizations deploy services in multiple regions.

Power Platform services are available in specific Azure geographies. For more information about where Power Platform services are available, where your data is stored, and how it's used, see [Microsoft Trust Center](https://www.microsoft.com/trustcenter). Commitments concerning the location of customer data at rest are specified in the Data Processing Terms of the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31). Microsoft also provides data centers for [sovereign entities](/power-platform/admin/regions-overview).

Accessing Copilot Studio generative AI features from regions outside the United States results in [data movement across regional boundaries](/microsoft-copilot-studio/manage-data-movement-outside-us). This data movement can be enabled and disabled in Power Platform. Learn more in [Regions involved with copilots and generative AI features](/power-platform/admin/geographical-availability-copilot#regions-involved-with-copilots-and-generative-ai-features). Geographic data residency in Microsoft Copilot Studio provides a robust framework for ensuring data security and compliance with local regulations. In addition to its own native security features, Copilot Studio leverages the Azure infrastructure to provide secure and compliant data residency options. Learn more about data residency and Copilot Studio in [Geographic data residency in Copilot Studio](/microsoft-copilot-studio/geo-data-residency) and [Security and geographic data residency in Copilot Studio](/microsoft-copilot-studio/geo-data-residency-security).

### Data at rest

Unless otherwise stated in documentation, customer data remains in its original source (for example, Dataverse or SharePoint). All data persisted by Power Platform is encrypted by default using Microsoft-managed keys.

### Data in processing

Data is in processing when it's being used as part of an interactive scenario, or when a background process, such as a refresh, touches it. Power Platform loads data in processing into the memory space of one or more service workloads. To facilitate the workload's functionality, data that's stored in memory isn't encrypted.

### Data in transit

Power Platform requires all incoming HTTP traffic to be encrypted using TLS 1.2 or higher. Requests that try to use TLS 1.1 or lower are rejected.

For more information, see [About data encryption in Power Platform](/power-platform/admin/about-encryption) and [Data storage and governance in Power Platform](/power-platform/admin/security/data-storage).

## Related information

- [About data encryption](/power-platform/admin/about-encryption)
- [Data storage and governance in Power Platform](/power-platform/admin/security/data-storage)
- [Power Platform security FAQs](/power-platform/admin/security/faqs)
- [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
