---
title: "Test connection to Exchange Server (on-premises) | MicrosoftDocs"
description: Learn how to test your app connection to  Exchange Server (on-premises)
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/06/2021
author: revachauhan
ms.author: rechauha
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Test connection to Exchange Server (on-premises)

The following guidance is for those having issues with connecting customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) to a mailbox hosted on their Microsoft Exchange on-premise deployment using server-side synchronization.

Dynamics 365 is hosted on Microsoft Azure. During configuration, server-side sync will try to initiate an HTTP connection to the Exchange Web Services (EWS) endpoint configured by the customer on the email server profile associated to the mailbox. The EWS endpoint is an internet-facing HTTP accessible resource which can be accessed from outside the customer network.

![Scenario for troubleshooting connection issues](media/troubleshooting-scenario.png "Scenario for troubleshooting connection issues")

## Determine if the issue is with Dynamics 365

To help diagnose the issue, let's determine if the problem is with the Dynamics 365 Online connection.

### Test connection with the Microsoft Remote Connectivity Analyzer

1. Open https://testconnectivity.microsoft.com/tests/O365EwsAccess/input 

2. Fill in the following values:

   To find these values, select an environment in the Power Platform admin center, go to **Settings** > **Email** > **Server profiles** > select the **Exchange Server (Hybrid)** profile.

   > [!NOTE]
   > Do not use test connection on the emailserver profile as in certain scenarios can misrepresent what the real issue is. Instead please configure a test mailbox associate it to the emailserver profile and test and enable it. Jim question: I need clarification on this as I don't understand text.

  |Field/setting  |Value  |
  |---------|---------|
  |Target mailbox email address     | For example: aTestMailbox@contoso.com        |
  |Authentication type     |  Select **Basic authentication**.        |
  |Microsoft Account     | You'll need an [impersonation account](/exchange/client-developer/exchange-web-services/impersonation-and-ews-in-exchange) (imp_acc_1) configured on Microsoft Exchange on-premises with impersonation access for all the mailboxes you wish to test synchronization.        |
  |Password     |         |
  |Use Autodiscover to detect server settings <br /> Specify Exchange Web Services URL    | Use Autodiscover if you want to use the automatically discover service to determine the server location. Specify an EWS URL (for example, https://contoso.yourdomain.com/EWS/Exchange.asmx) to locate the email server manually.       |
  |Test predefined folder      | Select this option.        |
  |Use Exchange Impersonation     | Enable this to test synchronization for multiple mailboxes.        |
  |Impersonated user     | Jim question: how is this different from Microsoft account?    |
  |Impersonated user identifier     |  Select **SmtpAddress**.       |

3. Fill in remaining values as appropriate and select **Perform Test**.

   :::image type="content" source="media/remote-connectivity-analyzer.png" alt-text="Microsoft Remote Connectivity Analyzer":::

### Test results

If the connectivity test is **not** successful, the issue is not with Dynamics 365 Online but could be with Microsoft Exchange on-premises configuration. The next step is to revisit your Microsoft Exchange server configuration and if necessary contact Microsoft Exchange on-premises support.  <--- Jim question. How do customers do this?

If the connectivity test is succcessful, contact [Support](get-help-support.md) to further analyze the source of the issue.