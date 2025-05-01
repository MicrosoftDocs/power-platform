---
title: Configure the SameSite attribute for session cookies in Dataverse and Dynamics 365
description: Learn how to configure the SameSite attribute for session cookies in Dataverse and Dynamics 365.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/09/2025
author: abhijananddv
ms.author: abhijanand
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Configure the SameSite attribute for session cookies in Dataverse and Dynamics 365

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Learn how to configure the SameSite attribute for session cookies (CrmOwinAuth) in Microsoft Dataverse and Dynamics 365. This setting enhances security by controlling how your session cookie is shared in cross-site scenarios. 

The SameSite cookie setting controls how browsers share your session cookie (CrmOwinAuth) used in Dataverse and Dynamics 365. This cookie stores session management-related information. 

## Why use SameSite? 

| Setting | Description | Recommendation |
| --- | --- | --- |
| Lax | Cookies are sent for top-level navigation&mdash;that is, link clicks&mdash;but not during cross-site form submissions such as POST, PUT, DELETE, PATCH. | Recommended for most scenarios. |
| None | Cookies are always sent. This setting could be necessary for integrations such as embedded Dynamics 365 in iframes or custom integrations. This is the default setting.  | This setting can be used for integrations depending on cross-site requests. |
| Strict | Cookies are never sent with cross-site requests, even for top-level navigation in cross-site scenarios. | This setting can be used for highly sensitive environments. It can also impact the user experience. |

## Important considerations 

### Multiple Dynamics 365 instances in one browser session (critical) 

When logging into Dynamics 365 environments, browsers create a _session cookie_ (CrmOwinAuth) that remembers your login. This cookie is shared across all Dynamics 365 environments under the same parent domain (crm.dynamics.com). 

If you log into multiple Dynamics 365 or Power Platform [environments](environments-overview.md)&mdash;such as a production and a test environment in one browser session&mdash;the SameSite security setting applied to the first environment automatically applies to the other environments in the same browser session. This could lead to unexpected behavior in environments where you haven't explicitly set the SameSite configuration. 

#### Recommended actions

- Use separate browser sessions or browser profiles for each environment. 
- Clear your browser cookies when switching between different Dynamics 365 environments. 
- Consult your [Power Platform admin center administrator](overview-role-powerapps-admin.md) if adjustments or turning off the setting across environments is needed, which isn't recommended. 

### More considerations 

| Consideration | Explanation | Guidance |
| --- | --- | --- |
| Security against cross-site attacks | Setting SameSite from **None** to **Lax** or **Strict** significantly reduces cross-site request forgery (CSRF) attacks by preventing cookie-based cross-site requests like POST, PUT, DELETE, or PATCH. | **Lax** is recommended for protection without major usability impacts. |
| Strict setting usage | The **Strict** setting provides maximum security but blocks all cross-site interactions, including direct user clicks from external sites where the cookie is involved. | Recommended for highly confidential scenarios due to its strict restrictions. |
| Embedding Dynamics 365 (iFrames) or custom integrations | Embedding Dynamics 365 in external websites using iframes could require the SameSite setting to be **None**. **Lax** or **Strict** settings cause embedding issues. | Use **None** for embedded scenarios and integrations. |
| Consistency with modern browsers | Modern browsers default to **Lax**, offering protection against unintended cross-site data leakage without significantly affecting usability. | **Lax** setting is recommended as a balanced approach. |

## Prerequisites 

Before configuring SameSite, be sure you meet the following requirements:

- You have a nonproduction environment available for initial testing. 
- You have the Power Platform admin center [System Administrator](security-roles-privileges.md) role for making changes to the organization entity in Dataverse. 

## Configure SameSite attribute 

Currently, we need to perform the configuration through API call. 

1. Log in to your Dynamics 365 organization where you want to apply the setting. 
2. Open a browser console and run the following script. (You may need to run _allow pasting_ if not already allowed to paste script in console).  

    > [!NOTE]
    > If you haven't configured the _samesitemodeforsessioncookie_, **0** is set as the default. (Currently 0 is mapped to **None**.)
    >
    > You can set _samesitemodeforsessioncookie_ to **1** for **None**, **2** for **Lax**, and **3** for **Strict**, which isn't recommended.

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

### Verify the update 

To verify the update, go to this URL: `<org-URL>/api/data/v9.0/organizations(<org-ID>)?$select=samesitemodeforsessioncookie`

Check that the value is updated. 

Log out and log in again. The SameSite value for the **CRMOwinAuth** cookie should be updated accordingly. 

## Functional testing 

Log out and log in again to Dynamics 365. 

Check critical integrations and scenarios, especially iframe and cross-site interactions. 

## Troubleshooting 

| Issue | Cause | Solution |
| --- | --- | --- |
| Dynamics 365 pages fail to load in iframe. | SameSite set to **Lax** or **Strict**. | Change to **None**. |
| Cookie setting persists between multiple environments. | The cookie is shared across the .crm.dynamics.com domain. | Clear cookies or use separate browser sessions, or profiles. |
| Integrations failing (CSRF errors). | SameSite is set to **Lax** or **Strict** blocks necessary cookies. | Use token-based authentication, which is recommended. Or, configure the setting to **None**. |
