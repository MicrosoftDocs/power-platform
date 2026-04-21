---
title: Sample tests for Power Platform Playwright samples
description: Explore ready-to-run Playwright tests for canvas apps, model-driven apps, and custom pages using the Northwind Traders sample data.
author: deepakkamboj
ms.author: dekamb
ms.topic: sample
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Sample tests

The repository includes a complete set of sample tests targeting a Northwind Traders environment. These samples demonstrate the full range of testing patterns supported by the toolkit and serve as a starting point for your own tests.

## Sample test suites

| Suite | File | App type | What it tests |
|---|---|---|---|
| Canvas app CRUD | [`tests/northwind/canvas/canvas-app-crud.test.ts`](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/canvas/canvas-app-crud.test.ts) | Canvas | Create, read, update, delete orders in a gallery |
| Model-driven CRUD | [`tests/northwind/mda/model-driven-crud.test.ts`](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/mda/model-driven-crud.test.ts) | Model-driven | Filter grid, open record, edit field, save, delete |
| Custom page CRUD | [`tests/northwind/mda/custom-page-crud.test.ts`](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/custom-page/custom-page-crud.test.ts) | Custom page (MDA) | Create account in embedded canvas page, verify in gallery |
| Custom page preview | [`tests/northwind/mda/custom-page.test.ts`](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/custom-page/custom-page.test.ts) | Custom page (Edit) | Add/delete record via [Power Apps](https://make.powerapps.com) preview |

## Run the samples

Follow these steps to set up your environment and run the sample test suites against a Northwind Traders environment.

### Prerequisites

1. Clone the repository and install dependencies:

   ```bash
   git clone https://github.com/microsoft/power-platform-playwright-samples.git
   cd power-platform-playwright-samples
   node common/scripts/install-run-rush.js install
   ```

1. Configure environment variables in `packages/e2e-tests/.env`:

   ```ini
   MS_AUTH_EMAIL=testuser@contoso.com
   MS_USER_PASSWORD=<password>
   CANVAS_APP_URL=https://apps.powerapps.com/play/<app-id>
   MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/main.aspx?appid=<app-id>
   CUSTOM_PAGE_NAME=AccountsCustomPage
   ```

1. Authenticate:

   ```bash
   cd packages/e2e-tests
   npm run auth:headful
   npm run auth:mda:headful
   ```

### Run all sample tests

To execute every test in the repository, run the following command from the `packages/e2e-tests` directory:

```bash
cd packages/e2e-tests
npx playwright test
```

### Run a single suite

You can target a specific test suite by passing its file or folder path to the `playwright test` command:

```bash
npx playwright test tests/northwind/canvas
npx playwright test tests/northwind/mda/model-driven-crud.test.ts
```

### Run with the Playwright UI

Use the `--ui` flag to launch Playwright's interactive test runner, which lets you watch, debug, and re-run tests visually:

```bash
npx playwright test --ui
```

## Canvas app CRUD sample

The canvas app test (`canvas-app-crud.test.ts`) [canvas app test (`canvas-app-crud.test.ts`)](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/canvas/canvas-app-crud.test.ts) demonstrates how to:

- Launch a canvas app directly by using `skipMakerPortal: true`.
- Wait for a gallery to load with a 60-second timeout.
- Select a gallery item by text content.
- Fill an order form and save it.
- Verify that changes appear in the gallery.

**Key patterns used:**

```typescript
// Wait for gallery with sufficient timeout
await canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .first()
  .waitFor({ state: 'visible', timeout: 60000 });

// Select gallery item by title text
const galleryItem = canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .filter({
    has: canvasFrame
      .locator('[data-control-name="Title1"]')
      .getByText('Order 001', { exact: true }),
  });
```

## Model-driven CRUD sample

The [model-driven test (`model-driven-crud.test.ts`)](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/mda/model-driven-crud.test.ts) demonstrates how to:

- Launch a model-driven app by using `directUrl`.
- Navigate to a grid view by entity name.
- Filter the grid by keyword and column value.
- Read cell values by column schema name.
- Open a record and edit a field.
- Save and verify on the form before navigating away.
- Delete a record through the command bar.

**Key patterns used:**

```typescript
// Filter and wait for grid
await mda.grid.filterByKeyword('ORD-TEST');
await mda.grid.waitForGridLoad();

// Read cell value and open record
const orderNumber = await mda.grid.getCellValue(0, 'nwind_ordernumber');
await mda.grid.openRecord({ rowNumber: 0 });

// Save form and verify
await mda.form.save();
expect(await mda.form.isDirty()).toBe(false);
```

## Custom page CRUD sample

The [custom page test (`custom-page-crud.test.ts`)](https://github.com/microsoft/power-platform-playwright-samples/blob/main/packages/e2e-tests/tests/northwind/custom-page/custom-page-crud.test.ts) demonstrates how to:

- Launch a model-driven app and navigate to a custom page via the sitemap.
- Scope all interactions to `iframe[name="fullscreen-app-host"]`.
- Create a record in the embedded canvas page.
- Refresh the gallery by navigating to the app root and back.
- Verify the newly created record appears.

**Key patterns used:**

```typescript
// Navigate to custom page via sitemap
const sidebarItem = page.locator(`[role="presentation"][title="${CUSTOM_PAGE_NAME}"]`).first();
await sidebarItem.waitFor({ state: 'visible', timeout: 30000 });
await sidebarItem.click();

// Scope to canvas iframe
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

// Refresh by navigating to app root and back
await page.goto(MODEL_DRIVEN_APP_URL, { waitUntil: 'load', timeout: 60000 });
await sidebarItem.click();
```

## Extend the samples

To adapt the samples to your environment:

- **Replace entity names** — Update `nwind_orders`, `nwind_ordernumber`, and similar schema names to match your Dataverse tables.
- **Replace control names** — Update `data-control-name` values to match your canvas app controls.
- **Replace app URLs** — Point `CANVAS_APP_URL` and `MODEL_DRIVEN_APP_URL` to your own apps.
- **Replace column names** — Update display names like `'Order Number'` in `getCellValue()` calls.

## Next steps

- [AI-assisted testing overview](ai-overview.md)
- [Page Object Model](page-object-model.md)
- [Configuration reference](configuration.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [Test custom pages](custom-pages.md)
- [Authentication guide](authentication-guide.md)
