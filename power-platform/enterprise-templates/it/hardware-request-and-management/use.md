---
title: Use the Hardware Request and Management template for Power Platform
description: Learn how to use the Hardware Request and Management template for Microsoft Power Platform.
author: microsoft-george
ms.author: georgenewton
contributors:
  - tverhasselt
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the Hardware Request and Hardware Management apps

Once configuration and setup steps are completed the apps are ready to use.

## Use the Hardware Request app

The Hardware Request app is very streamlined, to eliminate any specialized user training for the request process.  The app has minimal flexibility to minimize confusion.  The goal is to let the app guide the user through creating and submitting their request to initiate the workflow for the approval in the management app.  The following is a brief overview of the supported functions.

:::image type="content" source="media/use/hrm-use-home.png" alt-text="Screenshot of the Hardware Request app home page.":::

### Create a new request for hardware

The Hardware Request app simplifies how you shop and submit requests for new hardware when the need arises.  Here are the steps to get started:

1. One the home page, select **Create new request**
1. The *Select From Available Devices* page is shown with a separate tile for each *product type*

    :::image type="content" source="media/use/hrm-use-select-devicetype.png" alt-text="Screenshot of the Hardware Request app device type selection page.":::

1. From the device selection page, either:
    1. Select a tile to go to the products within a specific product type
    1. Filter by product description in the *Quick find* field. This reduces the number of tiles and the product count within each before selecting a device type
1. From the Product category view, you can add filters for brand or subtype, or search on the product description.
1. Key in quantity for the desired product or click the plus (+) button for the desired quantity.  When ready, click "Add to cart".
1. Repeat as necessary to fill the cart with all items to be requested
1. Once all products and quantity have been added to cart, click on the shopping cart icon to check out.

### View requests for hardware

Once a request has been submitted, its progress to completion can be tracked through the same app.  Here are the steps to get started:

1. On the home page, select **View my requests**
1. The *My requests* page shows a table with all of your requests. The table fields are:
    1. Request title
    1. Approver
    1. Approval status
    1. Stage
    1. Submitted on (date)
    1. Completed on (date)
1. Select the **eye* to view more details about a specific request

### View devices

You can view devices that are assigned to you, as well. Take these steps to get started:

1. On the home page, select **View my devices**
1. The *My Assets* page shows a table with all of your assigned devices. The fields are:
    1. Device name
    1. Asset number
    1. Manufacturer
    1. Delivered on (date)
    1. Refresh eligible (date)

## Use the Hardware Management app

The most-likely hardware management scenarios are shared with overviews of how the Hardware Management app can accommodate them.

Within each scenario there are options available to the user. The hardware management app is flexible to handle a variety of scenarios. The goal is always for the system data to reflect how requests, assets and budget exist in the real world.

### Review and approve a request that requires a purchase

The workflow for the request process begins with the important decision to approve or reject. To make this decision, the hardware manager is provided with as much relevant information as possible.  Because this decision is prior to purchasing, the hardware manager can take action from the Hardware Management app, Microsoft Teams, or Microsoft Outlook.  We will cover all three options:

#### Use the Hardware Management app for requests that require a purchase

Follow these steps to get started reviewing and approving a request that requires a purchase directly in the Hardware Management app.

1. In *Requests* > Requests view list of "Open Requests" (Note: the default sort is by "Submitted On" date (descending) with the newest requests on top).
1. Select a request for review and click on the Request Name hyperlink for the row

    :::image type="content" source="media/use/hrm-use-management-po.png" alt-text="Screenshot of managing a request that requires a PO in the Hardware Management app .":::

1. The Hardware Request *General* tab provides an overview of the request. The information helps the hardware manager make a decision to approve or reject the request. The overview includes these sections:

    1. Details – Name, Business Group, Submitted by, Requires purchasing indicator, Amount, Submitted on date/time, Completed on date, Requested for, and Request number
    1. Approval – Status, Comments, Approved by, Approved on
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Purchase Orders
    1. Assets

1. The *Header* section contains the status tracker which:

    1. allows the administrator to quickly identify where in the process the request is
    1. has executable functions for each step in the process

