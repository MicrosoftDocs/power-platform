---
title: Power Platform and Dynamics 365 apps operated by 21Vianet in China
description: This article provides information about Microsoft Power Platform and Dynamics 365 apps that are operated by 21Vianet in China.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/12/2025
ms.subservice: admin
ms.author: sericks
ms.contributors:
- macarrer
- pvayner
- shailesn
- ahothur
contributors:
- Akshay-Koushik-Hothur 
---
# Power Platform and Dynamics 365 apps operated by 21Vianet in China

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft Power Platform and Dynamics 365 apps services operated by 21Vianet are designed to comply with regulatory requirements in China. The services are a physically separated environment of cloud services that's currently operated and transacted by a local operator, Shanghai Blue Cloud Technology Co., Ltd ("21Vianet"). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd., located in China.

The Dynamics 365 apps include Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.

## Provisioning

Customers in China have two options for accessing Microsoft Power Platform and Dynamics 365 apps:

- **Services operated by 21Vianet in China**: 21Vianet operates and offers Microsoft Power Platform and Dynamics 365 apps services in China. This option provides a consistent Microsoft Power Platform and Dynamics 365 apps experience that is the same as global offerings. It also meets the demands of customers who prefer to use online services that are provided by a local company that stores their data within China. These services are subject to Chinese laws.
- **Services operated by Microsoft**: This option is for customers who prefer to use services that are managed and delivered by Microsoft. If new and existing customers purchase Azure, Microsoft Power Platform and Dynamics 365 apps, and Office by using an Enterprise Agreement, Microsoft 365 and/or Microsoft Power Platform and Dynamics 365 apps can co-exist on the tenant.

For information about how to provision environments, go to [Create and manage environments in the Power Platform admin center](./create-environment.md).

## Feature availability

