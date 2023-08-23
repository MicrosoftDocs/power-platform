---
title: "Unified developer experience overview (preview)"
description: Learn about developing code for Dynamics 365 finance and operations apps using the new Power Platform unified developer experience.
author: pvillads
ms.date: 08/22/2023
ms.topic: article
ms.reviewer: pehecke
ms.author: pvillads
---

# Unified developer experience overview (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

The Power Platform unified dev3eloper experience is both the next step in the Dynamics 365 Finance and Operations (FnO) developer experience, and a powerful enabler for leveraging the value provided by cloud hosted Microsoft Dataverse.

Previously, the developer FnO story was based on a single machine hosting both the development experience (code editing, compilation, deployment) inside Visual Studio, and the runtime experience provided by a local Application Object Server (AOS) interacting with a SQL database also running locally. This local runtime was what provided the interaction with the FnO application, including debugging and unit test execution. Any interaction with the Dataverse stack needed to be handled manually.

For the unified experience we have changed this architecture so the execution of X++ code, including the debugging and unit-testing, now invariably runs in the cloud.

<!--figure goes here-->

In the illustration above, you can see a local development box that runs against an endpoint in the cloud. Behind this endpoint runs an Application Object Server (AOS), the SQL database instance and a complete Dataverse installation. A developer is not bound to use a single endpoint. Any target endpoints running on different versions of the application code can be used without the need for the developer to manage that complexity - The development box will switch to the target version automatically, downloading the correct version if needed. The development box itself can be lightweight. It only needs the Visual Studio instance and the Dynamics FnO tools (compiler etc.) to be installed, along with a lightweight database used for hosting source code cross references. It does not host the AOS, so the heavy lifting is performed by the server behind the endpoint. 

 The developer can also manage the content of the SQL database, to deal with troubleshooting scenarios that are bound to specific customer data. All this translates to increased developer productivity. 

Once the developer has provided his credentials, he can upload the package resulting from his development work (containing contributions from both FnO and Dataverse). The developer can then seamlessly interact with the application, run unit tests, and do debugging of the X++ and C# code, just as if everything was running locally. In fact, the debugging experience itself is snappier than the local debugging used to be, even when running over a network connection. 

In addition to the interactive story, we have also provided a CI/CD experience where you can build and deploy your solutions. The fully automatic deployment contains contributions from both Dataverse and FnO. 

We are also providing developers with tooling that can be used to query the cloud hosted database directly. We know that this is important for developers, who want to validate their code, and who want to diagnose problems by inspecting SQL query plans. 

All this translates into increased developer productivity for the developer. It is easy to set up the development environment (disposed of in around 20 minutes), and the system will make sure that the version you are developing against and the code that is executed on the server are in perfect synchronization. Since we have set up the data environment for you in the cloud, you can rest assured that it is secure and compliant, which translates into a reduced cost of ownership. With this hands-off infrastructure in place, there is no longer any need for you to manage your own cloud-hosted environments. 

Developers sometimes face problems that are data related. Fortunately, it is easy to update the database that you are debugging against, so these issues can be effectively rooted out. 

### See also

[Unified admin experience for finance and operations apps (preview)](../../admin/unified-experience/finance-operations-apps-overview.md)
