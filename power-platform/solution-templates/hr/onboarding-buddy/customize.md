---
title: Customize the Onboarding Buddy app
description: Learn how to customize the Onboarding Buddy app.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 09/29/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Learn how to customize the Onboarding Buddy app

The Onboarding Buddy app should be customized to fit how you want to run the program in your organization.  

To customize the application, create a new unmanaged solution in the same environment. Add the components from the Onboarding Buddy solution that you want to customize – such as the Onboarding Buddy App. Once you've added components to your new unmanaged solution, you can begin to customize to meet your additional requirements.  

The remainder of the documentation assumes that:

- You've created a new, unmanaged solution in your environment.
- You've added the components from the *managed* Onboarding Buddy App that you want to modify into your new *unmanaged* solution.
- You're editing those components in the unmanaged solution.

More information:

- [Solution concepts](/power-platform/alm/solution-concepts-alm)
- [Solution layers](/power-platform/alm/solution-layers-alm)

## Tailor program emails

There are four emails automatically sent by the "Buddy Onboarder Emails" flow:

- **Initial Email**is sent at the beginning of the match.
- **End Email** is sent the day the match ends.
- **First Nudge Email** is sent *X* days after the match starts and is configurable in the *Configuration table*.
- **End Nudge Email** is sent *Y* days before the match ends and is configurable in the *Configuration table*.

You can use the emails to communicate program expectations, link to useful resources, and other information necessary to set the Onboarder up for success and close out the match appropriately.

:::image type="content" source="media/customize/ob-customize-emails.png" alt-text="Screenshot of setting up a flow for an email communication.":::

> [!IMPORTANT]
> The emails are set up as generic communications. It is important that you customize the emails to suit your program's goals.

### Edit emails

Once you've added the *Buddy Onboard Emails* flow, you can edit the emails.

1. Go to the *unmanaged* Onboarding Buddy solution where you added the email flow.
1. Select the **Buddy Onboard Emails** flow.
1. Find the email you want to update in the flow and make your changes.
1. Save your flow.

## Update program information in the user interface

 You can customize the graphics and content in three introductory screens:

- Signup Screen
- Welcome Screen 1
- Welcome Screen 2

These screens allow you to introduce the buddy program and offer related details to your program participants.

:::image type="content" source="media/customize/ob-customize-intro-screens.png" alt-text="Screenshot of the three introductory Onboarding Buddy app screens.":::

### Customize the introductory screens

Customizations take place in a new, unmanaged solution. Follow the steps to customize:

1. Add **Onboarding Buddy** to your new, unmanaged solution where you plan to perform all your customizations.
1. Change the graphics and text to meet your program's needs.
1. Edit two screens in the app. They are:
    1. FP Landing Screen
    1. FP Message Screen
        1. This screen is both *Welcome Screen 1* and *Welcome Screen 2*. Only the text changes as the user selects *Next* or *Back*.

### Modify matching attributes

The Onboarding Buddy template uses *Regions* and *Organizations* as examples for how Buddies and Onboarders can be matched up. There are a couple of ways that you may need to modify them.

- You'll need to update the values for Regions and Organization so they are useful for matching in your organization.
- Additional or different attributes and logic are most likely needed to make the program work successfully in your organization.

#### Update Regions and Organization

1. Add **Region** and **Organization** as choices to your unmanaged solution where you are performing customizations.
1. Select the *Choice* component you want to edit. Make changes and select **Save**.
:::image type="content" source="media/customize/ob-customize-reg-org.png" alt-text="Power Apps screenshot of the Regions and Organization selections in the Choices section.":::

#### Change matching attributes and logic

There are many ways that you may want to change the matching logic. Here are some examples:

- Add a new choice attribute to match on. For more static sets of values – especially those that may be shared with other applications, choice components can be a good choice.
- Add a table-driven attribute to match on. If you need to add or change values in a matching attribute, creating a table to store those values will make it easier to update over time vs. a choice component.
- Allow the user to self-select attribute filters to find available buddies. Rather than force Region and Organization matching, allow the user to see various available buddies by adding a user-configurable filter to the matching screen.

To change the user interface or logic, you'll need to modify the *Buddy Matches* screen.
:::image type="content" source="media/customize/ob-customize-mod-match.png" alt-text="Power Apps screenshot Buddy Matches screen that can be edited.":::

The gallery, *galBuddies_BuddyMatches*, contains the filter code for matching buddies in the *Items* property:

`Filter('Buddy Lists', Region = varMatchedOnboarder.Region && Organization=varMatchedOnboarder.Organization && Available = true && Status = 'Status (Buddy Lists)'.Active && 'Status Reason' = 'Status Reason (Buddy Lists)'.Active)`

Adding filter ux components and modifying the gallery code will allow you to customize the matching process appropriately for your organization.

## Next steps

- [Get started managing the Onboarding Buddy app](manage.md)
