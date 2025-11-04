---
title: Govern with the CoE Power BI dashboard
description: "Perform risk assessments and identify critical, orphaned, or unused resources with the CoE Power BI dashboard."
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/06/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Govern with the CoE Power BI dashboard

As an admin, you can use the insights you gather to drive action, such as performing risk assessments and identifying critical, orphaned, or unused resources. The pages in the **Govern** section enable you to drive action directly from within the Power BI report through an embedded app. The app can be used to grant yourself or others ownership of a resource, or delete it.

## Environment capacity

You can use the **Environment Capacity** page to identify the environments consuming Dataverse capacity in your tenants. Review your total capacity consumption and identify environments that consume a lot of capacity.

:::image type="content" source="media/pb-7.png" alt-text="Environment Capacity":::

## App deep dive

You can use the **App deep dive** page to visualize data about your apps across multiple dimensions. The decomposition tree visual automatically aggregates data and enables drilling down into your dimensions in any order.

:::image type="content" source="media/pb-18.png" alt-text="App deep dive":::

You can use the decomposition tree visual to drill down into apps by environment name, app plan classification, maker department, connector name, connector tier, app type, and archive score.

You can filter the **App deep dive** page by:

- Environment
- Maker
- Is the app shared with the entire tenant?
- Number of shared (individual) users and groups
- App type
- Connector
- Last launched date
- App plan classification
- Connector name and connector tier
- Is the app orphaned (the app owner has left the organization)

In addition, you can sort the output data by the total number of users the app is shared with, unique users who have launched the app, last launched date, archive score, environment name, and app owner.

Some typical assessments an admin might perform are described in the following sections.

### Identify widely shared apps

Set **Shared with tenant** to **True**, or select the **App Shared with (Total)** on the filter pane to find widely shared apps.

- Widely shared resources (shared with the entire tenant or many individual users) might need a stronger support model, or you might need to review the number of people they're shared with.

