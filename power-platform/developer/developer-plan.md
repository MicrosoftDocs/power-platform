---
title: "Get started with the Power Platform"
description: "Get started with Power Platform"
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.custom: ""
ms.date: 06/14/2022
ms.reviewer: 
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerPlatform
  - PowerApps
  - Azure
---

# Get started with the Power Platform

The most simple way to get access to a power platform environment is to sign up for the Power Apps Developer plan. You can explore the power platform at full potential for learn, at no cost.

To fully use it as a developer, you'll need an Azure account and a work account. This article will guide you through the process for creating a Power Platform environment and a test tenant if needed.

## Where do I start?

If you have a work account, and want to use it to learn Power Platform, [Sign up for the Power Apps Developer Plan](#power-apps-developer-plan).

If you don't have a work account or prefer a Sandbox tenant to learn Power Platform, [create a test tenant](#how-to-create-a-test-tenant) before signing up for the developer environment.

## Power Apps Developer Plan

The Power Apps Developer Plan gives you a free development environment to build and test with Power Apps, Power Automate, and Microsoft Dataverse.

It's simple to sign up for the Power Apps Developer Plan:

1. Be sure you have a work account. If you don't, create a test tenant first.
2. Sign up on the [Power Apps Developer Plan website](https://aka.ms/PowerAppsDevPlan).

:::image type="content" source="./media/devplan-signup.gif" alt-text="Animation demo of developer plan sign-up.":::

After signing up for the Developer Plan, you'll be redirected to Power Apps. The environment will be shown with your name, for example "John Doe's environment." If there's already an environment with that name, the developer new environment will be named "John Doe's (1) environment."

![Maker Portal.](media/devplan-makerportal.png "Maker Portal")

> [!IMPORTANT]
> - Use the developer environment instead of your tenant’s default environment to work with certain capabilities such as premium and custom connectors.
> - You might need to select your developer environment from the top-right corner of the screen.
> - It might take a couple of minutes for the new environment to be provisioned and become available in the list of the environments. You can see the progress of the environment creation in the [Power Platform admin center](https://admin.powerplatform.com).

> [!WARNING]
> - In some situations, your admin might have turned off the sign up process. In this case, please contact your administrator, or create a test tenant.
> ![Viral Blocked.](media/devplan-viralblocked.png "Viral Blocked")

For detailed information about the developer plan, visit: [Sign up for the Power Apps Developer Plan](../../power-apps/maker/developer-plan.md).

## How to create a test tenant

If you don't already have a dedicated test tenant, you can create one for free, using the Microsoft 365 Developer Program or manually create one yourself.

The Microsoft 365 Developer Program is free and can have test user accounts and sample data packs automatically added to the tenant.

You'll need a work account or a microsoft account to sign up. Use either your personal email address or set up a separate email address/Microsoft account to be used when you start the registration process for the Microsoft 365 Developer Program.

1. Select the Join now button on the screen.
2. Sign in with a new Microsoft Account or use an existing (work) account you already have.
3. On the sign-up page select your region, enter a company name and accept the terms and conditions of the program before you select Next.
4. Select Set Up Subscription. Specify the region where you want to create your new tenant, create a username, domain, and enter a password. This step will create a new tenant and the first administrator of the tenant.
5. Enter the security information, which is needed to protect the administrator account of your new tenant.  This step will set up multi-factor authentication for the account.

:::image type="content" source="./media/devplan-m365signup.gif" alt-text="Animation demo of Microsoft 365 dev sign-up.":::

You can also [manually create a test tenant](https://learn.microsoft.com/azure/active-directory/develop/quickstart-create-new-tenant)

Now that you have your test tenant, [sign up for the Power Apps Developer Plan](#power-apps-developer-plan)

### See also

[Power Platform for developers](get-started.md)<br/>
[Fusion Development](fusion-development.md)<br/>

[!INCLUDE[footer-include](../includes/footer-banner.md)]