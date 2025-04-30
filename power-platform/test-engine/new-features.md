---
title: Power Apps Test Engine new features
description: Summary of new features added to Test Engine
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-ms
---

## Test Engine Canvas Changes

The first preview version of the Test Engine was focused on testing canvas applications only. The updated preview version of Test Engine provides new features to allow for more diverse test types.

#### Model Driven Application Support

The latest version of the Test Engine now expands Power Apps testing to include support for [Model Driven Applications](model-driven-application.md) (MDA). This enhancement allows testers to create more comprehensive test plans that cover both canvas and MDA.

#### Dataverse Integration

The ability to optionally include Dataverse in your test plans enables the creation of integration tests. This feature allows testers to validate interactions between applications and Dataverse, ensuring data integrity and consistency across the platform.

#### Managed Extensibility Framework

The new Managed Extensibility Framework model allows extra Power Fx actions to be registered. This framework provides a flexible way to extend the capabilities of the Test Engine by adding custom actions that can be used within test plans.

#### User Defined Types and User Defined Functions

The introduction of User Defined Types (UDTs) and User Defined Functions (UDFs) makes test steps more reusable and maintainable. UDTs allow you to define custom data structures, while UDFs enable the creation of custom functions. These features enhance the flexibility and readability of your test plans.

For more information on UDTs and UDFs, review the [PowerFx](./powerfx.md) documentation.

#### New Authentication Model

The new [authentication](./authentication.md) model removes the need for environment user name and password security, replacing it with a new authentication provider model. This model supports scenarios including multifactor authentication, enhancing the security and reliability of the Test Engine.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
