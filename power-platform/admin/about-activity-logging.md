---
title: "About activity logging"
description: "Learn about activity logging in Dynamics 365 and Power Platform." 
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
contributors:
  - paulliew
  - denisem-msft
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/24/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About activity logging

Activity Logging logs user and admin activities across Dynamics 365 and Power Platform:
• Management in a central location on the portal: Administrators can now manage settings and activity reporting for all environments within the “Security & Compliance Center” Previously, Audit Logging was set up separately within each environment.
• All data in the system is now logged: All data transactions
including plugin operations, entity operations, bulk operations, user login/out sessions, and even Microsoft Support Personnel operations are logged by this new functionality.
• Configurable Alert Policies: The system can now be set up to notify administrators or Compliance Officers of certain events, according to configurable settings.
• Audit Log Search capability: Administrators can now easily query audit logs via predefined or custom filters.
• Analyze suspicious behavior with Security Information and Event Management (SIEM): Functioning in near real-time, the SIEM will work to analyze and alert administrators of possible suspicious behavior within the system and provide actions to address these events.
• SIEM Vendor Integration: Dynamics 365 now provides out-of-box integration with multiple SIEM vendors such as ArcLight, Microsoft OMS, Okta, SumoLogic, BetterCloud, and standard CEF format integration for many others.
• Minimized impact to system performance: This new Activity Logging Management functionality has a smaller footprint on system resources compared to the previous Audit Log functionality.
POWER PLATFORM AND DYNAMICS 365 APPS | A GUIDE TO SECURITY AND COMPLIANCE
2021
49
When audit log search in the Office 365 Security and Compliance Center is turned on, user and admin activity from your organization is recorded in the audit log and retained for 90 days. However, your organization might not want to record and retain audit log data. Or you might be using a third-party security information and event management (SIEM) application to access your auditing data. In those cases, a global admin can turn off audit log search in Office 365.