1. Approve in the Management app

    1. Within the status tracker, click on the "Review" step
    1. Update the Approval Status from "Pending" to "Approved"
    1. In this case we, purchasing is required.  For "Require Purchasing?" keep the default *Yes*
    1. Select **Run Flow** to *Notify Review Complete*. This notifies the requesting user of the approval action
    1. Select **Next Stage** to advance to the *Purchase* step.

#### Use Teams for requests that require a purchase

It can be set up so that hardware managers have a workflow item for *Approval* set up for them in Teams. The workflow arrives when a hardware request is submitted along with a notification in *Activity*. Follow these steps to get started with this approval process scenario:

1. Select **Approvals** on the left-side panel
1. Choose the request to review and a card will open with the relevant details for the request:
    1. Status – "Requested" in this case (eventually "Approved" or "Rejected")
    1. Name
    1. Submitted By
    1. Amount
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Attachments – documents relevant to review
    1. Status flow – shows timing of action from requestor to approver
    1. Comments – allows approver to explain decision

1. Select **Approve** to advance to the *Purchase* step

#### Use Outlook for requests that require a purchase

It can be set up so that emails go to a hardware manager's *Outlook Inbox* when a request is submitted. Follow these steps to get started with this approval process scenario:

1. When an hardware request email arrives, simply open the email to review the relevant details for the request:

    1. Status – "Requested" in this case (eventually "Approved" or "Rejected")
    1. Name
    1. Submitted By
    1. Amount
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Attachments – documents relevant to review
    1. Status flow – shows timing of action from requestor to approver
    1. Comments – allows approver to explain decision

1. Select **Approve** to advance to the *Purchase* step

> [!NOTE]
>
> The approval itself does not trigger the purchase automatically. The purchase order is placed separately.

### Review and approve a request that doesn't require a purchase

Requests that do not require the purchasing step (assets already in inventory) must be handled slightly differently.  Because there are fewer steps, the process is simpler:

#### Use the Hardware Management app for a request that doesn't require a purchase

