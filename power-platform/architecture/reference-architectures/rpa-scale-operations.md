---
title: ​​Scale robotic process automation operations using Hosted RPA in Microsoft Power Automate for desktop​
description: Discover how Hosted RPA in Power Automate simplifies scaling RPA operations by eliminating static bot infrastructure challenges.
#customer intent: As a Power Platform user, I want to scale RPA operations using Hosted RPA in Power Automate so that I can reduce infrastructure management efforts.  
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/03/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - rranjit
  - jaypadimiti
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# ​​Scale robotic process automation operations using Hosted RPA in Microsoft Power Automate for desktop​ 

> [!TIP]
> The article provides an example scenario and visual representation of how to ​​scale RPA operations using Hosted RPA in Microsoft Power Automate for desktop​. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

Using the Hosted RPA (robotic process automation) feature, organizations can reduce the time and effort needed to procure, set up, operationalize, and maintain infrastructure for RPA automations. Static bot infrastructure can be challenging due to the need to provision, set up, and maintain the machines while ensuring maximum utilization by the RPA operations team. Cloud-based Microsoft Power Automate solves these issues with its Hosted RPA capability, enabling RPA practitioners to build, test, and run large-scale automations efficiently.



## Architecture diagram

:::image type="content" source="media/rpa-scale-operations/rpa-scale-operations.png" alt-text="Architecture diagram showing ​​how to scale RPA operations using Hosted RPA in Microsoft Power Automate for desktop." lightbox="media/rpa-scale-operations/rpa-scale-operations.png":::

<!-- awaiting larger image to be provided -->

## Workflow

1. **Azure Compute Gallery**: Identify the available Azure Compute Gallery, then create the VM Image Definition and Image Version mapped to a Custom VM Image Source.  
1. **Custom VM Image**: From the Custom VM Image Source, create the VM Image to serve as the baseline for Hosted RPA in Power Automate.  
1. **Hosted RPA**: Enable Hosted RPA in the Power Platform environment and assign the appropriate license to the environment.
1. **Hosted Machine Group**: Use the Power Automate portal to create a Hosted Machine Group and specify the maximum and committed number of bots for the group.
1. **Desktop Flow Connection**: Within the parent cloud flow, create a desktop flow connection pointing to the Hosted Machine Group as the target machine group.

## Use case details

Organizations that need to run RPA automations at scale, where workloads run on multiple machines, can use this architectural pattern to scale operations without pre-provisioning infrastructure. This approach lets RPA operations teams adapt to dynamic workloads with minimal effort.  

Consider these use cases:

- Processing end-of-quarters financial data, which typically requires multiple machines to handle high transaction volumes.  
- Processing high-priority daily work items in the work queue quickly to prevent SLA violations.
- Addressing a significant backlog of shipment orders in SAP during the holiday season by using Power Automate for desktop to automate user interface tasks.

## Components

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains Power Platform resources such as Power Automate [cloud flows](/power-automate/overview-cloud) and [desktop flows](/power-automate/desktop-flows/introduction).
- **Microsoft Azure**: Microsoft Azure resources like [Azure Compute Gallery](/azure/virtual-machines/azure-compute-gallery), VM image definition, VM image source, and [Virtual Networks](/azure/virtual-network/virtual-networks-overview) are used to create and share custom VM images in Power Automate portal.
- **Power Automate**: Power Automate implements the scheduled run and automation to produce the monthly account executive summary for each customer. Power Automate uses [virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities) to surface Fabric data using the [Microsoft Dataverse connector](/connectors/commondataserviceforapps/).

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design for resilience**: Hosted Machine Group ensures resilience by configuring maximum and committed bot numbers to process work items.

### Security

**Protect Hosted Machine Group secrets**: Use a secure vault like Azure Key Vault to manage and secure credentials for the Hosted Machine Group.

**Use credentials in Power Automate**: Switch from using a simple username and password to credentials in Power Automate to manage connection credentials more efficiently and prevent disruptions caused by unexpected password changes.

### Performance Efficiency

**Optimize infrastructure usage**: Evaluate the overall automation workload requirements and develop a strategy to maintain machine utilization within a Hosted Machine Group above a specified threshold, ensuring compliance with business SLA agreements.

### Experience Optimization

**Implement a consistent maintenance procedure**: To update the custom VM image used by the Hosted Machine Group, follow a standardized procedure that uses maintenance mode to indicate an ongoing update. Note that when the VM image is updated, all existing hosted bots complete their ongoing desktop flow runs before being reprovisioned with the new VM image.

## Next steps

Review [Hosted Machine Groups in Power Automate](/power-automate/desktop-flows/hosted-machine-groups) for details on how to get started with Hosted RPA in Microsoft Power Automate.

The following are the high-level steps to set up a solution architecture that uses Hosted RPA in Microsoft Power Automate:

1. Create Azure resources: Review [Create an Azure compute gallery in Azure and add an image](/power-automate/desktop-flows/hosted-machine-groups#create-an-azure-compute-gallery-in-azure-and-add-an-image) to create the required Azure resources and assign roles/permissions.
    - Azure Compute Gallery (ACG)
    - Image definition
    - Image version from VM image source 

1. Share the Azure Compute Gallery with Power Automate Hosted Machine Group service principal and makers.

1. Add a new VM image to Power Automate portal by pointing to the custom VM image listed in Azure Compute Gallery. Learn more in [Add a new custom VM image](/power-automate/desktop-flows/hosted-machine-groups#add-a-new-custom-vm-image).

1. Create a Hosted Machine Group. The Lakehouse contains the data you ingest into your Fabric workspace. Review [Create hosted machine groups](/power-automate/desktop-flows/hosted-machine-groups#create-hosted-machine-groups).

1. Configure the desktop flow connection in the parent cloud flow to use the Hosted Machine Group as the target machine group for the RPA automation.

1. Monitor your Power Automate RPA application. Track the performance of the Hosted Machine Group and your RPA automation by monitoring the machine run group and desktop flow runs sections in Power Automate portal.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Jay Padimiti](https://www.linkedin.com/in/jpadimiti/)**, Principal Program Manager

## Related resources

- [Introduction to the Power Automate hosted RPA](/power-automate/desktop-flows/hosted-rpa-overview)
- [Hosted machine groups limitations](/power-automate/desktop-flows/hosted-machine-groups#hosted-machine-groups-limitations)
- [Hosted RPA Best Practices and FAQ](/power-automate/desktop-flows/hosted-rpa-faq)
