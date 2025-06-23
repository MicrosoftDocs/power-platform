---
title: Integration pattern using Power Automate cloud flows
description: "Power Automate integration patterns: Discover how to design effective, scalable integrations using cloud flows. Learn key considerations and best practices."
#customer intent: As a Power Platform user,  I want to understand integration patterns using Power Automate so that I can design effective, scalable solutions for my organization.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 06/23/2025
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
  - ai-seo-date:06/23/2025
---

# Integration pattern using Power Automate cloud flows

This whitepaper explores various integration patterns using Power
Automate Cloud Flows, focusing on considerations for building effective
integrations for each pattern, the challenges faced, and the decision
making process for achieving the desired goals.

There’s no one approach to build integrations that is always superior to
all others, much like there’s many ways to build a house, the approach
depends on the requirements set forth. With that in mind, this
whitepaper will be guided by posing a hypothetical problem and guide you
through the process of identifying the appropriate solution.

The primary audience would be Enterprise Architects looking to design
new integrations or augment existing ones with modern low-code
solutions. There will be limited focus on technical solutions, however
links to relevant documentation will be provided where applicable.

## Introduction

Integration is a critical aspect of modern business processes, enabling
seamless data flow and automation across different systems. This paper
discusses the importance of choosing the right integration patterns and
the factors to consider when designing integrations with Power Automate.

We’ll begin by analyzing the key considerations for any integration and
what they could mean for us when building an architecture. We’ll then
proceed to dissect common integration patterns, how they work in Power
Automate, and real-world examples where such patterns can be applied.

Finally, we will look beyond Power Automate to understand what can be
done in case the tools that we have or just not enough to do the job
right.

**By the end of this white paper, you will learn:**

- How to deconstruct the requirements into the key components of an
  integration

- Who are the stakeholders to be included in the decision making
  process?

- How to decide which pattern would be best for your goals.

- Balancing scalability and performance

- Leveraging the strengths of cloud flows and addressing the
  shortcomings

- General technics for robust integrations

## The Requirements of an Integration

Before we go into the patterns, let’s start by looking at the
requirements of an integration. We can start from high-level goal, like
connect SAP to Dataverse or send a notification every time there’s an
update in a case a user works on.

These are examples of how a business user may look at an integration
problem and is also the starting point where an architect takes over.
What follow up questions do you need to ask when being tasked with
connecting system A to system B and who are the people to answer these
questions?

When we need to create any flow of information, the first question we
need to ask is:  
How much data is being sent and how often?  
**Volume and Frequency** is the first major component in our decision
making process that will determine the kinds of tools we’ll need to use
to implement the business requirement.

The next component would be the **Directionality**, or where does data
flow from and to.  
Finding that out will inform how we configure the pattern for a
successful integration.

And lastly, we need to consider **Capability**, or the ability of each
system involved to receive, process and send data. Using the “weakest
link” approach, evaluation of capabilities will inform us of the
limitations and possibilities. Sure, the business user may want
everything-all-at-once-in-real-time, but if that that IBM Mainframe just
can’t do it, the capability analysis will flag that from the get go.

Let’s review each component, starting with Volume and Frequency.

### Volume and Frequency

The amount of data and the frequency of integration tasks significantly
impact the choice of integration patterns. While we can think of an
obvious example, like the difference between sending 10 record and a
million records, the difference can also be more subtle.

What if you had a requirement to send 60,000 records every hour and a
requirement to send 1000 records every minute. Does that mean you can
use the same solution for both requirements? Not necessarily.

While the volume is same, 60,000 records per hour, the expectation when
the data arrives is different, or the frequency requirement is
different. It may be the case that one solution would work for both, but
only if you can demonstrate if you can do 1000 records per minute, not
60,000 records per hour.

So that’s it, right? Just find a common denominator and build one
solution that works for both? No… not always.

In some cases you might want to build separate solutions for these two
requirements because always running at higher frequencies might not be a
process that is used very often but it is much more resource intensive
towards one (or more) of the integrated systems.

