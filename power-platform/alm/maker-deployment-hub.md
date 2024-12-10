---
title: Set up pipelines in Power Platform
description: Learn how to view pipeline deployments in the Deployments experience.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 01/14/2025
ms.custom: template-how-to
---

# View solution deployments across solutions and pipelines

Makers can view all of their deployments in one place, regardless of solution or pipeline. If their deployment began from (or was deployed to) the current environment, they will be able to view its status and other details.

:::image type="content" source="media/maker-deployment-hub.png" alt-text="Screenshot of the deployment hub for makers." lightbox="media/maker-deployment-hub.png":::

## Get started
When you first access the Deployment Hub, you will see the "Get Started" section. This section currently offers several links to relevant documents designed to help makers gain a better understanding of solutions, pipelines, and the in-product Application Lifecycle Management (ALM) process. Future updates will enhance the "Get Started" section to be more interactive and include additional curated content beyond documentation.

## Failed deployments
On the left of the overview, makers will see their failed deployments. By selecting each deployment, a panel will appear, highlighting the necessary actions to either retry or revise the solution, ensuring a successful deployment.

## Active deployments
On the right of the overview, makers will see their ongoing deployments. Upon selecting these deployments, makers can view the in-progress details of the deployment (e.g. waiting for a pre-deployment approval). This is useful for makers who work in multiple solutions that they are deploying simultaneously.

## Frequently asked questions

### Why can't I see solution deployments other than those that I initiated?
In order to view others' solution deployments, you must have the Deployment Pipeline Administrator security role or have equivalent privileges to view other deployments.
