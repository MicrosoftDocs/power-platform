---
title: Revolutionize vehicle inspections with EVVIE
description: Discover how the Enterprise Visual Vehicle Inspection Engine uses AI and Power Platform to automate vehicle inspections, saving time and improving accuracy.
#customer intent: As a business decision maker, I want to understand the workflow of EVVIE so that I can design a similar solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Revolutionize vehicle inspections with EVVIE

The Enterprise Visual Vehicle Inspection Engine (EVVIE) uses AI and Microsoft Power Platform to revolutionize the vehicle inspection process. By automating inspections, EVVIE saves time and enhances accuracy, making it an invaluable tool for organizations managing large vehicle fleets. This article provides an overview of EVVIE's architecture, workflow, and key components, offering insights into how this innovative solution can streamline vehicle inspections and maintenance.

For a demo and more information about EVVIE, visit [aka.ms/EVVIE](https://aka.ms/EVVIE).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/app-evvie/evvie.png" alt-text="Architecture diagram of the Enterprise Visual Vehicle Inspection Engine's use of low-code and pro-code to drive AI-assisted vehicle inspection." border="true" lightbox="media/app-evvie/evvie.png":::

## Workflow

EVVIE uses a unique blend of Power Platform and Microsoft Azure resources to automate the vehicle inspection process using advanced AI models. At a high level, EVVIE's internal process is as follows:

1. A Power Apps canvas app serves as the interface to allow users to collect photos of vehicle damage as part of a vehicle inspection. Images are encoded as a base64 string.

1. The app uses a custom connector to provide the captured images to a custom API, a .NET-based Azure function app.

1. The function app receives and parses the HTTP API call from the app, fetches the photos, and interfaces with a multimodal language model in Azure OpenAI Service. The model reviews the photos and classifies the damage into three fields: area of car, severity level, and general description of the damage.

1. The inspection app receives the response from the function app and presents the AI-created damage assessment to the user, who can accept, modify, or reject the assessment. The user finalizes the assessment and submits it for the given vehicle. The assessment is securely stored in Dataverse.

1. A model-driven with custom pages lets administrators review vehicle inspection data.

## Components

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): All data collected as part of vehicle inspections, such as photos of damage, severity level ranking, and descriptions, is stored in Dataverse.

[**Power Apps**](/power-apps/): Staff in the field who inspect the vehicles and the administrative staff who review the inspections use apps built in Power Apps, Microsoft's no-code/low-code app development framework.

[**Custom connector**](/connectors/custom-connectors/): A custom connector lets the EVVIE mobile vehicle inspection app (used by staff inspecting vehicles in the field) call a back-end service that uses advanced AI to assess the provided photos.

[**Azure Functions**](/azure/azure-functions/): Azure Functions, Microsoft's event-driven serverless compute platform, act as a web API that the EVVIE app can call using an HTTP request through the custom connector. The Azure function app receives the images through the API call, uses an advanced AI model to assess damage, and returns the assessment to the app.

[**Azure OpenAI Service**](/azure/ai-services/openai/overview): EVVIE uses a multimodal AI model to assess the damage in provided images and classify it into three fields: severity level (1-5), area of vehicle (such as doors, windshield, front bumper), and description of damage. While any future multimodal language model can be used (that is, "o1" or "o3" once they're widely available), GPT-4o is used as of the time of this writing.

## Scenario details

EVVIE helps organizations with large vehicle fleets manage regular inspections and maintenance. Routine inspections take time and distract staff from more valuable work.  

To alleviate this burden and save time, EVVIE uses advanced multimodal generative AI to automatically assess and log vehicle damage. Instead of manually documenting each instance of damage, staff members provide EVVIE with a photo. From this single image, EVVIE assesses the damage, logs its location on the vehicle, determines the severity level, and provides a brief description.

EVVIE is inspired by conversations with the LA County Sheriff's Department, which manages a fleet of thousands of vehicles. Traditionally, each officer had to survey their vehicle with pen, paper, and clipboard before starting their shift, document any damage, and submit this information to their supervisor. However, this routine inspection often fell by the wayside due to pressing duties, leaving little time for a cumbersome 20-minute inspection.

With EVVIE, officers only need to open an app on their phone and take a photo of the vehicle. AI documents the damage and reports it to the supervisor, removing the need for paper-based processes.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

Each Microsoft cloud-based component in EVVIE's architecture is designed for exceptional reliability, ensuring it consistently meets critical uptime and recovery targets. This reliability is achieved through scalable redundancy, providing robust performance and resilience.

### Security

For EVVIE's proof of concept build, the Azure Functions-based web API that interfaces with the app doesn't include any security protocols. Anyone aware of the unique API endpoints (URLs) can potentially access EVVIE's back-end service.

In a production deployment, it's essential for the systems integrator to implement a standard authentication layer, such as key-based authentication through Azure API Management. Such security measures ensure that the back-end API service is only accessed as intended by the EVVIE front-end app.

### Operational Excellence

As a proof of concept, EVVIE is built from scratch with fictitious requirements to showcase the technology's capability to assess vehicle damage. Every aspect, from the inspection process to the criteria EVVIE evaluates&mdash;area of damage, severity level, description, and the specific areas of the vehicle where damage can be pinpointed&mdash;can and should be customized to meet the unique needs of any organization deploying EVVIE.

For instance, a systems integrator can:

- Adjust the specific areas of a vehicle where EVVIE can identify damage.
- Refine the system prompt used to instruct the model.
- Implement a minimum number of photo requirements.

These modifications ensure that EVVIE operates optimally and aligns with the organization's specific needs.

### Performance Efficiency

Two potential bottlenecks can significantly affect EVVIE's scalability:

- **Azure Functions-based API:** As EVVIE's front door to the AI service for vehicle damage assessment, it's crucial to ensure the Azure function app is configured for massive scale. Depending on the organization's consumption, deploying to a dedicated plan may be advisable to ensure scalability.

- **Azure OpenAI Service:** The Azure OpenAI model, called by the function app, is essential for assessing and logging damage. It's critical to ensure that the Azure OpenAI deployment, which the back-end API relies on, is always operational. Since Azure OpenAI uses a token-based system, it's important to guarantee that the model used in EVVIE has a high token quota for the given period of usage.

### Experience Optimization

The team that developed EVVIE dedicated significant time and effort to optimizing the user interface and user experience to make it intuitive and easy for staff to inspect vehicles and review inspections.

EVVIE's inspection app is a canvas app that can be easily modified through a simple select-and-drag interface, similar to PowerPoint, to better meet the organization's needs.

The interface presented to administrative staff for reviewing these inspections is a model-driven app with a custom page, which is equally easy to modify according to specific requirements.

### Responsible AI

**Nonsensitive use case:** The EVVIE application operates within a nonsensitive domain, significantly reducing the risk of bias negatively affecting vehicle inspections. Given the nature of vehicle damage assessment, there's minimal room for bias to influence outcomes.

**Controlled generative AI:** The generative AI models employed by EVVIE use features that constrain their assessments into predefined templates. This design ensures that the AI provides specific, factual responses as guided by the developer, limiting creativity and focusing on accurate, consistent assessments.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Tim Hanewich](https://www.linkedin.com/in/timhanewich/)**, Power Platform Technical Specialist
- **[Kelly Cason](https://www.linkedin.com/in/kellycason/)**, Business Applications Technical Specialist

## Next steps

For a demo video, further explanation of functionality, architecture, source code, and more, visit EVVIE on GitHub at [aka.ms/EVVIE](https://github.com/microsoft/SLG-Business-Applications/tree/main/demos/EVVIE).
