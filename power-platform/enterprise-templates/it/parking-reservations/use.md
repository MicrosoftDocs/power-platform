---
title: Use the Parking Reservation app
description: Learn how to use the Parking Reservation app to streamline and automate the parking reservation process.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/28/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a user of the Parking Reservations app, I want to reserve a parking space in advance so it is available when I arrive at my destination.
---

# Use the Parking Reservation app

As a user of the Parking Reservation app, you can:

- Update preferences
- Create short-term reservations
- Create long-term reservations
- View existing reservations
- Cancel reservations

## Update preferences

You can set up your preferred building and vehicle in the Parking Reservation app. Take these steps to update your preferences:

1. On the *My Reservation* screen, select the **Preferences** tab.
        :::image type="content" source="media/use/par-res-pref.png" alt-text="Screenshot of the Parking Reservation app's Preferences screen where users can set their building and vehicle preferences.":::
1. On the *Preferences* screen, choose your preferred building from a list of buildings in the *Select a preferred building* dropdown. This sets your preferred building as the default every time you go to the *Reserve a spot* screen.
1. Select your vehicle from a list of available vehicles in the *Select a preferred vehicle* dropdown to set it as your default. If your vehicle is not in the dropdown list, you can take steps to add it.
    1. Go to *My vehicles* to add your vehicle to the vehicle preferences dropdown list.
    1. Give your vehicle a nickname or follow your organization's naming guidance.
    1. Provide your vehicle's plate number.
    1. Select **Add** to add the vehicle to your *My vehicles* list.

## Reserve a parking spot

You have the option to create a short- or long-term reservation in the Parking Reservation app. The preferences you created will show up in the dropdown fields for you to select. Take these steps to set up your reservation:

1. On the *My Reservation* screen, select **Reserve a spot**.
    :::image type="content" source="media/use/reserve-spot.png" alt-text="Screenshot of the Parking Reservation app's Reserve a spot screen where users can reserve parking spots.":::
1. On the *Reserve a spot* screen, you need to indicate whether the reservation is long term (more than one day) or short term (only one day).
    1. Make sure *Is long term* is set to **No** for a single-date reservation.
    1. Make sure *Is long term* is set to **Yes** for a long-term reservation.
1. Select the **calendar icon** to select the reservation start date. If you are making a long term reservation, you need to select the **calendar icon** again to select the reservation end date.
1. Select **Vehicle** from the dropdown to select your vehicle. The options available are based on what you set as your preferences.
1. Select **Building*** from the dropdown to select the building. The options available are based on what you set as your preferences.
1. Select **Level** from the dropdown to select the level of the building.
1. Select **Spot type** from the dropdown to select the type of parking spot you need. You can choose from *Car*, *Motorcycle*, *Bicycle*, and *E-Vehicle* (choices are configurable). The *Is accessible* allows you to filter based on priority or what's available.
1. Select the **Parking spot** you want from the dropdown. The listed spots listed as available are based on what you previously selected for building, level, and spot type.
1. Select **Reserve** and a confirmation screen will appear. Select **Yes** to proceed with the reservation or **No** to cancel the action and go back to the reservation screen.
1. Look for your email confirmation that contains all the reservation details. Repeat these steps every time you need to create a short- or long-term reservation.

> [!NOTE]
> A reservation cannot proceed if the date selected doesn't adhere to advance booking policies for the building selected or you have an existing reservation for the selected date.

## View existing reservations

You can track existing reservations on the *My Reservation* screen. In the calendar control on the left side of the screen, blue dots below a date indicate your confirmed parking reservations.

## Cancel a reservation

You can cancel parking reservations in the Parking Reservations app. Take these steps to cancel specific reservations:

1. On the *My Reservation* screen, browse on the calendar control on the left side of the screen to identify the dates you have parking reservations set (a blue dot below the date indicates a reservation).
1. Select the date with the blue dot to display the parking reservation details of the respective reservation you intend to cancel.
1. Review the parking reservation details to confirm it is the date you want to cancel, and select **Cancel reservation**.
1. The *Cancel booking* screen prompts you to:
    1. Select **Yes** to confirm the cancellation.
    1. Select **No** to stop the cancellation.
1. Look for your email confirmation that contains all the reservation cancellation details. Repeat these steps every time you need to cancel a reservation.

### See also

[Overview of the Parking Reservation app](overview.md)