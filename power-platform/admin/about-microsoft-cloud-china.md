---
title: "Dynamics 365 apps - operated by 21Vianet in China  | MicrosoftDocs"
description: Dynamics 365 apps - operated by 21Vianet in China
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/23/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Dynamics 365 apps - operated by 21Vianet in China

Microsoft Dynamics 365 online services operated by 21Vianet is designed to comply with regulatory requirements in China. The services are a physically separated environment of cloud services operated and transacted currently by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in mainland China.

Microsoft strives to maintain functional parity between our commercially available service and Dynamics 365 apps - operated by 21Vianet in China. However, there are notable exceptions to this affected by dependent service or partner-solution availability, market priorities, or compliance regulations.

## Provisioning

Customers in China have two options from which to select how they want to access Dynamics 365 apps.

- Services operated by 21Vianet in China - 21Vianet operates and offers Dynamics 365 apps services in China. This option provides a consistent Dynamics 365 apps experience that is the same as global offerings. This option also meets the demands of customers who prefer to use online services provided by a local company that stores their data within China. These services are subject to Chinese laws.

- Services operated by Microsoft – This option is for Dynamics 365 apps customers that prefer to use services managed and delivered by Microsoft. For all new customers and existing customers, if the customer purchases Microsoft Azure, Dynamics 365, and Office using an Enterprise Agreement, Office 365 and/or Dynamics 365 can co-exist on the tenant. 

There are a few technical limitations during the provisioning of services that need to be taken in to account to avoid potential issues. 

|Scenario  |Recommendation  |
|---------|---------|
|**Purchased Azure, Office 365, and Dynamics 365 via OSPA.**    |Recommended sequence for provisioning: Office 365 or Dynamics 365 must be provisioned first, followed by Azure.|
|**Purchased Azure via OSPA first and then purchased Office 365 via OSPA. Now purchased Dynamics 365 via OSPA.**   | Customer already has two tenants, one for Azure and another for Office 365. Dynamics 365 can be added to the tenant containing Office 365 OSPA.        |
|**Purchase Office 365 via OSPA and then purchased Azure via OSPA. Now purchased Dynamics 365 via OSPA.**     | Customer started with Office 365 and then added Azure. Dynamics 365 can be provisioned on the same tenant.        |
|**Purchased Office 365 via OSPA and plans to add Dynamics 365.**   |If Office 365 is already provisioned, customer will be able to provision Dynamics 365 on the same tenant.         |
|**Purchased Office 365 via OSSA or CSP and purchased Dynamics 365.**    |Dynamics 365 needs to be provisioned on a separate tenant.          |

OSPA = Online Services Premium Agreement<br />
OSSA = Online Services Standard Agreement<br />
CSP = Cloud Solution Provider

