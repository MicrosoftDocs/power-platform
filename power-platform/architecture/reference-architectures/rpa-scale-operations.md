---
title: Reduce infrastructure challenges with hosted RPA in Power Automate
description: Learn how hosted RPA in Power Automate allows you to scale your automation workflows seamlessly without static infrastructure.
#customer intent: As a Power Platform user, I want to scale RPA operations using Hosted RPA in Power Automate so that I can reduce infrastructure management efforts.  
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
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
  - ai-gen-title
---

# ​Reduce infrastructure challenges with hosted RPA in Power Automate

[Robotic process automation (RPA)](https://www.microsoft.com/power-platform/products/power-automate/topics/robotic-process-automation/what-is-rpa) uses software bots to emulate human interactions in a graphical user interface like a desktop application to automate repetitive and manual tasks. [*Hosted RPA*](/power-automate/desktop-flows/hosted-rpa-overview) uses Microsoft infrastructure running in Azure to allow organizations to run RPA quickly and at scale in the cloud, without needing to provision and maintain their own static infrastructure.

Power Automate supports two hosted RPA scenarios. *Hosted machines* run attended or unattended RPA, allowing citizen and pro developers to build or test automations and business users to run them. *Hosted machine groups* run unattended RPA in production, optimizing resources for higher efficiency and lower cost with automatic scaling and dynamic load balancing.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to ​​scale RPA operations using hosted RPA in Power Automate for desktop. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/rpa-scale-operations/rpa-scale-operations.png" alt-text="Architecture diagram showing ​​how to scale RPA operations using Hosted RPA in Power Automate for desktop." lightbox="media/rpa-scale-operations/rpa-scale-operations.png":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Azure Compute Gallery**: Identify an available Azure Compute Gallery, then create the VM image definition and image version mapped to a custom VM image source.

1. **Custom VM image**: From the custom VM image source, create the VM image to serve as the baseline for hosted RPA in Power Automate.

1. **Hosted RPA**: Assign the appropriate license to the Power Platform environment.

1. **Hosted machine group**: Use the Power Automate portal to create a hosted machine group and specify the maximum and committed number of bots for the group.

1. **Desktop flow connection**: In the parent cloud flow, create a desktop flow connection that points to the hosted machine group.

## Components

[**Power Platform environment**](/power-platform/admin/environments-overview): Contains Power Platform resources such as Power Automate [cloud flows](/power-automate/overview-cloud) and [desktop flows](/power-automate/desktop-flows/introduction).

**Microsoft Azure**: Includes resources like [Azure Compute Gallery](/azure/virtual-machines/azure-compute-gallery), virtual machine (VM) image definition, VM image source, and [Virtual Networks](/azure/virtual-network/virtual-networks-overview) that are used to create and share custom VM images in Power Automate portal.

**Power Automate**: Provides the hosted RPA service that runs unattended automations in the cloud.

[**Azure Compute Gallery**](/azure/virtual-machines/azure-compute-gallery): A service that allows you to create and manage custom VM images, which can be shared with Power Automate for use in hosted RPA.

## Scenario details

Organizations that need to run RPA automations at scale, where workloads run on multiple machines, can use this architectural pattern to scale operations without provisioning their own infrastructure.

### Potential use cases

Here are some example use cases for hosted RPA in Power Automate:

- Processing end-of-quarter financial data, which typically requires multiple machines to handle high transaction volumes.

- Processing high-priority daily work items in the work queue quickly to prevent SLA violations.

- Addressing a significant backlog of shipment orders in SAP during the holiday season by using Power Automate for desktop to automate user interface tasks.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design for resilience**: Hosted machine groups ensure resilience by configuring maximum and committed bot numbers to process work items.

### Security

**Protect hosted machine group secrets**: Use a secure vault like Azure Key Vault to manage and secure credentials for the hosted machine group.

**Use credentials in Power Automate**: Switch from using a simple username and password to credentials in Power Automate to manage connection credentials more efficiently and prevent disruptions caused by unexpected password changes.

### Performance Efficiency

**Optimize infrastructure usage**: Evaluate the overall automation workload requirements. Develop a strategy to maintain machine utilization in a hosted machine group above a specified threshold, ensuring compliance with business SLA policies.

### Experience Optimization

**Implement a consistent maintenance procedure**: When you need to update the custom VM image used by the hosted machine group, follow a standard procedure that uses maintenance mode to indicate an ongoing update. Note that when the VM image is updated, all hosted bots complete their ongoing desktop flow runs before being reprovisioned with the new VM image.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Jay Padimiti](https://www.linkedin.com/in/jpadimiti/)**, Principal Program Manager

## Next steps

Review [Hosted machine group](/power-automate/desktop-flows/hosted-machine-groups).

Follow these high-level steps to set up a solution architecture that uses hosted RPA in Power Automate:

1. [Create an Azure compute gallery in Azure and add an image](/power-automate/desktop-flows/hosted-machine-groups#create-an-azure-compute-gallery-in-azure-and-add-an-image).

1. Share the Azure Compute Gallery with the Power Automate hosted machine group service principal and makers.

1. [Add a new custom VM image](/power-automate/desktop-flows/hosted-machine-groups#add-a-new-custom-vm-image) and point to the custom VM image in the Azure Compute Gallery.

1. [Create a hosted machine group](/power-automate/desktop-flows/hosted-machine-groups#create-hosted-machine-groups).

1. Configure the desktop flow connection in the parent cloud flow to use the hosted machine group as the target for the RPA automation.

1. Monitor your Power Automate RPA application. Track the performance of the hosted machine group and your RPA automation by monitoring the machine run group and desktop flow run sections in the Power Automate portal.

## Related resources

- [Introduction to the Power Automate hosted RPA](/power-automate/desktop-flows/hosted-rpa-overview)
- [Hosted machine groups limitations](/power-automate/desktop-flows/hosted-machine-groups#hosted-machine-groups-limitations)
- [Hosted RPA Best Practices and FAQ](/power-automate/desktop-flows/hosted-rpa-faq)