While it may sound like a waste of resources to build multiple
integration solutions for the same integration, the cost/benefit
equation may sometimes result in a need to do just that.

- Triggers

Volume and frequency is often affected by how an integration is
triggered.  
A **Scheduled Trigger** (also known as **Batch**) is probably the
simplest one, because it’s easy to predict the conditions of the
integration, assuming we know the growth trajectory of the data
involved.

**Event-Driven** triggers are affected by many factors and ultimately it
can be much harder to predict how often an integration is launched. An
event can be a button click, a change in a record in one of the systems
or an API call.  
For an enterprise app, like Power Apps, events like a button click are
easier to predict, since you are ultimately limited by the population of
employees.

Events triggered by a publicly accessible system, like a public services
Power Pages website open to millions of citizens, can fluctuate by
orders of magnitude.

### **⚫** Seasonality

Much like the changing of the seasons, volumes of data can change wildly
depending on how the business operates. Think of a services provider
that bills their customers monthly or quarterly, there might be needed
for a guaranteed large volume of data to pass through in a very short
time.

Seasonality is more severely affected by Event-Driven integrations,
because you don’t know how much data will be moved during certain
seasons. However, you can be aware that of these waves and implement
safeguards in your solution to prevent the integration from processing
an amount of data that you know will be beyond its capabilities (more on
that later).

Scheduled integrations can also be affected by seasonality in cases when
the size of the data batch is significantly affected time based events
in the business life cycle.  
An accounting firm for example could experience increased data volumes
during tax season.

### **⚫** Stakeholders

The conversation about Volume and Frequency is one that should always be
discussed with **Process Owners**, or the key business users that
provide the initial business requirements. Make sure that whatever was
indicated in the requirements correlates to how the process actually
works.

Business users may not always know the entire process so it’s up to you
as the architect to follow the leads and discover how things actually
supposed to work.

### **⚫** Plan for the Future

We can’t predict the future, but as architects, we have to try.  
When you build an integration solution for a growing business, you are
building something with an expiration date. There’s no way around it.

When building a critical integration solution, you clearly indicate the
conditions it is designed to work under and create long term plans for
its scalability.  
If there’s enough information, you can also indicate the expected date
when the solution will require scaling.

Regardless, for critical integrations there should be a monitoring
solution in place that will give the IT staff advance notice when
volumes approach the limits of the integration overall.

### Directionality

Directionality involves understanding the source and destination of data
in an integration process. It is essential to consider the availability
of systems, compliance requirements, and security measures when
determining the directionality of data flow. For instance, the data
might be coming from a private system that is not always available, or
it might be subject to strict compliance and security regulations.

### **⚫** Stakeholders

Compliance is paramount when dealing with data integration and can be
different for every system involved, ultimately affecting the flow of
data. It is necessary to consult with **Infrastructure Architects** and
**Security Officers** to ensure that the connection to the systems is
secure and meets all regulatory requirements set forth by the
organization.

High-security organizations often have stringent requirements that must
be met to access data, which can significantly impact the integration
design.

In cases where integration with legacy on-premises systems is required,
a common security requirement is to avoid inbound connections. So even
though the business asked for a cloud app to fetch data from the legacy
system, you’ll have to design the integration the opposite way, with the
legacy system reaching out to the cloud app.


### Capability

The result that can be achieved from a straightforward integration is
always limited by the weakest link in the chain. Capability is what each
system in that chain can attain in terms of overall performance.

Together with the previous components, we need to be aware how
capability of the systems involved maps to the business requirements and
if there’s anything we need to do to increase a capability.

For instance, if a system is not capable of processing large volumes of
data efficiently, it may become a bottleneck, leading to delays and
potential failures in the integration process. This is particularly
important when dealing with high-frequency data transfers or large
datasets.

### **⚫** Capability and Frequency