The deployment of Microsoft Business Applications in each geography is based on the foundational principles of security, privacy, compliance, transparency, reliability, and in-country/region disaster recovery. Organizations get a complete cloud infrastructure and platform, and familiar productivity and business application tools. Customer data is stored at rest within the geography, except as noted in the [Trust Center](https://www.microsoft.com/trust-center/privacy/data-location).

Microsoft strives to maintain functional parity across our localized datacenter deployments. However, there are exceptions that are affected by dependent service availability, market priorities, or compliance regulations. These exceptions are indicated in the [Product and Feature Availability PDF document (download)](https://aka.ms/BAPfunctionalparityapac). The column labeled "China (21-V)" should help customers and partners understand and plan for successful implementation of their business application solutions. Microsoft continues to evaluate these services and capabilities for inclusion and updates in future releases.

## Enable server-side synchronization functionality for Exchange Online in China

To connect Dynamics 365 with your Exchange Online tenant in China and use server-side synchronization functionality, go to [Enable server-side synchronization functionality for Exchange Online in China](connect-exchange-online.md#enable-server-side-synchronization-functionality-for-exchange-online-in-china).

## Telemetry for model-driven apps

The following URL must be added to the allow list to ensure communication through firewalls and other security mechanisms for model-driven apps telemetry information:

https://browser.pipe.aria.microsoft.com

## Expansion and transition to "China 3" datacenters

Effective April 2023, current and future Business Applications customers who operate in China are poised to benefit greatly from the new Azure datacenters that are referred to as the Azure "China 3" Region. These cutting-edge datacenters provide enough capacity and robustness to sustain the ongoing expansion and demands of Business Applications in China. They also offer an opportunity to introduce capabilities and offerings that aren't currently available in the region. This development represents an exciting and promising advancement for the future of Business Applications in China.

Effective July 10, 2023, new [Power Platform environments with a Dataverse database](create-environment.md#create-an-environment-in-the-power-platform-admin-center) will be created in China 3. Then, throughout August and September 2023, the Microsoft product engineering teams will transition existing Power Platform Dataverse environments to China 3. There will be no changes to the environment IDs, organization IDs, tenant IDs, URLs, or URIs that are used to access Business Applications environments. There will also be no functionality impact.

As customer tenants are selected for transition, notifications will be distributed to the Microsoft 365 Message Center to notify administrators about this maintenance activity. Specifically, the notifications will indicate when the transition will occur for their environments. Transitions are expected to occur between 15:00 and 21:00 Coordinated Universal Time. Both non-production environments and production environments will be transitioned without customer involvement. However, a minor interruption in service communication is expected. This interruption should last less than 10 minutes.

### IP updates

Existing workloads aren't expected to require customer reconfiguration or updates. However, we understand that some of our customers apply firewall filters that are sensitive to recognizable IPs. In this case, the configurations must be reviewed to ensure that the IP ranges in the following downloadable JSON file are configured as trusted Azure operated by 21Vianet IP ranges:

[Download Azure IP Ranges and Service Tags – China Cloud from Official Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=57062)

In this JSON file, the Business Applications engineering team recommends a focused review of defined IP filtering that's related to the following tags:

- PowerPlatformInfra.ChinaEast3
- PowerPlatformInfra.ChinaNorth3
- PowerPlatformPlex.ChinaEast3
- PowerPlatformPlex.ChinaNorth3

In addition, we recommend that you evaluate other tags that have been referenced, to pinpoint IP filtering. During this evaluation, consider the ChinaEast3 and ChinaNorth3 variations of those service tags, if they exist. If a China3 variation doesn't exist in your current IP filter configurations, consider adding it to the IPs from that tag's list in the JSON file.

### Dynamics 365 Finance and Dynamics 365 Supply Chain Management

In the coming months, Microsoft will share details about the transition of Dynamics 365 Supply Chain Management and Dynamics 365 Finance workloads to the Azure China 3 Region. Our product engineering teams are currently working to minimize that downtime that users and automated processes will experience during these migrations to China 3. More details will be shared with customers to help them prepare for these migrations. For customers who also have an active Finance and Supply Chain Management project in Microsoft Dynamics Lifecycle Services, Microsoft won't transition Power Platform environments with a Dataverse database. Those transitions will occur through a migration of the Finance and Supply Chain Management Lifecycle Services project and related environments.

### Frequently asked questions

#### When we update our IP range filters, should we remove filters related to the China 2 datacenters?

No. Some Business Applications services might continue to serve workloads from the China 2 datacenters.

#### We have extended our solution to use our own Azure resources, such as API Hubs, Logic Apps, and Azure Storage. Do we have to coordinate this transition, and do we also have to move those workloads and resources to China 3 datacenters?

No. Because the URIs to the Business Applications platform aren't changing, this transition doesn't require a coordinated migration of a customer's Azure resources to the China 3 datacenters.

#### If our Azure resources are operating in China 2 datacenters, but our Power Platform environment with a Dataverse database and related Business Applications are migrated to China 3, will measurable latency be introduced into our application's performance?

Because these datacenters are connected through Azure's network backbone, we don't expect a measurable effect on communication latency. Customers can measure latency expectations through tools such as the [Azure Speed Test](https://www.azurespeed.com/Azure/Latency).

#### Do Business Applications that rely on a connection to my Azure resources require those resources to be in the same datacenter?

No.

#### Should we expect to experience downtime?

The transition will occur sometime during the maintenance window that will be published in advance through the Microsoft 365 Message Center. We expect a minor interruption in service communication. This interruption should last less than 10 minutes.

#### What is our escalation path if this transition isn't completed as expected?

Microsoft engineers will actively monitor the transition and will take action to mitigate any unforeseen circumstances that arise. Of course, we encourage our customers to raise a high-severity ticket through their established process whenever they must engage 21Vianet and Microsoft Support for urgent assistance. Our engineering team will be on high alert for those environments that are transitioning to the China 3 datacenters.

#### I created a new environment after April 17, 2023. However, we haven't updated our IP filters and therefore can't connect to our environment.

We encourage you to update your IP filters per the guidance earlier in this article. If this update can't be done in the timeframes that you require, follow your established support request procedure to raise a support ticket. The support engineers will follow an established procedure to manually provision your environment to China 2. This new environment will be transitioned when your tenant is scheduled for transition to China 3.

#### Who should I contact with additional questions?

Follow your established support request procedure to raise any additional questions that you have.

## Additional resources

- [Apps Operated by 21Vianet Support](21vianet-support.md)
- [Dynamics 365 Finance operated by 21Vianet](/dynamics365/unified-operations/dev-itpro/deployment/china-local-deployment)
- [Support site for 21Vianet (in Chinese)](https://www.21vbluecloud.com/Dynamics365/)
- [Privacy statement (Dynamics 365 隐私声明)](https://www.21vbluecloud.com/Dynamics365/d365-privacy/)
- [Service Level agreement(世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/Dynamics365/d365-sla/)
- [Legal information (Dynamics 365 法律信息)](https://www.21vbluecloud.com/Dynamics365/dynamics365-legal/)
- [Service terms for Lifecycle services](https://www.21vbluecloud.com/dynamics365/d365-landing/)
- [OSPT (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Azure Docs (in Chinese)](https://docs.azure.cn/zh-cn/)
- [Azure China 21Vianet](/azure/china/china-welcome)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
