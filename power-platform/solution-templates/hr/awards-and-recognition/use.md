---
title: Use the Awards and Recognition app
description: Get started using the Awards and Recognition app.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 07/21/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the Awards and Recognition app

Follow the steps to create custom award and recognition *types*, opt-out users, and localize the application strings.

## Create awards and assessment ratings

The first step to configuring an awards program is to create the awards. There are three high-level steps to creating an award. First, specify the award details. Second, upload an image the represents the award. Third, define any related questions that you want nominators to rate nominees on (Award Assessment Ratings).

### Create the award record

1. Start the Awards and Recognition Administration app and select **Awards*.
1. Select **+ New** in the toolbar and fill out the *Name* and *Description* for the award. The description text should help nominators understand who might be eligible for a given award. Additionally, define whether the award can be made available to a single individual, multiple individuals (user-defined groups), and teams (pre-defined groups).
1. Select **Save**. Once you do that, you can now associate an image with the award. The Awards & Recognition app is a visual experience, so it's important to assign an image to each award.

### Associate an image

To associate an image, select **Choose file**, choose the image you want and select **Open**. Wait until the image uploads, then select **Save** once more.

### Create assessment ratings

1. With the new defined award on the screen, select **+ New Award Assessment Rating** in the *Award Assessment Ratings Questions* section. This will open up a new *Award Assessment Rating* form.
1. Specify the name of the trait you want assessed as part of the nomination for this award.
1. Provide details about how the nominator should assess the nominee in the *Description* section.
1. Specify the order in which it will be presented to the nominator.
1. Select **Save & Close**
1. Repeat steps 5-8 to add additional award assessment ratings as needed.
1. Repeat Steps 1-8 until all Awards have been defined.

## Create Groups

If any of your awards are being made available for pre-defined team nomination, then you will need to create each of these teams as Groups in the system. This allows the program administrator to control what teams will be available for nomination.

To create a Group, follow these steps:

1. Start the Awards and Recognition Administration App and select on "Groups" under Pre-Defined Groups.

1. Select **+ New** on the toolbar to fill out the *Name* for the group.  

1. Select **Save**. Once you do that, you can specify the members of that group (team).

1. Below the Group definition, in the *Members* section, select **+ New Group Member**. In the Member field, search for and select a user that is part of that group (team).

1. Select on **Save & Clos**.

1. Repeat Step #4 until all group (team) members have been associated to the group. This is important for three reasons. One, nominees will be able to see all the team members they are nominating for. Two, this helps the program administrators determine who gets awards. Three, the Awards Spotlight which randomly highlights recipients will not be able to highlight folks that aren't associated with the group.

## Create Nomination Periods and Associate Awards

Now that awards and groups (if needed) have been defined, it's time to create a nomination period. This will allow users to nominate their colleagues for various awards.

To create a Nomination Period, follow these steps:

1. Start the Awards and Recognition Administration App and select on "Nomination Periods" under Nomination Periods.

1. Select **+ New** on the toolbar and fill out the form:

    - Name – Give a name for the nomination like "Q4", for example.
Description – Provide a longer description of the period like "Quarter 4, Fiscal Year 2023"

    - Fiscal Year – Provide the fiscal year that the nomination period is in.

    - Start Date – Provide the date and time that the app will begin accepting nominations for this nomination period.

    - End Date - Provide the date and time that the app will stop accepting nominations for this nomination period.

1. Select **Save**.

1. Below the Nomination Period definition, in the Available Awards for this Nomination Period section, select on "Add Existing Award".

1. Search for and/or select an award and select on "Add"

1. Repeat steps 4-5 until all Awards that will be made available in this nomination period are associated to it.

## Review and finalize a nomination

When a nomination period ends, it's time to review the nominations and approve or reject them.

To review and approve/reject nominations, follow these steps: 

1. Start the Awards and Recognition Administration App and select on "Nominations" under Nominations.

1. If there are more than one active Nomination Period, you can filter by the nomination period you are reviewing for. Simply click on the Nomination Period column name, select Filter By, and select the Nomination Period you want to view. Click Apply.