1. Go to **Requests** > Requests view list of **Open Requests** (Note: the default sort is by *Submitted On* date (descending) with the newest requests on top).
1. Select a request for review and then select the **Request Name** hyperlink for the row
1. The Hardware Request *General* tab provides an overview of the request.  The information helps the administrator make a decision to approve or reject the request.  The overview includes sections:
    1. Details – Name, Business Group, Submitted by, Requires purchasing indicator (update from *Yes* to *No*; you'll notice the *Status Tracker* will change, with the steps for *Purchase* and *Receive* disappearing), Amount, Submitted on date/time, Completed on date, Requested for, and Request number
    1. Approval – Status, Comments, Approved by, Approved on
    1. Additional details – free text inputted from request
    1. Items – list includes product description, quantity and price
    1. Purchase Orders
    1. Assets
1. The Header section contains the status tracker which:
    1. allows the administrator to quickly identify where in the process the request is
    1. has executable functions for each step in the process
1. Approve in the Hardware Management app
    1. Within the status tracker, select **Review**
    1. Update the Approval Status from *Pending* to *Approved*
    1. In this case, purchasing is not required.  For *Require Purchasing?* change the default from *Yes* to *No*
    1. Select **Run Flow** to *Notify Review Complete*, which will notify the user making the request of the approval action
    1. Select **Next Stage** to advance to the *Deliver* step

> [!NOTE]
>
> Changing a request *Require Purchasing?* from default *Yes* to *No* cannot be done in Teams or Outlook. The Hardware Management app must be used for this function.

### Review and approve a request with items with mixed inventory

When the request includes both items for purchasing and items on hand, a hybrid approach is required.

It's best to view the request as *Requires purchasing? Yes* with individual items being assigned as *existing assets*.  The process resumes from step 5 in the *Use Hardware Management app for a request that doesn't require a purchase*. Take these steps:

1. Approve in the Hardware Management app
    1. Add an approval comment to indicate to Purchaser which items will be assigned from existing asset inventory (for example, *USB-C Charger should not be purchased; assign from inventory*)
    1. Assuming there is availability, go to the *Assets* block, select the **ellipsis (…)** and then select **Add Existing Asset**
    1. Input the name of the asset in *Look for records* and search
    1. Once selected, select the **Add** button; the asset is then assigned to the Request

### Reject a request

When after review, the decision may be made that a request should not be continued. The request may be a duplicate, entered by mistake, or exceed budget. In this case, the hardware manager must reject the request. This will ensure that no purchasing or further action is taken. The rejection can be done in Teams, Outlook or the Hardware Management app directly.

#### Use the Hardware Management app to reject a request

1. In Requests > Requests view list of "Open Requests" (Note: the default sort is by "Submitted On" date (descending) with the newest requests on top).
1. Select a request for review and click on the Request Name hyperlink for the row
1. The Hardware Request "General" tab provides an overview of the request.  The information helps the administrator make a decision to approve or reject the request.  The overview includes sections:
    1. Details – Name, Business Group, Submitted by, Requires purchasing indicator, Amount, Submitted on date/time, Completed on date, Requested for, and Request number
    1. Approval – Status, Comments, Approved by, Approved on
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Purchase Orders
    1. Assets
1. The Header section contains the status tracker which:
    1. allows the administrator to quickly identify where in the process the request is
    1. has executable functions for each step in the process
1. Reject
    1. Within the status tracker, click on the "Review" step
    1. Update the Approval Status from "Pending" to "Rejected"
    1. Select **Run Flow** to *Notify Review Complete*, which will notify the user making the request of the approval action

#### Use Teams to reject a request

Hardware managers have a workflow item for *Approval* in Teams that arrives when a request is submitted, along with a notification in *Activity*. To get started with the process of rejecting a hardware request through Teams, take these steps:

1. Select **Approvals** in the left-side panel
1. Select the request to review; a card will open with the relevant details for the request:
    1. Status – "Requested" in this case (eventually "Approved" or "Rejected")
    1. Name
    1. Submitted By
    1. Amount
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Attachments – documents relevant to review
    1. Status flow – shows timing of action from requestor to approver
    1. Comments – allows approver to explain decision
1. Select **Reject**

#### Use Outlook to reject a request

Hardware managers receive an email in their *Outlook Inbox* that arrives when a request is submitted and ready for a review. To get started with the process of rejecting a hardware request through Outlook, take these steps:

1. Open the request to review email. The email has the relevant details for the request:
    1. Status – "Requested" in this case (eventually "Approved" or "Rejected")
    1. Name
    1. Submitted By
    1. Amount
    1. Additional details – input as free text from request
    1. Items – list includes product description, quantity and price
    1. Attachments – documents relevant to review
    1. Status flow – shows timing of action from requestor to approver
    1. Comments – allows approver to explain decision
1. Select **Reject**

### Purchase

Once the Request is approved, it is ready for purchasing. Any items that require purchasing should be added to a *Purchase Order* in your company's purchasing system. To make the Hardware Management app reflect the reality of that purchase order, update the request with the purchase order information as follows:

1. Select the **ellipsis (…)** on the *Purchase Orders* tile in the request and select **+ Add New Purchase Order**
1. Input the following fields and select **Save** when you are done

    Required fields for a purchase:

    - Name (Note: Purchase Order name may align with the Request)
    - Business Group (financially responsible for the purchase)
    - Budget (where the funds are to be allocated from)

    Optional fields for a purchase:

    - PO Number (assigned externally)
    - Amount
    - Hardware Request
    - Currency

1. Once the purchase order is entered, the notification flow should be run to communicate the completion of the stage. From the overview, select **Purchase** within the workflow and then select **Run Flow** for *Notify purchase complete*. In the window that pops up, select **Run Flow** again
1. Advance the workflow by selecting **Purchase** in the workflow and then select **Next Stage**

## Receive

Once the shipment of the ordered products are received, you are ready for your next actions. To make the Hardware Management app reflect the reality of the received goods, update the request as follows:

1. Create assets for the received goods
    1. Select **Receive** within the workflow
    1. Select **Run Flow** for *Create assets*
    1. In the window that pops up, select **Run Flow** again
1. Communicate the receipt event to the requestor
    1. Select **Receive** within the workflow
    1. Select **Run Flow** for *Notify received complete*
    1. In the window that pops up, select **Run Flow** again
1. Advance the workflow
    1. Select **Receive** in the workflow
    1. Select **Next Stage**
    1. Select **Receive** in the workflow
    1. Select **Run Flow** for *Notify received complete*
    1. In the window that pops up, select **Run Flow** again

### Deliver

Now that the assets are on hand, they need to be delivered to the person who they were ordered for. Once the requestor is in possession of the assets, update the request as follows:

1. Create assets for each delivered item
    1. Select **Delivery** within the workflow
    1. Select **Run Flow** for *Set assets as delivered*
    1. In the window that pops up, select **Run Flow** again
1. Communicate the delivery event to the requestor
    1. Select **Delivery** within the workflow
    1. Select **Run Flow** for *Notify delivery complete*
    1. In the window that pops up, enter *Delivered On* date
    1. Select **Run Flow** again
1. Advance the workflow
    1. Select **Deliver** in the workflow and select **Next Stage**

### Complete

Update the request to reflect that the process is complete. Take these steps:

1. Communicate the completion to the requestor.
    1. Select **Complete** within the workflow
    1. Select **Run Flow** for *Notify request complete*
    1. In the window that pops up, select **Run Flow** again
1. Complete the workflow
    1. Select **Complete** in the workflow
    1. Enter a *Completed on* date and then select **Finish**

### Reassign a request

It may be necessary to reassign a request to a different approver than the one selected by default upon submission through the request app. The action can be completed either from the Hardware Management app or Teams.

#### Use the Hardware Management app to reassign a request

Take these steps to reassign a request to a different approver in the Hardware Management app:

1. Select **Assign**

   > [!NOTE]
   >
   > Depending on the size of the window, you may need to select the **ellipsis (…)** to see *Assign*.

1. The window for *Assign Hardware Request* will appear
1. For *Assign to*, select **User or Team**
1. For *User or team*, you can view all or filter to see *only users* or *only teams*
1. Once a selection is made for the reassignment, select **Assign**

#### Use Teams to reassign a request

Take these steps to reassign a request to a different approver in Teams:

1. In the card, select **Reassign**
1. Start typing the name in *Reassign to* (suggestions are made based on the input)
1. Once a name is selected, select **Confirm** to complete the reassignment

### Notify Hardware is eligible for refresh

Every Asset is assigned a *Refresh Eligible On* date, which is calculated based on the:

- *Refresh Term* (Months) in the refresh policy for the product
- *Delivered On* date of the asset

A flow for *Notify Asset Refresh Eligible* is executed periodically. For active assets that are exceeding their refresh date, a notification is sent to inform the asset owner. The asset itself is also updated to reflect the date on which the notification was sent. After that time, the replacement asset can be requested, according to policy. Once the replacement is delivered, the older asset can be updated to *Retired* status.

### Mass import for bulk purchase

Create assets purchased in bulk. Use Excel online integration for this. Bulk import these assets and associate the import to a purchase order for budget roll-up reasons without necessarily a request.

### Get insights on requests and hardware assets

The app is built with a handful of reports driven by Power BI that allow an administrator to monitor Request Activities and Budgets and Assets to enable efficient operations. Select **Dashboards** and then **Reports** on the left-side pane to get started.

#### Hardware Request Dashboard

The Hardware Request Dashboard gives a graphical view of request activity. Select the period from the dropdown (Today, Yesterday, This Week, Last Week…) for the desired *Submitted on* date filter.  The charts will update with views for:

- By Status
- By Stage
- Activity by count
- Activity by amount

:::image type="content" source="media/use/hrm-use-hrdashboard.png" alt-text="Screenshot of Hardware Request Dashboard in the Hardware Management app .":::

#### Hardware Management Report

Switch the view from *Hard Request Dashboard* to *Hardware Management Report* to see detailed reports with totals and charts in the header for:

- Budget
- Requests
- Assets
