---
title: "Power Apps Test Engine Power Fx (preview)"
description: "Describes Power Fx you can use with Power Apps Test Engine."
author: grant-archibald-ms
ms.author: grarchib
ms.date: 08/11/2023
ms.reviewer: jdaly
ms.topic: article
---

# Power Apps Test Engine Power Fx (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> 
> You can make use of [Learning Playground](https://microsoft.github.io/PowerApps-TestEngine/learning/playground/) to get hands on and try the functions documented in this guide.

## What is Power Fx?

[Microsoft Power Fx](../power-fx/overview.md) is a low-code general-purpose programming language based on spreadsheet-like formulas. It's a typed, declarative, functional language, with imperative logic and state management available as needed. Its history from Excel makes it accessible to a wide range of users, from beginners to experienced developers.

### Advanced Power Fx Scenarios

If you're already familiar with Power Fx, diving into advanced scenarios can significantly enhance the capabilities and efficiency of your applications. Here are some advanced scenarios and why they might be of interest:

- **Creating Custom Functions**: Creating custom functions allows developers to encapsulate complex logic into reusable components. This approach not only simplifies the development process but also ensures consistency and reduces the likelihood of errors. Custom functions can be tailored to specific business needs, making your test more powerful and flexible.

- **Integrating with External Data Sources**: Integrating Power Fx with external data sources enables your tests to interact with a wide range of data, from databases to web services. This integration can enhance the functionality of your applications by providing real-time data access and updates. It also allows for more dynamic and responsive tests that can adapt to changing data.

- **Optimizing Performance for Large-Scale Tests**: As your tests grow in complexity and scale, performance optimization becomes important. These optimizations could include performance, such as efficient data handling and using Power Fx's built-in functions for better performance. These optimizations ensure that your tests remain responsive and efficient, even with large datasets and complex logic.

## Extensibility Model

Test Engines Power Fx's [extensibility model](./extensibility.md) is one of its many compelling features. You can extend the language with custom functions and actions, making it highly adaptable to various scenarios. Here are some key aspects of the extensibility model:

- **Reuse the Skills You Already Have**: Power Fx's extensibility model allows you to use your existing skills in Power Fx and other programming languages, such as C#. Using this approach means you can bring your knowledge and experience into the Power Fx based tests, making it easier to create powerful and customized solutions.

- **Allow Reuse of Existing Libraries and Features**: The extensibility model enables the integration of existing libraries and features into Power Fx. Reuse allows developers to reuse tried-and-tested code and reducing development time to increase reliability. By incorporating existing libraries, you can enhance the functionality of your Power Fx applications without reinventing the wheel.

- **Provide a Model to Encapsulate Complexity for Users of the Functions**: One of the significant advantages of the extensibility model is its ability to encapsulate complexity. Makers and Developers can create custom functions that hide the intricate details of the underlying logic, providing a simple and user-friendly interface for end-users. Abstraction makes it easier for everyone to use and benefit from advanced functionality without needing to understand the complexities behind it.

- **Enhance Collaboration and Consistency**: Teams can create a consistent set of custom functions and actions that can be shared and reused across different projects. Using common `testSettings.yaml` file can promote collaboration and ensures that best practices are followed, leading to more robust and maintainable applications.

- **Facilitate Integration with External Systems**: The extensibility model allows for seamless integration with external systems and services. This means you can connect your Power Fx applications to a wide range of data sources and APIs, enhancing their capabilities and providing real-time data access.

- **Support for Advanced Scenarios**: The extensibility model is designed to support advanced scenarios, such as creating domain-specific languages and custom workflows. This flexibility ensures that Power Fx can be adapted to meet the unique needs of different industries and use cases.

As developer or advanced maker understanding and using the extensibility model, developers can create more powerful, flexible, and user-friendly applications with Power Fx. This model not only enhances the capabilities of the language but also makes it more accessible and valuable to a broader range of users.

## User Defined Types

User Defined Types (UDTs) in Power Apps Test Engine allow you to define custom data structures that can be used within your test plans. This feature enhances the flexibility and reusability of your test cases by enabling you to create complex data types tailored to your specific testing needs.

### UDT example

This example shows how to define and use UDTs in a `testSettings.yaml` file:

```yaml
powerFxTestTypes:
 - name: ControlName
   value: |
      {ControlName: Text} 
 - name: Options
   value: |
      [{Name: Text, Value: Number}]   
```

### UDT example explanation

The `powerFxTestTypes` section defines two new types: `ControlName` and `Options`.

- `ControlName` is a simple type with a single property `ControlName` of type `Text`.
- `Options` are a more complex type, representing a list of objects, each with `Name` (of type `Text`) and `Value` (of type `Number`).

You can use these types within your test cases to define variables and validate their properties. For example, you can set a variable of type `Options` and validate that it contains the expected `Name` and `Value` pairs.

## User Defined Functions

User Defined Functions (UDFs) in Power Apps Test Engine allow you to define custom functions that can be used within your test plans. This feature enhances the flexibility and reusability of your test cases by enabling you to create complex functions tailored to your specific testing needs.

### UDF Benefits

- **Reusability**: UDFs allow you to define complex functions once and reuse them across multiple test cases. This reduces redundancy and ensures consistency in your test plans.
- **Readability**: Using UDFs makes your test plans more readable and easier to maintain. By defining custom functions, you can encapsulate complex logic and make your test cases more understandable.
- **Flexibility**: UDFs provide the flexibility to create custom functions that fit your specific testing requirements. Use this approach to allow you to tailor your test cases to better fit your application's needs.
- **Maintainability**: With UDFs, changes to functions can be made in one place, reducing the effort required to update multiple test cases. This improves the maintainability of your test plans.

### UDF example

This example shows how to define and use UDFs in a `testSettings.yaml` file:

```yaml
testFunctions:
 - description: Wait until control is visible using Document Object Model (DOM) selector
   code: |
    WaitUntilVisible(control: Text): Void = 
      Preview.PlaywrightAction(Concatenate("//div[@data-id='", control, "']"), "wait");
 - description: Get the options for a control using Power Fx control from Model Driven App (MDA)
   code: |
    GetOptions(control: ControlName): Options =
      Preview.GetOptions(control);
```

### UDF example explanation

The `testFunctions` section defines two new functions:

- `WaitUntilVisible` takes a `control` parameter of type `Text` and waits until the specified control is visible using a DOM selector.
- `GetOptions` takes a `control` parameter of type `ControlName` and returns the options for the specified control using Power Fx from a Model Driven App (MDA).

Use these functions in your test cases to perform specific actions or retrieve data. For example, you can use `WaitUntilVisible` to ensure a control is visible before interacting with it, and `GetOptions` to retrieve and validate the options available for a control.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
