---
title: "Deployment scenarios | MicrosoftDocs"
description: Deployment scenarios.
ms.custom: ""
ms.date: 09/27/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Deployment scenarios 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Now that you have read through the platform architecture section and the data protection concepts, and have a good grasp of all the individual components, let’s look at some scenarios and how you might handle deploying them. This assumes you created some default data loss prevention policies like what we suggested in the compliance and data protection section of the document. These scenarios represent possible deployment configurations but are not the only ways you could deploy the given scenario. Use them to inspire how you want to handle things in your organization.

## Canvas app or Flows that are built to share with others (wp)

In this scenario a user built a flow in the default environment that uses only connectors that are allowed by your DLP policies.

For this scenario there is no need for additional DLP policies or environments. The user can share the flow themselves, with other users either as co-owners if they want them to be able to edit it, or for run-only.

## Canvas app or Flows with connectors violating existing DLP (wp)

A user started building a PowerApp, canvas app or a Flow and after adding two connectors, was informed that one of the connectors violated the DLP policies. They approached you for how they could get an exception.

For this scenario you have three primary options; deny the request, add the connector to your existing tenant wide policy or create environment(s) to support the exception. If you decide to update your existing tenant-wide DLP do so understanding it would apply to all environments and all PowerApps and Flows; there are not exceptions to that policy.

If you decide to allow an exception in a special environment, this could be a shared environment that is used by any users you give an exception to or it could be a separate environment for the user or team needing the exception.

## Canvas app or Flows with existing CDS database (wp)

A user or team wants to build an application that leverages data that already exists in CDS. They do not plan to make any schema changes to CDS.

For this scenario the CDS database would exist in an environment other than default (since you can’t currently create a CDS instance in default). The canvas apps or flows can’t therefore be built in the default environment using the CDS connectors but could if they use the Dynamics 365 connector which allows you to select the CDS instance from a separate environment.

The next decision comes down to if there is need for test data. If there is, then building the app in the test environment with the CDS connector would allow the app to be promoted to the production CDS environment once development and testing was completed. Since the app used the CDS connector it would be able to be simply exported and re-imported into the production environment without having to change the references to test. This assumes that test and production CDS environments have the same schema.

## Canvas or model-driven apps and/or Flow with CDS – Multiple Teams (wp)

Multiple teams in your organization want to build applications with each having either a PowerApp model-driven app component or some of their own CDS schema customizations. In this scenario some teams’ applications might want to leverage some of the data from other teams’ applications. The goal is to have a centralized CDS that all these teams interact with, and not a silo of data for each teams’ applications.

For this scenario you could have one main CDS production environment that contains all the applications once they are deployed for use by the broad set of organization users. Each team that is building an application would have their own CDS environment. Each team would release updates to their application in the form of managed CDS solutions. These managed CDS solutions would be imported into the CDS production environment. If there were test or staging or UAT environments that would happen prior to the import to production to support testing. But it would be the same managed solution imported into each that was exported from the development instance.

If a team depended on other teams’ schema or other CDS assets, they would import that dependent team’s managed solution into their CDS development environment. That would of course make their solution dependent on the other team’s application.

By having each team do their development work in their own environment allows each application to develop independently of the other applications in your organizations. While at the same time keeping a centralized data repository that all apps could interact across the enterprise data.

Some governance is needed in this type of environment to ensure applications coming into the shared environment do not make conflicting design decisions. For a simple example, some of the shared common entities like Account or Contact, you wouldn’t want individual applications trying to rename those entities differently.
With this setup, the CDS environment could also contain Dynamics 365 applications co-existing with your internally built applications.


