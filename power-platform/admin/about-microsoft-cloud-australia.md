---
title: "About Microsoft Cloud Australia  | MicrosoftDocs"
description: About Microsoft Cloud Australia
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
# About the Microsoft Cloud Australia datacenter
 If you’re an existing Power Apps customer with a billing address mapping to a new data center region, review the information in this topic to understand the move process.  
  
<a name="BKMK_Expansion"></a>   
## Australia GEO expansion announcement  
  
### What is Microsoft announcing?  
The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), are currently available in 130 markets and 44 languages enabling us to sell side-by-side with [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] in the majority of the markets worldwide. With the inclusion of datacenters in Japan (recently announced) and Australia, both targeting Q1 CY2015, our global customers will be served by 17 datacenters covering 6 global regions around the world.   
  
 This marks an important step for customers and partners on our cloud journey to serve our customers in Australia, New Zealand, and Oceania (Australia GEO). By bringing customer engagement apps to the local region, we’ll be able to serve our customers more effectively and with better performance while also ensuring compliance with local requirements.  
  
### What prompted Microsoft to undertake this geographic expansion?  
 In order to better serve customer needs for data residency and reduced latency, we continually evaluate where we should expand availability around the world. We are committed to long-term investment in customer engagement apps and expansion over time.  
  
 This global expansion will enable us to deliver on the promise of increasing sales productivity while allowing our customers to sell effectively, market smarter, and provide care everywhere to offer amazing experiences to their customers.  
  
### What are the future geographic expansion plans for customer engagement apps?  
 Geographic expansion of customer engagement apps is a high priority and we’re constantly evaluating market needs. While we have no additional information or specifics on future plans to announce at this time, we will update if and when we have something to share.  
  
<a name="BKMK_Overview"></a>   

## Datacenter overview  
  
### Where are the datacenters located in the Australia Geo?  
 The Australia Geo will consist of datacenters in the Australia East Region (New South Wales) and the Australia Southeast Region (Victoria).  
  
### What does this announcement mean for customers in the Australia Geo?  
 [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] is committed to meeting the growing demand for reliable and connected devices and services for our customers around the globe. We have heard loud and clear that our customers in the Australia Geo need locally delivered services. The growth of customer engagement apps in the Australia Geo means we can better serve the needs of these customers in three ways:  
  
- Most customer data will be kept within Australia, except for [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] data*, helping customers meet data residency requirements.  
  
- Customers who deploy applications to the new Australia datacenters enjoy improved performance within the Australia Geo as network latency is reduced.  
  
- Our expansion in the Australia Geo also provides customers with the same level of high availability and redundancy as with our datacenters in other countries/regions. Customers in Australia, New Zealand, and Oceania will enjoy the benefit of a financially backed 99.9% service level agreement (SLA) and redundancy both inside of the primary datacenter where they are deployed as well as to the secondary datacenter in the Australia geography to help ensure ongoing uptime and protect against a major disaster in a single region.  
  
