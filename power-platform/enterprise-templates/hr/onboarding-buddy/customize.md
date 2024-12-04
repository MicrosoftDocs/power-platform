---
title: Customize the Onboarding Buddy app
description: Learn how to customize the Onboarding Buddy app to fit your organization's requirements and goals, including emails, graphics, and matching attributes.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 02/21/2024
ms.custom: 
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:12/04/2023
ms.service: power-platform
ms.subservice: solution-templates
---

# Customize the Onboarding Buddy app

Customize the Onboarding Buddy app to fit how your organization wants to run its onboarding program.To customize the app, create an unmanaged solution in the same environment, add the components from the Onboarding Buddy solution that you want to customize, and start making changes to meet your requirements.

## Prerequisites

- You have a new, unmanaged solution in your environment.
- You added the components from the *managed* Onboarding Buddy solution that you want to modify into your new *unmanaged* solution.
- You're editing those components in the unmanaged solution.

Learn how to [create a solution](/power-apps/maker/data-platform/create-solution). Learn about [solution concepts](/power-platform/alm/solution-concepts-alm) and [solution layers](/power-platform/alm/solution-layers-alm).

## Customize program emails

Four emails are automatically sent by the **Buddy Onboarder Emails** flow:

- **Initial Email** is sent at the beginning of the match.
- **End Email** is sent the day the match ends.
- **First Nudge Email** is sent *X* days after the match starts. Set *X* in the `Configuration` table.
- **End Nudge Email** is sent *Y* days before the match ends. Set *Y* in the `Configuration` table.

You can use the emails to communicate program expectations, link to useful resources, and provide other information necessary to set up the Onboarder for success and close out the match appropriately.

:::image type="content" source="media/customize/ob-customize-emails.png" alt-text="Screenshot of setting up a flow for an email communication.":::

> [!IMPORTANT]
> The emails in the Onboarding Buddy template come with generic content. You should customize the emails for your organization.

### Edit emails

Once you've added the *Buddy Onboard Emails* flow, you can edit the emails.

1. Go to the *unmanaged* Onboarding Buddy solution and select the **Buddy Onboard Emails** flow.
1. In the flow, find the email you want to update and make your changes.
1. Save your flow.

## Update program information in the app user interface

 You can customize the graphics and content in three introductory screens to introduce and provide details about the buddy program. The screens are shown in the illustration that follows:

- Signup screen
- Welcome screen 1
- Welcome screen 2

:::image type="content" source="media/customize/ob-start-update.png" alt-text="Screenshot of the three introductory Onboarding Buddy app screens.":::

### Customize the introductory screens

1. Edit the **Onboarding Buddy canvas app** in your new, unmanaged solution.
1. Change the graphics and text on the screens as needed.
    1. **FP Landing screen** is the signup screen.
    1. **FP Message screen** is both Welcome screen 1 and Welcome screen 2. Only the text changes as the user selects *Next* or *Back*.
    1. Save your changes.

### Modify matching attributes

The Onboarding Buddy template matches Buddies and Onboarders using their *Regions* and *Organization* attributes. You can [change the values](#update-regions-and-organization) so that they're useful for matching Buddies with Onboarders in your organization, or [add different attributes and update the logic](#change-attributes-and-logic).

#### Update Regions and Organization

1. Add **Region** and **Organization** as choices to your unmanaged solution.
1. Select **Objects** > **Choices** > the component you want to edit.
1. Change what you need, and then select **Save**.
:::image type="content" source="media/customize/ob-customize-reg-org.png" alt-text="Power Apps screenshot of the Regions and Organization selections in the Choices section.":::

#### Change attributes and logic

You're not limited to matching Buddies and Onboarders by their region and organization. You have several ways to change how the solution matches Buddies and Onboarders. Here are some examples:

- Add a new choice attribute to match on. For static values, especially values that are shared with other applications, choice components can be a good option.
- Add a table-driven attribute to match on. If you need to add or change values often, creating a table to store them makes updates easier than using a choice component.
- Allow the user to self-select attribute filters to find available buddies. Rather than force Region and Organization matching, allow the user to see various available buddies by adding a user-configurable filter to the matching screen.

To change the user interface or logic, you need to modify the **Buddy Matches** screen. The `Items` property of the gallery **galBuddies_BuddyMatches** contains the Buddy matching filter code:

`Filter('Buddy Lists', Region = varMatchedOnboarder.Region && Organization=varMatchedOnboarder.Organization && Available = true && Status = 'Status (Buddy Lists)'.Active && 'Status Reason' = 'Status Reason (Buddy Lists)'.Active)`

To customize the matching process, add filter components and modify the gallery code as needed.

### Next step

[Get started managing the Onboarding Buddy app](manage.md).
