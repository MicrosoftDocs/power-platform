---
title: "Governance Components  | MicrosoftDocs"
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
# Use Governance components

Once you are familiar with your environments and resources, you might start thinking about governance processes for your apps. You might want to gather additional information about your apps from your makers, or you might want to audit specific connectors or app usage.

The Governance Components solution contains assets relevant to admins and makers.

Learn how to [set up the governance components](setup-governance-components.md).

Here's a breakdown of the assets that form the Governance components:

1. **Sample Audit Process**
    1. [Developer Compliance Center (Canvas App)](#apps)
    1. [Flow – Compliance detail request](#flows)
    1. [Business Process Flow for Auditing resources](#business-process-flow)
1. **Archive unused apps**
    1. [App Archive and Clean Up – Start Approval and Check Approval (Flows)](#flows)
    1. [App Archive and Clean Up Admin View (Model Driven App)](#apps)
1. **Act based on certain connector usage**
    1. [Find and add admins as owners for apps that leverage certain connectors (Flow)](#flows)
    1. [Find and disable flows that leverage certain connectors (Flow)](#flows)

## Entities

- **Archive Approval** Represents archival approval tasks started during the *App Archive and Clean Up* flow

## Flows

### Admin \| Compliance detail request

This flow works in conjunction with other apps and flows in the CoE toolkit to facilitate a process described in the following section: [PowerApps App Auditing
Process](example-processes.md).

It sends an email to users who have Power Apps apps in the tenant that are not compliant with specific thresholds:

- The app is shared with \> 20 Users or at least 1 group and the business justification details have not been provided.

- The app has business justification details provided but has not been published in 60 days (so is likely not on the latest version of Power Apps) or is missing a description.

- The app has business justification details provided and has indicated high business impact and has not submitted a mitigation plan to the attachments field.

You can customize the email sent out by the Flow; by default it will look like the following:  

![Compliance Detail Request email](media/coe55.png)

### Admin \| App archive and clean up – Start Approval

Checks for apps that have not been modified in the last six months (configurable) and asks the app owner (via Flow Approvals) if the app can be archived.

This flow starts the approval process and writes the Approval Task to the *Archive Approval* CDS Entity.

![App archive and clean up – Approval](media/coe58.png)

### Admin \| App archive and clean up – Check Approval

Monitors Approval responses of the *App Archive and Clean Up – Start Approval* flow and, if approved, archives the app file to SharePoint.

**Pre-Requisite**: Create a SharePoint document library to store the archived apps and configure this in the Environment Variables.

**Customize**: By default, this flow will archive the application but not remove it or its permission from the environment, so that we do not inadvertently remove apps from your tenant. Update this flow based on your requirements, to delete the app from the environment or remove app permissions.

### SETUP REQUIRED \| Admin \| Find and disable flows that leverage certain connectors

Checks if any Flows are using specific connectors, notifies the Flow maker and disables the Flow. The admin will receive a report.

**Customize**: On setup, the array provided is blank so that we do not inadvertently disable flows in your tenant. You must specify what connectors you want to audit by editing the flow and updating the *disableConnectorArray* as shown for the connectors of your choice.  

![Find and disable flows that leverage Certain connectors](media/coe59.png)

![Find and disable flows that leverage Certain connectors](media/coe60.png)

### SETUP REQUIRED \| Admin \| Find and add admins as owners for apps that leverage certain connectors

Checks for apps that leverage certain connectors, notifies the app maker, and shares the app with the admin security group.

**Customize**: On setup, the array provided is blank so that we do not inadvertently add owners to apps with connectors in your tenant. You must specify what connectors you want to audit by editing the Flow and updating the *disableConnectorArray* as shown for the connectors of your choice.  

## Apps

### Developer Compliance Center

This app is used in the [PowerApps App Auditing
Process](example-processes.md), as a
tool for users to check if their app is compliant and to submit information to the Center of Excellence admins as business justification to stay in compliance.
They can also use the app to update the description and re-publish, which are
other ways to stay in compliance.

**Permission**: Once you are using the [PowerApps App Auditing Process](example-processes.md), this app needs to be shared with your App Makers. If you are intending to use this process, modify the *Welcome email* (see [Set up nurture components](setup-nurture-components.md))
flow to add users to a Security Group and then share this app with the Security Group.

**Pre-Requisite**: This app uses CDS; a Premium license is therefore required for each app user.

**Customize**: Verify that the Support Details form matches your requirements, and update if necessary.

:::row:::
   :::column span="":::
      ![Developer Compliance Center Overview](media/coe56.png)
   :::column-end:::
   :::column span="":::
      ![Developer Compliance Center App Detail](media/coe57.png)
   :::column-end:::
:::row-end:::

## Model-Driven app

### App Archive and Clean Up View

A model driven app that provides an interface to canvas apps that have been highlighted for archiving, and their approval status.

This model driven app works in conjunction with other apps and flows in the CoE toolkit to facilitate the process described in the following section: [PowerApps
App Auditing Process](example-processes.md)

**Customize**: Instead of using this model-driven app, you could modify the Power Platform Admin View app to show the *Archive Approval* entity.

![App Archive and Clean Up View](media/coe61.png)

## Business Process Flow

### Power Apps App Approval BPF

This process helps the admin audit the app approval process by providing a visualization of the stage in the process they are currently on.

The audit stages are

- Validate maker requirements
- Assess risk
- Highlight in app catalog

:::row:::
   :::column span="":::
      ![Power Apps App Approval BPF - Implementation](media/coe62.png)
   :::column-end:::
   :::column span="":::
      ![Power Apps App Approval BPF - Validate Maker Requirements](media/coe63.png)
   :::column-end:::
:::row-end:::

#### Activate Business Process Flow

The Power Apps App Approval BPF is disabled by default. To enable it:

1. Go to [make.powerapps.com](<https://make.powerapps.com>) and set the current Environment to the same Environment where the Center of Excellence solution is installed.

1. Select **Solutions** \> **Center of Excellence**.

1. Select **Process** from the Filter option at the top.

1. Select the ellipse (…) menu of Power Apps App Approval BPF and \> **Turn On**.