- Often apps are shared with the entire organization because it's the easy option. If the app is for a single department, job role, or group of people, you can help the maker by setting up a Microsoft Entra group to share their app. Otherwise:

  - Your entire org sees the app in the Power Apps mobile player or on make.powerapps.com (even if it's not relevant to them).
  - If a user doesn't have access to the underlying data source, they receive an error message when they try to open the app, which can cause an increase in support tickets and confusion.

- Apps shared with a large number of individual users pose a different risk: if the app is for a specific job role or department, when a user leaves the department or job role they'll still see the app and be able to access the information. Therefore, it's recommended to share role-specific apps with a Microsoft Entra group instead.

### Identify orphaned apps

Set **Is Orphaned** to **True** in the filter pane to find orphaned apps.

Orphaned apps, where the app owner has left the organization, will still work for users, but changes or bug fixes can only be made by an owner. It's important, therefore, to identify orphaned apps and find a new owner for them, or work on a retirement plan for those apps.

### Identify implicitly shared app connections

- Some connectors, like the SQL Connector used with SQL Server Authentication, can be [shared implicitly with users](/powerapps/maker/canvas-apps/connections-list\#sql-user-name-and-password-authentication). This means that as soon as the app is published, the connection is also published and available to your users. Your users can then also create apps by using any connection that uses SQL Server authentication that's shared with them.

- Identify apps that use the SQL Server Connector. Ensure that users are aware of the risks, and help them mitigate it by enabling Microsoft Entra authentication for SQL Server.

Select **SQL Server** in the **Connector Name** drop-down list on the rightmost filter pane to find apps that use the SQL Server Connector.

### Review top-used connectors in apps

- Identify top-used connectors to understand what data sources your makers are connecting to.
- Identify how many apps and makers are using premium connectors to understand your license consumption and requirements.

Select **Connector Name** in the decomposition tree visual to view app numbers aggregated by connector name, or select **Connector Tier** in the decomposition tree visual to view app numbers aggregated by connector tier.

Once you have identified apps based on the selected criteria, right-click to select a specific app, and then select **Drill through** to get further details for the selected app. You can manage app access through an embedded app, review app connectors, review the app archive score, and review the individual app usage using **Drill through**.

:::image type="content" source="media/pb-26.png" alt-text="Drill through to app details.":::

## Flow deep dive

You can use the **Flow deep dive** page to visualize data about your flows across multiple dimensions. The decomposition tree visual automatically aggregates data and enables drilling down into your dimensions in any order.

:::image type="content" source="media/pb-19.png" alt-text="Flow deep dive":::

You can use the decomposition tree visual to drill down into apps by environment name, maker department, connector name, connector tier, flow state, and archive score.

Some typical assessments an admin might perform are described in the following sections.

### Identify suspended flows

- Flows are suspended due to using a combination of connectors that conflict with the company [data policies](/power-automate/prevent-data-loss) or billing restrictions.

- Find those flows, and work with the maker to decide whether the flow is still needed, and if so, what policy violation they've encountered. Educate the maker or modify the data policy as needed.

Select **State** in the decomposition tree visual and then drill down to suspended flows.

### Identify orphaned flows

- Orphaned flows, where the flow owner has left the organization, will stop working. It's therefore important to identify orphaned flows, check whether they're still needed, and find a new owner.

- In the meantime, grant yourself ownership to see what the flow is doing.

Set **Is Orphaned** to **True** in the filter pane to find orphaned apps.

### Implicitly shared flow connections

- Some connectors, like the SQL Connector used with SQL Server Authentication, are [shared implicitly with users](/powerapps/maker/canvas-apps/connections-list\#sql-user-name-and-password-authentication). This means that as soon as the flow is shared, the connection is also published and available to your users. Your users can also create flows by using any connection that uses SQL Server authentication that's shared with them.

- Identify flows that use the SQL Server Connector. Ensure that users are aware of the risk, and help them mitigate it by enabling Microsoft Entra authentication for SQL Server.

Select **SQL Server** in the **Connector Name** drop-down list on the rightmost filter pane to find flows that use the SQL Server Connector.

### Review top-used connectors in flows

- Identify top-used connectors to understand what data sources your makers are connecting to.
- Identify how many flows and makers are using premium connectors to understand your license consumption and requirements.

Select **Connector Name** in the decomposition tree visual to view app numbers aggregated by connector name, or select **Connector Tier** in the decomposition tree visual to view app numbers aggregated by connector tier.

After you have identified flows based on the selected criteria, right-click to select a specific flow, and then select **Drill through** to get further details for the selected flow. You can manage flow access through an embedded app, review flow connectors, and review the flow archive score.

:::image type="content" source="media/pb-27.png" alt-text="Drill through to flow details.":::

## App and flow archive

Using the CoE dashboard, admins also have the ability to identify unused apps and flows by monitoring their archive score: in short, the higher the score, the more likely it is that you can safely archive the resource.

- The highest possible score for an app is 6. A score of 6 represents an app that hasn't been modified since it was created, is using a nonproduction word like  _test_ or _demo_ in the title, was created over three years ago, and was likely created from a template.

- The highest possible score for a flow is 10. A score of 10 represents a flow that hasn't been modified since it was created, is using a nonproduction word like _test_ or _demo_ in the title, was created over three years ago, was likely created from a template, is in a stopped state, doesn't have an owner, and isn't complex (contains fewer than five actions).

The **App deep dive** page shows the archive score. You can either sort the table by highest archive score, or select **Archive Score** in the decomposition tree visual to view aggregated data across all scores. You can use filters to target specific makers, date ranges, environments, departments, or connectors. Drill through from an individual app to the **Review Archive Score** page to view the score details.

The **Archive Score** is the sum of multiple criteria:

- Has the app been modified since it was created? (+1)
- Does the app name use nonproduction words such as *test*, *demo*, or *sample*? (+1)
- When was the app last modified? (+3 for more than two years ago, +2 for more than one year ago, +1 for more than three months ago)
- Is this app likely a template, or are there multiple apps with the same name? (+1)
- Is the app suspended? (+2)
- Is the app orphaned? (+2)

:::image type="content" source="media/pb-28.png" alt-text="App Archive Score":::

The **Flow deep dive** page shows the archive score. You can either sort the table by highest archive score, or select **Archive Score** in the decomposition tree visual to view aggregated data across all scores. You can use filters to target specific makers, date ranges, environments, departments, or connectors. Drill through from an individual flow to the **Review Archive Score** page to view the score details.

The **Archive Score** is the sum of multiple criteria:

- Has the flow been modified since it was created? (+1)
- Does the flow name use nonproduction words such as *test*, *demo*, or *sample*? (+1)
- When was the flow last modified? (+3 for more than two years ago, +2 for more than one year ago, +1 for more than three months ago)
- Is this flow likely a template, or are there multiple flows with the same name? (+1)
- What is the flow state? (+2 for suspended)
- Is the flow orphaned? (+2)
- Does the flow have an owner?(+2 if no owner)
- How complex is the flow, based on the number of unique actions? (-1 if it's complex, because that indicates a user has spent much time putting it together)

:::image type="content" source="media/pb-29.png" alt-text="Flow Archive":::

### Manage app access

The **Manage App Access** page is available by drilling down from a selected app and provides you with an embedded app that lets you immediately take action.

With the embedded app, you don't have to leave the Power BI dashboard to take action:

- You can grant yourself or others ownership. This will trigger an email notification to the users you share the app with.

- You can delete the app.

- You can email the app owner.

- After you've granted yourself ownership, you can open the maker portal to view the version number.

:::image type="content" source="media/pb-30.png" alt-text="App details":::

### Manage flow access

The **Manage Flow Access** page is available by drilling down from a selected flow and provides you with an embedded app that lets you immediately take action.

With the embedded app, you don't have to leave the Power BI dashboard to take action:

- You can grant yourself or others ownership. This will trigger an email notification to the users you share the flow with.

- You can export the flow.

- You can delete the flow.

- You can email the flow maker.

- After you've granted yourself ownership, you can open the maker portal to view flow analytics and details.

:::image type="content" source="media/pb-31.png" alt-text="Flow details":::

## Connector deep dive

You can use the **Connector deep dive** page to better understand your connector usage across flows and apps. Identify the most-used connectors and learn how many apps and flows use premium connectors and which makers.

:::image type="content" source="media/pb-20.png" alt-text="Connector deep dive":::

<a name="desktop_flows_risk_assessment"></a>

### Desktop flow usage

The **Desktop Flow usage** page enables you to filter by:

- Environment name and type
- Maker
- Desktop flow name
- Error code
- Run completed on date

Some typical assessments an admin might perform are described in the following sections.

#### Identify orphaned desktop flows

Orphaned desktop flows, where the flow owner has left the organization, will stop working. It's therefore important to identify orphaned desktop flows, check whether they're still needed, and find a new owner.

Select **Blank** in the **Maker Name** drop-down list on the filter pane to find orphaned flows.

#### Identify frequent failures

Identify frequent reasons for why desktop flow runs fail and work with the maker to fix the errors.

Select an error in the **Error Code** drop-down list on the filter pane to find desktop flows that failed.

:::image type="content" source="media/pb-23.png" alt-text="Desktop flow usage":::

### Desktop flow detail

The **Desktop flow detail** page is available by drilling down from a selected desktop flow. This page provides you with richer information about the runs of this desktop flow. You will be able to review the run history, identify anomalies in the time it takes to complete a single run, and view error codes and messages if the desktop flow has failed.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
