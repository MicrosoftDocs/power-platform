---
title: "Licensing and license management  | MicrosoftDocs"
description: About licensing and license management.
author: dileepsinghmicrosoft

ms.component: pa-admin
ms.topic: conceptual
ms.collection: get-started
ms.date: 11/02/2021
ms.subservice: admin
ms.author: dileeps
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# About licensing and license management

Organizations can obtain licenses by either licensing Microsoft Power Apps or Microsoft Power Automate specifically or by it being included in the license of another Microsoft cloud service offering. For example, both Microsoft 365 and Dynamics 365 provide entitlements for Power Apps and Power Automate. As with most Microsoft licensing, you can mix and match for users as appropriate, giving some additional entitlements.

In the rest of this section, we will highlight some of the key implications and scenarios related to licensing, but it is not the product licensing documentation. You should consult licensing documentation for the latest details. Pricing and specific plan details for Power Apps and Power Automate can be found in the [licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Use of connectors

Power Apps and Power Automate use connectors to interact with services. Connectors can be [standard](/connectors/connector-reference/connector-reference-standard-connectors), [premium](/connectors/connector-reference/connector-reference-premium-connectors), or [custom](/connectors/custom-connectors/). To use premium connectors for Power Apps, users must have Power Apps licenses or use [pay-as-you-go plan](pricing-billing-skus.md). To use premium connectors for Power Automate, users must be licensed with Standalone Power Automate licenses.  

## Trial Plans

Trial plans are available for both Power Apps and Power Automate. Free trials last 30 days for Power Apps and 90 days for Power Automate plans. Users can self-service sign up for these trials in your organization. This can be done by explicitly visiting the pricing pages or by being prompted when they attempt an action in the apps that require additional licensing.

For Power Automate, an unlicensed user who signs into flow.microsoft.com will be set up with the *free* Power Automate plan. If later they try to perform an action like sharing a flow, they'll be prompted to sign up for a *trial*. In this example, if the user accepted the offer for trial they would be signed up for a Power Automate trial. This trial wouldn't show up under the user licenses in the Microsoft 365
Portal, however you can see it in the Power Apps license report discussed later in the security section.

For Power Apps, if a user signs up for a Power Apps trial, they'll get a Power Apps per user trial if needed for any of the actions they take such as creating an environment.

As the administrator, you'll likely be assisting users that had started in a trial and either want to continue experimenting or are ready to get a regular license to keep working with the app they are building. If you are moving to a regular license for a user, it would also be a good time to work with them to see if their app should stay where it was built or should be moved according to the environment strategy you adopt. For those not ready to get a full license but want to keep experimenting you could help them get set up on the developer plan and help them move their application and flow assets into their new developer environment.

## Power Apps Developer Plan

In addition to the trial plans, there's also a *free* Power Apps Developer Plan. This is a special plan that allows up individual self-service sign and it provides an individual environment that the user can use to build apps and flows. These environments will show up on the administrator’s list of environments and will list the type of environment as “Developer”. The environments are for individual use, so there's no ability to share with other users. Users in your organization can self-service sign up for this plan even if they have Power Apps and Power Automate license entitlements via another licensing plan. Sign-up for the Power Apps Developer Plan can be found [here](https://powerapps.microsoft.com/communityplan/) and more details on its features [here](/powerapps/maker/dev-community-plan).

## What users are licensed

You can always look at individual user licensing in the Microsoft 365 admin center by drilling into specific users. 

You can also use the following PowerShell command to export assigned user licenses.

```powershell
Get-AdminPowerAppLicenses -OutputFilePath '<licenses.csv>'
```

Exports all the assigned user licenses (Power Apps and Power Automate) in your tenant into a tabular view .csv file. The exported file contains both self-service sign-up internal trial plans and plans that are sourced from Microsoft Entra ID. The internal trial plans aren't visible to admins in the Microsoft 365 admin center.

The export can take a while for tenants with a large number of Microsoft Power Platform users.



[!INCLUDE[footer-include](../includes/footer-banner.md)]