---
title: Trace function in Power Apps
description: Reference information including syntax and examples for the Trace function in Power Apps.
author: mduelae

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 01/19/2023
ms.subservice: power-fx
ms.author: aheaney
search.audienceType:
  - maker
search.app:
  - PowerApps
contributors:
  - gregli-msft
  - mduelae
---

# Trace function in Power Apps

Use **Trace** to record real-time diagnostic information so that you can better understand your logic and debug issues.

When used in Power Apps, the output from **Trace** appears in the [Power Apps Monitor](/power-apps/maker/monitor-overview.md) tool along with other app activities.  If you have allowed your app to send telemetry data to [Azure Application Insights](/power-apps/maker/canvas-apps/application-insights), the **Trace** function can also be used to send information to your Application Insights resource. **Trace** can only be used in [behavior formulas](../imperative.md). 

When used with Test Studio, **Trace** is an optional expression that can be used to provide additional information in your test results from the **OnTestCaseComplete** event. Trace event messages, as well as any messages for both passed and failed assertions, are contained in a Traces table in the TestCaseResult record. The Traces table has two properties, Message and Timestamp.  Trace information used in Tests will also be recorded in Application Insights. Test trace information will not be available in the Monitor tool as the Monitor is connected to the app when it is played from the Canvas studio.

Usually **Trace** returns _true_.  If _Message_ contains an error, it will be reported in the Monitor and/or App Insights but will otherwise be suppreseed by **Trace**.  Errors in the other arguments will result in an error being reported to the app.

## Syntax

**Trace**( _Message_ [ , _TraceSeverity_ [ , _CustomRecord_ [ , _TraceOptions_ ] ] ] )_

- _Message_ – Required. The information to be traced. Numbers, Dates, Booleans and any other data type that can be coerced to Text.
- _TraceSeverity_ – Optional. The severity level of the Trace recorded in Monitor and Application Insights. Options are **TraceSeverity.Information**, **TraceSeverity.Warning** or **TraceSeverity.Error**.
- _CustomRecord_ – Optional. A record containing custom data that will be recorded in Monitor or Application Insights.
- _TraceOptions_ – Optional. Options are **TraceOptions.None** (default) and **TraceOptions.IgnoreUnsupportedTypes** which will ignore data types in _CustomRecord_ that cannot be serialized.  

## Examples

1. Create a button control in Power Apps.
2. Set the **OnSelect** formula to the formula:
  ```powerapps-dot
  Set( x, x+1 );
  Trace( x );
  ```
3. Open the Power Apps Monitor.
4. Press your button a few times.
5. View the monitor.

The Monitor will display an event for each button click and for each **Trace** value:

### See Also

[Test Studio Overview](/power-apps/maker/canvas-apps/test-studio) <br>
[Working with Test Studio](/power-apps/maker/canvas-apps/working-with-test-studio)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
