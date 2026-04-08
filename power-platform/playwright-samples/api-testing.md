---
title: API testing through form context in Power Platform Playwright Samples
description: Use the FormComponent execute method to run Xrm API calls in-browser and validate Dataverse business logic without navigating the UI.
author: deepakkamboj
ms.author: deepakkamboj
ms.topic: how-to
ms.date: 04/07/2025
ms.subservice: developer
---

# API testing through form context

The `FormComponent.execute()` method lets you run arbitrary JavaScript inside the Dynamics 365 form context — directly against the Xrm API. This opens a hybrid testing approach: use Playwright to navigate to a record, then use `execute()` to validate or manipulate data programmatically, bypassing UI interactions that would otherwise be slow or fragile.

## How it works

When a model-driven app record is open in the browser, the Xrm object is available on `window.Xrm`. The `execute()` method bridges Playwright's Node.js context and the browser's page context, injecting your function and returning its result:

```typescript
const result = await modelDrivenApp.form.execute(async (formContext) => {
  // This code runs inside the browser, with access to the full Xrm API
  return formContext.getAttribute('nwind_ordernumber')?.getValue();
});

console.log(`Order number from Xrm: ${result}`);
```

`formContext` is the standard Dynamics 365 `Xrm.Form.FormContext` object. Any Xrm Client API method is available.

## Read field values via Xrm

Use `execute()` to read field values without relying on DOM selectors:

```typescript
// Read a text field
const orderNumber = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_ordernumber')?.getValue()
);

// Read a lookup field
const customer = await mda.form.execute((ctx) => {
  const lookup = ctx.getAttribute('nwind_customerid')?.getValue();
  return lookup?.[0]?.name ?? null;
});

// Read a choice/option set
const statusCode = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_orderstatusid')?.getValue()
);
```

> [!TIP]
> Reading via Xrm API is more reliable than reading DOM input values. The Xrm API returns the internal typed value regardless of how the field is rendered.

## Write field values via Xrm

Set field values programmatically without filling input elements:

```typescript
await mda.form.execute((ctx) => {
  ctx.getAttribute('nwind_ordernumber')?.setValue('ORD-API-001');
  ctx.getAttribute('nwind_notes')?.setValue('Updated via Xrm API');
});
```

> [!NOTE]
> Setting values via `execute()` bypasses browser input events. For fields with `onChange` business rules, this is equivalent to what a plugin or script would do. For fields that depend on browser input focus/blur events, use `mda.form.setAttribute()` which triggers the UI path.

## Validate business logic rules

Test that field-level or form-level business rules fire correctly:

```typescript
// Open a record
await mda.grid.openRecord({ rowNumber: 0 });

// Trigger a field change
await mda.form.setAttribute('nwind_orderstatusid', 'Shipped');

// Validate that a business rule made the tracking field required
const requiredLevel = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_trackingnumber')?.getRequiredLevel()
);

expect(requiredLevel).toBe('required');
```

## Check form validity and dirty state

```typescript
// After making changes, verify the form is dirty
const isDirty = await mda.form.isDirty();
expect(isDirty).toBe(true);

// Save and verify no validation errors
await mda.form.save();
expect(await mda.form.isValid()).toBe(true);
expect(await mda.form.isDirty()).toBe(false);
```

## Execute Xrm WebApi calls

The full Xrm.WebApi is available inside `execute()`. Use it to query or mutate Dataverse records directly:

```typescript
// Query Dataverse records without navigating the grid
const result = await mda.form.execute(async (formContext) => {
  const response = await (window as any).Xrm.WebApi.retrieveMultipleRecords(
    'nwind_orders',
    '?$filter=nwind_orderstatus eq 1&$select=nwind_ordernumber&$top=5'
  );
  return response.entities.map((e: any) => e.nwind_ordernumber);
});

expect(result.length).toBeGreaterThan(0);
```

> [!IMPORTANT]
> `Xrm.WebApi` calls run in the browser context and are subject to Dataverse API limits and the test user's security role. They count against your API call quota.

## Test plugin side effects

After saving a record, use `execute()` to verify that a plugin correctly updated a related field:

```typescript
// Create a new order via UI
await mda.navigateToFormView('nwind_orders');
await page.locator('input[data-id="nwind_ordernumber.fieldControl-text-box-text"]').fill('ORD-PLUGIN-TEST');
await mda.form.save();

// Wait for plugin async processing
await page.waitForTimeout(3000);

// Verify the plugin set the calculated total
const calculatedTotal = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_calculatedtotal')?.getValue()
);

expect(calculatedTotal).toBeGreaterThan(0);
```

## Combine UI navigation with API assertions

A common pattern is to drive navigation through the UI, then validate state through the API:

```typescript
test('submit order sets status to Pending', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({ ... });
  const mda = app.getModelDrivenAppPage();

  // Navigate to the order via the grid (UI path)
  await mda.navigateToGridView('nwind_orders');
  await mda.grid.filterByKeyword('ORD-001');
  await mda.grid.waitForGridLoad();
  await mda.grid.openRecord({ rowNumber: 0 });

  // Click Submit via the command bar (UI path)
  await mda.commanding.clickButton('Submit Order');
  await page.waitForTimeout(2000);

  // Validate the status via Xrm API (API assertion)
  const status = await mda.form.execute(
    (ctx) => ctx.getAttribute('nwind_orderstatusid')?.getValue()
  );

  expect(status).toBe(100000001); // Pending option set value
});
```

## Form context API reference

The `execute()` callback receives a standard Dynamics 365 `Xrm.Form.FormContext`. Key methods:

| Method | Description |
|---|---|
| `getAttribute(name)` | Get a form attribute by schema name |
| `getAttribute(name).getValue()` | Read the current field value |
| `getAttribute(name).setValue(v)` | Set the field value |
| `getAttribute(name).getRequiredLevel()` | Read `'none'`, `'recommended'`, or `'required'` |
| `getAttribute(name).setRequiredLevel(level)` | Set the required level |
| `getControl(name).setVisible(bool)` | Show or hide a field |
| `getControl(name).setDisabled(bool)` | Enable or disable a field |
| `ui.tabs.get(name).setVisible(bool)` | Show or hide a tab |
| `data.entity.getId()` | Get the current record GUID |
| `data.entity.getEntityName()` | Get the logical entity name |
| `data.save()` | Save the form programmatically |

For the full Xrm Client API reference, see [Microsoft Dataverse client API reference](https://learn.microsoft.com/power-apps/developer/model-driven-apps/clientapi/reference).

## Next steps

- [Test model-driven apps](model-driven-application.md)
- [Page Object Model](page-object-model.md)
- [API reference](api-reference.md)

## See also

- [FormComponent API](api-reference.md#formcomponent)
- [Sample tests](samples.md)
- [Xrm Client API reference](https://learn.microsoft.com/power-apps/developer/model-driven-apps/clientapi/reference)
