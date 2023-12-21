---
title: Deploy pipelines as a service principal or pipeline owner
description: Deploy pipelines with a service principal or pipeline stage owner’s identity.
author: caburk
ms.author: caburk
ms.reviewer: pehecke
ms.topic: overview
ms.date: 12/13/2023
ms.custom: 
---
# Deploy pipelines as a service principal or pipeline owner (preview)

[This article is prerelease documentation and is subject to change.]

Delegated deployments can be run as a service principal or pipeline stage owner. When enabled, the pipeline stage deploys as the delegate (service principal or pipeline stage owner) instead of the requesting maker.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback

## Deploy with a service principal

### Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- One of the following Microsoft Entra roles: Global Administrator, Cloud Application Administrator, or Application Administrator.
- You must be an owner of the enterprise application (service principal) in Microsoft Entra ID.

For a delegated deployment with a service principal, follow these steps.

1. Create an enterprise application (service principal) in Microsoft Entra ID.

    > [!IMPORTANT]
    > Anyone enabling or modifying service principal configurations in pipelines must be an owner of the enterprise application (service principal) in Microsoft Entra ID.  
1. Add the enterprise application as a server-to-server (S2S) user in your pipelines host environment and each target environment it deploys to.
1. Assign the Deployment Pipeline Administrator security role to the S2S user within the pipelines host, and System Administrator security role within target environments. Lower permission security roles can't deploy plug-ins and other code components.
1. Choose (check) **Is delegated deployment** on a pipeline stage, select **Service Principal**, and enter the Client ID. Select **Save**.
1. Create a cloud flow within the pipelines host environment. Alternative systems can be integrated using pipelines' Dataverse APIs.
1. Select the **OnApprovalStarted** trigger. **OnDeploymentRequested** can also be used if **Pre-Export Step Required** is disabled on the pipeline stage.
1. Add steps for your desired custom logic.
1. Insert an approval step. Use Dynamic content for sending deployment request information to the approver(s).
1. Insert a condition.
1. Create a Dataverse connection for the service principal. You’ll need a client ID and secret.
1. Add Dataverse **Perform an unbound action** using the settings shown below.  
    Action Name: UpdateApprovalStatus
    ApprovalComments: Insert Dynamic Content. Comments will be visible to the requestor of the deployment.
    ApprovalStatus: 20 = approved, 30 = rejected
    ApprovalProperties: Insert Dynamic Content. Admin information accessible from within the pipelines host.

    > [!IMPORTANT]
    > The UpdateApprovalStatus action must use the service principal’s connection. 
    > 
    > :::image type="content" source="media/spn-connection.png" alt-text="Connect with service principal":::
    
    > [!TIP]
    > To improve the debug experience, select ApprovalProperties and insert workflow() from the dynamic content menu. This links the flow run to the pipeline stage run (run history).
    
1. Save, and then test the pipeline.

Below is a screenshot of a canonical approval flow.

:::image type="content" source="media/canonical-approval-flow.png" alt-text="Canonical Approval Flow":::

> [!IMPORTANT]
> - Requesting makers may not have access to deployed resources in target environments. Resources can be shared after deployment. To automate sharing, you can use the ALM Accelerator extension as a reference implementation.
> - At a minimum, the Basic User security role is needed to deploy connection references and access the environment.
> - When testing, if you remove your own security role, another administrator will need to restore it later. Power Platform admins can restore their own security role within the classic experience.

## Deploy as the pipeline stage owner

Regular users, including those used as service accounts, can also serve as delegates. Configuration is more straightforward when compared to service principals, but solutions containing connection references for oAuth connections can't be deployed.

To deploy as the pipeline stage owner, follow these steps.

1.	Assign the Deployment Pipeline Administrator security role to the pipeline stage owner within the pipelines host, and assign System Administrator security role within target environments.
    
    Lower permission security roles can't deploy plug-ins and other code components.

1. Sign in as the pipeline stage owner. Only the owner can enable or modify these settings. Team ownership isn't allowed.
2.	Select **Is delegated deployment** on a pipeline stage, and select **Stage Owner**.
    - The pipeline stage owner’s identity will be used for all deployments to this stage.
    - Similarly, this identity must be used to approve deployments.
1.	Create a cloud flow in a solution within the pipelines host environment.
    1. Select the **OnApprovalStarted** trigger.
    1. Insert actions as desired. For example, an approval.
    1. Add Dataverse **Perform an unbound action**.  
      Action Name: UpdateApprovalStatus (20 = completed, 30 = rejected)
