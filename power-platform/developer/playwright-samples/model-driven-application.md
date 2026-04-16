---
title: Test model-driven apps with Power Platform Playwright samples
description: Write end-to-end tests for Dynamics 365 and model-driven Power Apps using the ModelDrivenAppPage, GridComponent, and FormComponent classes.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Test model-driven apps

Model-driven apps render list views using a data grid component and a form runtime for record editing. The framework's [`GridComponent`](api-reference.md#gridcomponent)  and [`FormComponent`](api-reference.md#formcomponent)  classes abstract the underlying DOM structure so you don't need to write complex selectors. This guide shows how to navigate to an app, interact with the grid, open records, and verify form field values using the [`ModelDrivenAppPage`](api-reference.md#modeldrivenapppage)  and its built-in components.

## Launch a model-driven app

Use `skipMakerPortal: true` and `directUrl` to bypass [Power Apps](https://make.powerapps.com) navigation and go straight to the app:

```typescript
import { test } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode } from 'power-platform-playwright-toolkit';

const MODEL_DRIVEN_APP_URL = process.env.MODEL_DRIVEN_APP_URL!;

test.beforeEach(async ({ page, context }) => {
  const app = new AppProvider(page, context);

  await app.launch({
    app: 'Northwind Orders',
    type: AppType.ModelDriven,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: MODEL_DRIVEN_APP_URL,
  });

  modelDrivenApp = app.getModelDrivenAppPage();
});
```

## Work with the grid

The [`GridComponent`](api-reference.md#gridcomponent) handles the [AG Grid](https://www.ag-grid.com/) that powers model-driven list views. It uses `[row-index]` attributes for reliable row targeting that works correctly after filtering.

### Wait for the grid to load

Navigate to an entity's list view and wait for the grid rows to render before interacting with them.

```typescript
await modelDrivenApp.navigateToGridView('nwind_orders');
await modelDrivenApp.grid.waitForGridLoad();
```

### Filter the grid

Narrow the grid results by searching across all visible columns or by targeting a specific column.

```typescript
// Filter by keyword (searches across visible columns)
await modelDrivenApp.grid.filterByKeyword('ORD-12345');
await modelDrivenApp.grid.waitForGridLoad();

// Filter by a specific column
await modelDrivenApp.grid.filterByColumn('Order', 'ORD-12345');
```

### Read cell values

Retrieve the displayed value of a cell by row index and column name (schema name or display name).

```typescript
// By column schema name
const orderNumber = await modelDrivenApp.grid.getCellValue(0, 'nwind_ordernumber');

// By column display name
const status = await modelDrivenApp.grid.getCellValue(0, 'Order Status');
```

### Open a record

Open a record's form by row number or by matching a column value.

```typescript
// Open the first record in the grid
await modelDrivenApp.grid.openRecord({ rowNumber: 0 });

// Open a record by column value
await modelDrivenApp.grid.openRecord({
  columnName: 'Order Number',
  columnValue: 'ORD-12345',
});
```

### Select rows

Select one or more rows in the grid, or check whether the grid contains any records.

```typescript
// Select one row
await modelDrivenApp.grid.selectRow(0);

// Select multiple rows
await modelDrivenApp.grid.selectRows([0, 1, 2]);

// Check if grid is empty
const isEmpty = await modelDrivenApp.grid.isGridEmpty();
```

## Work with forms

The [`FormComponent`](api-reference.md#formcomponent) wraps the Dynamics 365 form runtime and the Xrm FormContext API.

### Read field values

Use `getAttribute()` to retrieve the current value of a form field by its schema name.

```typescript
const orderNumber = await modelDrivenApp.form.getAttribute('nwind_ordernumber');
const status = await modelDrivenApp.form.getAttribute('nwind_orderstatusid');
```

### Write field values

Use `setAttribute()` to programmatically set a field's value on the form.

```typescript
await modelDrivenApp.form.setAttribute('nwind_ordernumber', 'ORD-99999');
await modelDrivenApp.form.setAttribute('nwind_notes', 'Updated via test');
```

### Save the form

Save the record and verify the form is no longer dirty and passes validation.

```typescript
await modelDrivenApp.form.save();

// Verify the form saved successfully
expect(await modelDrivenApp.form.isDirty()).toBe(false);
expect(await modelDrivenApp.form.isValid()).toBe(true);
```

### Navigate form tabs

Switch between tabs on the form to access fields in different sections.

```typescript
await modelDrivenApp.form.navigateToTab('Summary');
await modelDrivenApp.form.navigateToTab('Details');
```

### Control field visibility and state

Change a field's visibility, disabled state, or required level at runtime.

```typescript
await modelDrivenApp.form.setFieldVisibility('nwind_notes', true);
await modelDrivenApp.form.setFieldDisabled('nwind_ordernumber', false);
await modelDrivenApp.form.setFieldRequiredLevel('nwind_customerid', 'required');
```

### Execute custom Xrm code

Run any code that uses the Dynamics 365 Xrm API directly on the form context:

```typescript
const result = await modelDrivenApp.form.execute(async (formContext) => {
  const attr = formContext.getAttribute('nwind_ordernumber');
  return attr?.getValue();
});

console.log(`Order number from Xrm: ${result}`);
```

## Full CRUD workflow example

This test demonstrates a complete create, read, update, and delete workflow against a model-driven app.

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode } from 'power-platform-playwright-toolkit';

const ENTITY = 'nwind_orders';
const APP_URL = process.env.MODEL_DRIVEN_APP_URL!;

test('should create, read, update, and delete an order', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'Northwind Orders',
    type: AppType.ModelDriven,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: APP_URL,
  });
  const mda = app.getModelDrivenAppPage();

  // Step 1: Create a new order record
  await mda.navigateToFormView(ENTITY);
  await page.locator('input[data-id="nwind_ordernumber.fieldControl-text-box-text"]').fill('ORD-TEST-001');
  await page.locator('button[aria-label*="Save"]').first().click();
  await page.waitForTimeout(3000);

  // Step 2: Read the record in the grid
  await mda.navigateToGridView(ENTITY);
  await mda.grid.waitForGridLoad();
  await mda.grid.filterByKeyword('ORD-TEST-001');
  await mda.grid.waitForGridLoad();

  expect(await mda.grid.getRowCount()).toBeGreaterThan(0);
  const cellValue = await mda.grid.getCellValue(0, 'Order Number');
  expect(cellValue).toContain('ORD-TEST-001');

  // Step 3: Update the order number
  await mda.grid.openRecord({ rowNumber: 0 });
  await page.locator('input[data-id="nwind_ordernumber.fieldControl-text-box-text"]').fill('ORD-TEST-001-UPDATED');
  await page.locator('button[aria-label*="Save"]').first().click();
  await page.waitForTimeout(3000);

  // Step 4: Delete the record
  await mda.navigateToGridView(ENTITY);
  await mda.grid.waitForGridLoad();
  await mda.grid.filterByKeyword('ORD-TEST-001-UPDATED');
  await mda.grid.waitForGridLoad();
  await mda.grid.selectRow(0);
  await page.locator('button[aria-label*="Delete"]').first().click();
  // Confirm the deletion dialog
  const dialog = page.locator('[role="dialog"]');
  await dialog.locator('button:has-text("Delete")').click();
});
```

## Navigate using the sitemap

Use the sitemap sidebar to navigate to a specific entity list view.

```typescript
// Navigate to a specific entity list view via sitemap
const sidebarItem = page.locator('[role="presentation"][title="Orders"]').first();
await sidebarItem.waitFor({ state: 'visible', timeout: 15000 });
await sidebarItem.click();
```

## Troubleshoot grid issues

The following table lists common grid interaction problems and how to resolve them.

| Symptom | Likely cause | Resolution |
|---|---|---|
| Row not found after filtering | Grid still re-rendering | Add `await mda.grid.waitForGridLoad()` after filter |
| `nth-child` selector fails | [AG Grid](https://www.ag-grid.com/) header/row structure | Use `[row-index]` selector (built into [`GridComponent`](api-reference.md#gridcomponent) ) |
| Checkbox click blocked by overlay | CheckMark icon overlays input | Use `{ force: true }` on checkbox click |

## Next steps

- [Test custom pages](custom-pages.md)
- [Page Object Model](page-object-model.md)
- [Sample tests](samples.md)

## See also

- [Authentication guide](authentication-guide.md)
- [Configuration reference](configuration.md)
- [API reference](api-reference.md)
