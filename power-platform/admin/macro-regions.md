---
title: Power Platform and Dynamics 365 macro regions
description: Macro region represents the data residency boundary aligning with data residency laws for a given geography. Learn more about the countries available in a specific macro region.
author: shpradha
ms.component: pa-admin
ms.topic: concept-article
ms.collection: get-started
ms.date: 05/15/2026
ms.subservice: admin
ms.author: shpradha
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Macro region 
Macro region represents the data residency boundary aligning with data residency laws for a given geography. Learn more about the countries available in a specific macro region.
Macro region enhancement to environment provisioning enables customers to select a macro region during environment creation. This applies to public cloud only and is being introduced for tenants in the Canada region.

> [!Note]
> Macro region is enabled for the Canada region. Please visit this content to learn as more macro regions become available.

With macro region enabled for a region, customers select a macro region, such as North America, Europe, or Asia-Pacific instead of a specific geography (geo). The platform then automatically assigns the optimal geo within the selected macro region based on capacity, availability, and performance considerations. This approach helps ensure a more scalable, resilient, and performant experience for all customers while continuing to respect data residency commitments. The intelligent geo selection ensures environments are placed in regions with optimal capacity and health, improving uptime and responsiveness.

Using a macro region provides the following capabilities:
- As customer workloads grow, the platform dynamically places environments in geos best suited to handle demand at scale, without manual intervention.
- Customers no longer need to evaluate and select individual geos, simplifying environment creation while still maintaining regional control.
- Microsoft can continuously optimize backend infrastructure, ensuring customers benefit from ongoing investments in new regions, capacity, and resiliency.
- Customers still control where their data resides at a regional level, ensuring alignment with business, compliance, and regulatory requirements.

## Expected changes in your provisioning experience with a macro region 
- New tenants, not meeting high scale deployment criteria, select a macro region and won't explicitly choose a region (country) during environment creation. 
- Customer see their macro region and region in the environment properties and in the environment list. 
- Macro region is continental residency boundary, for example, the Europrean Untion Data Boudary (EUDB), while region represents the country fo deployment for clarity. 
- The system automatically determines the geo within that macro region geography using capacity-based routing. 
- Customers continue to see their data location (region) transparently after provisioning.
- Existing tenants remain unchanged and retain their current geo selection capabilities. 

| # | Macro region geography          | Countries                | Description                                               |
|---|---------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------------|
|1  |North America                    |United States, Canada                                                             | Your data resides within the United States or Canada.| 
|2  |The Americas                     |United States, Canada, Brazil | Your data resides within the Americas, including North and South America. |
|3  | European Union (EU)  and European Free Trade Association (EFTA)       |France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands      | Your data resides within EU and EFTA member states which are EUDB regions. | 
|4  |Europe and United Kingdom (UK)                      | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands | Your data resides within EU and EFTA or the UK and it should not be considered EUDB. |
|5  |Europe, UK, Middle East, Africa  | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy,  Ireland, Netherlands, South Africa, United Arab Emirates (UAE) | Your data resides within Europe, UK, Middle East, or Africa.|   
|6  |Asia-Pacific                     | Singapore, Australia*, India*, Japan, Korea                                           | Your data resides within the Asia Pacific region. |
 
\* Australia and India geographies have tax-restrictions and need data residency alignment and accountability for compliance with local tax reporting rules and for auditability within jurisdiction.

## High-scale deployment criteria
Customers who meet criteria continue to have the ability to select a specific geo (region) during environment creation. Qualifying criteria include any one of the following characterists:

-	[Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) is enabled for Microsoft 365 in this tenant.
-	High-scale deployments, such as 100 or more paid Dynamics 365 licenses or 1 TB or more of Dataverse storage. 
-	Premium Dynamics 365 workloads, such as Finance Premium or Supply Chain Premium with greater than or equal to 20 paid licenses.
-	High-scale premium Power Platform workloads, such as Power Apps or Power Automate has greater than or equal to 5000 paid licenses.
-	Specialized workloads, for example Contact Center. 

This criteria ensures customers with strict geo control requirements can continue operating with full flexibility.

As tenants mature and begin to meet one of the high-scale deployment criteria, the auto Upgrade Enablement feature enables the ability at the tenant-level to select a specific region during environment creation going forward. 

## Data residency and compliance
-	Data always resides within the selected macro region boundary. 
-	Where applicable, compliance constructs, such as the EUDB, are preserved and clearly communicated. 
-	The platform doesn't expand residency guarantees beyond contractual commitments. 

## Customer experience example
Assume that a customer selects **Europe and UK** as the macro region. The platform then assigns a geo, such as Germany or Italy, based on capacity and availability. The customer can view the assigned geo after provisioning.

If the customer requires explicit geo selection, such as France, they can qualify for premium criteria or engage with Microsoft support for exception handling. 

## Continuity for existing customers 
There is no impact to existing environments or tenants. Existing customers retain current geo selections and continue to have access to geo-based provisioning like they always have, ensuring a non-disruptive rollout while enabling a modern provisioning model for future environments.
  
## Related content
- [Advanced Data Residency](/microsoft-365/enterprise/advanced-data-residency)
- [Products by region](https://azure.microsoft.com/regions/services/)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
