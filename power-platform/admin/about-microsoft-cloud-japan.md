---
title: "About Microsoft Cloud Japan  | MicrosoftDocs"
description: About Microsoft Cloud Japan
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
# About the Microsoft Cloud Japan datacenter

 If you’re an existing customer with a billing address mapping to a new data center region, review the information in this topic to understand the move process:  
  
<a name="BKMK_Expansion"></a>   
## Japan GEO expansion announcement  
  
### What is Microsoft announcing?  
The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), are now available as a service within the Japan datacenters.  
  
 In addition, customer engagement apps are currently available in 130 markets and 44 languages enabling us to sell side-by-side with [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] in the majority of the markets worldwide. With the inclusion of Japan, our global customers will now be served from datacenters in 5 global regions around the world.  
  
 This marks an important step for on our cloud journey to serve our customers and partners in Japan (Japan GEO). By bringing customer engagement apps to the local region we will be able to serve our customers more effectively and with better performance while also ensuring compliance with local requirements.  
  
### What prompted Microsoft to undertake this geographic expansion?  
 In order to better serve customer needs for data residency and reduced latency, we continually evaluate where we should expand availability around the world. We are committed to long-term investment in customer engagement apps and expansion over time.  
  
Customer engagement apps (such as Dynamics 365 Sales and Customer Service), are currently available in 130 markets and 44 languages enabling us to sell side-by-side with Office365 in the majority of the markets around the globe.  
  
 This global expansion will enable us to deliver on the promise of increasing sales productivity while allowing our customers to sell effectively, market smarter, and provide care everywhere to offer amazing experiences to their customers.  
  
### What are the future geographic expansion plans?  
 Geographic expansion is a high priority and we’re constantly evaluating market needs. While we have no additional information or specifics on future plans to announce at this time, we will update if and when we have something to share.  
  
<a name="BKMK_Overview"></a>   
## Datacenter overview  
  
### Where are the datacenters located in the Japan Geo?  
 The Japan Geo will consist of datacenters in the Japan East and Japan West.  
  
### Will the standard SLA be offered at general availability launch?  
 Yes, on the date of general availability, the standard 99.9% financially backed SLA will apply, just as it does in our other regions around the world. Note: the SLA does not cover [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)].  
  
### Do existing customers have the choice to keep their service from being moved to the Japan Datacenters?  
 Existing customers will remain in the datacenters where they are currently deployed unless they request to be moved. [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] reserves the right to make a unilateral decision to migrate accounts based on multiple conditions. All new customers purchasing customer engagement apps (such as Dynamics 365 Sales and Customer Service), in Japan will be provisioned within the Japan datacenter.  
  
<a name="BKMK_RequestMove"></a>   
### How do I request my environment to be moved to the Japan datacenter?  
 You can request a move to the new Japan datacenter by submitting a technical support incident through the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
1.  Sign in to [https://admin.microsoft.com](https://admin.microsoft.com).  
  
2.  Go to **Support** > **Service Requests** > **+**  
  
3.  Choose **More** > **Dynamics 365 Online**  
  
4.  For **Feature**, select **Data Management**. For **Symptom**, select **Data Center migration request**.  
  
5.  Fill in the rest of the information to submit a service request.  
  
A support engineer will assist you in verifying required prerequisites and provide guidance throughout the move process.  
  
### How will Microsoft engage with me on the migration?  
 Once you have been scheduled for migration, a member of the [!INCLUDE[pn_Microsoft_Support](../includes/pn-microsoft-support.md)] team will work directly with you to discuss scheduling and any other issues that may come up during the migration.  
  
### If I am scheduled for an update to [!INCLUDE[pn_crm_online_2015_update](../includes/pn-crm-online-2015-update.md)] or [!INCLUDE[pn_crm_online_2015_update_1_shortest](../includes/pn-crm-online-2015-update-1-shortest.md)], will Microsoft apply the update at the same time as their migration to the Japan datacenter?  
 You must be updated to [!INCLUDE[pn_crm_online_2015_update](../includes/pn-crm-online-2015-update.md)] or later before migrating to the Japan datacenter.  Customers can schedule their update.  
  
### If I have both Microsoft 365 services and customer engagement apps, how will migration be handled?  
 The move of each service will be handled separately and customers will be fully supported even if one service has been moved and the other has not. Customers will be able to choose their move date and time. [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] will work with the customer to schedule the move. For [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)], customers will be notified through the message center about the move timeline, but the large number of existing customers means that individual scheduling is not possible. For [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] scheduling and migration, see [Moving core data to new Microsoft 365 datacenter geos](https://technet.microsoft.com/library/dn878163.aspx).  
  
### Can I move Microsoft 365 and customer engagement apps at the same time?  
 The move process for each service is handled separately, but the  move can be scheduled to coincide with the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] move if requested.  
  
### Will multi-geo environments be available to customers in Japan?  
 Multi-geo environments will be supported for Japan. Availability of multi-geo environment support will be limited in the initial rollout to a fixed number of eligible customers upon request, and we’ll continue to expand over time.  
  
 For additional guidance regarding multiple tenants and multiple environments, see [Multiple online environments or tenants](https://docs.microsoft.com/dynamics365/admin/multiple-online-instances-tenants). This link will be updated with the [!INCLUDE[pn_crm_online_2015_update](../includes/pn-crm-online-2015-update.md)] launch.  
  
### How will this affect users or partners?  
 Regardless of where customer engagement apps are provisioned, you’ll have the ability to determine which of your users will have access to those services based on how you configure customer engagement apps.  
  
### Will customer engagement apps be available on Azure Infrastructure as a Service (IaaS) in Japan?  
 At this time customer engagement apps are only available for dev/test scenarios and isn’t supported for production use cases.  Developers can leverage their MSDN subscription and [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] credits for dev/test scenarios. Note: we recently announced intent to support customer engagement apps on [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] IaaS but we are dependent on [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Premium Storage availability being available in each geographic region. Azure’s Limited Public Preview will only be available in the U.S. and part of Europe. We do not have any additional information regarding other geos or general availability at this time.  
  
### Where can I find more about security, data privacy, and compliance?  
 The Trust Center will be updated as needed when the Japan datacenters launch into general availability. To see the current version of the Trust Center, see: [Microsoft Trust Center](https://go.microsoft.com/fwlink/p/?LinkID=393409).  

### Will Microsoft Dynamics Marketing, Social Engagement, and Parature, from Microsoft be available in the Japan datacenters?  
 These services will be available for purchase in the local market but will be delivered outside of the Japan datacenters at this time. Note: customer engagement apps leverages [!INCLUDE[pn_microsoft_azure_active_directory](../includes/pn-microsoft-azure-active-directory.md)] and Multi-Factor Authentication, which don’t offer a region choice to customers.  
  
<a name="BKMK_Pricing"></a>   
## Pricing  
  
### How will billing be handled for customers whose environments are moved from an existing tenant located outside of Japan to a new tenant in Japan?  
 Billing is related to the country/region where the customer signs up for the Microsoft Dataverse service, not where the service is deployed.  
  
### Will all versions be available?  
 You’ll be able to purchase all licenses that are currently available in the market today. For more information, see: [Pricing List](https://go.microsoft.com/fwlink/p/?LinkID=401462).  
  
### See also  
 [Office 365 now available from datacenters in Japan](https://blogs.office.com/2014/12/15/office-365-now-available-datacenters-japan/)   
 [New datacenter regions](new-datacenter-regions.md)
