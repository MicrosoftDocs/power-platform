---
title: Enterprise Visual Vehicle Inspection Engine
description: Learn how EVVIE uses AI and Power Platform to automate vehicle inspections, saving time and improving accuracy.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/04/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---
# EVVIE - Enterprise Visual Vehicle Inspection Engine

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

The Enterprise Visual Vehicle Inspection Engine (EVVIE) applies the power of AI and Microsoft Power Platform to revolutionize the vehicle inspection process. By automating inspections, EVVIE saves time and enhances accuracy, making it an invaluable tool for organizations managing large vehicle fleets. This guide provides an overview of EVVIE's architecture, workflow, and key components, offering insights into how this innovative solution can streamline vehicle inspections and maintenance.


 Inspect vehicles and assess damage using generative AI and Power Platform. For a demo and more information, visit [aka.ms/EVVIE](https://microsoft-my.sharepoint.com/personal/timh_microsoft_com/Documents/Stretch%20Projects/AI%20POC%20Teasers%20(CHASE%20IRIS)/EVVIE/Power%20CAT%20Template/aka.ms/EVVIE)

## Architecture diagram

:::image type="content" source="../../media/image2.png" alt-text="architecture diagram" border="true":::

## Workflow
EVVIE uses a unique blend of Microsoft Power Platform and Microsoft Azure resources to automate the vehicle inspection process using advanced AI models. EVVIE's internal process is described below at a high level:

- A Power Apps (canvas) app used by the user serves as the interface to collect photos of vehicle damage as part of a vehicle inspection.

- The Power App uses a custom connector (API integration) to provide the captured images to a custom API, a .NET-based Azure Function.

- The Azure Function receives and parses the HTTP API call (images are encoded as a base64 string) from the Power App, takes these photos, and interfaces with a multimodal LLM in Azure OpenAI Service. The multimodal LLM reviews the photos and classifies the damage into three fields: 1) area of car, 2) severity level (1-5), and 3) general description of the damage.

- The Power Apps inspection app receives this response from the Azure Function, presenting the AI-created damage assessment to the user, who can accept, modify, or reject the assessment. After finalizing the assessment, they submit it for the given vehicle, where it's securely stored in Dataverse.

- Another Power Apps app (model-driven with custom pages) lets administrators review this vehicle inspection data

## Use case details

EVVIE helps organizations with large vehicle fleets manage regular inspections and maintenance. Routine inspections can be time-consuming and often require staff to carry a pen, paper, and clipboard to document findings, taking them away from their valuable work.

- To alleviate this burden and save time, EVVIE uses advanced multimodal generative AI to automatically assess and log vehicle damage. Instead of manually documenting each instance of damage, staff members simply provide EVVIE with a photo. From this single image, EVVIE assesses the damage, logs its location on the vehicle, determines the severity level, and provides a brief description.

- EVVIE is inspired by conversations with the LA County Sheriff's Department, which manages a fleet of thousands of vehicles. Traditionally, each officer had to survey their vehicle with pen, paper, and clipboard before starting their shift, document any damage, and submit this information to their supervisor. However, this routine inspection often fell by the wayside due to pressing duties, leaving little time for a cumbersome 20-minute inspection.

- With EVVIE, officers only need to open an app on their phone and take a photo of their car. The AI takes care of documenting the damage and virtually reports it to their supervisor, eliminating the need for paper-based processes.

## Components

