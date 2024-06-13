---
title: Use the Hardware Request and Hardware Management apps
description: Learn how to use the Hardware Request and Hardware Management apps to streamline the asset request and approval process.
author: microsoft-george
ms.author: georgenewton
contributors:
  - tverhasselt
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 05/30/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the Hardware Request and Hardware Management apps

Once configuration and setup steps are complete, the apps are ready to share and use.

## Use the Hardware Request app

The Hardware Request app is straight forward and easy to use so no specialized user training is necessary for the request process. The app guides you through creating and submitting a request to initiate the workflow for the approval in the management app. This article provides a brief overview of the supported functions in the Hardware Request app.

:::image type="content" source="media/use/hrm-use-home.png" alt-text="Screenshot of the Hardware Request app home page.":::

### Create a new request for hardware

The Hardware Request app simplifies how you shop and submit requests for new hardware. Take these steps to get started:

1. On the home page, select **Create new request** to go to the *Select From Available Devices* page. Here, you see a separate tile for each *product type*.

    :::image type="content" source="media/use/hrm-use-select-devicetype.png" alt-text="Screenshot of the Hardware Request app device type selection page.":::

1. From the device selection page, either:
    1. Select a tile to go to the products within a specific product type.
    1. Filter by product description in the *Quick find*. field. This reduces the number of tiles and the product count within each before selecting a device type.
1. From the Product category view, you can add filters for brand or subtype, or search on the product description.
1. For each product request, be sure to indicate the quantity. You can key in quantity or select **plus (+)**.
1. Select **Add to cart**.
1. Repeat the steps as necessary to fill the cart with all necessary items.
1. Select the **shopping cart** to check out.
1. On the check-out page, you can add the following information:

    - *Request title* - give your request a name

    - *Business group* - select your business group

    - *Requested on behalf of* - if you are requesting for another individual, select their name from the dropdown

    - *Additional details* - provide any details that may be helpful

1. Review each hardware request and quantity to ensure accuracy. You have the option to select **Remove** if necessary.

1. Select **Submit request**. A *Request submitted* page appears when complete.

### View requests for hardware

Once you submit a request in the Hardware Request app, you can view its progress. Take these steps:

1. On the home page, select **View my requests**.
1. View your requests. The *My requests* page shows a table with all of your requests. The table fields are:
    - Request title
    - Approver
    - Approval status
    - Stage
    - Submitted on (date)
    - Completed on (date)
1. Select the **eye** to view more details about a specific request.

### View devices

You can also view devices that are assigned to you. Take these steps:

1. On the home page, select **View my devices**.
1. View your devices. The *My Assets* page shows a table with all of your assigned devices. The fields are:

    - Device name
    - Asset number
    - Manufacturer
    - Delivered on (date)
    - Refresh eligible (date)

## Use the Hardware Management app

Hardware requests are managed by a team in the Hardware Management app. This section covers the most-likely hardware management scenarios you may encounter as a hardware manager.

The Hardware Management app is designed to be flexible so it can handle a variety of scenarios for you. The goal is always for the system data to reflect how requests, assets, and budget exist in the real world.

### Review and approve a request that requires a purchase

The workflow for the request process begins with the important decision to approve or reject. To make this decision, the hardware manager is provided with as much relevant information as possible.  Because this decision is made prior to purchasing, you or other hardware managers can take action from the Hardware Management app, Microsoft Teams, or Microsoft Outlook.

#### Use the Hardware Management app for requests that require a purchase

Take these steps to review and approve a request that requires a purchase directly in the Hardware Management app.

1. Select **Requests** on the left pane in the Hardware Management app.
1. Select an **Open Requests** to view a list of open requests (Note: the default sort is by *Submitted On* date (descending) with the newest requests on top).
1. Select the **Request Name hyperlink** of the request you want to review. It takes you to the Hardware Request *General* tab.

    :::image type="content" source="media/use/hrm-use-management-po.png" alt-text="Screenshot of managing a request that requires a PO in the Hardware Management app.":::

    The Hardware Request *General* tab provides an overview of the request. The information on the overview page helps you make a decision to approve or reject the request. The overview includes these sections:

    - Details
      - Name
      - Business Group
      - Submitted by
      - Requires purchasing indicator
      - Amount
      - Submitted on date/time
      - Completed on date
      - Requested for
      - Request number
    - Approval
      - Status
      - Comments
      - Approved by
      - Approved on
      - Additional details – input as free text from request
    - Items
      - product description
      - quantity
      - price
    - Purchase Orders
    - Assets
    - Header – contains the status tracker that allows the administrator to quickly identify where in the process the request is and has executable functions for each step in the process