1. Select the name of the nomination to drill down into the details.  

> [!NOTE]
>The name of the nomination is concatenation of the *type* of award (Person, People, or Team), the *Award Name*, and the *date*, and *time* the nomination was submitted.

4. Review the award, the nominee(s), the ratings, and the case for the nomination provided by the nominator.  

1. If needed, there is a space for taking notes while in the review period. Just add text in the Reviewer's Notes field at the bottom-right. This is for the reviewer's use.

1. When ready to approve/reject a nomination, select **Deactivate** on menu bar. A dialog box will appear allowing you to choose between Approved, Denied, Withdrawn, or Cancelled. Select the choice that reflects how you are going to finalize this nomination and select **Deactivate**.
1. A flow will automatically update the *Reviewed By* and *Reviewed On* columns to reflect who finalized each nomination and when.

> [!IMPORTANT]
> There are no email notifications that go out automatically as a part of this solution. It is expected that the organizational process will include some way of notifying individuals involved such as an award ceremony or other official communication after the entire review process is complete.

## Localize application strings

All of the strings in the Awards and Recognition App can be localized to support the diverse set of languages that may be spoken in your company. The app contains default strings for all text, but checks to see if there's a localized version in the Employee Experience Localization table. The table is included in the Employee Experience base solution that gets installed alongside the Awards and Recognition solution. The Employee Experience base solution and the Awards and Recognition solution are accessed together from AppSource.

To grant users the ability to localize app strings, you must assign the Employee Experience Localizer security role to them. Once assigned, a user can open the Employee Experience Localization Admin App and follow these steps:

1. Select **+New**.
1. Fill out the form.

    - English Value is the text in the app that you want to replace. 

    - Language is the language you want to provide a localized value for.

    - Localized Value is the translated text.

    - String Type is the type of string you're replacing. This field is optional.
1. Select **Save**.

## Nominate for an award

Open the Awards and Recognition App.  

To create a new nomination, follow these steps:

1. From the main screen, select a *Nomination Period*. Select **Next**.

1. Select from available awards. Select **Next**.

1. Select who you are nominating (if there is only one choice, it is pre-selected).

    - Single Person – you are nominating an individual for this award.

    - Multiple People – you are nominating more than one individual as a group for this award.  

    - Team – you are nominating a pre-defined team for this award.

1. Using the drop down, search and select the *nominee(s)*. Click **Next**.

1. Make a case for the Nomination by providing a rationale for why the nominee(s) deserves to win this award. Select **Next**.

1. If there are Assessment Ratings defined for this Award, the next screen will be *Star Ratings*. If not, you will be at the *Review & Submit* screen.

1. If you are on the Star Ratings screen, provide a rating for each assessment area and click Next.
1. On the Review & Submit screen, review the award selected, the nominee(s), the rationale, and the ratings you provided. If everything looks good, click Submit. If not, you can click on the back arrow on the top menu bar to change the various elements of the nomination until you're satisfied. Then proceed back to this screen and click Submit.

## View nominations I've submitted

To view nominations you've submitted in the past, follow these steps:

1. From the main screen of the Awards and Recognition app, select **Recent Activity** under the top menu bar in the upper-right portion of the screen. This will take you to the My Recognitions screen.

1. Select **Nominations I've Submitted** if it's not already defaulted to that view.

1. Review and drill-down into nominations you've submitted in the past by clicking on the arrow to the right of each choice.

Use the search and filter capability to narrow down results if there are lots of records.

## View recognitions I've received

To view approved awards that I've received, follow these steps:

1. From the main screen of the Awards and Recognition app under the top menu bar in the upper-right portion of the screen. This will take you to the My Recognitions screen.

1. Select **Recognitions Received**.

1. Review and drill-down into nominations you've submitted in the past by clicking on the arrow to the right of each choice. Use the search and filter capability to narrow down results if there are lots of records.

## Change screen settings

Users can toggle between color themes in the Awards and Recognition App:

- Light Theme
- Dark Theme
- Contrast Theme (for accessibility)

To change the color theme, click on the **settings icon (gear icon)**, select a different theme, then click the **back arrow**.
