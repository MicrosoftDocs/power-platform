---
title: "Dynamics 365 US Government - Feature availability  | MicrosoftDocs"
description: Dynamics 365 US Government - Feature availability
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/28/2020
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

Microsoft strives to maintain functional parity between our commercially available service and that which is servicing Dynamics 365 U.S. Government - referred to as Dynamics 365 GCC and GCC High. Please refer to the [Global Geographic Availability](https://dynamics.microsoft.com/geographic-availability/) tool to see where the Dynamics 365 Apps and Offers are available throughout the world, including approximate timelines on when they will be available. 

At this time, preview features in the commercial offering are not available to Dynamics 365 US Government Community Cloud (GCC) and GCC High customers. This is intentional, as the GCC and GCC High deployment enable a community leveraging our generally available services, further protected with heightened compliance demands of the U.S. Government and Government community customers.

There are certain experiences that are currently not available with Dynamics 365 GCC and GCC High.  We continue to evaluate these for incorporation into future releases. The following generally available features are not currently available:

- [Activity Logging (Available CY2020-Q4)](enable-use-comprehensive-auditing.md)
- [AppSource](https://appsource.microsoft.com/?product=dynamics-365-business-central%3Bdynamics-365-for-customer-services%3Bdynamics-365-for-field-services%3Bdynamics-365-for-finance-and-operations%3Bdynamics-365-for-project-service-automation%3Bdynamics-365-for-sales) (that is, the ability to install Applications directly from AppSource)
- [CAFEx Integration](https://appsource.microsoft.com/product/dynamics-365/cafexliveassistfor365.27ac7522-68b2-44a2-9f36-da66a47e2b19)
- [Connected Field Service](https://msdn.microsoft.com/library/mt744253.aspx)
- [Data Export Service](https://appsource.microsoft.com/product/dynamics-365/mscrm.44f192ec-e387-436c-886c-879923d8a448) - replaced by Microsoft Dataverse to [Azure Data Lake](https://docs.microsoft.com/powerapps/maker/common-data-service/export-to-data-lake). Available CY2020 – Q4.
- [Gamification](https://docs.microsoft.com/dynamics365/customer-engagement/gamification/manage-gamification-in-dynamics-365-online)
- [Home.Dynamics.com](https://home.dynamics.com/) and the app switcher
- [Insights, powered by InsideView](https://appsource.microsoft.com/product/dynamics-365/insideviewinc.b5386882-4312-4d69-879a-23081897c012)
- [PowerBI “embedded” user dashboard experience](https://docs.microsoft.com/power-bi/service-connect-to-microsoft-dynamics-crm)
- [Relevance Search (Available CY2020-Q4)](https://docs.microsoft.com/powerapps/user/relevance-search)
- [Versium Predict](https://docs.microsoft.com/dynamics365/customer-engagement/versium-predict/versium-predict)
- [Teams Integration](https://docs.microsoft.com/dynamics365/teams-integration/teams-integration)

There are a number of other business application apps and services that are not currently available as a service operating within the GCC or GCC High at this time. They include:

- [Microsoft Dynamics 365 Marketing](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/overview)
- [Microsoft Dynamics 365 Talent](https://docs.microsoft.com/dynamics365/unified-operations/talent/)
- [Microsoft Business Central](https://docs.microsoft.com/dynamics365/business-central/index)
- [Microsoft Dynamics 365 Customer Insights (Available in GCC)](https://docs.microsoft.com/dynamics365/ai/customer-insights/overview)
- [Microsoft Dynamics 365 AI for Customer Service Insights](https://docs.microsoft.com/dynamics365/ai/customer-service-insights/overview)
- [Microsoft Dynamics 365 AI for Market Insights](https://docs.microsoft.com/dynamics365/ai/market-insights/overview)
- [Microsoft Dynamics 365 AI for Sales](https://docs.microsoft.com/dynamics365/ai/sales/overview)
- [Microsoft Dynamics 365 for Finance and Operations](https://docs.microsoft.com/dynamics365/unified-operations/fin-and-ops/) - Please note that while this is not available in GCC, it is available to purchase and associate to a customer’s tenant running GCC services. This option is not available for GCC High customers.
- [Microsoft Dynamics 365 for Retail](https://docs.microsoft.com/dynamics365/unified-operations/retail/) - Please note that while this is not available in GCC, it is available to purchase and associate to a customer’s tenant running GCC services. This option is not available for GCC High customers.

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
 [PowerBI for US Government Customers](https://docs.microsoft.com/power-bi/service-govus-overview)<br/>
 [Compliance Offerings](https://www.microsoft.com/trustcenter/compliance/complianceofferings?product=Dynamics365)