1. Select on the **Review** step in the status tracker.
1. Update the approval status from *Pending* to **Approved**.
1. Keep the default set to **Yes** for *Require Purchasing?* since this is a purchasing scenario.
1. Select **Run Flow** to *Notify Review Complete*. This notifies the requesting user of the approval action.
1. Select **Next Stage** to advance to the *Purchase* step.

#### Use Teams for requests that require a purchase

It can be set up so that you have a workflow item for *Approvals* set up for them in Teams. The workflow arrives when a hardware request is submitted along with a notification in *Activity*. Take these steps to start the approval process scenario:

1. Select **Approvals** on the left pane in the Hardware Management app.
1. Choose the request to review and a card will open with the relevant details for the request:
    - Status – *Requested* in this case (eventually the status will be *Approved* or *Rejected*)
    - Name
    - Submitted By
    - Amount
    - Additional details – input as free text from request
    - Items – list includes product description, quantity, and price
    - Attachments – documents relevant to review
    - Status flow – shows timing of action from requestor to approver
    - Comments – allows you, as the approver, to use free text to explain the decision

1. Select **Approve** to advance to the *Purchase* step.

Learn more about [approvals in Microsoft Teams](/power-automate/teams/native-approvals-in-teams).

#### Use Outlook for requests that require a purchase

It can be set up so that emails go to your or another hardware manager's *Outlook Inbox* when a request is submitted. Take these steps to start this approval process scenario:

1. When a hardware request email arrives, simply open the email to review the relevant details for the request:

    - Status – *Requested* in this case (eventually *Approved* or *Rejected*)
    - Name
    - Submitted By
    - Amount
    - Additional details – input as free text from request
    - Items
        - description
        - quantity
        - price
    - Attachments – documents relevant to review
    - Status flow – shows timing of action from requestor to approver
    - Comments – allows approver to explain decision

1. Select **Approve** to advance to the *Purchase* step.

> [!NOTE]
>
> The approval itself does not trigger the purchase automatically. The purchase order is placed separately.

### Review and approve a request that doesn't require a purchase

Requests that don't require the purchasing step (assets already in inventory) must be handled slightly differently.  Because there are fewer steps, the process is simpler:

#### Use the Hardware Management app for a request that doesn't require a purchase

Take these steps to go through a scenario where you use the Hardware Management app to process a request that does not require a purchase:

1. Select **Requests** on the left pane in the Hardware Management app.

1. Select **Open Requests** to view a list of open requests(Note: the default sort is by *Submitted On* date (descending) with the newest requests on top).

1. Select the **Request Name hyperlink** of the request you want to review. It takes you to the Hardware Request *General* tab that provides an overview of the request. The information helps you make the decision whether to approve or reject the request. The overview page includes these sections:

    - Details
        - Name
        - Business Group
        - Submitted by
        - Requires purchasing indicator
        - Amount
        - Submitted on date/time
        - Completed on date
        - Requested for
        - Request number
    - Approval
        - Status
        - Comments
        - Approved by
        - Approved on
    - Additional details – shows free text input related to request
    - Items
        - description
        - quantity
        - price
    - Purchase Orders
    - Assets
    - Header – contains the status tracker that helps you quickly identify the request process stages and contains executable function for each step in the process.

1. Select **Review** in the status tracker.

1. Update the Approval Status field from *Pending* to **Approved**.

1. For *Require Purchasing?*, change the default from *Yes* to **No** since a purchase is not required in this scenario.

1. Select **Run Flow** for *Notify Review Complete*. This action notifies the requestor of the approval action.

1. Select **Next Stage** to advance to the *Deliver* step.

> [!NOTE]
>
> Changing a request *Require Purchasing?* from default *Yes* to *No* cannot be done in Teams or Outlook. The Hardware Management app must be used for this function.

### Review and approve a mixed inventory request

When the request includes both items for purchasing and items on hand, a hybrid approach is required.

