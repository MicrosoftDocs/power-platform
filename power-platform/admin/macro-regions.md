---
title: Power Platform and Dynamics 365 macro region geography
description: Macro region represents the data residency boundary aligning with data residency laws for a given geography. Learn more about the regions available in a specific macro region geography.
author: shpradha
ms.component: pa-admin
ms.topic: concept-article
ms.collection: get-started
ms.date: 07/15/2026
ms.subservice: admin
ms.author: shpradha
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Power Platform and Dynamics 365 macro region geography

A macro region geography represents the data residency boundary that aligns with data residency laws for a given geography. This article lists the regions available in a specific macro region geography.

The macro region enhancement to environment provisioning enables you to select a macro region geography during environment creation. This feature applies to public cloud only and is rolling out globally. At this time, it’s available in select geographies.

As an admin, you can select a macro region geography, such as North America, Europe, or Asia-Pacific instead of a specific [datacenter region](/power-platform/admin/new-datacenter-regions). The platform then automatically assigns the optimal [datacenter region](/power-platform/admin/new-datacenter-regions) within the selected macro region geography based on capacity, availability, and performance considerations. This approach helps ensure a more scalable, resilient, and performant experience for all customers while continuing to respect data residency commitments. The intelligent region selection ensures environments are placed in regions with optimal capacity and health, improving uptime and responsiveness.

Using a macro region geography provides the following capabilities:

- As your workloads grow, the platform dynamically places environments in geographies best suited to handle demand at scale, without manual intervention.
- You no longer need to evaluate and select an individual [datacenter region](/power-platform/admin/new-datacenter-regions), simplifying environment creation while still maintaining regional control and alignment with data residency laws.
- Microsoft can continuously optimize backend infrastructure, ensuring you benefit from ongoing investments in new regions, capacity, and resiliency.
- You still control where your data resides at a geography level, ensuring alignment with business, compliance, and regulatory requirements, such as [EUDB](/privacy/eudb/eu-data-boundary-learn).

## Expected changes in your provisioning experience with a macro region geography

- When creating a new environment, if the tenant doesn't yet meet the [datacenter region selection eligibility criteria](#datacenter-region-selection-eligibility-criteria), you see the list of macro region geographies. The portal doesn't display individual datacenter regions.
- You can see your macro region geography and data location (datacenter region) in the environment properties and in the environment list. 
- A macro region geography is a continental residency boundary and could include one or more continents and geographies, such as Europe, UK, Middle East, and Africa, while a region represents the datacenter region of deployment. 
- The system automatically determines the region within that macro region geography by using capacity-based routing, performance, and availability. 

## Macro region geography

The following table describes each macro region geography:

| # | Macro region geography          | Regions                 | Description                                               |
|---|---------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------------|
|1  |North America                    |United States, Canada                                                             | Your data resides within the United States or Canada.| 
|2  |The Americas                     |United States, Canada, Brazil | Your data resides within the Americas, including North and South America. |
|3  | European Union (EU)  and European Free Trade Association (EFTA)       |France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands      | Your data resides within EU and EFTA member states which are European Union Data Boundary (EUDB) regions. | 
|4  |Europe and United Kingdom (UK)                      | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy, Ireland, Netherlands | Your data resides within EU and EFTA or the UK and it shouldn't be considered EUDB. |
|5  |Europe, UK, Middle East, Africa  | UK, France, Germany, Norway, Sweden, Switzerland, Poland, Italy,  Ireland, Netherlands, South Africa, United Arab Emirates (UAE) | Your data resides within Europe, UK, Middle East, or Africa and it shouldn't be considered EUDB.|   
|6  |Asia-Pacific                     | Singapore, Australia*, India*, Japan, South Korea                                           | Your data resides within the Asia-Pacific region. |
 
\* Australia and India geographies have tax restrictions and need data residency alignment and accountability for compliance with local tax reporting rules and for auditability within jurisdiction. If you're a customer who needs your data at rest to stay in Australia and India, you need to consider getting [advanced data residency](/microsoft-365/enterprise/advanced-data-residency) and are subject to other regulatory needs.

Please note:

