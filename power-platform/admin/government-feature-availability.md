---
title: "Dynamics 365 US Government - Feature availability  | MicrosoftDocs"
description: Dynamics 365 US Government - Feature availability
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/16/2021
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
# Dynamics 365 US Government - Feature availability 

Microsoft strives to maintain functional parity between our commercially available service and those servicing Dynamics 365 U.S. Government. These services are referred to as Dynamics 365 Government Community Cloud (GCC) and GCC High. Refer to the [Global Geographic Availability](https://dynamics.microsoft.com/geographic-availability/) tool to see where the Dynamics 365 Apps and Offers are available throughout the world, including approximate availability timelines. 

Currently preview features in the commercial offering are not available to Dynamics 365 GCC and GCC High customers. This policy is intentional, as U.S. government deployments enable a community applying our generally available services. These services are further protected with heightened compliance demands of the U.S. Government and related community customers.

Certain experiences aren't available with Dynamics 365 GCC and GCC High. Microsoft continues to evaluate these services for updates for future releases. The following generally available features are not currently available:

- [Activity Logging (Available CY2020-Q4)](enable-use-comprehensive-auditing.md)
- [AppSource](https://appsource.microsoft.com/?product=dynamics-365-business-central%3Bdynamics-365-for-customer-services%3Bdynamics-365-for-field-services%3Bdynamics-365-for-finance-and-operations%3Bdynamics-365-for-project-service-automation%3Bdynamics-365-for-sales) (that is, the ability to install Applications directly from AppSource)
- [CAFEx Integration](https://appsource.microsoft.com/product/dynamics-365/cafexliveassistfor365.27ac7522-68b2-44a2-9f36-da66a47e2b19)
- [Connected Field Service](/previous-versions/dynamicscrm-2016/developers-guide/mt744253(v=crm.8))
- [Data Export Service](https://appsource.microsoft.com/product/dynamics-365/mscrm.44f192ec-e387-436c-886c-879923d8a448) - replaced by Microsoft Dataverse to [Azure Data Lake](/powerapps/maker/common-data-service/export-to-data-lake). Available CY2020 – Q4.
- [Gamification](/dynamics365/customer-engagement/gamification/manage-gamification-in-dynamics-365-online)
- [Home.Dynamics.com](https://home.dynamics.com/) and the app switcher
- [Insights, powered by InsideView](https://appsource.microsoft.com/product/dynamics-365/insideviewinc.b5386882-4312-4d69-879a-23081897c012)
- [Power BI “embedded” user dashboard experience](/power-bi/developer/embedded/embedded-analytics-power-bi)
- [Relevance Search (Available CY2020-Q4)](/powerapps/user/relevance-search)
- [Versium Predict](/dynamics365/customer-engagement/versium-predict/versium-predict)
- [Teams Integration](/dynamics365/teams-integration/teams-integration)
- [Microsoft Power Platform Build Tools for Azure DevOps](../alm/devops-build-tools.md)

A number of other business application apps and services aren't currently available as a service operating within the GCC or GCC High at this time. These include:

- [Microsoft Dynamics 365 Marketing](/dynamics365/customer-engagement/marketing/overview)
- [Microsoft Dynamics 365 Talent](/dynamics365/unified-operations/talent/)
- [Microsoft Business Central](/dynamics365/business-central/index)
- [Microsoft Dynamics 365 Customer Insights (Available in GCC)](/dynamics365/ai/customer-insights/overview)
- [Microsoft Dynamics 365 AI for Customer Service Insights](/dynamics365/ai/customer-service-insights/overview)
- [Microsoft Dynamics 365 AI for Market Insights](/dynamics365/ai/market-insights/overview)
- [Microsoft Dynamics 365 AI for Sales](/dynamics365/ai/sales/overview)
- [Microsoft Dynamics 365 for Finance and Operations](/dynamics365/unified-operations/fin-and-ops/) - Although this service is not included in Dynamics 365 GCC, it is available for purchase. Use it to associate with a customer’s tenant running GCC services. Note that this option is not available for GCC High customers.
- [Microsoft Dynamics 365 for Retail](/dynamics365/unified-operations/retail/) - Although this service is not included in Dynamics 365 GCC, it is available for purchase. Use it to associate with a customer’s tenant running GCC services. Note that this option is not available for GCC High customers.

<a name="BKMK_NetworkPorts"></a>   

## Network ports for [!INCLUDE[pn_CRM_Online_Government_shortest](../includes/pn-crm-online-government-shortest.md)]  
 The following ports are open for outbound connections between [!INCLUDE[pn_CRM_Online_Government_shortest](../includes/pn-crm-online-government-shortest.md)] and internet services.  

- 80 HTTP  
- 443 HTTPS  
- 465 Secure SMTP  
- 587 Secure SMTP
- 995 Secure POP3 
- 993 Secure IMAP 

Customizations or email configurations in Dynamics 365 GCC and GCC High can only use these ports.

### See also  
 [Microsoft Dynamics 365 US Government](microsoft-dynamics-365-government.md)<br/>
 [Important changes coming](../important-changes-coming.md)<br/>
 [IP addresses and URLs](online-requirements.md#ip-addresses-and-urls)<br />
 [Power BI for US Government Customers](/power-bi/service-govus-overview)<br/>
 [Compliance Offerings](https://www.microsoft.com/trustcenter/compliance/complianceofferings?product=Dynamics365)


[!INCLUDE[footer-include](../includes/footer-banner.md)]