---
title: "About Microsoft Cloud India  | MicrosoftDocs"
description: About Microsoft Cloud India
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/03/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About the Microsoft Cloud India datacenter

<a name="BKMK_NewCloud"></a>   
## New Microsoft Cloud Services in India  
  
### What is Microsoft announcing?  
 We’re announcing the general availability of customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), served from new datacenter regions in Pune and Chennai, joining [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)] and [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] in providing the trusted [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] in India.  
  
 Built on foundational principles of security, privacy and control, compliance, and transparency, the [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] delivers trusted cloud services to enable people and organizations to achieve more. Providing flexible platform and productivity solutions [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)], [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)], and now customer engagement apps, the local [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] is designed to fuel innovation and accelerate India’s digital transformation.  
  
### What is the benefit to customers?  
 The new local [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] enables data residency for customers in India, bringing enterprise-grade reliability and performance to regulated industries and other businesses. This includes data replication in multiple regions within India for business continuity, reduced network distance, and the option of a private connection to the cloud with [!INCLUDE[pn_azure_expressroute](../includes/pn-azure-expressroute.md)]. The [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] in India comes with the same deep commitment to high availability as our other regions, including a financially backed service level agreement of 99.9%.  
  
 For customer engagement apps, data residency means that most customer data will be kept within India, except for [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] data. For the definition of customer data and details on our data flow maps in Geo, see the [Microsoft Trust Center](https://go.microsoft.com/fwlink/p/?LinkID=393409).  
  
### Where are the Microsoft Cloud India regions?  
 The India Geo will consist of datacenters in Central India (Pune) and South India (Chennai).  
  
### How do I find what country or region my account is under?  
  
1. Sign in to [https://admin.microsoft.com](https://admin.microsoft.com).  
  
2. In the upper-right corner of the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] admin center menu bar, click your organization.  
  
   ![Choose your organization](media/data-center-choose-organization.png "Choose your organization")  
  
3. On the **Company profile** page, your account country/region is listed under **Country or region**.  
  
<a name="BKMK_Overview"></a>   
## Service overview  
  
### Will multi-geo environments be available to customers in India?  
 Yes, multi-geo environments will be supported for India as long as the tenant is provisioned in India. For customers not located in India who want to provision an environment within the India datacenter, they must first purchase a tenant for an organization located in India and then the tenant can be provisioned in India.  
  
 Availability of multi-geo environment support will be limited in the initial rollout to a fixed number of eligible customers. We'll continue to expand this capacity over time.  [Read more on how to create and edit multi-geo environments](https://docs.microsoft.com/dynamics365/admin/add-edit-multiregional-instances).  
  
### Will the standard service level agreements be offered?  
 Yes, the standard service level agreements (SLAs) will apply to the India regions, just as they do in our other regions around the world.  
  
> [!NOTE]
>  The SLA doesn't cover [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)].  
  
### Will Microsoft Dynamics Marketing, Social Engagement, and Parature be available in the India datacenters?  
 These services are available for purchase in India, however, these services are provisioned regionally at this time.  
  
### What is the customer experience if I use both Dynamics CRM Online from the India regions while using Microsoft Dynamics Marketing, Microsoft Social Engagement, and Parature from other regions?  
 The customer experience will be unchanged, the workloads for the other services will simply be provisioned from other regions.  
  
### When will ExpressRoute be available in India for customers, and through which partners?  
 [!INCLUDE[pn_expressroute](../includes/pn-expressroute.md)] is currently available in India. [View a current list of ExpressRoute locations and partners](https://azure.microsoft.com/documentation/articles/expressroute-locations/). [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] is currently working to enable customers to use [!INCLUDE[pn_expressroute](../includes/pn-expressroute.md)] with customer engagement apps from the India regions.  
  
### Where can I find more about security, data privacy, and compliance?  
 You can find more information at the  [Microsoft Trust Center](https://go.microsoft.com/fwlink/p/?LinkID=393409).  
  
### Where can I find out more about the physical infrastructure?  
 These services are hosted in the Microsoft cloud infrastructure comprising more than 100 globally distributed datacenters, edge computing nodes, and service operations centers. This infrastructure is supported by one of the world’s largest multi-terabit global networks, with an extensive dark fiber footprint that connects them all.  
  
 [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] provides cloud services to customers 24x7x365, and the [!INCLUDE[pn_microsoft_cloud](../includes/pn-microsoft-cloud.md)] Infrastructure and Operations team designs, builds, operates and helps secure every facet of the infrastructure. Since opening our first datacenter in 1989, we’ve invested more than $15 billion on our infrastructure and remain focused on delivering reliable, scalable, and secure online services.  
  
<a name="BKMK_Migration"></a>   
## Migration  
 You may request migration to the India datacenter by submitting a technical support request.  If you’re an existing customer with a billing address mapping to India, review the information in this topic to understand the move process.  
  
<a name="BKMK_RequestMove"></a>   
### How do I request my environment to be moved to India?  
 You can request a move to the new India datacenter by submitting a technical support request through the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] or by calling [!INCLUDE[pn_Microsoft_Support](../includes/pn-microsoft-support.md)]. Please select the Data Management topic and Data Center Migration Request sub-topic to ensure your request receives the best possible routing.  A support engineer will assist you in verifying required prerequisites and provide guidance throughout the move process.  
  
 ![Migration Process](media/migration-process.png "Migration Process")  
  
 *Customers will be required to go through more steps depending on the type of transition.  
  
### How will Microsoft engage with me on the migration?  
 Once you have been scheduled for migration, a member of the [!INCLUDE[pn_Microsoft_Support](../includes/pn-microsoft-support.md)] team will work directly with you to discuss scheduling and any other issues that may come up during the migration.  
  
### If I am scheduled for an update to CRM Online 2015 Update or CRM Online 2015 Update 1, will Microsoft apply the update at the same time as their migration to the India datacenter?  
 You must be updated to [!INCLUDE[pn_crm_online_2015_update](../includes/pn-crm-online-2015-update.md)] or later prior to migrating to the India datacenter.  Customers can schedule their update.  
  
### If I have both Microsoft 365 services and customer engagement apps, how will migration be handled?  
 The migration of each service will be handled separately. For customer engagement apps, you’ll be able to choose their migration date and time. [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] will work with you to schedule the migration. For [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] scheduling and migration, see [Moving core data to new Microsoft 365 datacenter geos](https://technet.microsoft.com/library/dn878163.aspx).  
  
### Can I move Microsoft 365 and customer engagement apps at the same time?  
 The move process for each service is handled separately. The move can be requested to coincide with the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] move.  
  
### If my content is stored in the India datacenters, can I access my content for work from locations outside of India?  
 Yes. If you're outside of India and sign in as an authenticated user, you'll be able to access the relevant data.  
  
<a name="BKMK_Licensing"></a>   
## Licensing and pricing  
  
### Will all versions of customer engagement apps be available?  
 Customers will be able to purchase all licenses that are currently available in the market today. Please see local availability at [Microsoft Dynamics CRM Solutions](https://www.microsoft.com/en-au/dynamics/crm-purchase-online.aspx). Global pricing can be found at [Microsoft Dynamics Pricing List](https://go.microsoft.com/fwlink/p/?LinkID=401462).  
  
### How will a customer who has an existing volume license agreement outside of India be billed if they add a new tenant to their agreement that resides in India?  
 The additional seats will be invoiced at the same rate on the customer’s invoice. The business desk will need to provide a multi-tenant amendment to provide an additional tenant in India.  
  
### If I started a trial outside of India and before general availability, will I be moved to the India datacenter after general availability?  
 No. Trials will remain in the geography where they were initiated. You may choose to start a new trial that will provision in the India datacenter.  
  
### If I choose to convert a trial to a paid subscription, where the trial was created in a geographic region outside of India prior to general availability, will my subscription tenant and environment be moved to the India datacenter?  
 No. If you choose to convert a trial that was created in a geographic region outside of India before general availability, your trial will be converted and billed in the geography where it was initiated. If the trial was originally deployed in India and converted to a paid subscription, it will continue to be deployed in India.  
  
### If a customer creates a trial in the India datacenter after general availability, will they be taxed for the trial?  
 No. Trials are free for 30 days.  
  
### See also  
 [Announcing the availability of Office 365 from local datacenters in India](https://blogs.office.com/2015/10/11/announcing-the-availability-of-office-365-from-local-datacenters-in-india/)   
 [New datacenter regions](new-datacenter-regions.md)
