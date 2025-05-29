---
title: View performance recommendations
description: Enhance your Power Platform tenant's performance with actionable recommendations from the action center.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/28/2025
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
  - DanaMartens
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/04/2025
---

# View performance recommendations

The action center enhances your Power Platform tenant's performance with actionable recommendations. These recommendations improve website performance, optimize resource usage, and ensure efficient operations. You can view performance recommendations within the [action center](power-platform-advisor.md) in the Power Platform admin center.

The following recommendations are grouped by resource type:

## Sites

The following recommendations are related to websites:

### Improve performance of websites by migrating them to Bootstrap version 5

This recommendation lists production websites that aren't migrated to Bootstrap version 5. Review the websites and [migrate them to Bootstrap version 5 using the Power Pages bootstrap migration tool](/power-pages/configure/migrate-bootstrap) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High
- **Refresh frequency**: Daily
- **Managed environments only**: Yes  

### Review and move websites from standard data model to enhanced data model

This recommendation lists production websites that aren't migrated to the enhanced data model. Review the websites and [migrate them to the enhanced data model using the Power Pages site migration tool](/power-pages/admin/migrate-enhanced-data-model?branch=main&branchFallbackFrom=pr-en-us-648) where possible.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High
- **Refresh frequency**: Daily
- **Managed environments only**: Yes  

### Enable Content Delivery Network (CDN) to improve website performance

This recommendation lists production websites that don't have Content Delivery Network (CDN) enabled. Review the websites and [enable Content Delivery Network](/power-pages/configure/configure-cdn) where needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High
- **Refresh frequency**: Daily
- **Managed environments only**: Yes  