- **Dataverse:** All data collected as part of vehicle inspections (captured photos of damage, severity level ranking, descriptions, etc.) is stored in Dataverse.
- **Power Apps:** The applications presented to both the staff in the field inspecting the vehicles and the administrative staff _reviewing_ these inspections are built in Power Apps, Microsoft's no-code/low-code app development framework.
- **Custom connector:** A custom connector lets the EVVIE mobile vehicle inspection app (used by staff inspecting vehicles in the field) call a back-end service that uses advanced AI to assess the provided photos.
- **Azure function:** An Azure Function, Microsoft's event-driven serverless compute platform, serves as a web API that the EVVIE Power App can call via an HTTP call through the custom connector. The Azure Function receives the images via API call and interfaces with an advanced AI model to assess damage, returning this assessment to the requestor (the Power App).
- **Azure openAI service:** EVVIE uses a multimodal AI model to assess the damage in provided images and classify this damage into three fields: severity level (1-5), area of vehicle (that is, doors, windshield, front bumper), and description of damage. While any future multimodal large language model can be used (that is "o1" or "o3" once they're available), GPT-4o is used as of the time of this writing.

## Considerations

These considerations implement the pillars of Power Platform well-architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

Each Microsoft cloud-based component within EVVIE’s architecture is designed for exceptional reliability, ensuring it consistently meets critical uptime and recovery targets. This reliability is achieved through scalable redundancy, providing robust performance and resilience.

### Security

For EVVIE’s proof of concept build, the Azure Function-based web API that interfaces with the Power App doesn't include any security protocols. So, anyone aware of the unique API endpoints (URLs) can potentially access EVVIE’s back-end service.
In a production deployment, it's essential for the systems integrator to implement a standard authentication layer, such as key-based authentication through Azure API Management. This ensures that the back-end API service can only be accessed as intended by the EVVIE front-end Power App.

### Operational excellence

As a proof of concept, EVVIE is built from scratch with fictitious requirements to showcase the technology's capability in assessing vehicle damage. Therefore, every aspect—from the inspection process to the criteria EVVIE evaluates (area of damage, severity level, description), and the specific areas of the vehicle where damage can be pinpointed—can and should be customized to meet the unique needs of any organization deploying EVVIE.

For instance, a systems integrator can:

- Adjust the specific areas of a vehicle where EVVIE can identify damage.
- Refine the system prompt used to instruct the model.
- Implement a minimum number of photo requirements.

These modifications ensure that EVVIE operates optimally and aligns with the organization’s specific needs.


### Performance efficiency

Two potential bottlenecks can significantly impact EVVIE's scalability:

- **Azure Function-based API:** As EVVIE’s front-door to the AI service for vehicle damage assessment, it's crucial to ensure the Azure Function is configured for massive scale. Depending on the organization’s consumption, deploying to a dedicated plan may be advisable to ensure scalability.

- **Azure OpenAI Service:** The Azure OpenAI model, called by the Azure Function, is essential for assessing and logging damage. It's critical to ensure that the Azure OpenAI deployment, which the back-end API relies on, is always operational. Since Azure OpenAI uses a token-based system, it's important to guarantee that the model used in EVVIE has a sufficiently high token quota for the given period of usage.


### Experience optimization

The team that developed EVVIE dedicated significant time and effort to optimizing the user interface and user experience, ensuring it's intuitive and easy to use for staff inspecting vehicles and those reviewing the inspections.

EVVIE’s inspection app is a canvas app that can be easily modified through a simple select-and-drag interface, similar to PowerPoint, to better meet the organization’s needs. 

Likewise, the interface presented to administrative staff for reviewing these inspections is a model-driven app with a custom page, which is equally easy to modify according to specific requirements.


### Responsible AI

1. **Non-Sensitive Use Case:** The EVVIE application operates within a nonsensitive domain, significantly reducing the risk of bias negatively impacting vehicle inspections. Given the nature of vehicle damage assessment, there's minimal room for bias to influence outcomes.

1. **Controlled Generative AI:** The generative AI models employed by EVVIE use features that constrain their assessments into predefined templates. This design ensures that the AI provides specific, factual responses as guided by the developer, limiting creativity and focusing solely on accurate, consistent assessments.


## Related resources

For a demo video, further explanation of functionality, architecture, source code, and more, visit EVVIE on GitHub: [aka.ms/EVVIE](https://github.com/microsoft/SLG-Business-Applications/tree/main/demos/EVVIE).

The team that made EVVIE:
- **Tim Hanewich**, Power Platform Technical Specialist – core EVVIE systems and AI functionality.

- **Kelly Cason**, Business Applications Technical Specialist – EVVIE UI & UX.
