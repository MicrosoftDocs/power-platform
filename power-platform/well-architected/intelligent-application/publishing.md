---
title: Publishing considerations for intelligent application workloads
description: Publishing considerations for intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Publishing considerations for intelligent application workloads

It’s key to have a healthy application lifecycle management (ALM) process to avoid production issues and catch and fix any regression early.




## Testing

Understand your plans to validate that your copilots and integrations work as expected.

Define your test strategy for intelligent application workloads. Use of the [Test Framework](https://aka.ms/PVASamples/PVATestFramework) to bulk test user utterances and validate that the appropriate topic triggers or that the first ‘did you mean’ option is the correct one in 90% of the time.
Integrations will be tested as part the full end-to-end conversation testing with the Test Framework scale test capability.

Use the [Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) to configure copilots and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the copilot responses are evaluated against expected results.

Ensure that you understand nonfunctional requirements like availability, compliance, data retention/residency, performance, privacy, recovery time, security, and scalability. For example, a chat widget on the website should load and start the conversation in less then 5 seconds when clicked or a cloud flows triggered to return information to the user need to return the desired data in a maximum of 10s.

## Example

![Example solution configuration](media/solutionconfig.png)

## See also

- [Use environment variables](/power-apps/maker/data-platform/environmentvariables)
- [Power Platform ALM](/power-platform/alm/)
- [Power Platform pipelines](/power-platform/alm/pipelines)
- [Azure DevOps Power Platform Build Tools](/power-platform/alm/devops-build-tools)
- [GitHub Power Platform Actions](/power-platform/alm/devops-github-actions)