Frequency of data transfers is also a major concern when evaluating
capability. Systems must be able to handle the rate at which data is
being sent and received. For example, a system that can process data
efficiently once a day may struggle with the same volume if it needs to
process it multiple times a day.

### **⚫** Caching

By far, a caching layer is the most common solution when data access is
required to a system that can’t handle the business requirement. In case
of Dataverse, [**Synapse
Link**](/power-apps/maker/data-platform/export-to-data-lake)
can be used for that purpose, offering fast replication of selected data
into a hyper-scalable data storage service.

Other systems may offer similar solutions that’s worth exploring.

Using caching creates a new balance that the architect need to consider:
while response times for the end user of the integration are reduced,
the data received may be outdated, depending on the process involved.

For processes where near real time data is needed for critical
calculations or data consolidation, the integration process needs to
ensure that the data provided is not “expired”, adding more complexity
to the integration process.

### **⚫** Transformation & Business Logic

The final consideration for the capability of every system and the
integration process itself, is the need to perform business logic for
the integration to satisfy business requirements.

When evaluating the capabilities of a system, it should be in the
context of not just what the system can do, but what it can do with the
transformations you need it to do prior to sending the data, the logic
you need to perform in a flow before sending it to the target system,
and the logic the target needs to perform before the data becomes
operational.

A classic example is when you need to take out a table from an SQL
Database, and write it to Dataverse. The requirement is super simple…
but… you find out the table in SQL is not actually a table, but a view
relying on a dozen stored procedures, the data still need to be adapted
to Dataverse format mid-flight and when finally arriving there, there’s
a bunch of plugins that also need to do something.

Now imagine it’s not just an integration, it’s a massive batch import

### **⚫** Stakeholders

Critical systems have **System Administrators** that can usually provide
all the information you need about capability. Sometimes it’s a
centralized IT team, sometimes it’s a more decentralized arrangement.
Either way, you’ll need to evaluate each system’s capabilities before
you choose the right pattern.

## How it comes together

We looked into the 3 major components of an integration:  
**Volume and Frequency**, **Directionality**, and **Capability**.

Volume and frequency refer to the total amount of data being
transferred. Directionality involves understanding the source and
destination of data, which is important for ensuring compliance, and
securing data flow. Capability assesses each system's performance and
ability to process data, identifying any potential bottlenecks.

For each component we discussed how they are connected to initial
business requirements, what analysis one must perform to factor in their
impact on the integration process overall, and who are the stakeholders
to help perform the analysis.

Input from the stakeholders during analysis can entirely change our
approach in the integration design process. Process owners provide
initial requirements, while infrastructure architects and security
officers ensure compliance and security. System administrators help
evaluate the capabilities of each system involved.

Let’s put everything together through an example:  
  
The business requirement is to create an integration process that keeps
case information in sync between an external customer and internal
service engineers who work on cases.

Customers can add comments to a case through a website, while engineers
can add case information through a Power App.

Let’s look at the first component, Volume and Frequency.  
The case creation is primarily driven by customers, meaning that the
volume would depend on how many customers the company has and the
expected growth trajectory.

The total volume of updates would be:  
**[Customers]** x **[Cases per customer]** x **[Average updates per
case]**

For an existing organization, getting the values for this calculation
should be possible.  
This number should then be plotted on a chart with the expected growth,
so if we expect a 10M/year updates today and an average growth of
20%/year, the chart will look like this:

:::image type="content" source="./media/image3.emf" alt-text="Screenshot of a chart showing requests over time analysis.":::

*Fig. 1: Requests over time analysis*

Assuming we want to build something that lasts at least 5 years, a
typical timeframe for information systems ROI, we must build an
integration that can handle at least 25M requests per year.

The frequency part of it is the ability of the systems involved to
handle information within a year. Again, we can chart historical data to
understand how frequency will apply here:

:::image type="content" source="./media/image4.emf" alt-text="Screenshot of a chart showing request density over a year.":::

