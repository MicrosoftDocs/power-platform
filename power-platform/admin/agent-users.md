---
title: Create Entra agent users (preview)
description: Learn how to create an Entra agent identity for use in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/28/2025
author: paulliew
ms.author: paulliew
ms.reviewer: mkaur
search.audienceType: 
  - admin
---

# Create Entra agent users (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

[Microsoft Entra Agent ID](/entra/agent-id/what-is-microsoft-entra-agent-id) is an identity and security framework that extends Microsoft Entra capabilities to AI agents by providing purpose‑built identity constructs for nonhuman identities, such as assistive or autonomous software agents. As organizations deploy AI agents to perform tasks such as automation, orchestration, and data interaction, these agents require enterprise identities that can be authenticated, authorized, governed, and audited in the same way as users or application workloads.  

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

[Microsoft Copilot Studio integrates with Microsoft Entra Agent ID](/microsoft-copilot-studio/admin-use-entra-agent-identities) so that agents created in Copilot Studio can automatically receive an Entra agent identity that can be viewed and managed in the Microsoft Entra admin center.  

For agents that require data access to a Dataverse environment, an Entra agent user must be created and associated with the agent identity so that appropriate security roles can be assigned to enable access to Dataverse APIs and data within the environment. For more information, see [Create an agent user](create-users.md#create-an-agent-user-preview).
