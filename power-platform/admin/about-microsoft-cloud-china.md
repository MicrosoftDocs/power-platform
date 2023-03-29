---
title: "Power Platform and Dynamics 365 apps operated by 21Vianet in China  | MicrosoftDocs"
description: Provides information about Power Platform and Dynamics 365 apps that are operated by 21Vianet in China. The Dyamics 365 apps include Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/23/2023
ms.subservice: admin
ms.author: sericks
ms.contributors:
- macarrer
- pvayner
- shailesn
---
# Power Platform and Dynamics 365 apps - operated by 21Vianet in China

Microsoft Power Platform and Dynamics 365 apps services operated by 21Vianet is designed to comply with regulatory requirements in China. The services are a physically separated environment of cloud services operated and transacted currently by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in mainland China.

## Provisioning

Customers in China have two options from which to select how they want to access Power Platform and Dynamics 365 apps.

- **Services operated by 21Vianet in China**: 21Vianet operates and offers Power Platform and Dynamics 365 services in China. This option provides a consistent Power Platform and Dynamics 365 apps experience that is the same as global offerings. This option also meets the demands of customers who prefer to use online services provided by a local company that stores their data within China. These services are subject to Chinese laws.

- **Services operated by Microsoft**: This option is for customers that prefer to use services managed and delivered by Microsoft. For all new customers and existing customers, if the customer purchases Microsoft Azure, Power Platform and Dynamics 365 apps, and Office using an Enterprise Agreement, Microsoft 365 and/or Power Platform and Dynamics 365 apps can co-exist on the tenant. 

For information on provisioning environments, see [Create and manage environments in the Power Platform admin center](./create-environment.md).

## Feature availability

