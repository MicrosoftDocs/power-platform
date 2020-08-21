---
title: "Model-driven apps in Dynamics 365 - operated by 21Vianet in China  | MicrosoftDocs"
description: Model-driven apps in Dynamics 365 - operated by 21Vianet in China
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/30/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Model-driven apps in Dynamics 365 - operated by 21Vianet in China

Common Data Service services operated by 21Vianet is designed to comply with regulatory requirements in China. The services are a physically separated environment of cloud services operated and transacted currently by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in mainland China.

Microsoft strives to maintain functional parity between our commercially available service and model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, - operated by 21Vianet in China. However, there are notable exceptions to this affected by dependent service or partner-solution availability, market priorities, or compliance regulations.

## Provisioning

Customers in China have two options from which to select how they want to access model-driven apps in Dynamics 365.

- Services operated by 21Vianet in China - 21Vianet operates and offers Common Data Service services in China. This option provides a consistent model-driven apps in Dynamics 365 experience that is the same as global offerings. This option also meets the demands of customers who prefer to use online services provided by a local company that stores their data within China. These services are subject to Chinese laws.

- Services operated by Microsoft – This option is for customers that prefer to use services managed and delivered by Microsoft. For all new customers and existing customers, if the customer purchases Microsoft Azure, model-driven apps in Dynamics 365, and Office using an Enterprise Agreement, Microsoft 365 and/or model-driven apps in Dynamics 365 can co-exist on the tenant. 

There are a few technical limitations during the provisioning of services that need to be taken in to account to avoid potential issues. 

|Scenario  |Recommendation  |
|---------|---------|
|**Purchased Azure, Microsoft 365, and model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, via OSPA.**    |Recommended sequence for provisioning: Microsoft 365 or model-driven apps in Dynamics 365 must be provisioned first, followed by Azure.|
|**Purchased Azure via OSPA first and then purchased Microsoft 365 via OSPA. Now purchased model-driven apps in Dynamics 365 via OSPA.**   | Customer already has two tenants, one for Azure and another for Microsoft 365. model-driven apps in Dynamics 365 can be added to the tenant containing Microsoft 365 OSPA.        |
|**Purchase Microsoft 365 via OSPA and then purchased Azure via OSPA. Now purchased Dynamics 365, such as Dynamics 365 Sales and Customer Service, via OSPA.**     | Customer started with Microsoft 365 and then added Azure. Model-driven apps in Dynamics 365 can be provisioned on the same tenant.        |
|**Purchased Microsoft 365 via OSPA and plans to add model-driven apps in Dynamics 365.**   |If Microsoft 365 is already provisioned, customer will be able to provision model-driven apps in Dynamics 365 on the same tenant.         |
|**Purchased Microsoft 365 via OSSA or CSP and purchased model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service.**    |model-driven apps in Dynamics 365 needs to be provisioned on a separate tenant.          |

OSPA = Online Services Premium Agreement<br />
OSSA = Online Services Standard Agreement<br />
CSP = Cloud Solution Provider