- Macro region geography #1 is geared toward North America.
- Macro region geography #2 is geared toward folks in South America. 
- Macro region geography #3, European Union (EU) and European Free Trade Association (EFTA), is geared toward EUDB.  
- Macro region geography #4 specifically includes United Kingdom (UK) with Europe. Customers who want to be in EUDB should not pick #4.
- Macro region geography #5 is geared toward Middle East and Africa. Customers who want to be in EUDB should not pick #5. 
- Macro region geography #6 is geared toward Asia pacific.

> [!NOTE]
> Sovereign clouds like the Government Community Cloud (GCC), Government Community Cloud – High (GCC-H), and Department of Defense (DoD) remain unchanged and are excluded from macro region strategy.

## Datacenter region selection eligibility criteria

 To select a specific [datacenter region](/power-platform/admin/new-datacenter-regions) within a macro region geography when creating a new environment, enable:

- [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency) for all Microsoft 365 seats in your tenant.

The Advanced data residency (ADR) SKU applies only to Microsoft 365. To qualify for Dynamics 365 and Power Platform datacenter region access during new environment creation, enable it for all Microsoft 365 seats in the tenant.    

## Data residency and compliance

- Data always resides within the selected macro region geography boundary. If you're a customer who meets ADR criteria, your Dynamics 365 and Power Platform data is stored at rest within your selected datacenter region.  
- If you need EUDB, select the macro region, **European Union (EU) and European Free Trade Association (EFTA)**. This selection ensures your data at rest is in the EUDB boundary. Learn more about EUDB [here](/privacy/eudb/eu-data-boundary-learn#eu-data-boundary-countries-and-datacenter-locations).
- Australia and India geographies might be subject to tax restrictions and might need data residency alignment and accountability for compliance with local tax reporting rules and for auditability within a jurisdiction. To keep your data at rest in Australia and India, learn more about acquiring ADR to make an informed decision for your business.
- The platform doesn't expand residency guarantees beyond contractual commitments. Macro-region selection defines Microsoft's service-placement and data-residency boundary for the environment. Don't interpret macro-regions as legal, regulatory, tax, or compliance-defined areas, and don't view them as determinative of customer's obligations.
- [EUDB](/privacy/eudb/eu-data-boundary-learn#eu-data-boundary-countries-and-datacenter-locations) is a Microsoft contractual data-boundary commitment, not the same thing as a legal jurisdiction such as the EEA/GDPR perimeter. The current EUDB documentation describes EUDB as a geographically defined boundary within which Microsoft commits to store and process customer data and personal data for Microsoft enterprise online services, including Azure, Dynamics 365, Power Platform, and Microsoft 365, subject to documented exceptions.

## Data residency experience examples

If a customer **doesn't have** [advanced data residency](/microsoft-365/enterprise/advanced-data-residency)(ADR) turned on in the tenant:

1. The customer can see and can select from a list of **macro regions geographies** when they create an environment.
1. The customer selects *Europe & UK* as their macro region geography. 
1. The platform assigns a region (for example, Germany or Italy) based on capacity and availability.  
1. The customer can view the assigned datacenter region within the macro region geography after provisioning.  

If a customer **does have** [advanced data residency](/microsoft-365/enterprise/advanced-data-residency) (ADR) SKU turned on for 100% of their Microsoft 365 seats in that tenant, they qualify for datacenter region selection for Dynamics 365 and Power Platform:  

1. The customer can see and can select from a list of Power Platform and Dynamics 365 **datacenter regions** when they create an environment. Their selection ensures their data is stored at rest within the selected datacenter region.
1. The customer can view the assigned datacenter region after provisioning.  
  
If the customer doesn't have advanced data residency (ADR) and requires datacenter region selection (for example, France), they need to get the ADR SKU. To learn more, see [Advanced data residency](/microsoft-365/enterprise/advanced-data-residency). 

## Continuity for customers with existing environments  

As of the date of the announcement, Microsoft doesn't anticipate impacts to existing environments, which continue to retain the selected datacenter region.  This is subject to future adjustments due to technical [capacity, performance, compute] constraints and changing circumstances beyond reasonable control. 
  
## FAQ

#### How do you connect a Power Platform environment in one region to resources hosted in another region?

Create a virtual network (VNet) in the Power Platform environment's associated region and use [VNet peering](vnet-support-overview.md#how-can-a-power-platform-environment-in-one-region-connect-to-resources-hosted-in-another-region) to bridge to the separate-region VNet. 
Consider region-selection needs upfront if you have existing Azure VNets, private endpoints, or hub/spoke network topology.
  
- If you have ADR, you have full control on environment's datacenter region placement and get to create a VNet first.
- If you don't have ADR and don't intend to get ADR, provision the environment first and provision the VNet after.

#### Today, customers can allow list the regional URLs and IP ranges for their selected datacenter region. Without ADR, however, an Asia-Pacific environment can be assigned to any datacenter region within that macro region. In that case, must customers allow list every possible datacenter region in Asia-Pacific?

They can allow list the region assigned after provisioning.

#### What are the datacenter region placement considerations within a macro region?

A capacity- and availability-based algorithm selects the most suitable datacenter region during provisioning. This region serves as the default datacenter region for that macro region, for that tenant, for the foreseeable period of time. If capacity or other conditions become constrained, the algorithm makes an assessment and shifts provisioning of new environment for that tenant to another datacenter region within the macro region to maintain optimal performance.

For example, for a tenant, if the algorithm selects France as the datacenter region during the first environment creation for Europe & UK macro region, then subsequent environments provisioned for that tenant in Europe & UK macro region are also provisioned in France unless France experiences capacity or other constraints.

Let's take the example of a tenant t1, which decides to create one environment in each macro region. Say, in NAM, the new environment gets created in Canada. With this, Canada is registered as the affinity geo for NAM macro. Next environment in that macro will follow affinity and go to the same geo–-Canada. Now customer decides to create another environment in another macro region, say, The Americas. Let's say the new environment gets created in Brazil. With this, Brazil is now registered as the affinity geo for The Americas macro. So, if T1 continues to create an environment in every macro, the first environment created determines and sets the affinity geo for that macro.

Plan for the possibility that unforeseen circumstances might place environments created under a broad macro-region geography in different datacenter regions within that macro region. This placement can affect Azure network alignment, VNet integration design, latency expectations, and customer legal review. Consider getting ADR if you require deterministic datacenter region placement.

#### Can Dynamics 365 customers enable ADR on their tenants for any azure regions in the world? 

All Dynamics 365 and Power Platform customers located in any of the 17 datacenter regions are eligible to enable ADR for any of the 28 Go-Local regions. When you enable ADR, it makes a data-at-rest promise to keep your Microsoft 365 select workloads in the associated Go Local. The 17 Dynamics 365 datacenter regions have a perfect overlap with Microsoft 365 Go Locals. Please note, there are three Azure regions, Belgium, Finland, and Greece, that do not currently have a corresponding Go-Local region support and therefore cannot enable ADR for Microsoft 365 data at rest support. However, if the customer needs to enable ADR for Dynamics 365 data-at-rest geo-location access and data-at-rest commitment, please escalate to Dynamics 365 support for *Need ADR for unsupported Azure region for D365 macro region*.

#### If I don't have ADR, does this mean my test, dev, and production environments could be split into three different macro regions now? 

Once you attach to a datacenter region inside the selected macro region geography in the first provisioning, Microsoft follows the placement affinity logic to place them together. Microsoft reserves the right to react in unforeseen circumstances.  


#### Is ADR making a data-at-rest promise for the D365 datacenter region selected as geo location for my environment? I don't see D365 supported in D365 documentation? 

Please note, ADR is not making any data-at-rest commitments for Dynamics 365. ADR provides data-at-rest promise for select Microsoft 365 products to the associated Go-Local region.   

The data-at-rest promise for Dynamics 365/Power Platform is coming from the Dynamics 365/Power Platform product aligned with product terms. For all those Microsoft customers who already have ADR for Microsoft 365, they automatically qualify for Dynamics 365 data location access at environment creation, and the product term promise applies to keep customer's data at rest in the Dynamics 365/Power Platform datacenter region associated with the environment. If a customer buys ADR for 100% of Microsoft 365 seats in the tenant––Dynamics 365/Power Platform is making the data-at-rest commitment by allowing data center region access for geo location at environment creation and ensuring customer's data at rest will go to the selected data center region and stay there, aligned with product terms.

## Related content

- [Advanced Data Residency](/microsoft-365/enterprise/advanced-data-residency)
- [Products by region](https://azure.microsoft.com/regions/services/)
- [Datacenter regions](new-datacenter-regions.md)