*The Australia Geo will be considered a separate Geo subject to the same data location commitments we make for other Geos. For the definition of customer data and details on our data flow maps in Geo, see the [Dynamics Trust Center](https://www.microsoft.com/dynamics/crm-trust-center.aspx).  
  
### What region will be used for replication of data for the Australia Geo?  
Services deployed in the Australia East Region will replicate data to the Australia Southeast Region and vice-versa.  
  
 For the Australia East and Southeast Region datacenters, access to provisioning resources in these datacenters is limited, as described here:  
  
- For Web Direct, access to the datacenters is based on the country/region set in your Microsoft Dataverse account.  
  
  - If the account country/region is Australia, New Zealand or Fiji, Dataverse resources will be provisioned in the Australia East and Southeast Region datacenters.  
  
  - If the account country/region is not Australia, New Zealand, or Fiji, the customer will not be able to provision services in the Australia East and Southeast Region datacenters. To do so a customer needs to try or purchase customer engagement apps (such as Dynamics 365 Sales and Customer Service) for an organization located in Australia, New Zealand or Fiji. The customer can create another Web direct account for organizations located in Australia, New Zealand and Fiji, with a billing address in any these regions, if they wish to select and deploy services in the Australia East and Southeast Region datacenters.  
  
- For Volume Licensing (VL) customers, access to the datacenters is based on the country/region in which the volume license agreement was signed.  
  
  - If the VL agreement was signed in Australia, New Zealand, or Fiji, the customer will be able to use services in the Australia East and Southeast region datacenters. Accounts added to the VL agreement will be enabled to use customer engagement apps in the Australia East and Southeast Region datacenters.  
  
  - VL customers can also create a secondary deployment in Australia, New Zealand, or Fiji under an existing VL agreement by either signing an enrollment in Australia, New Zealand, or Fiji or by applying for a multi-tenant amendment through the local Licensing Specialist.  
  
- Web direct and VL customers in Australia will still have the ability to deploy environments in datacenters outside of Australia – however, you must have a tenant already provisioned in Australia. Under this multi-tenant/multi-geo scenario, AU GST will still be applied to environments deployed in other regions.  
  
### How do I find what country or region my account is under?  
  
1. Sign in to [https://admin.microsoft.com](https://admin.microsoft.com).  
  
2. In the upper-right corner of [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], choose your organization.  
  
   ![Choose your organization](media/data-center-choose-organization.png "Choose your organization")  
  
3. On the **Company profile** page, your account country/region is listed under **Country or region**.  
  
<a name="BKMK_ServiceOverview"></a>   

## Service overview  
  
### Will multi-geo environments be available to customers in Australia?  
  
- Multi-geo environments will be supported for Australian customers as long as the tenant is first provisioned in Australia.  For customers who aren’t located in Australia but want to provision an environment within the Australia datacenter, they must first purchase a tenant for an organization located in Australia and then the tenant will be able to get provisioned in Australia.  
  
- Availability of multi-geo environment support will be limited in the initial rollout to a fixed number of eligible customers upon request, and we will continue to expand over time.  
  
### Will the standard SLA be offered at general availability launch?  
 Yes, on the date of general availability, the standard 99.9 % financially backed service level agreement (SLA) will apply, just as it does in our other regions around the world. Note: the SLA doesn’t cover [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)].  
  
### What rules govern New Zealand or Oceania customers who want to license affiliates located in Australia?  
 A New Zealand and Oceania customer may not place orders under its existing agreement for any affiliate located in Australia, nor grant any affiliate located in Australia administrative rights to manage subscriptions, if the customer elects to access and use services delivered from datacenters located in Australia. An affiliate located in Australia that wants to access and use Online Services delivered from our datacenters located in Australia must enter into its own subscription under its separate [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] Agreement.  
  
### Will Microsoft Dynamics Marketing, Social Engagement, and Parature be available in the Australia datacenters?  
 These services will be available for purchase in the local market but will be delivered outside of the Australia Datacenters at this time. Note: customer engagement apps leverage [!INCLUDE[pn_microsoft_azure_active_directory](../includes/pn-microsoft-azure-active-directory.md)] and Multi-Factor Authentication, which don’t offer a region choice to customers.  
  
### Will customer engagement apps be available on Azure Infrastructure as a Service (IaaS) in Australia?  
 At this time, customer engagement apps are only available for Dev/Test scenarios and isn’t supported for production use cases. Developers can leverage their MSDN subscription and [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] credits for dev/test scenarios. Note: we recently announced intent to support customer engagement apps on [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] IaaS but we’re dependent on [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Premium Storage availability in each geography. Azure’s Limited Public Preview will only be available in the U.S. and part of Europe.  
  
### Where can I find more about security, data privacy, and compliance?  
 The [Microsoft Dynamics 365 Trust Center](https://go.microsoft.com/fwlink/p/?LinkID=393409) will be updated as needed when the Australia Datacenters launch into general availability.  
  
### What app data be in Australia datacenters at general availability?  
 We’ll store all customer data, including backups, within the Australia Datacenter. For any [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] services that are running in conjunction with customer engagement apps those services will follow the data storage rules for [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)].  
  
### Will customer engagement apps be Information Security Registered Assessors Program (IRAP) certified when the datacenters are live in Australia?  
 We’re actively investigating [IRAP](https://www.asd.gov.au/infosec/irap/index.htm) requirements and how they relate specifically to customer engagement apps and we’ll share more information at a later date.  
  
### Where can I find out more about the physical infrastructure for customer engagement apps?  
 [Microsoft Cloud Infrastructure and Operations (MCIO)](https://go.microsoft.com/fwlink/p/?LinkID=528551) powers the Microsoft cloud services. MCIO focuses on smart growth, high reliability, operational excellence, cost-effectiveness, environmental sustainability, and a trustworthy online experience for customers and partners worldwide.  
  
 MCIO delivers the core infrastructure and foundational technologies for Microsoft's 200+ online businesses including [!INCLUDE[pn_bing](../includes/pn-bing.md)], [!INCLUDE[pn_outlook_com](../includes/pn-outlook-com.md)], [!INCLUDE[pn_msn](../includes/pn-msn.md)], [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)], [!INCLUDE[pn_xbox_live](../includes/pn-xbox-live.md)], and customer engagement apps. The infrastructure is comprised of a large global portfolio of datacenters, servers, content distribution networks, edge computing nodes, and fiber optic networks.  
  
<a name="BKMK_Migration"></a>   

## Migration  
  
### I have applications and data in an existing Microsoft datacenter. Will I be able to move those resources to the Australia datacenters?  
 For Web direct customers, if the account country/region is Australia, New Zealand, or Fiji, the customer will be eligible to have their environments moved to the Australia East and Southeast region datacenters.  
  
- The account country/region can be found in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
  1. Sign in to [https://admin.microsoft.com](https://admin.microsoft.com).  
  
  2. In the upper-right corner of [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], choose your organization.  
  
  ![Choose your organization](media/data-center-choose-organization.png "Choose your organization")  
  
  3.  On the **Company profile** page, your account country/region is listed under **Country or region**.  
  
- If the account country/region is outside Australia, New Zealand, or Fiji, you’ll need to create another Web direct account with a billing address in Australia, New Zealand, or Oceania. Once the new account and tenant are created, you can then request the move of their environment and data from other regions into the Australia region by contacting Support. For more information, see [How do I request my environment to be moved to the Australia datacenter?](about-microsoft-cloud-australia.md#BKMK_RequestMove) [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] reserves the right to make a unilateral decision to migrate accounts based on multiple conditions.  
  
  If you’re a volume license customer and the volume license agreement was signed in Australia, New Zealand, or Oceania, you’ll be eligible to move applications and data to the Australia East and Southeast region datacenters and deploy services there.  
  
- Accounts added to the volume license agreement are eligible to move applications and data to the Australia East and Southeast region datacenters and deploy services there.  
  
- To provision a tenant in the Australia datacenter, if you have a volume license enrollment outside the Australia datacenter you will need to sign an enrollment in Australia, New Zealand, or Oceania and then migrate existing environments to the Australia datacenter.  
  
- To move your tenants, environments, and data to the Australia regions, you should contact Support for additional information regarding migrating your environments. For more information, see [How do I request my environment to be moved to the Australia datacenter?](about-microsoft-cloud-australia.md#BKMK_RequestMove) [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] reserves the right to make a unilateral decision to migrate accounts based on multiple conditions.  
  
  For additional guidance regarding multiple tenants and multiple environments, see [Multiple online environments or tenants](https://docs.microsoft.com/dynamics365/admin/multiple-online-instances-tenants). 
  
<a name="BKMK_RequestMove"></a> 
  
### How do I request my environment to be moved to the Australia datacenter?  
 You can request a move to the new Australian datacenter by submitting a technical support incident through the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
1. Sign in to [https://admin.microsoft.com](https://admin.microsoft.com).  
  
2. Go to **Support** > **Service Requests** > **+**  
  
3. Choose **More** > **Dynamics 365 Online**  
  
4. For **Feature**, select **Data Management**. For **Symptom**, select **Data Center migration request**.  
  
5. Fill in the rest of the information to submit a service request.  
  
   A support engineer will assist you in verifying required prerequisites and provide guidance throughout the move process.  
  
### How will Microsoft engage with me on the migration?  
 Once you have been scheduled for migration, a member of the [!INCLUDE[pn_Microsoft_Support](../includes/pn-microsoft-support.md)] team will work directly with you to discuss scheduling and any other issues that may come up during the migration.  
  
### If I have both Microsoft 365 services and customer engagement apps, how will migration be handled?  
 The migration of each service will be handled separately. For customer engagement apps, you’ll be able to choose their migration date and time. [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] will work with you to schedule the migration. For [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] scheduling and migration, see [Moving core data to new Microsoft 365 datacenter geos](https://technet.microsoft.com/library/dn878163.aspx).  
  
### Can I move Microsoft 365 and customer engagement apps at the same time?  
 The move process for each service is handled separately but the move can be scheduled to coincide with the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] move if requested.  
  
<a name="BKMK_Pricing"></a>   

## Pricing and licensing  
  
### Will all versions of customer engagement apps be available?  
 Customers will be able to purchase all licenses that are currently available in market today. Please see local availability at [Microsoft Dynamics CRM Solutions](https://www.microsoft.com/en-au/dynamics/crm-purchase-online.aspx). Global pricing can be found at [Microsoft Dynamics Pricing List](https://go.microsoft.com/fwlink/p/?LinkID=401462)  
  
### How will a customer who has an existing volume license (VL) agreement outside of Australia be billed if they add a new tenant to their agreement that resides in Australia?  
 The additional seats will be invoiced at the same rate on the customer’s invoice. The business desk will need to provide a multi-tenant amendment to provide an additional tenant in Australia.  
  
### Will customers who purchase Dynamics CRM Online and an additional service such as Parature, Dynamics Marketing, or Microsoft Social Engagement be taxed differently per service?  
 [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] has a datacenter footprint that varies according to each online service offered. The customer engagement apps will be provisioned and available from datacenters located within Australia, which makes those services subject to some taxes that do not necessarily apply to tenants located and provisioned outside Australia. [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)] has their own datacenter footprint; they’re offered from to customers in Australia from datacenters outside of Australia. Therefore, these online services are subject to a different tax treatment.  
  
<a name="BKMK_Tax"></a>   
## Tax and billing  
  
### Will there be any changes on my bill?  
 New Zealand and Fiji customers will see no changes on their invoices.  
  
 For Australia customers, from the general availability date when services become available from [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] Australia datacenters, [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] will charge all Australian customers an additional amount equal to the Australian GST for services and will issue tax invoices. This change will occur because Australian GST is payable on taxable supplies of goods and services provided and offered in Australia.  
  
### My tenant has not moved to Australia datacenter, why am I being charged Australia Goods and Service Tax (GST)?  
 There are various factors that must be considered to determine whether GST is payable on the supply. Australian GST is payable on taxable supplies of goods and services provided and offered in Australia.  
  
<a name="BKMK_Trials"></a>   
## Trials  
  
### If I started a trial outside of Australia and before general availability, will I be moved to the Australia datacenter after general availability?  
 No. Trials will remain in the geography where they were initiated. You may choose to start a new trial that would be provisioned in the Australia datacenter.  
  
### If I choose to convert a trial to a paid subscription, where the trial was created in a geographic region outside of Australia prior to general availability, will my subscription tenant and environment be moved to the Australia datacenter?  
 No. If you choose to convert a trial that was created in a geographic region outside of Australia before general availability, your trial will be converted and billed in the geography where it was initiated. Australia GST does not apply.  
  
 If the trial was originally deployed in Australia and converted to a paid subscription, you’ll charged Australia GST.  
  
 If you decide you want your environment to be in the Australia datacenter, you’ll need to follow the migration steps outlined previously. Once you’re moved to Australia, the appropriate billing and tax will be applied.  
  
### If a customer creates a trial in the Australia datacenter after general availability, will they be taxed for the trial?  
 No. Trials are free for 30 days.  
  
### Can I create a trial in the Australia datacenter before general availability?  
 No. You can’t create a trial or move a production environment before general availability.  
  
### See also  
 [Office 365 and Dynamics CRM Online now available from datacenters in Australia](https://blogs.office.com/2015/03/30/office-365-and-dynamics-crm-online-now-available-from-datacenters-in-australia/)    
 [New datacenter regions](new-datacenter-regions.md)
