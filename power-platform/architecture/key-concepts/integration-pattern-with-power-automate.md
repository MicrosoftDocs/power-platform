---
title: Integration pattern using Power Automate cloud flows
description: "Power Automate integration patterns: Discover how to design effective, scalable integrations using cloud flows. Learn key considerations and best practices."
#customer intent: As a Power Platform user,  I want to understand integration patterns using Power Automate so that I can design effective, scalable solutions for my organization.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 06/24/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - rachaudh
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:06/24/2025
---

# Use integration pattern in Power Automate cloud flows

This article explores different integration patterns using Power Automate cloud flows. It covers considerations for building effective integrations for each pattern, the challenges you might face, and the decision-making process for achieving your goals.

There isn’t one approach to building integrations that’s always best. Like building a house, the approach depends on your requirements. This article uses a hypothetical problem to guide you to the right solution.

The primary audience is enterprise architects who want to design new integrations or enhance existing ones with modern low-code solutions. This article focuses less on technical solutions and provides links to relevant documentation where needed.

## Introduction

Integration is a key part of modern business processes. It lets data and automation flow across different systems. This article explains how to choose the right integration patterns and what to consider when designing integrations with Power Automate.

First, learn about the key considerations for any integration and what they mean when you build an architecture. Then, explore common integration patterns, how they work in Power Automate, and see real-world examples where you use these patterns.

Finally, learn what to do if Power Automate doesn't have the tools you need.

By the end of this article, you learn:

- How to break requirements into the key parts of an integration
- Who to include as stakeholders in the decision making process
- How to choose the best pattern for your goals
- How to balance scalability and performance
- How to use the strengths of cloud flows and address their shortcomings
- Techniques for robust integrations

## Requirements in integration

Before discussing the patterns, start by looking at the requirements of an integration. Begin with a high-level goal, such as connecting SAP to Dataverse or sending a notification every time there’s an update in a case a user works on.

These are examples of how a business user may look at an integration problem and is also the starting point where an architect takes over.
What follow-up questions do you need to ask when being tasked with connecting system A to system B and who are the people to answer these questions?

When we need to create any flow of information, the first question we need to ask is: How much data is being sent and how often?