The deployment of business applications in each geography is built on the foundational principles of security, privacy, compliance, transparency, reliability, and in-country disaster recovery, offering organizations a complete cloud infrastructure and platform, as well as familiar productivity and business application tools. This means that customer data is stored at rest within the geography, except as noted in the [Trust Center](https://www.microsoft.com/trust-center/privacy/data-location). 

Microsoft strives to maintain functional parity across our localized data center deployments. However, there are exceptions affected by dependent service availability, market priorities, or compliance regulations. These exceptions are indicated through the [Product and Feature Availability PDF document (download)](https://aka.ms/BAPfunctionalparityapac); refer to the column labeled China (21-V) to help customers and partners understand and plan for successful implementation of their business application solutions. Microsoft continues to evaluate these services and capabilities for inclusion and updates in future releases. 

## Enable server-side synchronization functionality for Exchange Online in China

To connect Dynamics 365 with your Exchange Online tenant in China and use server-side synchronization functionality, see [Enable server-side synchronization functionality for Exchange Online in China](connect-exchange-online.md#enable-server-side-synchronization-functionality-for-exchange-online-in-china).

## Expansion and Transition to “China 3” Datacenters

Beginning in April, 2023, current and future Microsoft Business Applications customers operating in China are poised to greatly benefit from the new Microsoft Azure datacenters referred to as the Microsoft Azure “China 3” Region. 

These cutting-edge datacenters provide the necessary capacity and robustness to sustain the ongoing expansion and demand of Business Applications in China, and offer the opportunity to introduce new capabilities and offerings that are currently not available in the region. This development represents an exciting and promising advancement for the future of Business Applications in China.

As of April 17, 2023, new [Power Platform environments with Dataverse database](create-environment.md#create-an-environment-in-the-power-platform-admin-center) will be created in China 3. Subsequently, throughout April, May, June, July, and August 2023, the Microsoft product engineering teams will transition existing Power Platform Dataverse to Microsoft Azure China 3.  There will be no changes to the Environment IDs, Org IDs, Tenant IDs, URLs or URIs used to access Business Applications Environments, nor will there be any functionality impact. 

As customer tenants are selected for transition, notifications will be distributed to the Microsoft 365 Message Center notifying administrators of this maintenance activity, specifically indicating when this will take place for their environments. It is expected this will take place between 15:00 UTC and 21:00 UTC. Both non-production and production environments will be transitioned without customer involvement; but is expected to cause a minor service communication interruption lasting less than 10 minutes.

### IP updates
Existing workloads are not expected to require customer reconfiguration or updates. However, we understand that some of our customers apply firewall filters sensitive to recognizable IPs.  In these situations, a review of these configurations is required to ensure the following IP ranges are configured as trusted Microsoft Azure, operated by 21 Vianet, IP ranges:

[Download Azure IP Ranges and Service Tags – China Cloud from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/confirmation.aspx?id=57062)

Within the JSON file linked through Download Center, above, the Business Applications engineering team suggests a focused review on defined IP filtering related to the following tags:
- PowerPlatformInfra.ChinaEast3
- PowerPlatformInfra.ChinaNorth3
- PowerPlatformPlex.ChinaEast3
- PowerPlatformPlex.ChinaNorth3

Further, we encourage an evaluation of other tags that have been referenced to pinpoint IP filtering. With that, consider the ChinaEast3 and ChinaNorth3 variations of those service tags, if they exist.  If a China3 variation does not exist in your current IP filter configurations, consider adding them to the IPs from that tag’s list that are present in this file.

### Dynamics 365 Finance and Supply Chain Management
In the coming months, Microsoft will also share details about the transition of Dynamics 365 Supply Chain Management and Dynamics 365 Finance workloads to China 3.  Our product engineering teams are in the process of minimizing downtime that users and automated processes will experience with these migrations to the China 3 Region.  As such, more details will be shared to work with and prepare customers for these migrations. Microsoft won't transition Power Platform environments with Dataverse database for customers that also have an active Dynamics 365 Finance and Supply Chain Management Lifecycle Services (LCS) project. These transitions will take place with a migration of the Dynamics 365 Finance and Supply Chain Management LCS project and related environments.

### Frequently asked questions

#### When updating our IP range filters, should we remove those related to the China 2 datacenters?
No. There may be some Business Application services continuing to serve workloads from the China 2 datacenters.

#### We have extended our solution to leverage our own Azure resources, such as API Hubs, Logic Apps, and Azure Storage. Do we need to coordinate this transition and also move those workloads and resources to China 3 datacenters?
No.  As the URIs to the Business Applications platform are not changing, this transition does not necessitate a coordinate migration of a customer’s Azure resources to the China 3 datacenters.

#### If our Azure resources are operating in China 2 datacenters, but our Power Platform environment with a Dataverse database and related Business Applications are migrated to China 3, will this introduce measurable latency in our application’s performance? 
As these datacenters are connected through Microsoft Azure’s network backbone, we do not expect there to be a measurable effect on communication latency. Customers can measure latency expectations through tools such as the [Azure Speed Test](https://www.azurespeed.com/Azure/Latency).

#### Do Business Applications that rely upon connection to my Azure resources, require that they are located in the same datacenter?
No

#### Should we expect to experience downtime?
This will take place sometime during the maintenance window, which will be published in advance through the Microsoft 365 Message Center. We expect a minor, service communication interruption lasting less than 10 minutes.

#### What is our escalation path should this transition not complete, as expected?
Microsoft engineers will be actively monitoring this transition and will take actions to mitigate unforeseen circumstances, should they present themselves. Of course, we encourage our customers to raise a high severity ticket through their established processes whenever there is a need to engage 21-V and Microsoft support for urgent assistance.  Our engineering team will be on high alert for those environments that are executing the transition to the China 3 datacenters.  

#### I have created a new environment after April 17, 2023. However, we have not updated our IP filters and, thus, are unable to connect to our environment.
We encourage you to update your IP filters per the guidance above. If this is not possible in the timeframes you require, please follow your established support request procedure to raise a support ticket. The support engineers will work to follow an established procedure to manually provision your environment to China 2. This new environment will be transitioned when your tenant is scheduled for transition into China 3.

#### Who should I contact with additional questions?
Please follow your established support request procedure to raise additional questions that you may have.

## Additional resources
- [Apps Operated by 21Vianet Support](21vianet-support.md)
- [Dynamics 365 Finance operated by 21Vianet](/dynamics365/unified-operations/dev-itpro/deployment/china-local-deployment)
- [Support site for 21Vianet (in Chinese)](https://www.21vbluecloud.com/Dynamics365/)
- [Privacy statement (Dynamics 365 隐私声明)](https://www.21vbluecloud.com/Dynamics365/d365-privacy/)
- [Service Level agreement(世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/Dynamics365/d365-sla/)
- [Legal information	(Dynamics 365 法律信息)](https://www.21vbluecloud.com/Dynamics365/dynamics365-legal/)
- [Service terms for Lifecycle services](https://www.21vbluecloud.com/dynamics365/d365-landing/)
- [OSPT (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Azure Docs (in Chinese)](https://docs.azure.cn/zh-cn/)
- [Azure China 21Vianet](/azure/china/china-welcome)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
