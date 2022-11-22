---
title: "Manage the default Power Platform environment"
description: "Guidance for managing the Power Platform default environment."
author: Mattp123
manager: tapanm
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/04/2022
ms.author: matp 
ms.service: powerapps
---
# Manage the default environment


## Reactive Governance
Every employee in an organization will have access to the Default Environment in a tenant. It is not possible to remove their Environment Maker Role from the Default Environment. Reactive Governance is the process where CoE teams, using the information gathered by CoE Starter Kit and a combination of  tools like Power Platform Power Shell Cmdlets or Admin Connectors of Power Platform. This article provides some best practices for using the data you gather from these sources to manage your default environment.

Additional Information:

-   [Power Platform for Admins - Connectors \| Microsoft Learn](https://learn.microsoft.com/en-us/connectors/powerplatformforadmins/)

-   [Power Automate Management - Connectors \| Microsoft Learn](https://learn.microsoft.com/en-us/connectors/flowmanagement/)

-   [Power Automate for Admins - Connectors \| Microsoft Learn](https://learn.microsoft.com/en-us/connectors/microsoftflowforadmins/)

-   [Power Apps for Admins - Connectors \| Microsoft Learn](https://learn.microsoft.com/en-us/connectors/powerappsforadmins/)

-   [Programmability and Extensibility - PowerShell - Getting started - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/admin/powershell-getting-started)

## Tracking Integrations

Connectors is a service within Power Platform which allows applications and flows to integrate with services. There are over 800+ connectors to different services out of the box that users can use. Using [DLP policies](https://learn.microsoft.com/en-us/power-platform/admin/wp-data-loss-prevention), Power Platform administrators can control which integrations are allowed in each environment. However, there are some standard [connectors that cannot be blocked](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification#list-of-connectors-that-cant-be-blocked) (or connectors you don’t want to block), but you do want to know if your users are using them so that you can provide policy guidance. For example, you might want to track the apps and flows in default environment which use the Exchange connector and direct the makers to move to a different environment which allows outbound emails.

The Core Components in CoE Starter Kit contains the schema and flows to retrieve the list of all environments and resources (apps, flows) within each environment. It also records the details of connectors used by the app or flow. This data is refreshed every 24 hours. You can use the CoE dashboards to discover the connections leveraged across the different environments. You can also search for related flows and apps directly from the CoE Dataverse. You can find more information on tracking connectors here:

[Monitor with the CoE Power BI dashboard - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/coe/power-bi-monitor)

## Discovering Unused and Abandoned Apps/Flows

As Power Platform adoption in your organizations grows, you are going to run into the issue of abandoned and unused apps and flows. 
* When an employee exits an organization, the apps and flows owned by the employee are in effect abandoned. These apps and flows are called Abandoned Apps/Flows. 
* An employee might create an app or a flow which is used for a short duration and then remains unused. These apps and flows are called Unused apps/flows.

To maintain the overall hygiene, it makes sense to establish processes and procedures to clean up abandoned and unused flows and apps. This is especially important for the Default Environment as all the users are makers.

The CoE Starter Kit defines two different processes to handle abandoned and unused apps/flows:

-   Clean up for abandoned apps: [Set up clean-up for orphaned objects - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/coe/setup-orphan-components)

-   Clean up for unused apps: [Set up inactivity notifications components - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/coe/setup-archive-components)

You can choose to use the processes as is or modify it to suit the needs of your organization.

## Discovering Highly Used Power Apps

While the Default Environment is intended to build personal productivity apps/flows, some citizen developers might end up creating apps which become widely adopted or business critical. While this is a good outcome, it  needs to be managed. When a Personal Productivity app/flow suddenly becomes an app used by more than 10 employees, the Power Platform CoE should evaluate if the app should be moved to it own environment or a shared environment for the team/group. You can use some of the following parameters to determine if you app should be moved out to a dedicated Environment, a shared Environment or best left alone in the Default Environment. You can read more about Environment Strategy and different groups of environments here: [Establishing an environment strategy - Microsoft Power Platform - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/environment-strategy)

<table>
    <th>Parameters</th><th>Defining Criteria</th><th>Environment</th>
    <tr>
        <td rowspan="3">Number of Users</td>
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
        <td rowspan="3">Nature of Data</td>
        <td>Highly Confidential</td>
        <td>Dedicated</td>
    </tr>
    <tr>
        <td>Confidential</td>
        <td>Shared</td>
    </tr>
      <tr>
        <td>Not Confidential</td>
        <td>Default</td>
    </tr>
     <tr>
        <td rowspan="2">Impact to Business <br/>(monetory or reputation)</td>
        <td>Yes</td>
        <td>Shared or Dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
      <tr>
        <td rowspan="2">Requires ALM</td>
        <td>Yes</td>
        <td>Shared or Dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
</table>

**NOTE** These are indicative examples of parameters used to take a decision in porting an app from Default Environment to a shared or dedicated environment. Your CoE should determine these parameters and defining criteria in alignment with your business goals.

You can use the CoE Starter Kit to discover highly shared apps and flows. The CoE Starter Kit provides a Power BI dashboard that allows you to surface this information. You can read more about it here: [Identify widely shared apps](https://learn.microsoft.com/en-us/power-platform/guidance/coe/power-bi-govern#identify-widely-shared-apps)
The Compliance process in the CoE starter kit can be used to track app sharing/usage. You can use this app right out of the box or configure it to meet your organization's process. You can read more about it here: [Example App auditing process - Power Platform | Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/guidance/coe/example-processes)

## Migrating Applications from Default Environment

Solutions can be used to package and deploy your applications, flows, table schemas from one environment to another. CoE teams can create a process to package the solution components, deploy it to a target environment and finally delete it from the Default Environment. To successfully migrate an app or flow over to a different environment perform the following steps:

1.  Create a solution and add the app and all its dependencies into it. The dependencies include the apps, flows, table schemas.

2.  The solution can then be exported from the default environment and imported to a different environment.

3.  Ensure that all users who had access in the default environment are added to the target environment with the relevant security roles. Consider creating and using dedicated security group to manage users, irrespective of the number of users its shared with.

4.  Ensure that all configuration data or application data are migrated over to the new environment

5.  Test/Validate the application

6.  Notify the users of the new application and remove access to all users to the application in the default environment. \[Retain the access for a few admins/maker\]

7.  Eventually, delete the contents of the solution and then the solution itself from the Default Environment. Note that when tables are deleted, the data from the tables are lost as well. Ensure that you do not delete any shared assets. For example, if another app or flow uses a table, do not delete the table from dataverse.

You can learn more about solutions here: [Introduction to solutions - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/introduction-solutions)

## Quarantining Apps

Power Apps exposes a functionality that allows the Power Platform admin to quarantine a Canvas App. Once quarantined the app cannot be run by users it has been shared with. You can also un-quarantine an app to restore access to the shared users. Only admins can change the state of an app. Makers will be allowed to edit an app irrespective of the quarantine status of the app.

In the Default Environment, this feature is particularly useful in several scenarios:

-   The organization wants to disable the app temporarily until the app is reviewed for use

-   Disabling access to an app which has been shared with many individual users

-   You can use this process to stand in for a "soft-delete" of an app when it is being upgraded or moved to a different environment as discussed in the previous section.

Quarantining an app is supported using three PowerShell cmdlets:

-   Quarantine - Allows the administrator to quarantine an App
``` 
Set-AppAsQuarantined -EnvironmentName <EnvironmentName> -AppName <AppName>
```

-   Un-Quarantine
```
Set-AppAsUnquarantined -EnvironmentName <EnvironmentName> -AppName <AppName>
```

-   Get Quarantine State
```
Get-AppQuarantineState -EnvironmentName <EnvironmentName> -AppName <AppName>
```

## Designated SharePoint Form Environment

Power Platform is tightly integrated with the rest of the Microsoft enterprise ecosystem. This allows any user (irrespective of their skill developing applications) to build high impact automations and applications for themselves or their teams. One of the most powerful examples is the integration between SharePoint and Power Platform. You can create or customize a SharePoint form using Power Apps ([read more here](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/customize-list-form)) .

When a user creates a custom SharePoint form in SharePoint, a canvas app is created in the Default Environment. In large organizations, this can result in a lot of apps created in the default environment. To avoid this, create a separate environment and designate it to store the custom SharePoint forms. This allows Power Platform admins to separate out the SharePoint forms from the general productivity apps in the default environment.

To change the SharePoint form environment:

1.  Create a separate Environment to store the SharePoint forms.

2.  Assign all the users who create or update forms the Environment Maker role in the new environment.

3.  Use the following [Power Shell cmdlet to set the SharePoint form environment](https://docs.microsoft.com/power-platform/admin/powerapps-powershell#designate-sharepoint-custom-form-environment)
```
  Set-AdminPowerAppSharepointFormEnvironment --EnvironmentName '<EnvironmentName>'
```
Key points to keep in mind:

1.  Existing SharePoint forms will not be migrated over to the new SharePoint form environment.

2.  If you delete the SharePoint form Environment after setting it, the SharePoint forms will be lost and the user interface will revert back to using the default SharePoint form.

3.  If a user tries to create a custom SharePoint form after the SharePoint form environment is deleted, to the canvas app will be created in the default environment.

4.  This command applies only for SharePoint forms customized by Power Apps. Power Automate flows created from SharePoint always leverage the default environment.

## Backup and Restore of Default Environment

Like every other environment type (sandbox, production, developer), default environment also gets archived. However, there is no manual backup that you can request for this environment. Restore operation is a possibility like every other environment and needs to go through a support ticket. A big caution on trying to restore default environment is that you need to consider the cleanup of all those test apps and flows that are created.