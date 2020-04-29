---
title: "Deployment scenarios  | MicrosoftDocs"
description: Deployment scenarios
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/13/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Deployment scenarios 

Let's look at some scenarios and how you might handle deploying them. This assumes you created some default data loss prevention (DLP) policies like what we suggested in the [compliance](wp-compliance-data-privacy.md) and [data protection](wp-data-loss-prevention.md) content. These scenarios represent possible deployment configurations but are not the only ways you could deploy the given scenario. Use them to inspire how you want to handle things in your organization.

## Canvas app or flows that are built to share with others 
In this scenario a user built a flow in the default environment that uses only connectors that are allowed by your DLP policies.

For this scenario there is no need for additional DLP policies or environments. The user can share the flow themselves, with other users either as co-owners if they want them to be able to edit it, or for run-only.

## Canvas app or flows with connectors violating existing DLP 

A user started building a model-driven app, a canvas app, or a flow and after adding two connectors, was informed that one of the connectors violated the DLP policies. They approached you for how to get an exception.

For this scenario you have three primary options: deny the request, add the connector to your existing tenant-wide policy or create environments to support the exception. If you decide to update your existing tenant-wide DLP, do so understanding it would apply to all environments and all apps and flows; there are no exceptions to that policy.

If you decide to allow an exception in a special environment, this could be a shared environment that is used by anyone you give an exception to or it could be a separate environment for the user or team needing the exception.

## Canvas app or flows with existing Common Data Service database 
A user or team wants to build an application that leverages data that already exists in Common Data Service. They do not plan to make any schema changes to Common Data Service.

For this scenario the Common Data Service database would exist in an environment other than default (since you can't currently create a Common Data Service environment in default). The canvas apps or flows can't therefore be built in the default environment using the Common Data Service connectors but could if they use the connector that allows you to select the Common Data Service environment from a separate environment.

The next decision comes down to whether there is a need for test data. If there is, then building the app in the test environment with the Common Data Service connector would allow the app to be promoted to the production Common Data Service environment once development and testing was completed. Since the app used the Common Data Service connector, it would be able to be simply exported and re-imported into the production environment without having to change the references to test. This assumes that test and production Common Data Service environments have the same schema.

## Canvas or model-driven apps and/or flow with Common Data Service – multiple teams 
Multiple teams in your organization want to build applications with each having either a Power Apps model-driven app component or some of their own Common Data Service schema customizations. In this scenario some teams' applications might want to leverage some of the data from other teams' applications. The goal is to have a centralized Common Data Service that all these teams interact with, and not a silo of data for each teams' applications.

For this scenario you could have one main Common Data Service production environment that contains all the applications once they are deployed for use by the broad set of organization users. Each team that is building an application would have their own Common Data Service environment. Each team would release updates to their application in the form of managed Common Data Service solutions. These managed Common Data Service solutions would be imported into the Common Data Service production environment. If there were test or staging or UAT environments, that would happen prior to the import to production to support testing. But it would be the same managed solution imported into each that was exported from the development environment.

If a team depended on other teams' schema or other Common Data Service assets, they would import that dependent team's managed solution into their Common Data Service development environment. That would of course make their solution dependent on the other team's application.

Having each team do their development work in their own environment allows each application to develop independently of the other applications in your organizations, while at the same time keeping a centralized data repository that all apps could interact with across the enterprise data.

Some governance is needed in this type of environment to ensure applications coming into the shared environment do not make conflicting design decisions. For a simple example, with some of the shared common entities like Account or Contact, you wouldn't want individual applications trying to rename those entities differently.

With this setup, the Common Data Service environment could also contain model-driven apps in Dynamics 365 co-existing with your internally built applications.

### See also
[About solution packages](wp-solution-packages.md)
