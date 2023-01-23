---
title: "Manage the Power Platform default environment"
description: "Guidance for managing the Power Platform default environment."
author: rranjit83
ms.topic: conceptual
ms.date: 11/30/2022
ms.author: rranjit
ms.reviewer: matp
ms.subservice: guidance
---
# Manage the default environment

Every employee in an organization using the Power Platform has access to the default environment. Since it isn't possible to remove the environment maker role from the default environment, Power Platform admins should consider, and when necessary, implement ways to control the default environment. To that end, Center of Excellence (CoE) teams can gather information using the CoE Starter Kit, PowerShell cmdlets, and Power Platform admin connectors to see what is happening in environments and use that information to guide makers and exert control over their apps and flows. This article provides some best practices for using the data you gather from these sources to manage your default environment.

## Tracking integrations

Connectors are services within Power Platform that allows apps and flows to integrate with other services. There are over 800 connectors to different services that you can use. Using [DLP policies](/power-platform/admin/wp-data-loss-prevention), Power Platform administrators can control which integrations are allowed in each environment.

However, there are some connectors that drive core Power Platform functionality so these are [connectors that can't be blocked](/power-platform/admin/dlp-connector-classification#list-of-connectors-that-cant-be-blocked). You'll want to know if your users are using a non-blocking connector so that you can provide policy guidance. For example, you might want to track the apps and flows in the default environment that use the Exchange connector and direct the makers to move to a different environment, which allows outbound emails.

The core components in the CoE Starter Kit contain the schema and flows to retrieve the list of all environments and resources, such as apps and flows, within each environment. The starter kit also records the details of connectors used by the app or flow. This data is refreshed every 24 hours. You can use the CoE dashboards to discover the connections leveraged across the different environments. You can also search for related flows and apps directly from the Dataverse environment where the CoE Starter Kit is installed. You can find more information on tracking connectors here:

[Monitor with the CoE Power BI dashboard](/power-platform/guidance/coe/power-bi-monitor)

## Discovering unused and abandoned apps and flows

As Power Platform adoption in your organizations grows, you're likely to have abandoned and unused apps and flows in your default environment.
* When an employee exits an organization, the apps and flows owned by the employee are in effect abandoned. These apps and flows are called *abandoned apps/flows*.
* An employee might create an app or a flow, which is used for a short duration and then remains unused. These apps and flows are called *unused apps/flows*.

To maintain the overall environment hygiene, establish processes and procedures to clean up abandoned and unused flows and apps. This is especially important for the default environment as all the users in the environment are potential makers.

The CoE Starter Kit defines two different processes to handle abandoned and unused apps and flows:

- Clean up for abandoned apps: [Set up clean-up for orphaned objects](/power-platform/guidance/coe/setup-orphan-components)

- Clean up for unused apps: [Set up inactivity notifications components](/power-platform/guidance/coe/setup-archive-components)

You can choose to use the processes from the CoE Starter Kit as-is or modify it to suit the needs of your organization.

## Discovering highly used Power Apps apps and flows

While the default environment is intended to build personal productivity apps and flows, some citizen developers might create apps and flows that become widely adopted or business critical. While this is a good outcome, it should be managed. When a personal productivity app or flow is used by a significant number of employees, such as 10 or more, you can use the Power Platform CoE to evaluate whether the app should be moved to its own environment or a shared environment for the team or group. You can use some of the following parameters to determine if your app should be moved out to a dedicated environment, a shared environment, or best left alone in the default environment. More information: [Establishing an environment strategy](/power-platform/guidance/adoption/environment-strategy)

Below are indicative examples of the parameters used to make a decision in moving an app from the default environment to a shared or dedicated environment. You should determine these parameters and defining criteria in alignment with your business goals.

<table>
    <th>Parameters</th><th>Defining criteria</th><th>Environment</th>
    <tr>
        <td rowspan="3">Number of users</td>
        <td>1-10 users</td>
        <td>Default</td>
    </tr>
    <tr>
        <td>7-30 users</td>
        <td>Shared</td>
    </tr>
      <tr>
        <td>&gt;30 users</td>
        <td>Dedicated</td>
    </tr>
     <tr>
        <td rowspan="3">Nature of data</td>
        <td>Highly confidential</td>
        <td>Dedicated</td>
    </tr>
    <tr>
        <td>Confidential</td>
        <td>Shared</td>
    </tr>
      <tr>
        <td>Not confidential</td>
        <td>Default</td>
    </tr>
     <tr>
        <td rowspan="2">Impact to business <br/>(monetary or reputation)</td>
        <td>Yes</td>
        <td>Shared or dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
      <tr>
        <td rowspan="2">Requires ALM</td>
        <td>Yes</td>
        <td>Shared or dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
</table>

Use the CoE Starter Kit to discover highly shared apps and flows. The CoE Starter Kit provides a Power BI dashboard that allows you to surface this information. More information: [Identify widely shared apps](/power-platform/guidance/coe/power-bi-govern#identify-widely-shared-apps)

The compliance process in the CoE Starter Kit can be used to track app sharing and usage. Use this app as-is or configure it to meet your organization's process. More information: [Example App auditing process](/power-platform/guidance/coe/example-processes)

## Migrating applications from default environment

Use solutions to package and deploy your applications, flows, and tables from one environment to another. Fusion teams can create a process to package the solution components, deploy it to a target environment, and finally delete it from the default environment. To successfully migrate an app or flow over to a different environment perform the following steps:

1. Create a solution and add the app and all its dependencies to it. The dependencies include the apps, flows, and tables.

1. The solution can then be exported from the default environment and imported into a different environment.

1. Ensure that all users who had access in the default environment are added to the target environment with the relevant security roles. Consider creating and using dedicated security group to manage users, irrespective of the number of users it's shared with.

1. Ensure that all configuration data or app data are migrated over to the new environment.

1. Test and validate the app.

1. Notify users of the new application and remove access to all users to the application in the default environment. However, you should retain access for a few admins and makers.

1. Eventually, delete the contents of the solution and then the solution itself from the default environment. Note that when tables are deleted, the data from the tables are lost as well. Ensure that you don't delete any shared assets. For example, if another app or flow uses a table, don't delete the table.

More information: [Introduction to solutions](/power-apps/developer/data-platform/introduction-solutions)

## Quarantining apps

Power Apps exposes a functionality that allows the Power Platform admin to quarantine a canvas app. Once quarantined, the app can't be played by users the app has been shared with. You can also unquarantine an app to restore access to shared users. Only admins can change the state of an app. Makers can still edit an app irrespective of the quarantine status of the app.

In the default environment, the app quarantine feature is useful in several scenarios:

- The organization wants to disable the app temporarily until the app is reviewed for use.

- Disabling access to an app, which has been shared with many individual users.

- You can use this process to stand in for a "soft-delete" of an app when it's being upgraded or moved to a different environment as discussed in the previous section.

Quarantining an app is supported using three PowerShell cmdlets:

-  Quarantine - Allows the administrator to quarantine an app.
``` 
Set-AppAsQuarantined -EnvironmentName <EnvironmentName> -AppName <AppName>
```

- Unquarantine.
```
Set-AppAsUnquarantined -EnvironmentName <EnvironmentName> -AppName <AppName>
```

- Get quarantine state.
```
Get-AppQuarantineState -EnvironmentName <EnvironmentName> -AppName <AppName>
```

## Designated SharePoint form environment

Power Platform is tightly integrated with the rest of the Microsoft enterprise ecosystem. This allows any user, irrespective of their skill developing applications, to build important automations and applications for themselves or their teams. One of the most powerful examples is the integration between SharePoint and Power Platform. You can create or customize a SharePoint form using Power Apps. More information: [Customize a Microsoft Lists or SharePoint form by using Power Apps](/power-apps/maker/canvas-apps/customize-list-form)

When a user creates a custom SharePoint form in SharePoint, a canvas app is created in the default environment. In large organizations, this can result in many apps created in the default environment. To avoid this, create a separate environment and designate it to store the custom SharePoint forms. This allows Power Platform admins to separate out the SharePoint forms from the general productivity apps in the default environment.

To change the SharePoint form environment:

1. Create or designate an existing separate environment to store the SharePoint forms.

1. Assign all the users who create or update forms the environment maker role in the new environment.

1. Use the following [PowerShell cmdlet to set the SharePoint form environment](/power-platform/admin/powerapps-powershell#designate-sharepoint-custom-form-environment).
```
  Set-AdminPowerAppSharepointFormEnvironment --EnvironmentName '<EnvironmentName>'
```

Key points to keep in mind:

- Existing SharePoint forms won't be migrated over to the new SharePoint form environment.
- If you delete the SharePoint form environment after setting it, the SharePoint forms will be lost, and the user interface will revert back to using the default SharePoint form.
- If a user tries to create a custom SharePoint form after the SharePoint form environment is deleted, the canvas app will be created in the default environment.
- The Set-AdminPowerAppSharepointFormEnvironment command applies only for SharePoint forms customized by Power Apps. Power Automate flows created from SharePoint always leverage the default environment.

## Backup and restore of default environment

Like every other environment type (sandbox, production, developer), the default environment also gets archived. However, there's no manual backup that you can request for the default environment. Like any other environment, a restore operation is possible and requires you to contact Microsoft Support. Be aware that when you restore the default environment, you need to consider you might also be restoring all the unused or abandoned apps and flows that were removed after the cleanup.

## See also

[Secure the default environment](secure-default-environment.md)

[Power Platform for Admins - Connectors](/connectors/powerplatformforadmins/)

[Power Automate Management - Connectors](/connectors/flowmanagement/)

[Power Automate for Admins - Connectors](/connectors/microsoftflowforadmins/)

[Power Apps for Admins - Connectors](/connectors/powerappsforadmins/)

[Programmability and Extensibility - PowerShell - Getting started](/power-platform/admin/powershell-getting-started)

[What is a Center of Excellence?](../coe/motivation.md)
