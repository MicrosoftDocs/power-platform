---
title: Get started managing the Parking Reservation program
description: Learn how to manage how to manage the Parking Reservations app
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 02/05/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a Parking Reservations program manager, I want to learn how to administrate the Parking Reservations program so that I can effectively manage parking spaces for people who need them.
---

# Manage the Parking Reservation program

Before people in your organization can start using the Parking Reservation app, a Parking Reservation program manager needs to take steps to ensure it is set up with relevant data. In this role, you need to complete certain configuration steps that create records for countries, cities, buildings, floors, and parking spots in the Administrator model-driven app.

:::image type="content" source="media/manage/par-res-admin.png" alt-text="Screenshot of active reservations in the Parking Reservation model-driven app for administrators.":::

## Create countries

You need to create records for all the countries that can be selected in your organization's Parking Reservation app.

1. Start the Parking Reservation Administrator model-driven app and select Countries under Parking Details.
1. Select **+ New** on the top toolbar and fill out the Country Name for the new country record.
1. Select **Save**.
1. Repeat the steps every time you need to create a new country.

## Create cities

You need to create records for all the cities that can be selected in your organization's Parking Reservation app.

1. Start the Parking Reservation Administrator model-driven app and select **Cities** under *Parking Details*.
1. Select **+ New** on the top toolbar and fill out the *City Name* for the new city record.
1. Select the *Country* field value from existing countries by either typing in a few letters of the country name or selecting the **magnifying glass** icon and choosing one of the results, this is a required field.
1. Select Save.
1. Repeat the steps every time you need to create a new city.

## Create buildings

You need to create records for all the buildings that can be selected in your organization's Parking Reservation app.

1. Start the Parking Reservation Administrator model-driven app and select Buildings under Parking Details.
1. Select **+ New** and type in a Name for the new building record.
1. Type in a numeric value to set your organization's *Book in Advance Days* policy. This value states how many days in advance a person needs to make their parking reservations.
1. Type in the numeric value to set your organization's *Cancellation Policy Days* policy.This value states how many days in advance a person needs to cancel their parking reservation.
1. Select the appropriate Country and City values by typing in a few letters of the country or city name you are looking for and choosing from the results.
1. Type in State, Street, and Zip Code as needed.

## Create floors

You need to create records for all the floors within each building that can be selected in your organization's Parking Reservation app.

1. Start the Parking Reservation Administrator model-driven app and select **Floors** under *Parking Details*.
1. Select **+ New** and type in the Name for the new floor record.
1. Select the *Building Id* field value from existing buildings by either typing in a few letters of the building name or selecting the magnifying glass icon and choosing from the results.
1. Type in the Level for this floor.
1. Select **Save**.
1. Repeat the steps every time you need to create a new floor.

## Create parking spots

You need to create records for all the parking spots that can be selected on each floor within each building in your organization's Parking Reservation app.

1. Start the Parking Reservation Administrator model-driven app and select **Parking Spots** under *Parking Details*.
1. Select **+ New** and type in a Name for the new parking spot record.
1. Select the *Building* field value from existing building by either typing in a few letters of the country name or selecting the magnifying glass icon and choosing one of the results.
1. Select the *Floor Id* field value from existing floors by either typing in a few letters of the floor name or selecting the magnifying glass icon and selecting one of the results.
1. Select the *Is Accessible* field value. Choose **No** (default), to not include a priority or accessibility filter or choose **Yes**, to include in the list of accessible parking spots.
1. Select the (vehicle) *Type* from one of the following choices: Car, Motorcycle, Bicycle, or E-Vehicle.
1. Select **Save**.
1. Repeat the steps every time you need to create a parking spot.