*Fig. 2: Request density over a year*

Looking at this data we now know that even today, our integration must
withstand a total of 3.2M requests per month. Taking the 20% growth over
5 years, assuming the same yearly peaks, the integration we build today
must handle 8M requests per month.

Now let’s analyze the directionality.  
Hiding in the business requirement is actually 4 data streams: a data
stream from the website to write case updates into Dataverse, another
stream for the website to read updates from Dataverse, a third data
stream where engineers write updates into Dataverse from Power App, and
finally a fourth to read updates in the Power App.

:::image type="content" source="./media/image5.emf" alt-text="Screenshot of a diagram showing website integration, direct pattern.":::

*Fig. 3: Website integration, direct pattern*

Now that we understand the data flow and the data steams involved, let’s
tackle the last component, **Capability**.

The data streams on the right, the engineer’s side, is one we don’t have
to build as a custom integration, however there are a few things to
consider when building the Power App using built-in connectors.

When getting case information from Dataverse, we should make sure that
there are filters and request limits in place that take into account
what the engineer actually needs to find and how much the app is
physically capable of displaying.

If you don’t set any limits and have engineers attempt to load all cases
every time they open the system, you might have engineers with
pitchforks coming for you.

On the other side of the integration, we have the two data streams for
connecting the website. It’s a custom website so let’s assume we’ll need
to publish an endpoint for it to read and write data.