- [Volume and frequency](#volume-and-frequency) is the first major component in our decision making process that will determine the kinds of tools we need to use
  to implement the business requirement.

- The next component would be the [directionality](#directionality), or where does data flow from and to. Finding that out informs how we configure the pattern for a
  successful integration.

- And lastly, we need to consider [capability](#capability), or the ability of each system involved to receive, process and send data. Using the `weakest
  link` approach, evaluation of capabilities inform us of the limitations and possibilities. Sure, the business user may want everything-all-at-once-in-real-time, but if that IBM Mainframe just can’t do it, the capability analysis
  will flag that from the get go.

Let’s review each component, starting with Volume and frequency.

### Volume and frequency

The amount of data and the frequency of integration tasks significantly impact the choice of integration patterns. While an obvious example is the difference between sending 10 records and a million records, the difference can also be more subtle.

What if you had a requirement to send 60,000 records every hour and a requirement to send 1000 records every minute. Does that mean you can
use the same solution for both requirements? Not necessarily.

While the volume is same, 60,000 records per hour, the expectation when the data arrives is different, or the frequency requirement is different. It may be the case that one solution would work for both, but
only if you can demonstrate if you can do 1000 records per minute, not 60,000 records per hour.

So that’s it, right? Just find a common denominator and build one solution that works for both? No, not always.

In some cases you might want to build separate solutions for these two requirements because always running at higher frequencies might not be a
process that is used often but it's more resource intensive towards one (or more) of the integrated systems.

While it may sound like a waste of resources to build multiple integration solutions for the same integration, the cost/benefit equation may sometimes result in a need to do just that.

- **Triggers**

    Volume and frequency is often affected by how an integration is triggered. A scheduled trigger (also known as batch) is probably the
    simplest one, because it’s easy to predict the conditions of the integration, assuming we know the growth trajectory of the data involved.

    Event-driven triggers are affected by many factors and ultimately it can be harder to predict how often an integration is launched. An
    event can be a button click, a change in a record in one of the systems or an API call. For an enterprise app, like Power Apps, events like a button click are
    easier to predict, since you're ultimately limited by the population of employees.

    Events triggered by a publicly accessible system, like a public services Power Pages website open to millions of citizens, can fluctuate by orders of magnitude.

- **Seasonality**

    Like the changing of the seasons, volumes of data can change wildly depending on how the business operates. Think of a services provider that bills their customers monthly or quarterly, there might be needed for a guaranteed large volume of data to pass through in a short time.

    Seasonality is more severely affected by event-driven integrations, because you don’t know how much data will be moved during certain seasons. However, you can be aware that of these waves and implement safeguards in your solution to prevent the integration from processing an amount of data that you know will be beyond its capabilities (more on that later).

    Scheduled integrations can also be affected by seasonality in cases when the size of the data batch is affected time based events
    in the business life cycle. An accounting firm, for example,  could experience increased data volumes during tax season.

- **Stakeholders**

    The conversation about volume and frequency is one that should always be discussed with process owners, or the key business users that
    provide the initial business requirements. Make sure that whatever was indicated in the requirements correlates to how the process actually works.

    Business users may not always know the entire process so it’s up to you as the architect to follow the leads and discover how things supposed to work.

- **Plan for the future**

    The future can’t be predicted, but as architects, it is necessary to try. When building an integration solution for a growing business, the result is something with an expiration date. There’s no way around it.
    
    When building a critical integration solution, you clearly indicate the conditions it's designed to work under and create long term plans for its scalability. If there’s enough information, you can also indicate the expected date when the solution will require scaling.
    
    Regardless, for critical integrations there should be a monitoring solution in place that will give the IT staff advance notice when volumes approach the limits of the integration overall.

### Directionality

Directionality involves understanding the source and destination of data
in an integration process. It's essential to consider the availability
of systems, compliance requirements, and security measures when
determining the directionality of data flow. For instance, the data
might be coming from a private system that isn't always available, or
it might be subject to strict compliance and security regulations.

- **Stakeholders**

    Compliance is paramount when dealing with data integration and can be
    different for every system involved, ultimately affecting the flow of data. It's necessary to consult with infrastructure architects and
    security officers to ensure that the connection to the systems is secure and meets all regulatory requirements set forth by the organization.

    High-security organizations often have stringent requirements that must be met to access data, which can significantly impact the integration design.

    In cases where integration with legacy on-premises systems is required, a common security requirement is to avoid inbound connections. So even though the business asked for a cloud app to fetch data from the legacy system, you’ll have to design the integration the opposite way, with the legacy system reaching out to the cloud app.


### Capability

The result that can be achieved from a straightforward integration is
always limited by the weakest link in the chain. Capability is what each
system in that chain can attain in terms of overall performance.

Together with the previous components, we need to be aware how
capability of the systems involved maps to the business requirements and
if there’s anything we need to do to increase a capability.

For instance, if a system isn't capable of processing large volumes of
data efficiently, it may become a bottleneck, leading to delays and
potential failures in the integration process. This is important when dealing with high-frequency data transfers or large
datasets.

- **Capability and frequency**

    Frequency of data transfers is also a major concern when evaluating capability. Systems must be able to handle the rate at which data is being sent and received. For example, a system that can process data efficiently once a day may struggle with the same volume if it needs to process it multiple times a day.

- **Caching**

    By far, a caching layer is the most common solution when data access is required to a system that can’t handle the business requirement. In case of Dataverse, [**Synapse
    Link**](/power-apps/maker/data-platform/export-to-data-lake) can be used for that purpose, offering fast replication of selected data into a hyper-scalable data storage service.

    Other systems may offer similar solutions that’s worth exploring.

    Using caching creates a new balance that the architect needs to consider while response times for the end user of the integration are reduced,
    the data received may be outdated, depending on the process involved.

    For processes where near real time data is needed for critical calculations or data consolidation, the integration process needs to ensure that the data provided isn't expired, adding more complexity to the integration process.

- **Transformation and business logic**

    The final consideration for the capability of every system and the integration process itself, is the need to perform business logic for the integration to satisfy business requirements.

    When evaluating the capabilities of a system, it should be in the context of not just what the system can do, but what it can do with the transformations you need it to do prior to sending the data, the logic you need to perform in a flow before sending it to the target system, and the logic the target needs to perform before the data becomes operational.

    A classic example is when you need to take out a table from an SQL database, and write it to Dataverse. The requirement is super simple
    but you find out the table in SQL isn't actually a table, but a view relying on a dozen stored procedures, the data still need to be adapted
    to Dataverse format mid-flight and when finally arriving there, there’s a bunch of plugins that also need to do something.

    Now imagine it’s not just an integration, it’s a massive batch import.

- **Stakeholders**

    Critical systems have system administrators that can usually provide all the information you need about capability. Sometimes it’s a centralized IT team, sometimes it’s a more decentralized arrangement.
    Either way, you’ll need to evaluate each system’s capabilities before you choose the right pattern.

## How it comes together

We looked into the three major components of an integration:  
- Volume and frequency
- Directionality
- Capability

Volume and frequency refer to the total amount of data being
transferred. Directionality involves understanding the source and
destination of data, which is important for ensuring compliance, and
securing data flow. Capability assesses each system's performance and
ability to process data, identifying any potential bottlenecks.

For each component, the discussion covers how they are connected to initial business requirements, what analysis must be performed to factor in their impact on the integration process overall, and who the stakeholders are to help perform the analysis.

Input from the stakeholders during analysis can entirely change our
approach in the integration design process. Process owners provide
initial requirements, while infrastructure architects and security
officers ensure compliance and security. System administrators help
evaluate the capabilities of each system involved.

#### Example 
  
The business requirement is to create an integration process that keeps case information in sync between an external customer and internal service engineers who work on cases. Customers can add comments to a case through a website, while engineers can add case information through a Power App.

Let’s look at the first component, volume, and frequency. The case creation is primarily driven by customers, meaning that the volume would depend on how many customers the company has and the
expected growth trajectory. The total volume of updates would be: `[Customers] x [Cases per customer] x [Average updates per case]`

For an existing organization, getting the values for this calculation should be possible. This number should then be plotted on a chart with the expected growth, so if we expect a 10M/year updates today and an average growth of 20% per year, the chart will look like this:

:::image type="content" source="media/integration-pattern-with-power-automate/requestovertime.png" alt-text="Screenshot of a chart showing requests over time for integration patterns in Power Automate." lightbox="media/integration-pattern-with-power-automate/requestovertime.png":::


Assuming the goal is to build something that lasts at least five years, a typical timeframe for information systems ROI, the integration must be able to handle at least 25M requests per year.

The frequency part concerns the ability of the systems involved to handle information within a year. Historical data can be charted to understand how frequency will apply in this context:

:::image type="content" source="media/integration-pattern-with-power-automate/requestdensity.png" alt-text="Screenshot of a chart showing request density over a year for integration patterns in Power Automate." lightbox="media/integration-pattern-with-power-automate/requestdensity.png":::


This data shows that even today, the integration must withstand a total of 3.2M requests per month. Taking the 20% growth over five years, and assuming the same yearly peaks, the integration built today must handle 8M requests per month.

Now let’s analyze the directionality. 
 
Hiding in the business requirement is actually four data streams: 
- A data stream from the website to write case updates into Dataverse, 
- Another stream for the website to read updates from Dataverse 
- A third data stream where engineers write updates into Dataverse from Power App
- Finally a fourth to read updates in the Power App.

:::image type="content" source="media/integration-pattern-with-power-automate/websiteintegration.png" alt-text="Screenshot of a diagram showing direct website integration pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/websiteintegration.png":::



Now that you understand the data flow and the data steams involved, let’s tackle the last component, Capability.

The data streams on the right, the engineer’s side, is one you don’t have to build as a custom integration, however there are a few things to
consider when building the Power App using built-in connectors.

When getting case information from Dataverse, you should make sure that there are filters and request limits in place that take into account what the engineer actually needs to find and how much the app is physically capable of displaying.

If you don’t set any limits and have engineers attempt to load all cases
every time they open the system, you might have engineers with
pitchforks coming for you.

On the other side of the integration, we have the two data streams for
connecting the website. It’s a custom website so let’s assume we’ll need
to publish an endpoint for it to read and write data.

This is something you can easily do with a [**Power Automate HTTP trigger**](/power-automate/oauth-authentication?tabs=classic-designer).  
However, you must also consider the [**capabilities of the cloud flow**](/power-automate/limits-and-config)
that will handle these requests and Dataverse, which is the final destination. These aren't the same and you should consult with [**current documentation**](https://microsofteur-my.sharepoint.com/personal/ifain_microsoft_com/Documents/Power%20CAT/PAuto%20Integrations%20Patterns/Analysis.vsdx)
to understand if the number of requests you expect to handle is in line with the capabilities of both services.

If you discover that Dataverse is already handling a lot of requests, which can be done through [**Dataverse Analytics**](/power-platform/admin/analytics-common-data-service), and can't handle the projected request load, you’ll need to consider
adding a protective buffer in the form of [**Azure Data Lake**](/power-apps/maker/data-platform/azure-synapse-link-data-lake).

In this case, the integration will result in the following setup:

:::image type="content" source="media/integration-pattern-with-power-automate/decoupled.png" alt-text="Screenshot of a diagram showing website integration, decoupled read pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/decoupled.png":::


This will reduce the read request volume from Dataverse to prevent the
infamous 429 errors from popping up. You can decrease the dependency
even further by also decoupling the create/update request from the
website using a queuing service, like [**Azure Service
Bus**](/azure/service-bus-messaging/service-bus-queues-topics-subscriptions).
This will result in this (even cooler) integration:

:::image type="content" source="media/integration-pattern-with-power-automate/fullydecoupled.png" alt-text="Screenshot of a diagram showing website integration, fully decoupled pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/fullydecoupled.png":::


Along with a well-built cloud flow that handles errors correctly, has a retry logic in it and generally follows all the [**best
practices**](/power-automate/guidance/coding-guidelines/) one might expect, this is the final form of the business requirement. An
integration design that can handle anything.

So why can’t we just build it this way from the start and not worry about it ever again?

Because of cost.  

Not only will you be investing more time and money in the initial development, you'll invest more time and money to pay for licensing and maintenance of each component we add.

This isn't a case of compromising quality for cost, it’s a case of building according to what is needed, while not being wasteful.

When choosing an integration pattern and its components, you want to
perform the analysis you did and choose the approach that uses the least amount of components and complexity, not the one that is technically the most capable.

With the analysis part done, let’s look at examples of integration
patterns and how they can be used.

## Integration patterns

The discussion covered what to consider when planning an integration using Power Automate and how to perform an analysis to determine which pattern would work best. With that information, it is time to explore the different kinds of integrations available.

This list is by no means definitive, however there’s a good chance that a significant chunk of business requirements will end up using one or a combination of these patterns.

### Instant user action

Let’s start with the simplest pattern, a user driven action, or Instant as it’s known in the Power Platform world. This pattern perhaps the most intuitive one because it’s how most people interact
with devices. You press a button and expect a predefined series of actions to happen in response.

#### Example

You’re building a Power App for product managers, which will allow users
to review customer feedback for products and create an action plan to
improve these products based on comments and suggestions.

The problem is that some technical specifications for the product are stored in
Oracle’s Product Lifecycle Management solution. You don’t always need to
look at those so copying the entire dataset to Dataverse doesn’t make
sense but having a button to load the data on request is handy.

There’re several reasons why implementing an integration here might be
better than just having people go to Oracle and get the information from
there: bad user experience (Oracle being what it is, doesn’t make it better),
security concerns, or licensing costs.

Considering how cost-effective it's to build integrations with Power Platform, any one of these reasons qualifies as a good enough reason in the eyes of most managers to approve the costs for such an
integration.

To start, you’ll use an instant cloud flow that will be called upon pressing a button in the app. The flow itself can be as simple as a three step process to call Oracle using the parameters provided by the app
(like Product ID), getting the data, and writing it to Dataverse, which will be reflected in the Power App.

:::image type="content" source="media/integration-pattern-with-power-automate/instanttrigger.png" alt-text="Screenshot of a diagram showing user driven, Instant trigger pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/instanttrigger.png":::


Realistically, the data model between Oracle and Dataverse would be
entirely different so some transformation might be required, resulting
in extra steps.

Despite the name, it’s worth noting that Instant triggers are not
instant. The time it will take the execute the entire flow depends on
the availability and Oracle, Dataverse, and the time it takes to perform
all the transformations you need.

Even for this simple case, you should consider adding an indication in your app that something is happening and the ability to cancel the operation in case it takes too long. This is especially true if you’re operating in a large organization where it’s possible for thousands of people to press the button the same short time window.

Regardless, an integration can fail for many reasons and the last thing
anyone likes about their user experience is clicking a button to sit
there not knowing if something is happening or not.

### Pattern 2: Event-driven, aka automatic

Architects love event-driven architectures because things seem to just fall into place like magic. It’s so intuitive because that’s similar to
how our brain works. There’s two two sides to this of course, much like a research on nuclear fission can end up with you reading a wikipedia article about the ford nucleon, event-driven patterns can get you places you never intended to go.

#### Example

The customer service department wants to send automatic updates to customers whenever a representative makes updates to the case. Not every update needs to go to the customer, only when a note is added or the status of the case has changed.

This one looks simple and it’s something you all experienced in our daily lives. Implementing this In Power Automate requires and automatic trigger,
one that responds to events happening in a given system.

Automatic triggers allow you to create event-driven integrations using
from over a thousand of supported systems. Triggers can be configured to
respond to a record created in Dataverse, incoming emails, files added
to OneDrive, or even to when it rains near your house (yes, really.
Check out the MSN Weather connector).

In our example, the customer service representatives are using a Dataverse connected app to work on a case and provide updates to the customer automatically without having to write emails to customers manually.

The flow would need to respond to changes in any case, but only when edits happen within the defined scope, which is adding notes or changing the status.  
This can be achieved by indicating the change type you’d like to monitor and define the columns to respond to using the select columns parameter.

As a result, you’ll get a cloud flow with the pattern below:

:::image type="content" source="media/integration-pattern-with-power-automate/autotrigger.png" alt-text="Screenshot of a diagram showing event-driven, Automatic trigger pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/autotrigger.png":::


#### A few nuances to consider here
 
First, there’s a good chance that we don’t actually need to respond to
every status update, only to those that concern the customer. It’s likely that there are intermediate case status updates that are meant
for internal use only.

Fortunately, you can achieve that by specifying the Filter Rows parameter that will make sure only case with a certain status value will trigger the flow. The same parameter can also be used for other types of
filtration if needed.

Implementing this logic into the flow itself using an If action is at
least a waste of time and at worst, a costly mistake.

Another thing to consider that is especially sensitive in event-driven architectures is the logic behind the execution of the event itself. Can
we create a situation in which an event will cause an action that would cause that event to happen again in an infinite loop? Is there a set of circumstances that would create multiple updates? That would cause
notifications to be sent out to a customer in rapid succession?

This is the kind of thinking an architect needs to do when creating
event-driven patterns, to avoid unexpected logical conflicts.

Lastly, let’s think about one of the analysis components that can be
particularly sensitive here, volume and frequency.

Sending out notifications by itself is simple enough, unless you end up in a situation when you're trying to send out more notifications than our communication channel can handle. Every e-mail service has its own
limitations on how many emails can be sent out in a given period of time, same can be said for SMS services, instant messages, and others.

Make sure you have a clear understanding of the expected volume that is going to be generated by the events of the flow, have a plan in place to limit the event when it’s executed more often than expected, and have a mitigation plan for when that happens.

### Pattern 3: Data consolidation pattern

Data consolidation is a necessity for every organization that is large enough to have multiple management systems and the wise enough to understand that they need to have a complete picture of the data across those systems.

Often this requirement comes from the need to create reports, in which case organizations will typically implement some kind of a master data management solution like Data Lake. However, collecting data from
different systems into one is sometimes needed for day-to-day operations, like HR, customer service, sales, and others.

The difference is that for the purposes of analytics it is common to
take all the data from all systems and use it as the foundation to build
different kinds of reports. For operational purposes the point is to
take only the data that is needed to complete the business process.

#### Example

A company has three legacy systems to manage different parts of the business. SAP is used for orders and accounts receivables, Oracle is
used for product inventory management, and IBM is used for content management where customer related documents are stored.

The organization has commissioned a new Power Platform based app that
will use AI to predict the next best action for customers based on their
history and advise sales staff on a possible action plan.

The app will need to collect relevant data across all three systems use that to create a sales action plan displayed to sales managers.

From the requirements you can see that there's no need to collect all the data across all systems but only information that would be relevant to the process of creating an action plan. There's also apparently no need to update the data in real time or any kind of event-driven pattern.

With that in mind, ypu can imagine a scheduled process that would collect the necessary data from all three systems, consolidate the data into a data format understandable to Dataverse and let AI do its thing from there.

Depending on the size of the sales staff and how often they would interact with each customer, you can define the frequency off the schedule for the flow, resulting in a pattern that will look like this:

:::image type="content" source="media/integration-pattern-with-power-automate/scheduledtrigger.png" alt-text="Screenshot of a diagram showing data consolidation pattern, Scheduled trigger in Power Automate." lightbox="media/integration-pattern-with-power-automate/scheduledtrigger.png":::


A scheduled trigger in Power Automate will allow us to create flows
with almost any level of recurrence, from running once a second to once
a year.

Scheduled flows are more predictable than automatic ones as we know when they're going to run but can be as unpredictable in the volume they're going to push, if the scope of the data you have defined is too broad or the growth of the data was more rapid than we have expected.

Imagine if you have created a flow that runs every 10 minutes but after a year in operation starts taking more than 10 minutes to complete, what kind of data conflicts with the generate and how will it disrupt the business process it was originally built for?

In addition to safeguards for the run time of the flow that uses scheduled triggers, you should also implement appropriate monitoring to make sure that the flow runs at all. How many times you have seen a critical background process that stopped running and no one noticed until at least some damage was done.

[**Applications
Insights**](/power-platform/admin/app-insights-cloud-flow)
is one way to handle this monitoring.

### Pattern 4: Service oriented architecture

Large organizations will have a lot of different systems handling
different parts of their business, that would evolve over time to
acquire pieces of information from other systems to complete their
respective business processes.

The idea here's to let each system do what it does best and have the
integration layer worry about creating the bridge between them. The
problem of course is that it creates a situation where there's no one
source of truth and the approach itself creates a high level of
interdependency between the systems, potentially resulting in a high
development and maintenance costs.

This pattern is essentially the combination of all the previous patterns you talked about before.

#### Example

Continuing with the previous story, you have SAP handling orders and account receivables, Oracle handling product inventory, IBM is used to
storing internal financial documentation, Dataverse is used to run apps for sales customer service and product management.

Additionally you now have SharePoint for internal collaborations and knowledge base management, and Maersk APIs for logistics automation. Each one of those services needs to be able to talk to each other based on schedules events or manual user actions.

There's no one flow that can be built to respond to each one of those
triggers and serve every purpose any kind of business process would
require. Essentially, the solution here's to create multiple flows for
each point in each business process for each kind of trigger that might
be needed.

Even if it were possible to create one flow that would serve all
functions together, it would not have been practical from the point of
view of performance, security, or even just maintenance.

Dealing with landscape that has hundreds of flows isn't easy but it's
scalable with the right resources. Dealing with one huge flow that does
it all, isn't.

What we’ll get in the end is a pattern that connects every service to
every service in a Service Oriented Architecture, also known as the
Spaghetti Oriented Architecture, given the result below:

:::image type="content" source="media/integration-pattern-with-power-automate/eventdriventrigger.png" alt-text="Screenshot of a diagram showing event-driven, trigger pattern in Power Automate." lightbox="media/integration-pattern-with-power-automate/eventdriventrigger.png":::


Along with all the best practices you already covered, what’s important here's to think about this systematically, so you can capitalize on
opportunities to optimize cross system processes. Let’s say you have a requirement to send a document from SharePoint to SAP and Oracle during the same event.

Why not create one flow that does that?  
You’ll still need to write the file to two systems but you’ll need to read
it only once. Also think about how rigid is the logic you’re creating. In a large landscape it’s likely that changes to how business processes work
across systems will happen as often as any change to any of these systems. That’s also the reason why over consolidation of logic in one flow will
hurt your ability to maintain the IT landscape.

### Pattern 5: Synchronization

In this last pattern, you’ll look at data synchronization. A situation when data is stored in the same type of system but in different databases.

It’s a pattern architects tend to dislike because it feels like such a waste storing the same data twice in identical systems, but there are some use cases for that. There’re two that are perhaps the most common for enterprise applications.

The first case is performance. It’s less of an issue in the 21st century with high speed connectivity but there’s more than a few industries where it’s still very important, just ask your stock broker. Ultimately, we’re limited by
the speed of light, so data located in a data center near you'll always be more available than a data center one across the pond.

Another reason to synchronize data is the law. Depending on the country you live and the data you store, you’ll need to comply with regulations regarding where the original data is physically
located. In these cases organizations will just deploy a local copy the database and apps with a synchronization process for data that can be copied
elsewhere.

#### Example

A medical devices company operates across several countries in Europe, in cooperation with local medical institutions. The laws of each country
are clear about medical data, it must be stored within the borders of each country.

Information about orders, products, and shipping can be stored cross-border. To address the regulatory requirements, the company created an instance
of their Power Platform customer management app and Dataverse in each country. However they would like to have full information about products and shipping in every instance.

This pattern will require us to implement an automatic flow that would trigger on every update of the account record, representing customers. Fields relating to medical data won't be copied but basic
contact information, orders, and shipping will be kept in sync.

In the flow, you can use standard filters to make sure we only respond to changes in the fields we're allowed to synchronize, resulting in the following pattern:

:::image type="content" source="media/integration-pattern-with-power-automate/eventdrivenautotrigger.png" alt-text="Screenshot of a diagram showing event-driven, Automatic trigger for synchronization in Power Automate." lightbox="media/integration-pattern-with-power-automate/eventdrivenautotrigger.png":::


In addition to everything talked about automatic triggers, a key point here's the expected response time. It's possible that business users have an expectation that data will appear in both systems at the same time, or at least quicker that it actually would. You must get ahead of this conversation and build the right expectations.

It worth getting back to the foundation of how Power Automate works. The service is asynchronous with no guaranteed response times like in a real-time system. This means that if through our analysis you understand that the process to synchronize is expected to perform beyond the capabilities of Power Automate, this needs to be considered as part of
the implementation plan.

It's common to hear business users request
real-time data access but it’s also uncommon for this request to have a
good reason. Before taking extreme measures, make sure that you, the
architect, understands the business process and the need to data
transfer speed to be what they are.



## Beyond cloud flows

Customers often ask which tool to use for integration: Power Automate, Data Factory, Service Bus, or custom code in Azure Functions.

Power Automate is the default choice. You need a strong reason to choose something else.

Integration involves both an initial investment and ongoing maintenance costs.

Ongoing costs can be high, but Power Automate is cost effective to build and maintain.

If you choose to write everything in custom code, you need to justify this decision to whoever approves the budget. Can you justify paying more for the same outcome?

#### Example

An online banking service wants to improve its lending process by qualifying people for loans in seconds while they fill out an online form or talk to a representative.

The qualification process is complex. It requires getting information from several systems and performing calculations for a final risk score. After evaluation, the calculations are too slow or can't be done using cloud flows.

The solution is in the problem statement. Cloud flows can't handle the calculation, but they can gather data across different systems. In this case, use both cloud flows and custom code.

Use Power Automate to collect initial data with built-in connectors. Writing custom code for these connections doesn't solve the main issue and increases costs.

Encapsulate complex calculations in custom code running as an Azure Function, which can scale independently, or use a custom connector for Power Automate.

The following diagram shows example tools for integration and how they affect scalability and costs:

:::image type="content" source="media/integration-pattern-with-power-automate/integration.png" alt-text="Screenshot of a diagram showing integration tools and scalability options in Power Automate." lightbox="media/integration-pattern-with-power-automate/integration.png":::

Don't think of it as one or the other. Use the best parts of each tool to get the job done efficiently.

## Final thoughts

This article is a guide for architects who want to use Power Automate for integration solutions. It's based on documented best practices and years of experience in the role. This article highlights the critical considerations when building integrations and the different patterns you can use to achieve this goal.

This article isn't an exhaustive guide for Power Automate, and it isn't a set of instructions. The goal is to give you a framework to help you solve problems.

Learn more about building cloud flows if you want to be a developer too.

## Related resources

- [Power Automate coding guidelines](/power-automate/guidance/coding-guidelines/)
- [Power Automate on Microsoft Learn](/training/powerplatform/power-automate)
