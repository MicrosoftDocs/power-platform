---
title: Use the Awards and Recognition app
description: Get started configuring and using the Awards and Recognition app.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 07/21/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Configure and use the Awards and Recognition app

You can set up an award and recognition program by configuring the Awards and Recognition Administration app and the Employee Experiences Base app to create a custom experience for your users in the Awards and Recognition app.

This article gets you started with how to use both the administrative and user apps.

## Create awards and assessment ratings

The first step to creating an awards program is to configure the awards. There are three high-level steps to creating an award:

- Create the award record.
- Upload an image that represents the award.
- Define the *Award Assessment Rating* questions (if applicable).

### Create the award record

Take these steps to create an award record:

1. Start the *Awards and Recognition Administration* app and select **Awards**.
1. Select **+ New** in the toolbar and fill out the *Name* and *Description* for the award. The description text should help nominators understand who might be eligible for a given award. Additionally, define whether the award can be made available to a single individual, multiple individuals (user-defined groups), or teams (pre-defined groups).
1. Select **Save**.

### Associate an image

The app is a visual experience, so it's important to assign an image to each award.

Take these steps to associate an image:

- Select **Choose file**.
- Choose the *image* you want and select **Open**.
- Wait until the image uploads, then select **Save**.

### Create assessment ratings

Adding assessment ratings to an award is an optional step that allows a nominator to assess additional traits related to the award. Take these steps to create assessment ratings for an award:

1. With the newly defined award on the screen, select **+ New Award Assessment Rating** in the *Award Assessment Ratings Questions* section. This will open up a new *Award Assessment Rating* form.
1. Specify the name of the trait to assess as part of the nomination for this award.
1. Provide details about how the nominator should assess the nominee in the *Description* section.
1. Specify the order in which it will be presented to the nominator.
1. Select **Save & Close**
1. Repeat steps one to five to add additional award assessment ratings as needed.

## Create groups

If any of your awards are being made available for a pre-defined team nomination, then you'll need to create each of these teams as *Groups* in the system. This allows the program administrator to control which teams are available for nomination.

To create a *Group*, take these steps:

1. Start the *Awards and Recognition Administration* app and select **Groups** in the *Pre-Defined Groups* section.

1. Select **+ New** on the toolbar to fill out the *Name* for the group.  

1. Select **Save**. Once you do that, you can specify the members of that group (team).

1. Select **+ New Group Member** in the *Members* section.

1. Search for and select a user who is part of that group (team) in the *Member* field.

1. Select **Save & Close**.

1. Repeat steps four through six until all group (team) members are associated to the group. This is important for three reasons:

    - It allows program administrators to determine who gets awards.
    - It enables users to see all the team members they are nominating.
    - It ensures that the *Awards Spotlight*, which randomly highlights recipients, can highlight recipients who are associated with the group.

## Create nomination periods and associate awards

Now that the awards and groups (if needed) have been defined, it's time to create nomination periods and associate awards to them. This allows users to nominate their colleagues for various awards.

### Create nomination periods

All awards and recognitions are given out in defined nomination periods. Take these steps to define the nomination periods for your organization:

1. Start the Awards and Recognition Administration app and select **Nomination Periods** in the *Nomination Periods* section.

1. Select **+ New** on the toolbar and fill out the form:

    - **Name** – Give a name for the nomination. For example, *Q4*.

    - **Description** – Provide a longer description of the period. For example, *Quarter 4, Fiscal Year 2023*.

    - **Fiscal Year** – Enter the nomination period's fiscal year.

    - **Start Date** – Provide the date and time that the app will start accepting nominations for the nomination period.

    - **End Date** - Provide the date and time that the app will stop accepting nominations for the nomination period.

1. Select **Save**.

1. Repeat steps one through three to continue creating nomination periods.

### Add existing awards to the nomination periods

Users select specific awards that are made available within a set nomination period. Take these steps to associate existing awards to the nomination periods you set up:

1. Select **Add Existing Award** in the *Available Awards for this Nomination Period* section.

1. Search for and select an existing award.

1. Select **Add** to add the existing award.

1. Repeat steps one through three to continue to associating awards to specific nomination periods.

## Review and finalize the nominations

When a nomination period ends, it's time to review the nominations and approve or reject them.

Follow these steps to review the nominations and approve or reject:

1. Start the Awards and Recognition Administration app and select **Nominations** in the  *Nominations* section.