It's best to view the request as *Requires purchasing? Yes* with individual items being assigned as *existing assets*.  Take these steps to review and approve a mixed inventory request in the Hardware Management app:

1. Add an approval comment to indicate to Purchaser which items will be assigned from existing asset inventory (for example, *USB-C Charger should not be purchased; assign from inventory*).
1. Go to the *Assets* block, select the **ellipsis (…)**, and then select **Add Existing Asset**.
1. Input the name of the asset in *Look for records* and search.
1. Select the asset and then select **Add**. This action assigns the asset to the request.

### Reject a request

After review, the decision may be made that a request should not be continued. The request may be a duplicate, be a mistake, or exceed budget. In this case, you must reject the request. This ensures that no purchasing or further action is taken. You can reject a request in Teams, Outlook, or the Hardware Management app directly.

#### Use the Hardware Management app to reject a request

Take these steps to reject a request directly in the Hardware Management app:

1. Select **Requests** on the left pane in the Hardware Management app.

1. Select **Open Request** to view a list of requests (Note: the default sort is by "Submitted On" date (descending) with the newest requests on top).

1. Select the **Request name hyperlink** of the request you want to review. It takes you to the Hardware Request *General* tab that provides an overview of the request. The information helps you make the decision whether to approve or reject the request. The overview page includes these sections:

    - Details
        - Name
        - Business Group
        - Submitted by
        - Requires purchasing indicator
        - Amount
        - Submitted on date/time
        - Completed on date
        - Requested for
        - Request number
    - Approval
        - Status
        - Comments
        - Approved by
        - Approved on
    - Additional details – shows free text input related to request
    - Items
        - description
        - quantity
        - price
    - Purchase Orders
    - Assets
    - Header - contains the status tracker that helps you quickly identify the request process stages and contains executable function for each step in the process

1. Select the **Review** step in the status tracker.

1. Update the Approval Status field from *Pending* to **Rejected**.

1. Select **Run Flow** to *Notify Review Complete*. This action notifies the user making the request of the approval action.

#### Use Teams to reject a request

Hardware managers have a workflow item for *Approval* in Teams that arrives when a request is submitted, along with a notification in *Activity*. To get started with the process of rejecting a hardware request through Teams, take these steps:

1. Select **Approvals** in the left pane of Teams.
1. Select the request to review; a card will open with the relevant details for the request:

    - Status – shows *Requested* in this case (eventually *Approved* or *Rejected*)
    - Name
    - Submitted By
    - Amount
    - Additional details – shows free text input related to request
    - Items – lists the products with description, quantity, and price
    - Attachments – shows relevant documents to review
    - Status flow – shows timing of action from requestor to approver
    - Comments – allows approver to explain decision

1. Select **Reject**.

#### Use Outlook to reject a request

Hardware managers receive an email in their *Outlook Inbox* that arrives when a request is submitted and ready for a review. To reject a hardware request through Outlook, take these steps:

1. Open the request to review email. The email has the relevant details for the request:
    - Status – *Requested* in this case (eventually *Approved* or *Rejected*)
    - Name
    - Submitted By
    - Amount
    - Additional details – shows free text input related to request
    - Items – lists the product description, quantity, and price
    - Attachments – shows documents relevant to review
    - Status flow – shows timing of action from requestor to approver
    - Comments – allows approver to explain decision
1. Select **Reject**.

### Purchase

Once the Request is approved, it's ready for purchasing. Any items that require purchasing are added to a *Purchase Order* in your company's purchasing system. To make the Hardware Management app reflect the reality of that purchase order, update the request with the purchase order information. Take these steps:

1. Select the **ellipsis (…)** on the *Purchase Orders* tile in the request and select **+ Add New Purchase Order**.
1. Input the fields and select **Save**.

    Required fields for a purchase:

    - Name (Note: Purchase Order name may align with the Request)
    - Business Group – shows group that is financially responsible for the purchase
    - Budget – shows where the funds are to be allocated from

    Optional fields for a purchase:

    - PO Number (assigned externally)
    - Amount
    - Hardware Request
    - Currency

1. Once the purchase order is entered, run the notification flow to communicate the completion of the stage. From the overview, select **Purchase** within the workflow and then select **Run Flow** for *Notify purchase complete*. In the window that appears, select **Run Flow** again.
1. Advance the workflow by selecting **Purchase** in the workflow and then select **Next Stage**.

