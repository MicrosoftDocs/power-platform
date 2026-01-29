---
title: Trace function
description: Reference information including syntax and examples for the Trace function.
author: mduelae

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Trace"]
---

# Trace function
[!INCLUDE[function-trace-applies-to](includes/function-trace-applies-to.md)]



Often there is a lot of logic working behind the scenes in an app. Sometimes the impact is obvious, for example, a control's value or color changes, confirming the logic operated correctly. However, sometimes it isn't obvious and it can be difficult to visualize and understand what is happening inside the app. Use the **Trace** function to record diagnostic information from behind the scenes, creating a timeline of what actually happened, to better understand how your app is operating and to help debug issues.

When used in Power Apps, the output from **Trace** appears in the [Power Apps Live Monitor](/power-apps/maker/monitor-overview) tool along with other app activities. If you allowed your app to send telemetry data to [Azure Application Insights](/power-apps/maker/canvas-apps/application-insights), the **Trace** function can also be used to send information to your Application Insights resource. **Trace** can only be used in [behavior formulas](../imperative.md) - to trace values from data properties, you need to use alternatives such as [debug buttons](/troubleshoot/power-platform/power-apps/create-and-use-apps/monitor-debugging-canvas-apps#trace-data-property-values-by-using-debug-buttons). 

When used with [Test Studio](/power-apps/maker/canvas-apps/test-studio), **Trace** is an optional expression that can be used to provide additional information in your test results from the **OnTestCaseComplete** event. **Trace** event messages are combined with passed and failed assertion messages in the **Traces** table of the **TestCaseResult** record. The **Traces** table has two properties, **Message** and **Timestamp**. Trace information used in tests will also be recorded in Application Insights. Test trace information isn't be available in the Live Monitor tool as the Live Monitor is connected to the app when played from the Power Apps Studio.

## Syntax

**Trace**( _Message_ [, _TraceSeverity_ [, _CustomRecord_ [, _TraceOptions_ ] ] ] )

- _Message_ – Required. The information to be traced. Numbers, Dates, Booleans, and any other data type that can be coerced to Text.
- _TraceSeverity_ – Optional. The severity level of the Trace recorded in Live Monitor and Application Insights. Options are **TraceSeverity.Information** (default), **TraceSeverity.Warning**, **TraceSeverity.Error**, or **TraceSeverity.Critical**.
- _CustomRecord_ – Optional. A record containing custom data that is recorded in Live Monitor or Application Insights.
- _TraceOptions_ – Optional. Options are **TraceOptions.None** (default) and **TraceOptions.IgnoreUnsupportedTypes** which ignores data types in _CustomRecord_ that can't be serialized.

## Example

1. Create a button control in Power Apps Studio.
2. Set the **OnSelect** formula to the formula:
  ```power-fx
  Set( x, x+1 );
  Trace( x );
  ```
3. Open the Power Apps Live Monitor in another browser window by selecting the "Advanced tools" icon in the left hand pane and select "Open live monitor":
  ![entry point for Power Apps live monitor](media/function-trace/open-monitor.png)
4. Return to the original Studio browser window and select your button four times. Use **Alt-click** on your mouse if in design mode.
5. View the Power Apps Live Monitor.
6. The Live Monitor's grid will contain an event for each button click and for each **Trace** call, which will show the value of the variable after each increment. Drill into a Trace event to see where the **Trace** was initiated, and the expression used for the message, in the right hand panel:
  ![live monitor trace showing button being pressed four times and corresponding increments of a variable](media/function-trace/increment-trace.png)

## See Also

[Power Apps Live Monitor Overview](/power-apps/maker/monitor-overview) <br>
[Test Studio Overview](/power-apps/maker/canvas-apps/test-studio) <br>
[Working with Test Studio](/power-apps/maker/canvas-apps/working-with-test-studio)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































