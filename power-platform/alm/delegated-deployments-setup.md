---
title: Deploy pipelines as a service principal or pipeline owner
description: Deploy with a service principal or pipeline stage owner’s identity.
author: caburk
ms.author: caburk
ms.reviewer: kvivek
ms.topic: overview
ms.date: 10/02/2023
ms.custom: 
---
# Deploy pipelines as a service principal or pipeline owner (preview)

[This article is prerelease documentation and is subject to change.]

Delegated deployments can be run as a service principal or pipeline stage owner. When enabled, the pipeline stage deploys as the delegate (service principal or pipeline stage owner) instead of the requesting maker. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback

## Deploy with a service principal

1. Create an App registration (service principal) in Microsoft Entra ID (formerly Azure Active Directory)

    > [!IMPORTANT] 
    > Add the pipeline stage owner as an owner of the app registration in Entra ID. This can be a standard user or service principal.
1. Add the app registration as an S2S user in your pipelines host environment and each target environment it deploys to.
1. Assign the Pipelines Administrator security role to the S2S user within the pipelines host, and System Administrator security role within target environments. 
1. Lower permissioned security roles cannot deploy plugins and other code components.
1. Check Is delegated deployment on a pipeline stage, select Service Principal, and enter the Client ID. Save.
1. Create a cloud flow within the pipelines host environment. _Alternive systems can be integrated using pipelines Dataverse API's._
1. Select the OnApprovalStarted trigger.
1. Add steps for desired custom logic.
101. Insert an approval step. Use Dynamic content for sending deployment request information to the approver(s).
1. Insert a condition. 
1. Add Dataverse Perform an unbound action.
    1.  Action Name: UpdateApprovalStatus
    1.  ApprovalComments: Insert Dynamic Content. Comments will be visible to the requestor of the deployment.
    1.  ApprovalStatus: 20 = approved, 30 = rejected
    1.  ApprovalProperties: Insert Dynamic Content. Admin information accessible from within the pipelines host.
1. > [Important] The UpdateApprovalStatus action must use the service principal’s connection. You’ll need a client ID and secret.
    > :::image type="content" source="media/spn-connection.png" alt-text="Connect with service principal":::
1.	Save and then test the pipeline. 

:::image type="content" source="media/canonical-approval-flow.png" alt-text="Canonical Approval Flow":::

> [!IMPORTANT] 
> - Requesting makers may not have access to deployed resources in target environments. Resources can be shared after deployment. To automate sharing, you can use the ALM Accelerator extension as a reference implementation.
> - At minimum, the Basic User security role is needed to deploy connection references and access the environment. 
> - When testing, if you remove your own security role, another admin will need to restore it later. Power Platform admins can restore their own security role within the classic experience.

## Deploy as the pipeline stage owner
Regular users, including those used as service accounts, can also serve as delegates. Configuration is more straightforward when compared to service principals, but solutions containing connection references cannot be deployed. 

1.	Assign the Pipelines Administrator security role to the pipeline stage owner within the pipelines host, and System Administrator security role within target environments. 
    
    Lower permissioned security roles cannot deploy plugins and other code components.

2.	Check Is delegated deployment on a pipeline stage, select Stage Owner. 
    1.	The pipeline stage owner’s identity will be used for all deployments to this stage. 
    1.	Similarly, this identity must be used to approve deployments.
3.	Create a cloud flow in a solution within the pipelines host environment.
    1.	Select the OnApprovalStarted trigger. OnDeploymentRequested can also be used if Pre-Export Step Required is disabled on the pipeline stage.
    1.	Insert actions as desired. For example, an approval.
    1.	Add Dataverse Perform an unbound action.
    1.	Action Name: UpdateApprovalStatus (20 = completed, 30 = rejected)

