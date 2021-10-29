---
title: "ALM environment strategy considerations"
description: "To follow application lifecycle management principles in Power Platform, consider these factors when determining your ALM environment needs and strategy."
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 09/11/2020
ms.reviewer: ""
ms.service: power-platform
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
    - More information: [Environments overview](../admin/environments-overview.md)
-   How can I automatically provision environments from source code?
    - More information: [Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)
-   What are the dependencies on my environments? 
    - More information: [Multiple solution layering and dependencies](organize-solutions.md#multiple-solution-layering-and-dependencies)

### Other environments 

You should also answer the question, "Which types of non-development environments do I need?"

For example, in addition to your production environment, you might need separate
test, UAT, SIT, and
pre-production environments. Notice that, at a minimum, any healthy ALM practice
should include using a test environment prior to deploying anything to the production
environment. This ensures that you have a place to test your app, but also
ensures that the deployment itself can be tested. 

More information: [Establishing an environment strategy for Microsoft Power Platform](../guidance/adoption/environment-strategy.md)

## Multi-geographical considerations

Power Platform environments follow a specific service update schedule as environments are updated across the world. There are 6 stations in total that are primarily defined by geographical location.  Service updates are applied in sequence for each station. So, station 2 service updates are applied before station 3. Therefore, it’s common for environments that are in different stations to have different versions at a certain point in time. For more information about the environment service update schedule, go to [Released versions of Microsoft Dataverse](/dynamics365/released-versions/Microsoft-Dataverse)

### Solution import and environment version

When you have multiple environments in different regions, it’s important to understand the following implications when you import a solution:

- You *can* import a solution into an environment that is a newer version than the environment where the solution was exported. 
- You *can’t* import a solution into an environment that’s an older version than the environment where the solution was exported.

#### Example of successfully aligning environments with service update stations

Imagine that you have production environments in Canada and the United States. In that case, your development environments should be in North America (station 5) and not in Canada (station 2). Then, your development environments will always be the same or an earlier version than your production environments and curtail solution import version conflicts.
:::image type="content" source="media/environment-version-import.png" border="false" alt-text="Correct service update station environment alignment for successful solution import ":::

### See also
[Solution concepts](solution-concepts-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
