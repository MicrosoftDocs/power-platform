---
title: "ALM with Power Apps considerations"
description: "Understand the more detailed considerations that may be involved with application lifecycle management in Power Apps."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 06/03/2021
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Considerations

This article describes some of the considerations that may be involved with Power Platform application lifecycle management.

## Unmanaged methodology when you have several apps across multiple solutions

Understand and identify the base, common, and app solution layers.

<img src = "media/solution-conversion-layers.png" alt = "Solution layers for deploying an app" width = "350" height = "125">

Then, create solutions that adhere to the following structure:
   - Base layer. This temporary solution will provide the foundation for entities with lookup columns on other attributes. The base solution should contain just entity and entity metadata without entity components, such as columns and table relationships. The base solution can be used for the deployment of multiple apps.
   - Common layer. Components that are common and/or shared across multiple apps are contained in the common solution.
   - App layer. These solutions include just the components specific to the apps. Each app should be structured so that the solution includes all app components in one solution. This solution will contain the tables and components for the app, such as columns, forms, views, and charts. We recommend that you don’t share these components across different apps.
 
### Generate the base solution

   - The purpose of the base solution is to work around cross-component dependencies during an unmanaged to managed solution conversion.
   - The base solution can also contain tables and columns that are not currently in use by any development team. The tool includes a master exclusion list of tables and columns that will be used to ignore tables owned by other teams. 
   - Tables with `AddRequiredComponents = False` and  `DoNotIncludeSubcomponents = True` must be added into the solution. The solution name and publisher should be predefined. <!-- link for more info to dev docs for this? -->
   - Consider building a tool to generate the base solution. The tool can include a master exclusion list of tables and columns owned by current development teams.
   - The base solution will be the first solution converted as managed in all environments except the base solution development environment. No other solutions will be added to the base solution development environment.

### Build a common solution

   - This solution contains components that are shared across apps.
   - Obtain sign-off from every solution owner that no components exclusively owned by their app will be included in the common solution. This is an important clarification that can help you avoid layering complexities.
   - The common solution will be the second solution converted to managed in all environments except the base and common development environments.

### Use a wave conversion model

   - If you have 10 or more solutions to convert from unmanaged to managed, group the solutions together and import them in waves. 
   - The base solution followed by the common solution should be in the group for the first wave, so that they can be imported as managed solutions in all development environments before you convert your app solutions to managed.
   - The development environment refresh process should include the common solution imported as managed to all development environments. This should be done after every wave deployment. 
   - Group any solutions that cause downtime during trials into the final wave. Then, you will only have a single downtime event for the entire conversion process.

### Complete one or more trial conversions of each solution prior to conversion in production

   - If converting in waves, group the trial runs by wave.
   - The trial conversion environment should be as similar to the production environment as possible. Ideally, a copy of production along with portals configured, if any.
   - Conversion integration scheduling:
      - Plan to run your trial and production conversions outside of scheduled integration windows.
      - Schedule the conversion outside normal business hours.
   - If there's any app downtime during the unmanaged to managed conversion from the development environment to the test environment, make a note of it. This helps you determine how much time to allot for when you deploy to production. Check the following for potential impact during conversion:
      - App being converted to managed.
      - Other apps affected by the conversion.
      - Portals affected by the conversion.
   - Considerations when importing a managed solution to convert unmanaged components to managed:
      - If components are held in unmanaged solutions that still exist in the environment, all references will have to be removed before the managed solution can be imported.
      - Removing unmanaged solutions causes the loss of the reference container. Without a good understanding of what has been customized, you risk that components become orphaned in the default solution and possibly become hard to track.

### Testing
 
  - If there's any app downtime during the unmanaged to managed conversion from the development environment to the test environment, make a note of it. This helps you determine how much time to a lot for when deploying to production:
      - App that's imported.
      - Other apps affected by the conversion.
      - Portals affected by the conversion.
   - Integration scheduling:
      - Schedule outside of unmanaged to managed conversion window.
      - Schedule outside hours for regular deployments as well.

Create new development environments after the conversion of the base and common solutions as managed on production. 
   - For each app create a new development environment with the following:
      - Base and common solutions as managed.
      - Any other dependent managed solution required.
      - The app solution as an unmanaged solution.

## Limitations

- It can be very time-consuming to remove components to isolate the base solution or modular solutions. It can be a challenge to determine where dependencies reside and how best to remove them.

- It's difficult to migrate to a managed solution and develop a final solution architecture at the same time. Consider breaking the migration into phases such as moving to managed solutions, then establishing a new solution architecture. Isolated development is needed first to effectively create layered solutions.

## Portals specific considerations

For Power Apps portals app unmanaged to managed conversions, consider building a tool to search for components to eliminate, such as components without dependencies.
    - For example, the tool can be a console app that generates a .CSV output file, which displays table forms and views used by portals apps by checking the entity forms and entity lists tables. The output file can be used to determine dependencies between a portals app and table forms and views.

<!-- these are considered bugs so remove
## System tables that don’t support unmanaged layers

If customized in unmanaged solutions, the managed component must be deleted for the following system tables:

- Attribute maps.
- Access team templates.  -->

## Customization of deeply integrated system tables

Some system tables have many relationships and dependencies with other tables that make them difficult to import to other environments:
- User.
- Contact. Similar to system user for Power Apps but can cause complication when you import  portals apps.  
