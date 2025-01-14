---
title: What is the Parking Reservation template for Power Platform?
description: Learn about Microsoft's Parking Reservation template for Microsoft Power Platform.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 01/14/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# What is the Parking Reservation template for Microsoft Power Platform?

The Parking Reservation template is an enterprise-grade solution designed to help your organization streamline the process of managing and reserving parking spaces.

The Parking Reservation template allows you to:

- Configure parking slots across multiple geographic locations.
- Set customizable policies for advanced booking and cancellations for each building.
- Manage both short-term and long-term parking reservations.
- Cancel existing parking reservations.
- Use filtering options to reserve accessible parking spots.

You can extend the capabilities of the Parking Reservation template by customizing the apps to meet your organization's unique processing needs.

The Parking Reservation template package is available on Microsoft AppSource. The package consists of two solutions:

- **IT Base** contains components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Parking Reservation** contains all the components to enable users to create and manage parking spots and allow creation of parking reservations.

## IT Base solution

**IT Template Administration** is the model-driven app that allows admins to create, view, and edit localized string values. It's supported by two tables, one security role, and one choice.

- **IT Localization** is the table that records the app string replacements for every language into which the app is localized.
- **IT Error** is the table that records all errors from app and flows.
- **IT Template Administrator** is the security role that provides create, read, update, and delete access to the table.
- **ISO Language Code** is the one choice that stores the abbreviation for available language codes.

## Parking Reservation solution

The Parking Reservation solution is comprised of many components that can easily be customized to meet your needs.

Two apps:

- **Parking Reservation** is the canvas app where users create their parking reservations and set their user preferences.
- **Parking Reservation Administrator** is the model-driven app where an admin can manage all data. This includes the adding and configuration of the parking slots that can be booked through the canvas application. Users are empowered to add buildings, (building) floors, countries, and cities for adding parking slots. Configure advance and cancellation booking policies for each building.

Nine tables:

- **Building**
- **City**
- **Country**
- **Floor**
- **Long Term Reservation**
- **Parking Spot**
- **Reservation**
- **User**
- **Vehicle**

Two security roles:

- **Parking Reservation Admin** provides access to the model-driven app and canvas app.
- **Parking Reservation Admin Read-only** provides access to the model-driven app and canvas app with Read-only access.
- **Parking Reservation User** provides access to the canvass app.

Two choices:

- **Parking Days Choices** stores the available parking-day choices.
- **Spot Type Choices** stores the available spot-type choices:

  - Care
  - Motorcycle
  - Bicycle
  - E-Vehicle

Two connection references:

- Parking Reservation - Dataverse
- Parking Reservation - Outlook

### Next step

[Install and set up the Parking Reservation template](install-and-set-up.md)

### See also

[Manage the Parking Reservation app](manage.md)