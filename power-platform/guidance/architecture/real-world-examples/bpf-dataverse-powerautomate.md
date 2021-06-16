---
title: "Using business process flows, Dataverse, codeless custom connectors, and Power Automate with canvas apps  | Microsoft Docs"
description: Read about how T-Mobile built an app with complex security requirements by using business process flows technology with advanced security model of Dataverse.
author: slaouist
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/20/2021
ms.author: mehdis
ms.reviewer: kvivek
  
---

# Using business process flows, Dataverse, codeless custom connectors, and Power Automate with canvas apps 

With [business process flows](/power-automate/business-process-flows-overview), you can ensure that users enter data consistently and follow the same steps every time. The out of the box experience of business process flows is composed of stages and steps that are then displayed in a control at the top of the form.

 ![Business Process Flow](./media/BPF_1.png)

For experiences that require a custom user experience, Dataverse offers a rich set of APIs to create a rich business process flow experience within canvas apps.  Here is an example of a business process flow implemented in a canvas app:

![Business Process Flow in Canvas](./media/BPF_2.png)

To render a business process flow within a canvas app, you can make use of a “codeless” custom connector that implements some key Dataverse APIs related to business process flows functionality. A “codeless” custom connector is a connector in which we only need to use the Open API spec that lines up with the underlying Dataverse API service without building the service itself. 

![Architecture Diagram](./media/BPF_3.png)

In the case of business process flows, there are important APIs available to retrieve the different business process flows stages, active stage, and meta data related to the controls defined in each stage. To learn more about business process flows APIs, see [Work with business process flows using code](/power-automate/developer/business-process-flows-code) in the Power Automate docs. 

Within the canvas app, one can consume these APIs by adding the custom connector and invoking the exposed functions. However, it's sometimes more convenient to transform and shape the data returned from the custom connector server-side. In that case, Power Automate becomes a “low code” mechanism to process data server-side and return shaped responses to Power Apps. Power Automate can be used as a substitute to a full-fledged API service, which can be more performant but potentially more costly to build and would require pro developer skills.

Building canvas apps that implement a business process is possible without the use of business process flows, but when you're building an app that also has complex security requirements, using the out-of-the-box business process flows feature with the advanced security model offered by Dataverse is powerful.

For a real world example, view this blog on how T-Mobile built an app called Orbit used by project leads and executives to approve all new initiatives across the company: [Blog: T-Mobile manages company wide initiatives and more with Microsoft Power Platform](https://powerapps.microsoft.com/blog/tmobile/). 

![Power Apps canvas app for tracking initiatives and managing multi-stage approval process](./media/T-MobileOrbitApp1.jpg)