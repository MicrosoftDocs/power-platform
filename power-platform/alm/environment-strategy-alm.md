---
title: "Environment strategy for ALM | Microsoft Docs"
description: "Environment strategy considerations for application lifecycle management (ALM) with Power Platform"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 09/11/2020
ms.reviewer: ""
ms.service: powerapps
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Environment strategy for ALM

To follow application lifecycle management (ALM) principles, you'll need separate environments for app development and production. Although you can perform basic ALM with only separate
development and production environments, we recommend that you also maintain at
least one test environment that's separate from your development and production
environments. When you have a separate test environment, you can perform
end-to-end validation that includes solution deployment and application testing.
Some organizations might also need additional environments for user acceptance testing
(UAT), systems integration testing (SIT), and training.

Separate development environments can be helpful to help isolate changes from
one work effort being checked in before it's completed. Separate development environments can also be helpful to reduce situations when one person negatively affects another while making changes.

Every organization is unique, so carefully consider
what your organization's environment needs are.

### Development environments 

You should answer questions such as:

-   How many development environments do I need?

-   How can I automatically provision environments from source code?

-   What are the dependencies on my environments?

### Other environments 

You should also answer the question, "Which types of non-development environments do I need?"

For example, in addition to your production environment, you might need separate
test, UAT, SIT, and
pre-production environments. Notice that, at a minimum, any healthy ALM practice
should include using a test environment prior to deploying anything to the production
environment. This ensures that you have a place to test your app, but also
ensures that the deployment itself can be tested. 

More information: [Establishing an environment strategy for Microsoft Power Platform](/power-platform/guidance/adoption/environment-strategy)

### See also
[Solution concepts](solution-concepts-alm.md)
