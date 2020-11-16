---
title: "Governance components  | MicrosoftDocs"
description: "The governance components solution provides assets to automate common auditing and compliance scenarios."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use governance components

After you've become familiar with your environments and resources, you might start thinking about governance processes for your apps. You might want to gather additional information about your apps from your makers, or audit specific connectors or app usage.

## Demo: Governance components

Watch how to use the governance components solution.

> [!VIDEO https://www.youtube.com/embed/6bfaFsFtLow]

The governance components solution contains assets relevant to admins and makers. More information: [Set up governance components](setup-governance-components.md)

Here's a breakdown of the assets that form the governance components:

- Sample audit process
  - [Developer Compliance Center (canvas app)](#apps)
  - [Compliance Detail Request (flow)](#flows)
  - [Business process flows for auditing resources](#business-process-flows)

- Archive unused apps
  - [App and Flow Archive and Clean Up – Start Approval and Check Approval (flows)](#flows)
  - [App Archive and Clean Up View (model-driven app)](#apps)

## Entities

### Archive Approval

Represents archival approval tasks started during the App Archive and Clean Up flow.

## Flows

### Admin \| Compliance Detail Request

This flow works in conjunction with other apps and flows in the CoE Starter Kit to facilitate the process described in [App auditing process](example-processes.md). Compliance detail request emails are sent for apps and chatbots.

This flow sends an email to users who have apps in the tenant that aren't compliant with the following thresholds:

- The app is shared with more than 20 users or at least one group, and no business justification details have been provided for it.

- The app does have business justification details, but hasn't been published in 60 days (so it's likely not on the latest version of Power Apps) or is missing a description.

- The app has business justification details and an indication of high business impact, but no mitigation plan has been submitted to the attachments field.

This flow sends an email to users who have chatbots in the tenant that aren't compliant with the following thresholds:

- The chatbot has been launched more than 50 times, and no business justification details have been provided for it.

- The chatbot has business justification details and an indication of high business impact, but no mitigation plan has been submitted to the attachments field.

You can customize the email sent out by the flow; by default, it will look like the following image.

![The compliance detail request email informs a maker that they own an app that is currently missing compliance details which means it needs to be audited by an administrator per the support policy. Makers are prompted to complete the business justification and mitigation plan details in the Developer Compliance Center app to document the intended use of the app.](media/coe55.png "The compliance detail request email informs a maker that they own an app that is currently missing compliance details which means it needs to be audited by an administrator per the support policy. Makers are prompted to complete the business justification and mitigation plan details in the Developer Compliance Center app to document the intended use of the app.")

### Admin \| App Archive and Clean Up – Start Approval

Checks for apps that haven't been modified in the last six months (this time span is configurable) and asks the app owner (via flow approvals) whether the app can be archived.

This flow starts the approval process and writes the approval task to the Archive Approval Microsoft Dataverse entity.

![App Archive and Clean Up – Start Approval flow](media/coe58.png "App Archive and Clean Up – Start Approval flow")

### Admin \| App Archive and Clean Up – Check Approval

On a scheduled interval, checks for approval responses created by the App Archive and Clean Up – Start Approval flow and, if approved, archives the app file to SharePoint.

**Prerequisite**: Create a SharePoint document library to store the archived apps, and configure this in the environment variable.

**Customize**: By default, this flow will archive the application but not remove it or its permission from the environment, so that no apps are inadvertently removed from your tenant. To delete the app, update the [*Auto Delete On Archive* environment variable](setup-governance-components.md#update-environment-variables).

### Admin \| Flow Archive and Clean Up – Start Approval

Similar to the previous flow, but for flows rather than apps. This flow checks for flows that haven't been modified in the last six months (this time span is configurable) and asks the flow owner (via flow approvals) whether the flow can be archived.

This flow starts the approval process and writes the approval task to the Archive Approval Dataverse entity.

### Admin \| Flow Archive and Clean Up – Check Approval

Similar to the previous flow, but for flows rather than apps. On a scheduled interval, this flow checks for approval responses created by the Flow Archive and Clean Up – Start Approval flow and, if approved, archives the flow files to SharePoint. It archives two files per flow, one with the flow content, the other with the flow connections.

**Prerequisite**: The same SharePoint document library that's used to store the archived apps can be used to store archived flows.

**Customize**: By default, this flow will archive the flow but not remove it or its permission from the environment, so that no flows are inadvertently removed from your tenant. To delete the flow, update the [*Auto Delete On Archive* environment variable](setup-governance-components.md#update-environment-variables).

## Apps

### Developer Compliance Center

This app is used in the [auditing process](example-processes.md) as a tool for users to check whether their app, flow, chatbot or custom connector is compliant, and to submit information to the CoE admins as business justification to stay in compliance.

**Permission**: As soon as you're using the app auditing process, this app needs to be shared with your app makers. If you intend to use this process, modify the [Welcome email](setup-nurture-components.md) flow to add users to a security group, and then share this app with the security group.

**Prerequisite**: This app uses Dataverse; a Premium license is therefore required for each app user.

#### Compliance Status

A traffic light indicates how compliant the resource is in relation to a predefined rule set.

- **Apps** are compliant if the app description is populated, the business justification is submitted, and the app has been published in the past 60 days.
- **Flows** are compliant if the flow description is populated, the business justification is submitted, and the flow isn't suspended.
- **Chatbots** are compliant if the chatbot description and the business justification are populated, and the chatbot isn't suspended.
- **Custom connectors** are compliant if the custom connector description, business justification, and conditions of use are populated.

**Customize**: Verify that the compliance criteria matches your requirements, and update if necessary.

Makers can achieve compliance by providing additional information through the **Support Details** form:

- **Business Justification**: Describe the business need and the problem you're solving with this solution.
- **Business Impact**: Define the operational impact this solution has on the people using it.
- **Access Management**: Describe who has access to this resource, how access is managed (individual user access or access through group membership) and how joiners/movers/leavers processes are managed.
- **Dependencies**: Describe any dependencies this solution uses, for example external or internal APIs or Azure resources.
- **Conditions of use**: (For connectors only) Describe in which situations the connector can and should be used.
- **Mitigation Plan provided**: For critical solutions, upload a mitigation plan that details what business users will do in the event of an outage.

**Customize**: Verify that the **Support Details** form matches your requirements, and update if necessary.

:::row:::
   :::column span="":::
      ![Developer Compliance Center overview](media/coe56.png "Developer Compliance Center overview")
   :::column-end:::
   :::column span="":::
      ![Developer Compliance Center app detail](media/coe57.png "Developer Compliance Center app detail")
   :::column-end:::
:::row-end:::

## Model-driven app

### App Archive and Clean Up View

A model-driven app that provides an interface to canvas apps that have been highlighted for archiving and their approval status. This model-driven app works in conjunction with other apps and flows in the CoE Starter Kit to facilitate the process described for the [app auditing process](example-processes.md).

**Customize**: Instead of using this model-driven app, you can modify the Power Platform Admin View app to show the Archive Approval entity.

![App Archive and Clean Up View](media/coe61.png "App Archive and Clean Up View")

## Business process flows

### Power Apps App Approval BPF

This process helps the admin audit the app approval process by providing a visualization of the stage in the process they're currently on. The audit stages are:

- Validate maker requirements.
- Assess risk.
- Highlight the app in the app catalog.

:::row:::
   :::column span="":::
      ![Power Apps App Approval BPF - Implementation](media/coe62.png "Power Apps App Approval BPF - Implementation")
   :::column-end:::
   :::column span="":::
      ![Power Apps App Approval BPF - Validate Maker Requirements](media/coe63.png "Power Apps App Approval BPF - Validate Maker Requirements")
   :::column-end:::
:::row-end:::

### Flow Approval BPF

This process helps the admin audit the flow approval process by providing a visualization of the stage in the process they're currently on. The audit stages are:

- Validate maker requirements.
- Assess risk.
- Complete the admin review.

:::row:::
   :::column span="":::
      ![Flow Approval BPF - Implementation](media/bpf1.png "Flow Approval BPF - Implementation")
   :::column-end:::
   :::column span="":::
      ![Flow Approval BPF - Validate Maker Requirements](media/bpf2.png "Flow Approval BPF - Validate Maker Requirements")
   :::column-end:::
:::row-end:::

### Custom Connector Approval BPF

This process helps the admin audit the custom connector approval process by providing a visualization of the stage in the process they're currently on. The audit stages are:

- Validate maker requirements.
- Assess risk.
- Complete the admin review.

:::row:::
   :::column span="":::
      ![Custom Connector Approval BPF - Implementation](media/bpf5.png "Custom Connector Approval BPF - Implementation")
   :::column-end:::
   :::column span="":::
      ![Custom Connector Approval BPF - Validate Maker Requirements](media/bpf4.png "Custom Connector Approval BPF - Validate Maker Requirements")
   :::column-end:::
:::row-end:::

### Chatbot Approval BPF

This process helps the admin audit the chatbot approval process by providing a visualization of the stage in the process they're currently on. The audit stages are:

- Validate maker requirements.
- Assess risk.
- Complete the admin review.

:::row:::
   :::column span="":::
      ![Chatbot Approval BPF - Implementation](media/bpf7.png "Chatbot Approval BPF - Implementation")
   :::column-end:::
   :::column span="":::
      ![Chatbot Approval BPF - Validate Maker Requirements](media/bpf6.png "Chatbot Approval BPF - Validate Maker Requirements")
   :::column-end:::
:::row-end:::

### Activate the business process flows

All business process flows are disabled by default. To enable them, do the following:

1. Go to [make.powerapps.com](<https://make.powerapps.com>) and set the current environment to the same environment where the CoE solution is installed.

1. Select **Solutions** > **Center of Excellence**.

1. Select **Process** from the filter option at the top.

1. In **Power Apps App Approval BPF**, select the ellipsis (…) button, and then select **Turn On**.

1. Repeat the previous step for **Flow Approval BPF**, **Custom Connector Approval BPF**, and **Chatbot Approval BPF**.
