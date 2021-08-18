---
title: "Use connection references and environment variables  | Microsoft Docs"
description: "Learn about adding connection references and environment variables to solutions in Microsoft Dataverse."
keywords: 
author: kkanakas
ms.subservice: alm
ms.author: kartikka
manager: mayadu
ms.custom: ""
ms.date: 08/17/2021
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
ms.assetid: 
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Use connection references and environment variables

<!-- TODO Add intro -->

## Connection details

Not to be confused with the Connections entity in Microsoft Dataverse, a *connection* is
a wrapper around an API that allows the underlying service to talk to
applications within Power Platform i.e. Power Apps, Power Automate and so on.
This **connection** wrapper does not exist in the context of a solution.

*Connection references* are a **new solution component** that add a layer of
abstraction between the **connection** and component leveraging the
**connection**.  Because **connections are unique per environment**, connection
references ensure that connections can participate in ALM by removing hard-coded
identifiers within components and allowing new connections to be associated as
you migrate solutions across environments. Mapping a connection reference to a
connection in a target environment, was recently introduced in the modern import
experience and we are now enabling an option to create the mapping in an
automated manner.

## Why are connection references important from a CI/CD perspective?

When moving your solution across environments, each environment may have
different connections to access a data source i.e. Development environment may
reference a different Azure SQL data source than the test environment. In other
words, they will both access an Azure SQL environment but with a different
connection. Now, in the context of the UI, this process is simple.

As a user I can export a solution that includes different connection references
each pointing to a different connection.

![Changing connection references](media/cref-evar-figure1a.png)

![Changing connection references on solution import](media/cref-evar-figure1b.png)

When I import the solution into a different environment, the UI gives me an
option to change the connection reference to another data source that is
relevant to the target environment. As you can observe this is an interactive
capability. When doing this over a Continuous Integration/ Continuous Delivery
(CI/CD) pipeline, such interaction does not work for a fully automated CI/CD
scenarios, since there is no user interaction.

To enable a fully automated deployment, in this public preview, we provide a way
to deploy such changes in the connection reference without needing to have user
interaction. However, it does require a lot of pre-work with populated data to
make it happen and we will improve this experience over time.

## Deployment setting JSON file

To assist in the process, for this public preview we provide the ability to
provide a deployment settings file that you can check-in to source control and
pass it as a parameter when importing the solution in your pipeline.

![Example of a sample deployment setting file](media/cref-evar-figure2.png)

This deployment setting files, can be generated using the power platform command
line interface (pac cli)

## How to generate the deployment settings files

<!-- TODO Add intro -->

### When the solution zip file is available

When using pac cli and you do a pac solution export, it will generate a zip file
for you.

![PAC CLI create-settings command with solution zip file](media/cref-evar-figure3.png)

```azurecli
C:\> pac solution create-settings –solution-zip <path to the
solutionzipfilelocation> --settings-files <name for the settings file>
```

This will generate json file as shown in Figure 1. If you notice in the json
file that few values are empty in the connection references section

![Missing connection ID](media/cref-evar-figure4.png)

These values of the connection id need to be gathered, after creating them in
the target environment.

### Using the solution clone folder to generate the settings file

After you have done a pac solution clone you get the following directory
structure created on your local filesystem

![pac solution clone result](media/cref-evar-figure5.png)

Then you proceed to create the settings file in the context of the current
folder and populate the value of the settings file as shown in Figure 4

![Populated settings file](media/cref-evar-figure5b.png)

### How to get the connection ID for the deployment settings file

To get the connection id in the target environment, we can get such information
via various means.

To get the connection id you can either go into maker portal in your target
environment -\> select connections-\> select the connection you want to get the
connection id for and then look at the URL to get the connection id

![Connection ID captured in the URL](media/cref-evar-figure6.png)

Or you can go directly into the target environment and query the connection
references entity:

![Query the connection references entity](media/cref-evar-figure6b.png)

![Query the connection references entity](media/cref-evar-figure6c.png)

In the query editor, select edit columns and add connection id and then click he
results button.

![Query editor](media/cref-evar-figure6d.png)
s
![Query results](media/cref-evar-figure6e.png)

And now you have the connection id for the connection reference.

A simpler way to get this information, without needing to navigate a across the
power platform environment is to a create a Canvas on the connection reference
entity. The steps are as follows:

1.  Go to the maker portal in your tenant and within your target environment
    select New App-\> Canvas App

![New canvas app](media/cref-evar-figure7.png)

1.  Then in the Power Apps studio environment select data verse application.

![Selecting a dataverse application](media/cref-evar-figure8.png)

1.  Select the connection references Table and select connect

    ![Select the Connection reference table](media/cref-evar-figure9.png)

1.  This will create a gallery application that will list out all the
    connections and their connection ids within the environment

    ![Connection ID in a Power App](media/cref-evar-figure10.png)

As you can observe there are various ways to get the connection id information
for the connections in various environments

### Environment variable information

To get the values of the environment variable in the target environment, go to
the maker portal in the target environment and right click on the ellipsis and
choose to edit. This will provide the information needed to populate the
deployment settings file (the underlined values are the values needed for the
file):

![Values of the environment variables in the target environment](media/cref-evar-figure11.png)

Otherwise you can provide the value expect to have for the target environment,
update the values of the environment variables based on your knowledge of the
target environment and pass the settings file as parameter when importing the
solution into the target environment. This process will create the environment
variable and assign it value upon import.

![Updating the deployment settings file with the environment variable values](media/cref-evar-figure12.png)

This completes the update of the deployment settings file. Now proceed to Azure
DevOps

## Azure DevOps tasks

Start by creating your pipeline in Azure DevOps as documented [here](devops-build-tools.md).
When creating the import task in your pipeline, select **Use deployment
settings file** and provide the path to the deployment settings file. Once done,
initiate the pipeline.

![Using the deployment settings file](media/cref-evar-figure13.png)

### See also


[!INCLUDE[footer-include](../includes/footer-banner.md)]