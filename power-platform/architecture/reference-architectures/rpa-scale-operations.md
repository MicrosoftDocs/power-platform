---
title: ​​Scale RPA (Robotic Process Automation) Operations using Hosted RPA in Microsoft Power Automate for desktop​ 
description: Learn to ​scale RPA (Robotic Process Automation) Operations using Hosted RPA in Microsoft Power Automate for desktop​.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/22/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - rranjit
  - jaypadimiti
search.audienceType:
  - admin
  - flowmaker
---

# ​​Scale RPA (Robotic Process Automation) Operations using Hosted RPA in Microsoft Power Automate for desktop​ 

Using the Hosted RPA (Robotic Process Automation) feature, organizations can decrease the time and effort required for procuring, provisioning, operationalizing, and maintaining infrastructure to support RPA automations. Static BOT infrastructure can be challenging due to the need to provision, set up, and maintain the machines while ensuring maximum utilization by the RPA operations team. Cloud-based Microsoft Power Automate offers a solution to these issues with its Hosted RPA capability, enabling RPA practitioners to build, test, and run large-scale automations efficiently.

> [!TIP]
> The article provides an example scenario and visual representation of how to ​​scale RPA Operations using Hosted RPA in Microsoft Power Automate for desktop​. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/rpa-scale-operations/rpa-scale-operations.png" alt-text="Diagram showing ​​how to scale RPA Operations using Hosted RPA in Microsoft Power Automate for desktop." lightbox="media/rpa-scale-operations/rpa-scale-operations.pn":::

## Workflow

1. **Azure Compute Gallery** – After identifying available Azure Compute Gallery, create the VM Image Definition and Image Version mapped to a Custom VM Image Source.  
1. **Custom VM Image** – From the Custom VM Image Source, create the VM Image to serve as the baseline for Hosted RPA in Power Automate.  
1. **Hosted RPA** – Ensure Hosted RPA is enabled in the Power Platform environment with appropriate license assignment to the environment.
1. **Hosted Machine Group** – Use Power Automate portal to create Hosted Machine Group specifying the maximum and committed number of bots for this Hosted Machine Group.
1. **Desktop Flow Connection** – Within the parent cloud flow, create a desktop flow connection pointing to the Hosted Machine Group as the target machine group.

## Use case details

Organizations that have the need to run RPA automations at scale where workload need to run on multiple machines can use this architectural pattern to scale their operations without pre-provisioning the infrastructure. This approach allows RPA operations team to adapt to the dynamic workloads with minimal effort.

The following are some use cases:

- End of Quarter financial data processing requires numerous machines to handle a high volume of transactions.
- Process high priority daily work items in the Work Queue quickly to prevent SLA violations.
- Addressing a significant backlog of shipment orders in SAP during the holiday season by utilizing Power Automate for desktop to automate user interface tasks.

## Components

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources such as the Power Automate [cloud flows](/power-automate/overview-cloud) and [desktop flows](/power-automate/desktop-flows/introduction).
- **Microsoft Azure** – Microsoft Azure resources like [Azure Compute Gallery](/azure/virtual-machines/azure-compute-gallery), VM Image definition, VM Image Source, and [Virtual Network](/azure/virtual-network/virtual-networks-overview)  interface are used to create and share custom VM images in Power Automate Portal.
- **Power Automate**: Power Automate is used to implement the scheduled run and automation of producing the monthly account executive summary for each of their customers. Power Automate uses the [virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities) that surface Fabric data using the [Microsoft Dataverse connector](/connectors/commondataserviceforapps/).

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](/power-platform/well-architected/).

### Reliability

**Design for resilience** – Hosted Machine Group inherently ensures resilience through its configuration of maximum and committed bot numbers for processing work items.

### Security

**Protect Hosted Machine Group secrets** – Use a secure vault like Azure Key Vault to manage and secure credentials for the Hosted Machine Group.

**Use credentials in Power Automate** – Switching from using a simple username and password to utilizing Credentials in Power Automate allows for more efficient management of connection credentials and helps prevent disruptions caused by unexpected password changes.

### Performance efficiency

**Optimize infrastructure usage** – Evaluate the overall automation workload requirements and develop a strategy to maintain machine utilization within a Hosted Machine Group above a specified threshold, ensuring compliance with business SLA agreements.

## Experience Optimization

**Implement a consistent maintenance procedure** – To update the custom VM Image utilized by the Hosted Machine Group, adhere to a standardized procedure that employs maintenance mode to indicate an ongoing update. Remember to note that upon updating of VM image, all existing hosted bots complete their ongoing desktop flow runs prior to being reprovisioned with the new VM image.

## Next steps

[Review and use Hosted Machine Groups in Power Automate](/power-automate/desktop-flows/hosted-machine-groups) for details on how to get started with Hosted RPA in Microsoft Power Automate.

The following are the high-level steps involved in setting up a solution architecture that uses Hosted RPA in Microsoft Power Automate. 

1. Create Azure Resources – Review: [Create an Azure compute gallery in Azure and add an image](/power-automate/desktop-flows/hosted-machine-groups#create-an-azure-compute-gallery-in-azure-and-add-an-image) to create the required Azure resources.
    - Azure Compute Gallery (ACG)
    - Image definition
    - Image version from VM Image Source 
    - Assign roles/permissions 
1. Share the Azure Compute Gallery with Power Automate Hosted Machine Group service principal and makers
1. Add new VM Image to Power Automate Portal pointing the custom VM Image listed out of Azure Compute Gallery. Learn more: [Add a new custom VM image](/power-automate/desktop-flows/hosted-machine-groups#add-a-new-custom-vm-image)
1. Create a Hosted Machine Group – The Lakehouse contains the data you ingest into your Fabric workspace.  For example, review [Create hosted machine groups](/power-automate/desktop-flows/hosted-machine-groups#create-hosted-machine-groups).
1. Configure a desktop flow connection – Configure the desktop flow connection in the parent cloud flow to use the Hosted Machine group as the target machine group for the RPA automation.
1. Monitor your Power Automate RPA application – Keep tabs on the performance of the Hosted Machine Group and your RPA automation by monitoring the machine run group and desktop flow runs sections on Power Automate Portal.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Jay Padimiti](https://www.linkedin.com/in/jpadimiti/)**, Principal Program Manager

## Related resources

- [Introduction to the Power Automate hosted RPA](/power-automate/desktop-flows/hosted-rpa-overview)
- [Hosted machine groups limitations](/power-automate/desktop-flows/hosted-machine-groups#hosted-machine-groups-limitations)
- [Hosted RPA Best Practices and FAQ](/power-automate/desktop-flows/hosted-rpa-faq)