This is something we can easily do with a [**Power Automate HTTP
trigger**](/power-automate/oauth-authentication?tabs=classic-designer).  
However, we must also consider the [**capabilities of the cloud
flow**](/power-automate/limits-and-config)
that will handle these requests and Dataverse, which is the final
destination.  
These are not the same and we should consult with [**current
documentation**](https://microsofteur-my.sharepoint.com/personal/ifain_microsoft_com/Documents/Power%20CAT/PAuto%20Integrations%20Patterns/Analysis.vsdx)
to understand if the number of requests we expect to handle is in line
with the capabilities of both services.

If we discover that Dataverse is already handling a lot of requests,
which can be done through [**Dataverse
Analytics**](/power-platform/admin/analytics-common-data-service),
and cannot handle the projected request load, we’ll need to consider
adding a protective buffer in the form of [**Azure Data
Lake**](/power-apps/maker/data-platform/azure-synapse-link-data-lake).

In this case, the integration will result in the following setup:

:::image type="content" source="./media/image6.emf" alt-text="Screenshot of a diagram showing website integration, decoupled read pattern.":::

*Fig. 4: Website integration, decoupled read pattern*

This will reduce the read request volume from Dataverse to prevent the
infamous 429 errors from popping up. You can decrease the dependency
even further by also decoupling the Create/Update request from the
website using a Queuing service, like [**Azure Service
Bus**](/azure/service-bus-messaging/service-bus-queues-topics-subscriptions).
This will result in this (even cooler) integration:

:::image type="content" source="./media/image7.emf" alt-text="Screenshot of a diagram showing website integration, fully decoupled pattern.":::

*Fig. 5: Website integration, fully decoupled pattern*

Along with a well-built Cloud Flow that handles errors correctly, has a
retry logic in it and generally follows all the [**best
practices**](/power-automate/guidance/coding-guidelines/)
one might expect, this is the final form of the business requirement. An
integration design that can handle anything.

So why can’t we just build it this way from the start and not worry
about it ever again?

Because of cost.  
Not only will we be investing more time and money in the initial
development, we will invest more time and money to pay for licensing and
maintenance of each component we add.

This is not a case of compromising quality for cost, it’s a case of
building according to what is needed, while not being wasteful.

When choosing an integration pattern and its components, you want to
perform the analysis we did in this chapter and choose the approach that
uses the least amount of components and complexity, not the one that is
technically the most capable.

With the analysis part done, let’s look at examples of integration
patterns and how they can be used, in the next chapter.

# Integration Patterns

In the previous chapter we talked about what should you think about when
planning an integration using Power Automate and how perform an analysis
to understand which pattern would work best for you. With that
information, I think it’s high time we get to the part you’ve been
waiting for and look into different kinds of integrations available.

This list is by no means definitive, however there’s a good chance that
a big chunk of business requirements will end up using one or a
combination of these patterns.

## Instant User Action

Let’s start with the simplest pattern, a user driven action, or
**Instant** as it’s known in the Power Platform world. This pattern
perhaps the most intuitive one because it’s how most people interact
with devices. You press a button and expect a predefined series of
actions to happen in response.

Let’s review a example:

You’re building a Power App for product managers, which will allow users
to review customer feedback for products and create an action plan to
improve these products based on comments and suggestions.

The problem is that some technical specs for the product is stored in
Oracle’s Product Lifecycle Management solution. You don’t always need to
look at those so copying the entire dataset to Dataverse doesn’t make
sense but having a button to load the data on request is handy.

There’s several reasons why implementing an integration here might be
better than just having people go to Oracle and get the information from
there:  
Bad user experience (Oracle being what it is, doesn’t make it better),
security concerns, or licensing costs.

Considering how cost-effective it is to build integrations with Power
Platform, any one of these reasons qualifies as a “good enough” reason
in the eyes of most managers to approve the costs for such an
integration.

To start, we’ll use an Instant cloud flow that will be called upon
pressing a button in the app. The flow itself can be as simple as a 3
step process to call Oracle using the parameters provided by the app
(like Product ID), getting the data, and writing it to Dataverse, which
will be reflected in the Power App.

:::image type="content" source="./media/image8.emf" alt-text="Screenshot of a diagram showing user driven, Instant trigger.":::

*Fig. 6: User driven, Instant trigger*

Realistically, the data model between Oracle and Dataverse would be
entirely different so some transformation might be required, resulting
in extra steps.

Despite the name, it’s worth noting that Instant triggers are not
instant. The time it will take the execute the entire flow depends on
the availability and Oracle, Dataverse, and the time it takes to perform
all the transformations you need.

Even for this simple case, you should consider adding an indication in
your app that something is happening and the ability to cancel the
operation in case it takes too long.  
This is especially true if we’re operating in a large organization where
it’s possible for thousands of people to press the button the same short
time window.

Regardless, an integration can fail for many reasons and the last thing
anyone likes about their user experience is clicking a button to sit
there not knowing if something is happening or not.

## Pattern 2: Event-Driven, aka Automatic

Architects love event-driven architectures because things seems to just
fall into place like magic. It’s so intuitive because that’s similar to
how our brain works.  
There’s two 2 sides to this of course, much like a research on Nuclear
Fission can end up with you reading a Wikipedia article about the Ford
Nucleon, Event-Driven patterns can get you places you never intended to
go.

Let’s review an example:

The customer service department wants to send automatic updates to
customers whenever a rep makes updates to the case. Not every update
needs to go to the customer, only when a note is added or the status of
the case has changed.

This one looks pretty simple and it’s something we all experienced in
our daily lives.  
Implementing this In Power Automate requires and **Automatic** trigger,
one that responds to events happening in a given system.

Automatic triggers allow you to create event-driven integrations using
from over a thousand of supported systems. Triggers can be configured to
respond to a record created in Dataverse, incoming emails, files added
to OneDrive, or even to when it rains near your house (yes, really.
Check out the MSN Weather connector).

In our example, the customer service reps are using a Dataverse
connected app to work on a case and provide updates to the customer
automatically without having to write emails to customers manually.

The flow would need to respond to changes in any case, but only when
edits happen within the defined scope, which is adding notes or changing
the status.  
This can be achieved by indicating the **Change Type** we’d like to
monitor and define the columns to respond to using the **Select
Columns** parameter.

As a result, we’ll get a cloud flow with the pattern below:

:::image type="content" source="./media/image9.emf" alt-text="Screenshot of a diagram showing event-driven, Automatic trigger.":::

*Fig. 7: Event-driven, Automatic trigger*

A few nuances to consider here.  
First, there’s a good chance that we don’t actually need to respond to
every status update, only to those that concern the customer. It’s very
likely that there are intermediate case status updates that are meant
for internal use only.

Fortunately, we can achieve that by specifying the **Filter Rows**
parameter that will make sure only case with a certain status value will
trigger the flow. The same parameter can also be used for other types of
filtration if needed.

Implementing this logic into the flow itself using an If action is at
least a waste of time and at worst, a costly mistake.

Another thing to consider that is especially sensitive in event-driven
architectures is the logic behind the execution of the event itself. Can
we create a situation in which? An event will cause an action that would
cause that event to happen again in an infinite loop? Is there a set of
circumstances that would create multiple updates? That would cause
notifications to be sent out to a customer in rapid succession?

This is the kind of thinking an architect needs to do when creating
event-driven patterns, to avoid unexpected logical conflicts.

Lastly, let’s think about one of the analysis components that can be
particularly sensitive here, **Volume and Frequency**.

Sending out notifications by itself is simple enough, unless we end up
in a situation when we are trying to send out more notifications than
our communication channel can handle. Every e-mail service has its own
limitations on how many emails can be sent out in a given period of
time, same can be said for SMS services, instant messages and others.

Make sure you have a clear understanding of the expected volume that is
going to be generated by the events of the flow, have a plan in place to
limit the event when it’s executed more often than expected, and have a
mitigation plan for when that happens.

## Pattern 3: Data Consolidation Pattern

Data Consolidation is a necessity for every organization that is large
enough to have multiple management systems and the wise enough to
understand that they need to have a complete picture of the data across
those systems.

Often this requirement comes from the need to create reports, in which
case organizations will typically implement some what kind of a master
data management solution like Data Lake. However, collecting data from
different systems into one is sometimes needed for day-to-day
operations, like HR, customer service, sales, and others.

The difference is that for the purposes of analytics it is common to
take all the data from all systems and use it as the foundation to build
different kinds of reports. For operational purposes the point is to
take only the data that is needed to complete the business process.

Let's review an example:

A company has three legacy systems to manage different parts of the
business. SAP is used for orders and accounts receivables, Oracle is
used for product inventory management, and IBM is used for content
management where customer related documents are stored.

The organization has commissioned a new Power Platform based app that
will use AI to predict the next best action for customers based on their
history and advise sales staff on a possible action plan.

The app will need to collect relevant data across all three systems use
that to create a sales action plan displayed to sales managers.

From the requirements we can see that there's no need to collect all the
data across all systems but only information that would be relevant to
the process of creating an action plan. There's also apparently no need
to update the data in real time or any kind of event-driven pattern.

With that in mind, we can imagine a scheduled process that would collect
the necessary data from all three systems, consolidate the data into a
data format understandable to Dataverse and let AI do its thing from
there.

Depending on the size of the sales staff and how often they would
interact with each customer, we can define the frequency off the
schedule for the flow, Resulting in a pattern that will look like this:

:::image type="content" source="./media/image10.emf" alt-text="Screenshot of a diagram showing data consolidation pattern, scheduled trigger.":::

*Fig. 8: Data Consolidation Pattern, Scheduled trigger*

A **Scheduled** trigger in Power Automate will allow us to create flows
with almost any level of recurrence, from running once a second to once
a year.

Scheduled flows are more predictable than automatic ones As we know when
they're going to run but can be as unpredictable in the volume they're
going to push, if the scope of the data we have defined is too broad or
the growth of the data was more rapid than we have expected.

Imagine if you have created a flow that runs every 10 minutes but after
a year in operation starts taking more than 10 minutes to complete, what
kind of data conflicts with the generate and how will it disrupt the
business process it was originally built for?

In addition to safeguards for the run time of the flow That uses
Scheduled triggers, we should also implement appropriate monitoring to
make sure that the flow runs at all. I can't tell you how many times I
have seen a critical background process That stopped running and no one
noticed until at least some damage was done.

[**Applications
Insights**](/power-platform/admin/app-insights-cloud-flow)
is one way to handle this monitoring.

## Pattern 4: Service Oriented Architecture

Very large organizations will have a lot of different systems handling
different parts of their business, that would evolve over time to
acquire pieces of information from other systems to complete their
respective business processes.

The idea here is to let each system do what it does best and have the
integration layer worry about creating the bridge between them. The
problem of course is that it creates a situation where there's no one
source of truth and the approach itself creates a high level of
interdependency between the systems, potentially resulting in a high
development and maintenance costs.

This pattern he's essentially the combination of all the previous
patterns we talked about before, so let's look at an example and see how
that could work:

Continuing with the previous story, we have SAP handling orders and
account receivables, Oracle handling product inventory, IBM is used to
storing internal financial documentation, Dataverse is used to run apps
for sales customer service and product management.

Additionally we now have SharePoint for internal collaborations and
knowledge base management, and Maersk APIs for logistics automation.

Each one of those services needs to be able to talk to each other based
on schedules events or manual user actions.

There's no one flow that can be built to respond to each one of those
triggers and serve every purpose any kind of business process would
require. Essentially, the solution here is to create multiple flows for
each point in each business process for each kind of trigger that might
be needed.

Even if it were possible to create one flow that would serve all
functions together, it would not have been practical from the point of
view of performance, security, or even just maintenance.

Dealing with landscape that has hundreds of flows is not easy but it is
scalable with the right resources. Dealing with one huge flow that does
it all, is not.

What we’ll get in the end is a pattern that connects every service to
every service in a Service Oriented Architecture, also known as the
Spaghetti Oriented Architecture, given the result below:

:::image type="content" source="./media/image11.emf" alt-text="Screenshot of a diagram showing event-driven, Automatic trigger.":::

*Fig. 9: Event-driven, Automatic trigger*

Along with all the best practices we already covered, what’s important
here is to think about this systematically, so you can capitalize on
opportunities to optimize cross system processes. Let’s say you have a
requirement to send a document from SharePoint to SAP and Oracle during
the same event.

Why not create one flow that does that?  
You’ll still need to write the file to 2 systems but you’ll need to read
it only once.

Also think about how rigid is the logic you’re creating. In a large
landscape it’s very likely that changes to how business processes work
across systems will happen as often as any change to any of these
systems.

That’s also the reason why over consolidation of logic in one flow will
hurt your ability to maintain the IT landscape.

##

## Pattern 5: Synchronization

In this last pattern we’ll look at data synchronization. A situation
when data is stored in the same type of system but in different
databases.

It’s a pattern architects tend to dislike because it feels like such a
waste storing the same data twice in identical systems, but there are
some use cases for that. There’s two that are perhaps the most common
for enterprise applications.

The first case is Performance.  
It’s less of an issue in the 21<sup>st</sup> century with high speed
connectivity but there’s more than a few industries where it’s still
very important, just ask your stock broker. Ultimately, we’re limited by
the speed of light, so data located in a data center near you will
always be more available than a data center one across the pond.

Another reason to synchronize data is The Law.  
Depending on the country you live and the data you store, you’ll need to
comply with regulations regarding where the original data is physically
located.  
In these cases organizations will just deploy a local copy the database
and apps with a synchronization process for data that can be copied
elsewhere.

Let’s take a look at an example:

A medical devices company operates across several countries in Europe,
in cooperation with local medical institutions. The laws of each country
are clear about medical data, it must be stored within the borders of
each country.

Information about orders, products, and shipping can be stored
cross-border.

To address the regulatory requirements, the company created an instance
of their Power Platform customer management app and Dataverse in each
country. However they would like to have full information about products
and shipping in every instance.

This pattern will require us to implement an **Automatic** flow that
would trigger on every update of the Account record, representing
customers. Fields relating to medical data will not be copied but basic
contact information, orders, and shipping will be kept in sync.

In the flow we can use standard filters to make sure we only respond to
changes in the fields we are allowed to synchronize, resulting in the
following pattern:

:::image type="content" source="./media/image12.emf" alt-text="Screenshot of a diagram showing event-driven, Automatic trigger for synchronization.":::

*Fig. 10: Event-driven, Automatic trigger*

In addition to everything we talked about Automatic triggers, a key
point here is the expected response time. It is possible that business
users have an expectation that data will appear in both systems at the
same time, or at least quicker that it actually would. We must get ahead
of this conversation and build the right expectations.

It worth getting back to the foundation of how Power Automate works.  
The service is asynchronous with no guaranteed response times like in a
real-time system. This means that if through our analysis we understand
that the process to synchronize is expected to perform beyond the
capabilities of Power Automate, this needs to be considered as part of
the implementation plan.

Let me just say that it is very common to hear business users request
real-time data access but it’s also uncommon for this request to have a
good reason. Before taking extreme measures, make sure that you, the
architect, understands the business process and the need to data
transfer speed to be what they are.

If you do find yourself in a situation where you need a little bit more
oomph, the next chapter is for you.

# Beyond Cloud Flows

I had a few conversations with customers where I was asked about what
tool should they use for an integration. Should it be Power Automate,
Data Factory, Service Bus, or just custom code in Azure Functions?

And my answer is always this:  
Your default choice is always Power Automate.  
And you’ll need to convince me why it’s not the case.

I’m not trying to be facetious here. If you’re looking at all the
components of an integration we talked about in this paper, you
understand that an integration is initial investment and ongoing
maintenance costs.

Those ongoing costs can be, and historically have been, very high.  
Power Automate is second to none in cost effectiveness both to build and
maintain.

If you decide to just write everything in custom code (that’s how mom
and dad did it), then you’ll need to justify this decision to however
approves the budget.

This is the reason why I’m asking the question.  
Can you justify paying more for what you’re going to do?

Let’s look at an example and see how to address it:

An online banking service would like to improve their lending process by
being able to qualify people for loans in seconds while they fill in an
online form or talk to a rep over the phone.

The qualification process is complex, requiring getting information from
several systems and perform calculations for a final risk score.

Following an evaluation, the complexity of the calculations was deemed
too slow or impossible using cloud flows.

We could say that the solution is in the problem statement itself. They
looked into cloud flow and it’s just not possible.

Upon closer inspection, what is impossible is the calculation, not
gathering the data across different systems. So in this case the choice
doesn’t have to be cloud flows or custom code, it’s both.

We can use Power Automate’s strength by collecting the initial data we
need using connectors which are likely available out of the box. Writing
these connections as custom code will not address the limiting factor
but will most definitely introduce higher costs.

The complex calculations can be encapsulated in custom code running as
an Azure Function, which can be independently scaled, or even a custom
connector for Power Automate.

The diagram below shows an example of the tools one might use for
integrations and how it affects the scalability and costs:

However, you should not think of it as one or another. You take the best
parts of each to get the job done in the most efficient way possible.

# Final thoughts

This paper is meant to be a guide for architects looking to leverage
Power Automate for integration solutions. It is based on documented best
practices and years of experience in the role. We highlighted the
critical considerations when building integrations and the various
patterns that can be utilized to achieve this goal.

It is not an exhaustive guide for Power Automate, nor it’s an
instruction on what to do, the goal was to establish a thinking
framework that would help you solve problems.

I encourage you to learn more about the practical aspects of building
cloud flows, especially if you’re aspiring to be a developer as well.

Here’s some great places to learn more:

- [Power Automate coding guidelines](/power-automate/guidance/coding-guidelines/)

- [Power Automate on Microsoft Learn](/training/powerplatform/power-automate)