## Receive

Once the shipment of the ordered products are received, you are ready to create assets, communicate receipt, and advance the workflow in the Hardware Management app. Take these steps to update the request:

1. Select **Requests** on the left pane of the Hardware Management app.
1. Create assets for the received goods.
    1. Select **Receive** within the workflow
    1. Select **Run Flow** for *Create assets*
    1. In the window, select **Run Flow** again
1. Communicate the receipt event to the requestor.
    1. Select **Receive** within the workflow
    1. Select **Run Flow** for *Notify received complete*
    1. In the window, select **Run Flow** again
1. Advance the workflow.
    1. Select **Receive** in the workflow
    1. Select **Next Stage**
    1. Select **Receive** in the workflow
    1. Select **Run Flow** for *Notify received complete*
    1. In the window, select **Run Flow** again

### Deliver

Now that the assets are on hand, it's time to deliver them. Once the requestor is in possession of the assets, take these steps to update the request:

1. Select **Requests** on the left pane of the Hardware Management app.
1. Create assets for each delivered item.
    1. Select **Delivery** within the workflow
    1. Select **Run Flow** for *Set assets as delivered*
    1. In the window that pops up, select **Run Flow** again
1. Communicate the delivery event to the requestor.
    1. Select **Delivery** within the workflow
    1. Select **Run Flow** for *Notify delivery complete*
    1. In the window that pops up, enter *Delivered On* date
    1. Select **Run Flow** again
1. Advance the workflow.
    1. Select **Deliver** in the workflow and select **Next Stage**

### Complete

Update the request to reflect that the process is complete. Take these steps:

1. Select **Requests** on the left pane of the Hardware Management app.
1. Communicate the completion to the requestor.
    1. Select **Complete** within the workflow
    1. Select **Run Flow** for *Notify request complete*
    1. In the window that pops up, select **Run Flow** again
1. Complete the workflow.
    1. Select **Complete** in the workflow
    1. Enter a *Completed on* date and then select **Finish**

### Reassign a request

It may be necessary to reassign a request to a different approver than the one selected by default upon submission through the request app. You can complete the action either from the Hardware Management app or Teams.

#### Use the Hardware Management app to reassign a request

Take these steps to reassign a request to a different approver:

1. Select **Requests** on the left pane of the Hardware Management app.
1. Select **Assign** to bring up the *Assign Hardware Request* window.

   > [!NOTE]
   >
   > Depending on the size of the window, you may need to select the **ellipsis (…)** to see *Assign*.

1. For *Assign to*, select **User** or **Team**. For user or team, you can view all or filter to see *only users* or *only teams*.
1. Once a selection is made for the reassignment, select **Assign**.

#### Use Teams to reassign a request

Take these steps to reassign a request to a different approver in Teams:

1. In the card, select **Reassign**.
1. Start typing the name in *Reassign to* (suggestions are made based on the input).
1. Once a name is selected, select **Confirm** to complete the reassignment.

### Notify Hardware is eligible for refresh

Every Asset is assigned a *Refresh Eligible On* date. The date is calculated based on the:

- *Refresh Term* (Months) in the refresh policy for the product
- *Delivered On* date of the asset

A flow for *Notify Asset Refresh Eligible* is executed periodically. For active assets that are exceeding their refresh date, a notification is sent to inform the asset owner. The asset itself is also updated to reflect the date on which the notification was sent. After that time, the replacement asset can be requested, according to policy. Once the replacement is delivered, the older asset can be updated to *Retired* status.

### Mass import for bulk purchase

To create assets purchased in bulk, use the Excel online integration. Bulk import these assets and associate the import to a purchase order for budget roll-up reasons without a request.

### Get insights on requests and hardware assets

The app is built with a handful of reports driven by Power BI that allow you to monitor Request Activities, Budgets, and Assets to enable efficient operations. Select **Dashboards** and then **Reports** on the left pane to get started.

#### Hardware Request Dashboard

The Hardware Request Dashboard gives a graphical view of request activity. Select the period from the dropdown (Today, Yesterday, This Week, Last Week…) for the desired *Submitted on* date filter.  The charts updates with views for:

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
