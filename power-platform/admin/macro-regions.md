---
title: Power Platform and Dynamics 365 macro regions
description: Macro region represents the data residency boundary aligning with data residency laws for a given geography. Learn more about the countries available in a specific macro region.
author: shpradha
ms.component: pa-admin
ms.topic: concept-article
ms.collection: get-started
ms.date: 07/02/2026
ms.subservice: admin
ms.author: shpradha
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Power Platform and Dynamics 365 macro regions

A macro region geography represents the data residency boundary that aligns with data residency laws for a given geography. This article lists the regions available in a specific macro region geography.

The macro region enhancement to environment provisioning enables you to select a macro region geography during environment creation. This feature applies to public cloud only and is being rolled out globally. At this point it has been implemented for Canada, & Norway.

As an admin, you can select a macro region geography, such as North America, Europe, or Asia-Pacific instead of a specific [datacenter region](/power-platform/admin/new-datacenter-regions). The platform then automatically assigns the optimal [datacenter region](/power-platform/admin/new-datacenter-regions) within the selected macro region geography based on capacity, availability, and performance considerations. This approach helps ensure a more scalable, resilient, and performant experience for all customers while continuing to respect data residency commitments. The intelligent region selection ensures environments are placed in regions with optimal capacity and health, improving uptime and responsiveness.

Using a macro region geography provides the following capabilities:
- As your workloads grow, the platform dynamically places environments in geographies best suited to handle demand at scale, without manual intervention.
- You no longer need to evaluate and select individual [datacenter region](/power-platform/admin/new-datacenter-regions) , simplifying environment creation while still maintaining regional control and alignment with data residency laws.
- Microsoft can continuously optimize backend infrastructure, ensuring you benefit from ongoing investments in new regions, capacity, and resiliency.
- You still control where your data resides at a geography level, ensuring alignment with business, compliance, and regulatory requirements, example (EUDB)[https://learn.microsoft.com/en-us/privacy/eudb/eu-data-boundary-learn].

## Expected changes in your provisioning experience with a macro region

- When creating a new environment, if the tenant doesn't yet meet the [geo-selection eligibility](#geo-selection-eligibility-criteria) criteria, customers see the list of macro region geographies and individual datacenter regions are not displayed.
- Customers can see their macro region geography and data location (datacenter region) in the environment properties and in the environment list. 
- A macro region geography is a continental residency boundary, for example, the European Union Data Boundary (EUDB), while a region represents the country of deployment for clarity. 
- The system automatically determines the region within that macro region geography by using capacity-based routing, performance, and availability. 
- 

## Macro region geography

The following table describes each macro region.

| # | Macro region geography          | Regions                 | Description                                               |
|---|---------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------------|
|1  |North America                    |United States, Canada                                                             | Your data resides within the United States or Canada.| 
|2  |The Americas                     |United States, Canada, Brazil | Your data resides within the Americas, including North and South America. |
|3  | European Union (EU)  and European Free Trade Association (EFTA)       |France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands      | Your data resides within EU and EFTA member states which are European Union Data Boundary (EUDB) regions. | 
|4  |Europe and United Kingdom (UK)                      | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands | Your data resides within EU and EFTA or the UK and it shouldn't be considered EUDB. |
|5  |Europe, UK, Middle East, Africa  | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy,  Ireland, Netherlands, South Africa, United Arab Emirates (UAE) | Your data resides within Europe, UK, Middle East, or Africa.|   
|6  |Asia-Pacific                     | Singapore, Australia*, India*, Japan, South Korea                                           | Your data resides within the Asia-Pacific region. |
 
\* Australia and India geographies have tax restrictions and need data residency alignment and accountability for compliance with local tax reporting rules and for auditability within jurisdiction.

> [!NOTE]
> Sovereign clouds like the Government Community Cloud (GCC), Government Community Cloud - High (GCC-H), and Department of Defense (DoD) aren't supported.

## Geo-selection eligibility criteria

Customers who meet the following criterion can select a specific [datacenter region](/power-platform/admin/new-datacenter-regions) within a macro region geography when creating a new environment:

- [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) is enabled for all Microsoft 365 seats in this tenant.

This criterion ensures customers with residency requirements can continue operating with full flexibility. Note that the [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) (ADR) SKU applies only to Microsoft 365 and must be enabled for all Microsoft 365 seats in the tenant to qualify for Dynamics 365 and Power Platform geo-location access during new environment creation as well. ADR provides a contractual commitment that specified Microsoft 365 customer data is stored at rest only within the customer’s designated local country or region datacenters, aligned with product terms and country-specific availability.

## Data residency and compliance

-	Data always resides within the selected macro region geography boundary. 
-	Where applicable, compliance constructs, such as the EUDB, are preserved and clearly communicated. 
-	The platform doesn't expand residency guarantees beyond contractual commitments. 

## Customer experience example

- A customer selects “Europe & UK” as their Macro Region. 
- The platform assigns a region (e.g., Germany, or Italy) based on capacity & availability.  
- The customer can view the assigned datacenter region within the macro region geography after provisioning.  

If customer has [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) (ADR) SKU enabled for 100% of their M365 seats in that tenant:  

- This tenant qualifies for geo selection enablement on D365 and power Platform as well and will see list of Power Platform and Dynamics 365 datacenter regions to select from, during environment creation. 
- Learn more about [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) (ADR) if customer requires data center region selection ability for their usecase (e.g., France). 

## Continuity for Customers with existing environments  

As of the date of the announcement, Microsoft does not anticipate impacts to existing environments, which continue to have geo-based provisioning. These geo location settings are the result of technical [capacity, resources, performance, scale] constraints and could be subject to future adjustments to the extent that these are caused by circumstances beyond anyone's reasonable control.
  
## Related content

- [Advanced Data Residency](/microsoft-365/enterprise/advanced-data-residency)
- [Products by region](https://azure.microsoft.com/regions/services/)
- [Datacenter regions](new-datacenter-regions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