For information on provisioning environments, see [Create and manage environments in the Power Platform Admin center](https://docs.microsoft.com/power-platform/admin/create-environment).

## Features not available

Due to certain technological dependencies, the following features listed will not be available for general availability of Dynamics 365 Services operated by 21Vianet. For information about future feature availability, see [Business applications and platform release notes](https://go.microsoft.com/fwlink/p/?linkid=2010158).

- [Relevance Search]/dynamics365/customer-engagement/basics/relevance-search-results.md) or **Categorized Search** used for searching records across multiple entities will be unavailable.
- [Office 365 Groups]/dynamics365/customer-engagement/basics/collaborate-with-colleagues-using-office-365-groups.md) feature used for shared workspace for emails, conversations, files, and events in Dynamics 365 apps services will be unavailable.
- [Online Management API]/dynamics365/customer-engagement/developer/online-management-api.md) (Admin API) enables customers to create and manage the Common Data Service environments using REST API will be unavailable.
- [Company News Timeline]/dynamics365/customer-engagement/company-news-timeline/get-company-news-timeline-dynamics-365-phones-tablets.md) provides valuable insights from the latest news about tenant customers on the phone or tablet. This feature will be unavailable.
- [Global Discovery Service API]/dynamics365/customer-engagement/developer/webapi/discover-url-organization-web-api.md) which programmatically enables customer applications to discover user organization (also known as environment) and find environments across regions will not be available.
- The service health [Organization Insights](/dynamics365/customer-engagement/admin/use-organization-insights-solution-view-instance-metrics.md) feature will be unavailable.
- [Portals]/dynamics365/customer-engagement/portals/administer-manage-portal-dynamics-365.md) for the Dynamics 365 apps services will be unavailable.
- [Dynamics 365 for phones and tablets]/dynamics365/customer-engagement/mobile-app/overview.md) will be unavailable.
- The following Microsoft AppSource hosted solutions for the Dynamics 365 apps services will not be available:
  - [Microsoft Dynamics 365 - Data Export Service](https://appsource.microsoft.com/product/dynamics-365/mscrm.44f192ec-e387-436c-886c-879923d8a448)
  - [Dynamics 365 Connector for LinkedIn Lead Gen Forms](https://appsource.microsoft.com/product/dynamics-365/mscrm.dd228afa-64e7-4c9f-92ad-77e7f1334547?tab=overview)
  - [Microsoft Dynamics 365 - Gamification](https://appsource.microsoft.com/product/dynamics-365/mscrm.f6d23ec7-255c-4bd8-8c99-dc041d5cb8b3)
  - [DXC Health360 Care Coordination](https://appsource.microsoft.com/product/dynamics-365/tribridge_health360.2ca8cb47-4e93-4e1c-af86-784041b4d8a9)
- [Voice of the Customer]/dynamics365/customer-engagement/voice-of-customer/help-hub.md) solution used for sending surveys to customers and get their valuable feedback will not be available.
- [Live Assist for Microsoft Dynamics 365]/dynamics365/customer-engagement/live-assist/live-assist-microsoft-dynamics-365-powered-by-cafe-x.md) Powered by [CaféX](https://www.cafex.com/products/live-assist-365/) is an integrated omnichannel solution for Dynamics 365 apps services that will not be available.
- The following [Customer Service]/dynamics365/customer-engagement/customer-service/help-hub.md) features will be unavailable: 
  - Knowledge Base Search
  - Similar Cases Search
- The following [Field Service]/dynamics365/customer-engagement/field-service/overview.md) features will be unavailable:
  - Dynamics 365 Remote Assist
  - Push Notifications
  - Geofencing
  - Resource Scheduling Optimization (RSO)
  - Connected Field Service (CFS) for Azure IoT Central
  - Connected Field Service (CFS) for Azure IoT Hub
  - Field Service Mobile App
- The following [Sales]/dynamics365/customer-engagement/sales-enterprise/help-hub.md) features will be unavailable: 
  - LinkedIn’s Organization Chart feature
  - LinkedIn’s “No longer in the Organization” feature
  - [Embedded intelligence for Sales]/dynamics365/customer-engagement/sales-enterprise/embedded-intelligence.md)
  - [Dynamics 365 AI for Sales]/dynamics365/customer-engagement/sales-enterprise/dynamics365-ai-sales.md)

- The following components of Dynamics 365 Plan are unavailable.
  - [Project Service Automation](https://dynamics.microsoft.com/project-service-automation/overview/)
  - [Marketing (for >10 users)](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/help-hub)
  - [Microsoft Social Engagement](https://docs.microsoft.com/dynamics365/customer-engagement/social-engagement/integrate-social-engagement-dynamics-365)
  - [PowerApps for Dynamics 365](https://powerapps.microsoft.com/)
  - [Flow](https://flow.microsoft.com/)


## Additional resources
- [Dynamics 365 apps Operated by 21Vianet Support](21vianet-support.md)
- [Dynamics 365 Finance and Operations operated by 21Vianet](https://docs.microsoft.com/dynamics365/unified-operations/dev-itpro/deployment/china-local-deployment)
- [Dynamics 365 support site for 21Vianet (in Chinese)](https://www.21vbluecloud.com/Dynamics365/)
- [Dynamics 365 Privacy statement (Dynamics 365 隐私声明)](https://www.21vbluecloud.com/Dynamics365/d365-privacy/)
- [Dynamics 365 Service Level agreement(世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/Dynamics365/d365-sla/)
- [Dynamics 365  Legal information	(Dynamics 365 法律信息)](https://www.21vbluecloud.com/Dynamics365/dynamics365-legal/)
- [Service terms for Dynamics 365 Lifecycle services](https://www.21vbluecloud.com/dynamics365/d365-landing/)
- [OSPT of Dynamics 365 (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Azure Docs (in Chinese)](https://docs.azure.cn/zh-cn/)
- [Azure China 21Vianet](https://docs.microsoft.com/azure/china/china-welcome)