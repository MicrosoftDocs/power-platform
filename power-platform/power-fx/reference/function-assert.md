---
title: Assert function
description: Reference information, including syntax, for the Assert function.
author: mduelae

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: jorisde
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Assert function
[!INCLUDE[function-assert-applies-to](includes/function-assert-applies-to.md)]



An assertion is a condition or an expression that evaluates to true or false in a test. If the expression returns false, the test case will fail. Assertions are used to validate the expected result of a test or test step, against the actual result and to fail the test if the condition is false. Assertions can be used to validate the state of controls in your app such as label values, list box selections and other control properties.

> [!IMPORTANT]
> **Assert** function is only available for Test Studio in Power Apps.

Assertion messages, for both passed and failed assertions, are also contained in a Traces table in the TestCaseResult record.

## Syntax

_Assert(expression, message)_

- _Expression_ – Required. An expression that evaluates to true or false.
- _Message_ – Not Required. A message that describes the assertion failure.

## Examples

`Assert(lblResult.Text = "Success", "lblResult value Expected : Success , Actual : " & lblResult.Text)`<br>
`Assert(ListBox1.Selected.Value = "Success", "ListBox1 selection Expected : Success, Actual : " & ListBox1.Selected.Value)`<br>
`Assert(kudosAfterTest = kudosBeforeTest + 1, "Kudos count. Expected : " & kudosBeforeTest + 1 & " Actual :" & kudosAfterTest)`

### See Also

[Test Studio Overview](/power-apps/maker/canvas-apps/test-studio) <br>
[Working with Test Studio](/power-apps/maker/canvas-apps/working-with-test-studio)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































