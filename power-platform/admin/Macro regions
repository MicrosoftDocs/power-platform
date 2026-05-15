---
title: Power Platform and Dynamics 365 macro regions
description: Provides information about Power Platform and Dynamics 365 apps hosted in datacenters across many regions. Find a list of regions and URLs, plus how to migrate to a new datacenter.
author: shpradha
ms.component: pa-admin
ms.topic: concept-article
ms.collection: get-started
ms.date: 05/14/2026
ms.subservice: admin
ms.author: shpradha
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Macro region 
Macro region represents the data residency boundary aligning with data residency laws for the given geography. Learn more about the countries available in a specific macro region.
Macro region enhancement to environment provisioning enables customers to select a Macro Region during environment creation. This applies to public cloud only and is being introduced for tenants in Canada region only

With Macro region enabled for a region:
•	Customers will select a Macro Region (e.g., North America, Europe, Asia-Pacific) instead of a specific geography (geo).
•	The platform will automatically assign the optimal geo within the selected Macro Region based on capacity, availability, and performance considerations. 
This approach helps ensure a more scalable, resilient, and performant experience for all customers while continuing to respect data residency commitments.
Improved Performance and Reliability
•	Intelligent geo selection ensures environments are placed in regions with optimal capacity and health, improving uptime and responsiveness.
Better Scalability for Growth
•	As customer workloads grow, the platform dynamically places environments in geos best suited to handle demand at scale, without manual intervention.
Reduced Provisioning Friction
•	Customers no longer need to evaluate and select individual geos—simplifying environment creation while still maintaining regional control.
Future-Ready Infrastructure
•	Enables Microsoft to continuously optimize backend infrastructure, ensuring customers benefit from ongoing investments in new regions, capacity, and resiliency.
Consistent Regional Data Boundaries
•	Customers still control where their data resides at a regional level, ensuring alignment with business, compliance, and regulatory requirements.

##Expected changes in your provisioning experience with Macro region 
Kindly Note: Macro region is enabled for Canada region. Please visit this section to learn as more Macro regions become available.

•	New tenants (not meeting high scale deployment criteria) select a Macro Region and will not explicitly choose a region(country) during environment creation. 
•	Customer will see their Macro region and region in the environment properties and in the environment list. 
•	Macro region is continental residency boundary for e.g. EUDB while region represents country fo deployment for clarity. 
•	The system will automatically determine the geo within that Macro Region geography using capacity-based routing. 
•	Customers will continue to see their data location (region) transparently after provisioning.
•	Existing tenants remain unchanged and retain their current geo selection capabilities. 

| # | Macro region geography          | Countries                | Description                                               |
|---|---------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------------|
|1  |North America                    |United States, Canada                                                             | Your data resides within the United States or Canada.| 
|2  |The Americas                     |United States, Canada, Brazil | Your data resides within the Americas, including North and South America. |
|3  | European Union (EU)  and European Free Trade Association (EFTA)       |France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands      | Your data resides within EU and EFTA member states which are European Union Data Boundary (EUDB) regions. | 
|4  |Europe and United Kingdom (UK)                      | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands | Your data resides within EU and EFTA or the United Kingdom and it should not be considered EUDB. |
|5  |Europe, UK, Middle East, Africa  | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy,  Ireland, Netherlands, South Africa, United Arab Emirates (UAE) | Your data resides within Europe, UK, Middle East, or Africa.|   
|6  |Asia-Pacific                     | Singapore, Australia*, India*, Japan, Korea                                           | Your data resides within the Asia Pacific region. |
 
\* Australia and India geographies have tax-restrictions and need data residency alignment and accountability for compliance with local tax reporting rules and for auditability within jurisdiction.

##High scale deployment criteria
Customers who meet criteria will continue to have the ability to select a specific geo(region) during environment creation. Qualifying criteria include (any one of the following):
•	If customer had Advanced data residency(Advanced data residency in Microsoft 365 - Microsoft 365 Enterprise | Microsoft Learn)  enabled for M365 in this tenant.
•	High-scale deployments (100+ paid D365 licenses or 1 TB+ Dataverse storage) 
•	Premium Dynamics 365 workloads (Finance Premium or Supply Chain Premium with ≥20 paid licenses) 
•	High-scale Premium Power Platform workloads (Power Apps or Power Automate >= 5000 paid licenses)
•	Specialized workloads (e.g., Contact Center) 
This ensures customers with strict geo control requirements can continue operating with full flexibility.

As tenants mature and begin to meet one of the high scale deployment criteria, the auto Upgrade Enablement feature will enable the ability at tenant level to select a specific region during environment creation goin forward. 

##Data Residency & Compliance
•	Data will always reside within the selected Macro Region boundary. 
•	Where applicable, compliance constructs such as EU Data Boundary (EUDB) are preserved and clearly communicated. 
•	The platform does not expand residency guarantees beyond contractual commitments. 

##Customer Experience Example
•	A customer selects “Europe & UK” as their Macro Region.
•	The platform assigns a geo (e.g., Germany, or Italy) based on capacity & availability. 
•	The customer can view the assigned geo after provisioning.
•	If the customer requires explicit geo selection (e.g., France), they can: 
  o	Qualify for premium criteria, or
  o	Engage Microsoft support for exception handling. 

##Continuity for Existing Customers 
There is no impact to existing environments or tenants. Existing customers retain current geo selections and continue to have access to geo-based provisioning like they always have, ensuring a non-disruptive rollout while enabling a modern provisioning model for future environments.

  
### See also  
 [Advanced Data Residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/advanced-data-residency?view=o365-worldwide)
 [Products by region](https://azure.microsoft.com/regions/services/)   



[!INCLUDE[footer-include](../includes/footer-banner.md)]