For information on provisioning environments, see [Create and manage environments in the Power Platform admin center](https://docs.microsoft.com/power-platform/admin/create-environment).

## Features not available

Due to certain technological dependencies, the following features listed will not be available for general availability of Common Data Service services operated by 21Vianet. For information about future feature availability, see [Business applications and platform release notes](https://go.microsoft.com/fwlink/p/?linkid=2010158).

- [Search for records in an app](https://docs.microsoft.com/powerapps/user/search) or **Categorized Search** used for searching records across multiple entities will be unavailable.
- [Microsoft 365 Groups](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/basics/collaborate-with-colleagues-using-office-365-groups) feature used for shared workspace for emails, conversations, files, and events in Common Data Service services will be unavailable.
- [Online Management API](https://docs.microsoft.com/powerapps/developer/common-data-service/online-management-api) (Admin API) enables customers to create and manage the Common Data Service environments using REST API will be unavailable.
- [Company News Timeline](https://docs.microsoft.com/dynamics365/customer-engagement/company-news-timeline/get-company-news-timeline-dynamics-365-phones-tablets) provides valuable insights from the latest news about tenant customers on the phone or tablet. This feature will be unavailable.
- [Global Discovery Service API](https://docs.microsoft.com/powerapps/developer/common-data-service/webapi/discover-url-organization-web-api) which programmatically enables customer applications to discover user organization (also known as environment) and find environments across regions will not be available.
- The service health Organization Insights feature will be unavailable.
- [Portals](https://docs.microsoft.com/dynamics365/customer-engagement/portals/administer-manage-portal-dynamics-365) for the Common Data Service services will be unavailable.
- [Dynamics 365 for phones and tablets](https://docs.microsoft.com/dynamics365/customer-engagement/mobile-app/overview) will be unavailable.
- The following Microsoft AppSource hosted solutions for the Common Data Service services will not be available:
  - [Data Export Service](https://appsource.microsoft.com/product/dynamics-365/mscrm.44f192ec-e387-436c-886c-879923d8a448)
  - [Connector for LinkedIn Lead Gen Forms](https://appsource.microsoft.com/product/dynamics-365/mscrm.dd228afa-64e7-4c9f-92ad-77e7f1334547?tab=overview)
  - [Gamification](https://appsource.microsoft.com/product/dynamics-365/mscrm.f6d23ec7-255c-4bd8-8c99-dc041d5cb8b3)
  - DXC Health360 Care Coordination
- [Voice of the Customer](https://docs.microsoft.com/dynamics365/customer-engagement/voice-of-customer/help-hub) solution used for sending surveys to customers and get their valuable feedback will not be available.
- [Live Assist for Microsoft Dynamics 365](https://docs.microsoft.com/dynamics365/customer-engagement/live-assist/live-assist-microsoft-dynamics-365-powered-by-cafe-x) Powered by [CaféX](https://www.cafex.com/products/live-assist-365/) is an integrated omnichannel solution for Common Data Service services that will not be available.
- The following [Customer Service](https://docs.microsoft.com/dynamics365/customer-engagement/customer-service/help-hub) features will be unavailable: 
  - Knowledge Base Search
  - Similar Cases Search
- The following [Field Service](https://docs.microsoft.com/dynamics365/customer-engagement/field-service/overview) features will be unavailable:
  - Dynamics 365 Remote Assist
  - Push Notifications
  - Geofencing
  - Resource Scheduling Optimization (RSO)
  - Connected Field Service (CFS) for Azure IoT Central
  - Connected Field Service (CFS) for Azure IoT Hub
  - Field Service Mobile App
- The following [Sales](https://docs.microsoft.com/dynamics365/customer-engagement/sales-enterprise/help-hub) features will be unavailable: 
  - [LinkedIn’s Organization Chart feature](https://docs.microsoft.com/dynamics365/sales-enterprise/live-org-chart#embedded--sales-navigator-control)
  - [Integrate LinkedIn Sales Navigator solutions](https://docs.microsoft.com/dynamics365/linkedin/integrate-sales-navigator)
  - [Forecasting](https://docs.microsoft.com/dynamics365/sales-enterprise/configure-forecast)
  - [Dynamics 365 Sales Insights](https://docs.microsoft.com/dynamics365/ai/sales/overview)

- The following components of Dynamics 365 Plan are unavailable.
  - [Project Service Automation](https://dynamics.microsoft.com/project-service-automation/overview/)
  - [Marketing (for >10 users)](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/help-hub)
  - [Microsoft Social Engagement](https://docs.microsoft.com/dynamics365/customer-engagement/social-engagement/integrate-social-engagement-dynamics-365)


## Additional resources
- [Apps Operated by 21Vianet Support](21vianet-support.md)
- [Finance and Operations operated by 21Vianet](https://docs.microsoft.com/dynamics365/unified-operations/dev-itpro/deployment/china-local-deployment)
- [Support site for 21Vianet (in Chinese)](https://www.21vbluecloud.com/Dynamics365/)
- [Privacy statement (Dynamics 365 隐私声明)](https://www.21vbluecloud.com/Dynamics365/d365-privacy/)
- [Service Level agreement(世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/Dynamics365/d365-sla/)
- [Legal information	(Dynamics 365 法律信息)](https://www.21vbluecloud.com/Dynamics365/dynamics365-legal/)
- [Service terms for Lifecycle services](https://www.21vbluecloud.com/dynamics365/d365-landing/)
- [OSPT (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Azure Docs (in Chinese)](https://docs.azure.cn/zh-cn/)
- [Azure China 21Vianet](https://docs.microsoft.com/azure/china/china-welcome)
