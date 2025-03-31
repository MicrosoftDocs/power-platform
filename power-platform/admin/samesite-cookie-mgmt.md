---
title: Title
description: Describe what people can learn in this article.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/24/2025
author: abhijananddv
ms.author: abhijanand
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Title

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

## Configure SameSite Attribute for Session Cookies in Dataverse 

This document describes how to configure the SameSite attribute for session cookies (CrmOwinAuth) in Microsoft Dataverse and Dynamics 365. This setting enhances security by controlling how your session cookie is shared in cross site scenarios. 

## What is the SameSite cookie setting? 

The SameSite cookie setting controls how browsers share your session cookie (CrmOwinAuth) used in Dataverse and Dynamics 365. This cookie stores session management related information. 

## Why use SameSite? 

| Setting | Description | Recommendation |
| --- | --- | --- |
| Lax | Cookies are sent for top-level navigation (link clicks) but not during cross-site form submissions (POST, PUT, DELETE, PATCH). | Recommended for most scenarios. |
| None | Cookies are always sent, could be necessary for integrations (e.g., embedded dynamics CRM in iframes or custom integrations). This is the seeting by default | Can be used for integrations depending on cross-site requests. |
| Strict | Cookies are never sent with cross site requests, even for top level navigations in cross site scenarios. | Can be used for highly sensitive environments; can impact user experience. |

## Important Considerations 

### Multiple CRM Instances in One Browser Session (Critical) 

When logging into Dynamics 365 environments, browsers create a "session cookie" (CrmOwinAuth) that remembers your login. This cookie is shared across all Dynamics 365 environments under the same parent domain (crm.dynamics.com). 

If you log into multiple Dynamics 365 [environments](https://learn.microsoft.com/en-us/power-platform/admin/environments-overview) (e.g., a production CRM and a test CRM) in one browser session, the SameSite security setting applied to the first environment automatically applies to the other environments in the same browser session. This could lead to unexpected behavior in environments where you haven't explicitly set the SameSite configuration. 

### Recommended Actions: 

- Use separate browser sessions or browser profiles for each CRM environment. 
- Clear your browser cookies when switching between different Dynamics 365 environments. 
- Consult your [Power Platform Admin Center (PPAC) Administrator](https://learn.microsoft.com/en-us/power-platform/admin/overview-role-power-platform-admin) if adjustments or disabling the setting across environments is needed (generally not recommended). 

### Additional Important Considerations 

| Consideration | Explanation | Guidance |
| --- | --- | --- |
| Security Against Cross-Site Attacks | Setting SameSite from None to Lax or Strict significantly reduces cross-site request forgery (CSRF) attacks by preventing cookie based cross-site requests like POST, PUT, DELETE, or PATCH. | Lax is generally recommended for protection without major usability impacts. |
| Strict Setting Usage | The Strict setting provides maximum security but blocks all cross-site interactions, including direct user clicks from external sites where cookie is involved. | Recommended for highly confidential scenarios due to its strict restrictions. |
| Embedding CRM (iFrames) or Custom Integrations | Embedding Dynamics CRM in external websites using iframes could require the SameSite setting to be None. Lax or Strict settings will cause embedding issues. | Use None for embedded scenarios and integrations. |
| Consistency with Modern Browsers | Modern browsers default to Lax, offering protection against unintended cross-site data leakage without significantly affecting usability. | Lax setting is recommended as a balanced approach. |

## Pre-requisites 

Before configuring SameSite, ensure: 

- You have a non-production environment available for initial testing. 
- You have the PPAC [System Administrator](https://learn.microsoft.com/en-us/power-platform/admin/security-roles-privileges) role for making changes to the organization entity in Dataverse. 

## How to configure SameSite settings 

Currently, we need to perform the configuration through API call. 

### Steps to configure SameSite attribute 

1. Login to your dynamics organization where you want to apply setting. 
2. Open browser console and run below script (You may need to run allow pasting if not already allowed to paste script in console).  

> [!NOTE]
> If you haven't configured the samesitemodeforsessioncookie, 0 is set as default (Currently 0 is mapped to None)
>
> You can set samesitemodeforsessioncookie to 1 -> None, 2-> Lax, 3->Strict (Not recommended).

```javascript
const orgId = "<dynamics-org-id>"; 

const url = `/api/data/v9.0/organizations(${orgId})`; 

fetch(url, { 
    method: "PATCH", 
    headers: { 
        "OData-MaxVersion": "4.0", 
        "OData-Version": "4.0", 
        "Accept": "application/json", 
        "Content-Type": "application/json; charset=utf-8", 
        "Prefer": "return=representation" 
    }, 
    body: JSON.stringify({ 
        samesitemodeforsessioncookie: 1 // 1:None, 2:Lax 
    }) 
}) 
.then(response => { 
    if (response.ok) { 
        return response.json(); 
    } else { 
        throw new Error("Error updating: " + response.statusText); 
    } 
}) 
.then(data => console.log(" Update successful:", data)) 
.catch(error => console.error("Update failed:", error)); 
```

### Verify the Update 

Go to this URL: `<orgU-URL>/api/data/v9.0/organizations(<org-ID>)?$select=samesitemodeforsessioncookie`

Check value should be updated. 

Logout and re-login, samesite value for CRMOwinAuth cookie would be updated accordingly. 

## Functional Testing 

Log out and login back into Dynamics 365. 

Check critical integrations and scenarios, especially iframe and cross-site interactions. 

## Troubleshooting 

| Issue | Cause | Solution |
| --- | --- | --- |
| CRM pages fail to load in iframe | SameSite set to Lax or Strict | Change to None. |
| Cookie setting persists between multiple CRM environments | Cookie shared across.crm.dynamics.com domain | Clear cookies or use separate browser sessions/profiles. |
| Integrations failing (CSRF errors) | SameSite=Lax or Strict blocks necessary cookies | - use token-based authentication (recommended).<br>- Set to None. |
