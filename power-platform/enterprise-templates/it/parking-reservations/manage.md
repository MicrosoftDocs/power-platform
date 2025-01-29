---
title: Get started managing the Parking Reservation program
description: Learn how to manage how to manage the Parking Reservations app
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/28/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a Parking Reservations program manager, I want to learn how to administrate the Parking Reservations program so that I can effectively manage parking spaces for people who need them.
---

# Manage the Parking Reservation program

Before parking reservations can be made, you, as the parking reservation program manager, need to complete certain configuration steps that create records for countries, cities, buildings, floors, and parking spots in the Administrator model-driven app.

:::image type="content" source="media/manage/par-res-admin.png" alt-text="Screenshot of active reservations in the Parking Reservation model-driven app for administrators.":::

## Create countries

1. Start the Parking Reservation Administrator model-driven app and select Countries under Parking Details.
1. Select **+ New** on the top toolbar and fill out the Country Name for the new country record.
1. Select **Save**.
1. Repeat the steps every time you need to create a new country.

## Create cities

1. Start the Parking Reservation Administrator model-driven app and select **Cities** under *Parking Details*.
1. Select **+ New** on the top toolbar and fill out the *City Name* for the new city record.
1. Select the *Country* field value from existing countries by either typing in a few letters of the country name or selecting the **magnifying glass** icon and choosing one of the results, this is a required field.
1. Select Save.
1. Repeat the steps every time you need to create a new city.

## Create buildings

1. Start the Parking Reservation Administrator model-driven app and select Buildings under Parking Details.
1. Select **+ New** and type in a Name for the new building record.
1. Type in the numeric value for the Book in Advance Days to set the policy for required days prior to reservation.
1. Type in the numeric value for the Cancellation Policy Days to set the policy for required days prior to cancellation.
1. Select the appropriate values for Country and City by typing in a few letters of the country name or city name you are looking for and then choose from the results.
1. Type in State, Street, and Zip Code as needed.

## Create floors

1. Start the Parking Reservation Administrator model-driven app and select **Floors** under *Parking Details*.
1. Select **+ New** and type in the Name for the new floor record.
1. Select the Building Id field value from existing buildings by either typing in a few letters of the building name or selecting the magnifying glass icon and choosing from the results, this is a required field.
1. Type in the Level for this floor, this is a required field.
1. Select **Save**.
1. Repeat the steps every time you need to create a new floor.

## Create parking spots

1. Start the Parking Reservation Administrator model-driven app and select **Parking Spots** under *Parking Details*.
1. Select + New on the top toolbar and fill out the Name for the new parking spot record.
1. Select the *Building* field value from existing building by either typing in a few letters of the country name or selecting the magnifying glass icon and choosing one of the results, this is a required field.
1. Select the *Floor Id* field value from existing floors by either typing in a few letters of the floor name or selecting the magnifying glass icon and selecting one of the results, this is a required field.
1. Select the *Is Accessible* field value. Choose **No** (default), to not include a priority or accessibility filter or choose **Yes**, to include in the list of accessible parking spots.
1. Select (vehicle) Type, it can be one of the following choices, Car, Motorcycle, Bicycle, or E-Vehicle, this is a required field.
1. Select **Save**.
1. Repeat the steps every time you need to create a parking spot.
