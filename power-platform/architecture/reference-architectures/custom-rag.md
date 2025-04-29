---  
title: Extending Copilot Studio with a custom Retrieval Augmented Generation (RAG) Architecture
description: Learn how to extend Copilot Studio with a custom Retrieval Augmented Generation (RAG) Architecture
#customer intent: As a Copilot Studio agent maker, I want to extend Copilot Studio with a Custom Retrieval Augmented Generation (RAG) Architecture.  
author: manuelap-msft
ms.subservice: architecture-center  
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle  
ms.reviewer: pankajsharma2087  
ms.contributors:
- remidyon
- hejammes
contributors:  
  - manuelap-msft  
search.audienceType:  
  - admin  
  - flowmaker  
---  

# Extending Copilot Studio with a custom Retrieval Augmented Generation (RAG) Architecture

This document provides an overview of how to implement a custom [Retrieval Augmented Generation (RAG)](/azure/ai-foundry/concepts/retrieval-augmented-generation) architecture with Microsoft Copilot Studio.

> [!TIP]  
> This article provides an example scenario and a generalized example architecture to implement a custom [Retrieval Augmented Generation (RAG)](/azure/ai-foundry/concepts/retrieval-augmented-generation) architecture with Copilot Studio. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram  

:::image type="content" source="media/custom-rag/custom-rag.png" alt-text="Architecture diagram illustrating the workflow for using Dataverse with canvas apps." lightbox="media/custom-rag/custom-rag.png":::  

## Components

### Interface 

#### SharePoint 

Employees can access a Copilot Studio agent directly in SharePoint, making it easy to get support without jumping between systems.  

### Azure Virtual Network 

The Copilot Studio agent can run with custom secure setup using Azure VNet, with services like App Services, Cosmos DB, Databricks, Blob Storage, and API Management behind the scenes. Employees get a similar experience via Copilot Studio connecting to the custom system without their experience deprecating. 
 
#### App Registrations 

Defines the app’s identity and permissions in Azure. It’s how the app signs in and proves what it’s allowed to do. 

#### App Services 

Runs your web apps and APIs without the overhead. Fully managed, scales when you need it to.  

#### Function Apps 

Runs lightweight code in response to events such has a webhook or a timer. 

#### Azure Cosmos DB 

Fast, flexible NoSQL database that handles globally distributed data with low latency. 

#### Azure Databricks 

Big data and ML workspace built on Spark. Great for crunching data and building models. 

#### Azure Blob Storage 

A scalable storage for anything unstructured such as files, images, logs and backups. 

#### API Management 

Provides control over APIs so that you can secure, monitor, and manage how they’re used. 

#### Azure AI Foundry 

Where you build and manage AI workflows using foundation models which is used secure, scalable AI orchestration. 

### IP Firewall 

IP Firewall gives you control over who can access your Azure services by locking things down to specific IP ranges. Only traffic from networks you trust can get through. This allows you to reduce exposure and keep internal systems protected. 

For services like App Services, Function Apps, Cosmos DB, Databricks, Blob Storage, API Management, and Azure AI Foundry, this means you can block public access and keep things behind your own network or a private endpoint. 

This should be used when you need to keep environments private, enforce network boundaries, or meet security and compliance requirements. 

## Scenario details

An example use case could be a bank, the bank uses the IP Firewall to lock down access to services like Cosmos DB, Databricks, and Blob Storage so that only traffic from its internal network or approved virtual private networks can reach them. Public access is blocked completely. 

This matters because those services handle sensitive workloads: customer data in Cosmos DB, risk models in Databricks, and scanned documents in the Blob storage. By limiting access to known IP ranges, the bank reduces the risk of data leaks, lateral attacks, or accidental exposure. 

They apply the same controls to App Services, Function Apps, and API Management to make sure only their internal apps and staff can interact with back-end systems. Azure AI Foundry is locked down the same way to protect AI models and prompt logic from being accessed outside the bank’s secure environment. 

## Next steps

Learn how to [secure Power Platform access to resources inside your virtual network](secure-access-azure-resources.md).

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Azure Virtual Network](/azure/virtual-network/virtual-networks-overview)
- [Azure IP Firewall](/azure/virtual-network/ip-services/configure-public-ip-firewall)
- [Azure AI Foundry](/azure/ai-foundry/what-is-azure-ai-foundry)
- [Microsoft Responsible AI Principles](https://www.microsoft.com/ai/principles-and-approach/)
