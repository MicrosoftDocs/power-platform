---
title: "Example processes | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Monitor

The Monitor section gives you the ability to query basic inventory (Environments, Apps, Flows, Makers, Connectors, Audit Logs) to monitor usage across your entire tenant and within each environment. These reports also support drill downs and filtering, for example by maker department/country/city, connector usage, and premium feature usage.

## Overview – Power Apps and Power Automate

The **Overview – Power Apps and Power Automate** page provides you with a
tenant-wide overview of resources:

- Total Number of Environments (and Environments created this month)

- Total Number of Environment Makers

- Total Number of Custom Connectors

- Total Number of Apps, App Makers and Apps created this month

- Total Number of Flows, Flow Makers and Flows created this month

The visualizations highlight environments and makers with the most resources and show a map of where your makers are based.

:::row:::
   :::column span="":::
      ![Overview Power Apps](media/pb2.png)
   :::column-end:::
   :::column span="":::
      ![Power Power Automate](media/pb3.png)
   :::column-end:::
:::row-end:::

## Environments

The **Environments** page shows you how many environments, environment makers
and CDS instances you have.

The graphs visualize:

- Environment creation trend by environment type

- Number of resources per environment

- Number of environments by type

- Top environment creators

The filters allow you to drill down and analyse specific environment types and maker trends as well as changes over time through a filter on Environment Created date.

![Environments overview](media/pb4.png)

## Apps

The **Apps** page provides an overview of apps in your environment:

- Total Number of Apps

- Total Number of Apps created this month

- Total Number of App Makers

- Total Number of Canvas Apps and Model Driven Apps

- Number of Production Apps (The definition of a Production App is 50 active sessions or active sessions by 5 unique users for the same app in a month.)

On the graphs, you will be able to see your app creation trend, your top active departments, and environments with the highest number of apps. A list view of all apps enables you to sort your apps by unique users, sessions, users and
groups shared with, and last launched date.

Filters on this page can help you narrow down this view by app owner, app display name, environment, maker department and connector used.

![Apps overview](media/pb5.png)

## Flows

The **Flows** page provides an overview of apps in your environment:

- Total Number of Flows

- Total Number of Flows created this month

- Total Number of Flow Makers

- Total Number of Suspended and Stopped Flows

Through visuals, you will be able to see your flow creation trend, your top active departments and top environments. A list view of all flows enables you to sort your flows by number of actions in a flow, creator and flow state.

Filters on this page can help you narrow down this view by flow owner, flow display name, environment, maker department and connector used.

![Flow Overview](media/pb6.png)

## Custom Connectors

The **Custom Connectors** page helps you understand what [custom connectors](https://docs.microsoft.com/connectors/custom-connectors/) you have, what endpoints they are connecting to and which resources are using the custom
connector.

Next to the total number of custom connectors and number of test connectors (those that have the word Test in the display name), you will also see a connector creation trend, top connector makers and the link between a connector
and its consuming flow or app.

Filters help you narrow down the view by connector creator, environment and created date.

![Custom Connector Overview](media/pb9.png)

## Connections

The **Connections** page shows what resources and makers are using which connectors, and at a high-level which resources and makers are using premium features.

The filters on this page are:

- Connector tier (premium or standard)

- Connector (Office 365 Users, Common Data Service, Azure AD)

The visuals then show you a list of all apps, flows and makers using the tier or connector specified – as well as the number of connections for the filters<!---KATHY SAYS: yes?---> specified.

![Connections](media/pb8.png)
