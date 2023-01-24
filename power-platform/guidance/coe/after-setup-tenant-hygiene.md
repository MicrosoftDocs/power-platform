---
title: "Establishing tenant hygiene - Microsoft Power Platform & CoE Starter Kit | Microsoft Docs"
description: "The CoE Starter Kit contains a number of useful components to help you establish tenant hygiene."
author: stjeffer
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/07/2022
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Introduction

After installing and configuring the Center of Excellence (CoE) Starter Kit, your organization has insight into all Power Platform components in your tenant. This insight often uncovers new information about the number of environments, app, cloud flows and bots.  This document provides guidance and suggestions to implement tenant hygiene and robust governance based on the most common scenarios, using the features of the CoE Starter Kit.

The following sections provide guidance and recommendations to get the most value from your installation of the CoE Starter Kit.

## Getting started

Organic growth of the Microsoft Power Platform often does not align to the strategies organizations design (e.g. environment strategy). This leads to varying (depending on the number of environments, apps, cloud flows and bots) amounts of effort for CoE's to  understand what apps, environments, cloud flows and bots are being used for. This guidance provides admin and governance best practices, examples of tooling available in the CoE Starter Kit and out-of-the-box capabilities in product.

## Establishing tenant hygiene

### Managing existing environments

You will find there are environments in your tenant that you were unaware of. An environment strategy is critical for sustained, governed adoption of the Power Platform, and communicating it clearly is even more important to ensure that makers are developing solutions in the correct environment. Establishing control over environments can be achieved using the developer compliance center in the governance component of the CoE Starter Kit where environment owners are asked to provide business justification for keeping their environment. Some benefits of using the developer compliance center:

1. Identifying trial, developer, sandbox and production environments that can be deleted.
1. Managing capacity in your tenant.
1. Reducing the potential impact of DLP policy changes to existing apps and flows.
1. Increased visibility into what environments are being used for.

#### More information about managing environments

| Topic | Guidance |
| Defining an environment strategy | |
| Communicating Power Platform governance | |
| CoE Starter Kit - developer compliance center | |
| CoE Starter Kit - Power BI dashboard | |
| CoE Starter Kit - Compliance and adoption dashboard | |

### Securing your environments

With over 900 connectors available to your organization, establishing a Data Loss (DLP) Prevention strategy to control connector availability it critical. However, when you're getting started, you may be unaware of the impact changing a DLP policy will have on your makers apps and flows. The CoE Starter Kit contains a reference example of an environment and DLP request management process. Utilizing this solution puts your CoE in a great position for managing future environment and DLP requests. Making changes to existing, or creating new DLP policies introduces the risk of not seeing the impact to existing app and cloud flows. To mitigate this risk, use the DLP editor (impact analysis) tool, before you apply changes.

#### More information about securing your environments

| Topic | Guidance | 
| Establishing a DLP strategy | |
| DLP editor impact analysis | |

### Managing new environment creation and environment requests

Following best practices, having controls and processes to restrict who can create environments is a good first step in controlling environment creation. The CoE Starter Kit contains a reference example for an environment and DLP request management process.  Understanding this solution puts your CoE in a great position for managing future environment and DLP requests.  You should also consider checking periodically for new Power Platform connectors

#### More information about environment creation and environment requests

| Topic | Guidance |
| Environment strategy best practices | |
| Environment creation security guide | |
| Power Automate cloud flow template - check for new connectors |

### Managing Dataverse for Teams environments

Dataverse for Teams delivers a low-code data platform for Microsoft Teams. Dataverse for Teams environments are provisioned per 'Team' automatically when an app or bot is created (in Microsoft Teams) for the first time, or an app is installed from the app catalogue.

Microsoft Power Platform provides a clean-up mechanism that automatically removes Dataverse for Teams environments from your tenant that are left inactive for 90 days. From a compliance perspective, organizations often require information about an environment:

1. What is the purpose of the environment?
1. What type(s) of data will be used?
1. What connectors are required?
1. etc.

To remain in a compliant state and ensure that Dataverse for Teams environments are used effectively, you can configure the Dataverse for Teams environment management <thing> in the Governance component of the CoE Starter Kit, which provides a useful business justification process.  Consider a daily running process to check for new Dataverse for Teams environments.

#### More information about Dataverse for Teams environments

| Topic | Guidance |
| Automatically remove Dataverse for Teams environments | | 
| Business justification process | |
| Check for new Dataverse for Teams environments | |

### Managing the 'default environment'

Every tenant has a special type of environment: the default environment, and this is where your organic growth of apps and cloud flows happens.  It can't be deleted, however you can rename the default environment to better communicate its intent. Consider securing the environment to better manage access (including sharing), DLP and cross-tenant isolation.  Identifying the business value and risk of components, along with identifying unused apps and flows in the default environment are the first steps in establishing control, identifying apps that should be moved to more appropriate environments or levels of support. Look at quarantining apps that are not compliant and consider a process for cleaning up 'orphaned resources' - e.g. apps and flows that do not have an owner.  Use the Power BI dashboard to identify the most popular apps in your organization.

Summary of benefits in managing the default environment:

1. Identify unused apps and cloud flows: 
    1. Remove unused components from your environment

#### More information about managing the default environment

| Topic | Guidance |
| Renaming the default environment | |
| Secure the default environment | |
| Identify unused apps and cloud flows | |
| Quarantined non-compliant apps | |
| Clean up orphaned resources | |

### Managing apps and cloud flows

There are common scenarios to consider for managing apps and cloud flows in your organization.

#### Managing existing apps and flows

Within this scenario, there are two conditions:

1. Usage
1. Compliance

##### Usage

Identifying apps and cloud flows that are heavily used in your organization provides critical insight to ensure that these apps and cloud flows meet your compliance policies.  The Power BI dashboard in the CoE Starter Kit provides an overview of the most used apps and flows in your organization. Below are some screenshots of the useful information it provides:

<SCREENSHOT>

##### Compliance

Evaluating risk exposure for apps and cloud flows puts your CoE in the position of being able to define processes where high risk apps are identified. For example: migration of high risk apps, support of high value apps, etc. Most organizations will have hundreds (as a minimum) of apps and cloud flows and reaching out manually to owners to establish risk is not an option. In the CoE Starter Kit there are components that assist your CoE in capturing compliance information:

1. Admin compliance detail request is a cloud flow

[!INCLUDE[footer-include](../../includes/footer-banner.md)]