1. Filter by specifying a *nomination period* if there is more than one active nomination period.

    - Select the nomination period *column name*.
    - Select **Filter By**.
    - Select the specific *nomination period* you want to view.
    - Select **Apply**.

1. Select the *name of the nomination* to view more details. The name of the nomination is a concatenation of the *type* of award (Person, People, or Team), *Award Name*, *date*, and *time* the nomination was submitted.

1. Review the *award*, *nominees*, *ratings*, and *case for the nomination* provided by the nominator.  

1. Add text in the *Reviewer's Notes* field if you need a space for taking notes during the review period.

1. Select **Deactivate** on the menu bar when you are ready to approve or reject a nomination.

1. Choose *Approved*, *Denied*, *Withdrawn*, or *Cancelled*.

1. Select **Deactivate** to finalize the nomination. A flow will automatically update the *Reviewed By* and *Reviewed On* columns to reflect who finalized each nomination and when.

> [!IMPORTANT]
> The solution is not set up to automatically send out email notifications to the award recipients once the nominations are finalized.
>
> You need to set up your own organizational process to notify award recipients after the entire review process is complete. For example, you could send out an official communication that acknowledges the award recipients or have an awards ceremony.

## Localize application strings

The strings in the Awards and Recognition app can be localized to support the diverse set of languages that may be spoken in your company. The app contains default strings for all text, but checks to see if there's a localized version in the Employee Experience Localization table. The table is included in the Employee Experience Base solution that gets installed alongside the Awards and Recognition solution. The Employee Experience Base solution and the Awards and Recognition solution are accessed together from AppSource.

To grant users the ability to localize app strings, you must assign the **Employee Experience Localizer** security role to them. Once assigned, the user can open the Employee Experience Localization Admin app and follow these steps:

1. Select **+New**.
1. Fill out the form:

    - *English Value* is the text in the app that you want to replace.
    - *Language* is the language you want to provide a localized value for.
    - *Localized Value* is the translated text.
    - *String Type* is the type of string you're replacing. This field is optional.

1. Select **Save**.

## Nominate for an award

You can submit nominations for your coworkers for outstanding efforts in your organization and view your own recognitions that you receive in the Awards and Recognition app.

Open the *Awards and Recognition* app.  

To create a new nomination, follow these steps:

1. Select a *Nomination Period* from the main screen, then select **Next**.

1. Select from *available awards*. Select **Next**.

1. Select *who* you are nominating (if there is only one choice, it is preselected).

    - **Single Person** – you are nominating an individual for this award.

    - **Multiple People** – you are nominating more than one individual as a group for this award.  

    - **Team** – you are nominating a pre-defined team for this award.

1. Search and select the *nominees* from the drop-down list. Select **Next**.

1. Make a case for the nomination by providing a rationale for why the nominee or team deserves to win the award. Select **Next**.

1. If assessment ratings are defined for this award, you go to the *Star Ratings* screen where you rate each assessment area and then select **Next** to review and submit the nomination. If there are no assessment ratings to give, you go directly to the Review and Submit screen.

1. On the *Review & Submit* screen, review the award selected, nominee or team, rationale, and ratings you provided. If everything looks good, select **Submit**. If not, select the **back arrow** on the menu bar to change the various elements of the nomination until you're satisfied. Once complete, proceed back to the *Review & Submit* screen to select **Submit**.

## View nominations I've submitted

To view nominations you've submitted in the past, take these steps:

1. From the main screen of the Awards and Recognition app, select **Recent Activity**. This will take you to the *My Recognitions* screen.

1. Select **Nominations I've Submitted** if it's not already defaulted to that view.

1. Review the nominations you've submitted in the past by selecting the *arrow* to the right of each choice.

## View recognitions I've received

To view approved awards that I've received, take these steps:

1. Select **Recent Activity**. This will take you to the *My Recognitions* screen.

1. Select **Recognitions Received**.

1. Review the nominations you've submitted in the past by selecting the **arrow** to the right of each choice. Use the search and filter capability to narrow down results if there are lots of records.

> [!TIP]
>
> To find specific records to view, use the search and filter capabilities to narrow down results if there are lots of records.

## Change screen settings

You can toggle between color themes in the Awards and Recognition app:

- Light Theme (default)
- Dark Theme
- Contrast Theme (for accessibility)

Take these steps to change the color theme:

- Select the **settings icon (gear icon)**.
- Select a different theme.
- Select the **back arrow** to continue through the app with the updated theme applied.
