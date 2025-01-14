---
title: Use the Meeting Room Services app
description: Learn how to use the Meeting Room Services app to streamline and automate the meeting room services request process.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/10/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a user of the Meeting Room Services app, I want to create and manage meeting room service requests so that my meetings have the necessary resources to run well.
---
# Get started using the Meeting Room Services app

As a user of the Meeting Room Services app, you can:

- Create, view, cancel, or update your service request meetings.
- Submit feedback for completed service requests.
- Report issues on meeting rooms.

## Create a service request

Take these steps to create a service request:

1. In the Meeting Room Services app, go to the *Upcoming Meetings* screen.
1. Select **Request service** for an upcoming meeting listed on the screen.
1. On the *Request service* screen, specify the service and any subservice or other details to complete the request.
1. Select **Add to service requests**.
1. Repeat steps three and four until you have all the required services added in the *Service requests* section.
1. Select **Submit**. This triggers the *Meeting Room Services - When service is requested or updated* flow, which notifies one or more service owners regarding the submitted service request.

## View service requests

1. On the left navigation pane, select **My requests**.
1. Select any request number from the list.

## Cancel a service request

1. On the *My requests* screen, select on the request number of any *New* or *In Progress* service request.
1. Select **Cancel Request**.
1. Select **Yes** on the confirmation screen to trigger the *Meeting Room Services - When service is requested or updated* flow, which notifies one or more service owners about the updated service request.

## Update a service request

1. On the *My requests* screen, select on the request number of any *New* or *In Progress* service request.
1. Update the *Subservice* and *Additional details* fields as necessary.
1. Select **Update** to trigger the *Meeting Room Services - When service is requested or updated* flow, which notifies one or more service owners about the updated service request.
1. On the Success screen, select **Go to My requests**.

## Submit feedback for a completed service request

1. On the left navigation pane select **Feedback and issues**.
1. Choose a meeting to provide feedback and select **Give feedback** for that meeting. The Give feedback screen displays the completed service requests for that meeting and the survey topics for each service.
1. Select the rating for each survey topic and then select **Next** to view more completed service requests and provide ratings.
1. Select **Submit** when you are done providing ratings.

## Report an issue for a meeting room

1. On the left navigation pane select **Feedback and issues**.
1. Choose a meeting to provide feedback and select **Report issue** for that meeting.
1. On the **Report issue** screen provide details in the field.
1. Toggle to indicate if the room was usable or not.
1. Select **Report issue** to trigger the *Meeting Room Services - Notify administrator When an Issue is Reported* flow, which notifies the program managers about the issue with the meeting room.

### Related resources

[Overview of the Meeting Room Services template](overview.md)
