---
title: Locators in Power Platform Playwright Samples
description: Learn how to use the built-in locator classes, selector objects, and LocatorUtils to write reliable, maintainable selectors for Power Platform canvas and model-driven apps.
author: deepakkamboj
ms.author: deepakkamboj
ms.topic: concept-article
ms.date: 04/07/2025
ms.subservice: developer
---

# Locators

The toolkit provides four layers of locator support: Playwright's built-in semantic locators, static selector objects for each app surface, a `BaseLocators` class for building custom page objects, and `LocatorUtils` helpers for constructing CSS selector strings. Understanding all four layers lets you pick the right tool for each situation and write selectors that are resilient to DOM changes.

## Locator priority

Choose locators in this order, from most to least preferred:

| Priority | Type | Example | Why |
|---|---|---|---|
| 1 | Role + name | `getByRole('button', { name: 'Save' })` | Mirrors how assistive technology sees the page; survives CSS refactors |
| 2 | ARIA label | `getByLabel('Account Name')` | Tied to the label a user reads, not DOM structure |
| 3 | Placeholder | `getByPlaceholder('Search')` | Stable for inputs; visible to screen readers |
| 4 | Test ID | `getByTestId('create-blank-canvas-app')` | Explicit, purpose-built hook for tests |
| 5 | Data attribute | `locator('[data-control-name="Gallery1"]')` | Power Platform-specific; stable in canvas apps |
| 6 | CSS class / id | `locator('.ms-Button')` | Use only when no semantic option exists; fragile |

---

## Playwright built-in semantic locators

Playwright exposes these directly on `page` and `locator`. Use them first when targeting standard HTML and Fluent UI elements.

### getByRole

Selects by ARIA role and optional accessible name:

```typescript
// Click a button by its label
await page.getByRole('button', { name: 'Save' }).click();

// Click a menu item
await page.getByRole('menuitem', { name: 'New record' }).click();

// Find a dialog
const dialog = page.getByRole('dialog');
await dialog.getByRole('button', { name: 'Delete' }).click();

// Model-driven grid row
const row = page.getByRole('row', { name: 'ORD-001' });
```

Supported roles relevant to Power Platform:

```
button  link  textbox  heading  menuitem  grid  row  cell
dialog  navigation  searchbox  checkbox  combobox  tab  tabpanel
gridcell  columnheader  rowheader  option  listbox
```

### getByLabel

Selects an input by its associated `<label>` or `aria-label`:

```typescript
// Canvas app input
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
await canvasFrame.getByLabel('Account Name').fill('Contoso');
await canvasFrame.getByLabel('Main Phone').fill('555-1234');

// Model-driven form input (scoped to the page, not iframe)
await page.getByLabel('Order Number').fill('ORD-001');
```

### getByText

Finds elements by visible text content:

```typescript
// Find an item in a list
await page.getByText('Northwind Traders').click();

// Exact match to avoid partial hits
await page.getByText('ORD-001', { exact: true }).click();

// Regex match
await page.getByText(/Order \d+/).first().click();
```

### getByPlaceholder

Selects inputs by their `placeholder` attribute:

```typescript
await page.getByPlaceholder('Search').fill('ORD-001');
await page.getByPlaceholder('Enter a name or email address').fill('test@contoso.com');
```

### getByTestId

Selects by `data-testid` attribute (the toolkit uses `data-test-id` in some places — both work via `getByTestId` or CSS):

```typescript
// Using Playwright getByTestId (maps to data-testid)
await page.getByTestId('create-blank-canvas-app').click();

// Using CSS for data-test-id (Power Apps portal variant)
await page.locator('[data-test-id="Dialog.Accept"]').click();
```

---

## BaseLocators — build custom page objects

`BaseLocators` is an abstract class that wraps all Playwright semantic locators. Extend it to build page-specific locator classes, keeping selectors in one place.

```typescript
import { BaseLocators } from 'power-platform-playwright-toolkit';
import { Page } from '@playwright/test';

export class OrderFormLocators extends BaseLocators {
  constructor(page: Page) {
    super(page);
  }

  // Semantic locators via protected helpers
  get saveButton() {
    return this.getByRole('button', { name: 'Save' });
  }

  get orderNumberInput() {
    return this.getByLabel('Order Number');
  }

  get statusDropdown() {
    return this.getByRole('combobox', { name: 'Order Status' });
  }

  // CSS fallback when semantic options aren't available
  get notesTextarea() {
    // Document why CSS is used instead of getByRole/getByLabel
    return this.locator('textarea[data-id="nwind_notes.fieldControl-text-box-textarea"]');
  }

  // Chaining locators
  get confirmDeleteButton() {
    return this.chain(
      this.getByRole('dialog'),
      (dialog) => dialog.getByRole('button', { name: 'Delete' })
    );
  }
}
```

### Available protected methods in BaseLocators

| Method | Maps to |
|---|---|
| `getByRole(role, options?)` | `page.getByRole()` |
| `getByText(text, options?)` | `page.getByText()` |
| `getByLabel(label, options?)` | `page.getByLabel()` |
| `getByPlaceholder(placeholder)` | `page.getByPlaceholder()` |
| `getByTestId(testId)` | `page.getByTestId()` |
| `getByAriaLabel(label)` | `page.getByLabel()` (aria-label path) |
| `locator(selector)` | `page.locator()` — CSS fallback |
| `chain(parent, child)` | Scope a child locator inside a parent |

---

## LocatorUtils — build CSS selector strings

`LocatorUtils` is a static helper class that generates CSS selector strings. Use it when you need to build a selector dynamically and pass it to `page.locator()`.

```typescript
import { LocatorUtils } from 'power-platform-playwright-toolkit';

// data-automation-id (Fluent UI components)
const spinner = page.locator(LocatorUtils.automationId('loading-spinner'));
// => [data-automation-id="loading-spinner"]

// data-automation-key (Fluent UI list items)
const menuItem = page.locator(LocatorUtils.automationKey('contextualMenu'));
// => [data-automation-key="contextualMenu"]

// aria-label as CSS
const button = page.locator(LocatorUtils.ariaLabel('Save'));
// => [aria-label="Save"]

// Parameterised selector template
const appLink = page.locator(
  LocatorUtils.formatSelector('[role="rowheader"] a:has-text("{0}")', 'My App')
);
// => [role="rowheader"] a:has-text("My App")

// Class with wildcard (partial class match)
const badge = page.locator(LocatorUtils.className('*-badge'));
// => [class*="-badge"]

// ID shorthand
const root = page.locator(LocatorUtils.id('ApplicationShell'));
// => #ApplicationShell
```

### LocatorUtils reference

| Method | Selector produced | Use for |
|---|---|---|
| `automationId(id)` | `[data-automation-id="id"]` | Fluent UI components |
| `automationKey(key)` | `[data-automation-key="key"]` | Fluent UI list/menu items |
| `ariaLabel(label)` | `[aria-label="label"]` | Elements with aria-label (not associated `<label>`) |
| `dataTestId(id)` | `[data-test-id="id"]` | Power Apps portal test hooks |
| `formatSelector(tpl, ...args)` | Template with `{0}`, `{1}` replaced | Parameterised CSS selectors |
| `className(name)` | `.name` or `[class*="name"]` | Class-based selection (use sparingly) |
| `id(id)` | `#id` | Element ID (use sparingly) |

---

## PowerAppsPageSelectors — Maker Portal selectors

`PowerAppsPageSelectors` is a static object of CSS selector strings organised by portal surface. Use it when writing tests that interact with the Power Apps maker portal itself (not the running app).

```typescript
import { PowerAppsPageSelectors } from 'power-platform-playwright-toolkit';

// Wait for the Apps page to load
await page.locator(PowerAppsPageSelectors.AppsPage.MainContainer)
  .waitFor({ state: 'visible', timeout: 30000 });

// Click New App
await page.locator(PowerAppsPageSelectors.AppsPage.NewApp).click();

// Open an app by name (uses dynamic selector)
await page.locator(
  LocatorUtils.formatSelector(PowerAppsPageSelectors.AppsPage.AppSelector, 'My Canvas App')
).click();
```

### PowerAppsPageSelectors structure

| Section | What it covers |
|---|---|
| `Root` / `PageHeader` / `MainNavigation` | Top-level page chrome |
| `AppsPage` | App list grid, New app button, filter buttons |
| `SolutionsPage` | Solution list, search, sitemap selector |
| `AppPreviewPage` | Canvas studio command bar, Save/Publish/Play |
| `ModelAppPage` | Application shell, command bar, breadcrumb |
| `HomePage` | Home page regions and sections |
| `TeachingBubble` | Fluent UI teaching bubble dismissal |
| `ModalFocusTrapZone` / `DialogAcceptButton` | Dialogs |
| `CanvasDesignerIframe` / `CanvasPlayerIframe` | Studio iframe references |
| `MeInitialsButton` / `SignOutButton` | Auth UI |
| `ErrorPage` | Error page elements |

### PowerAppsPageLocators class

`PowerAppsPageLocators` wraps `PowerAppsPageSelectors` and returns ready-to-use Playwright `Locator` objects:

```typescript
import { PowerAppsPageLocators } from 'power-platform-playwright-toolkit';

const portalLocators = new PowerAppsPageLocators(page);

// Navigate the portal without writing raw selectors
await portalLocators.newAppButton.click();
await portalLocators.canvasAppButton.click();

// Find an app by name
await portalLocators.getAppByName('Northwind Orders').click();

// Find a solution by name
portalLocators.getSolutionByName('NorthwindSolution');

// Access the canvas designer iframe
await portalLocators.canvasDesignerIframe.waitFor({ state: 'visible' });
```

---

## ModelDrivenAppLocators — Runtime selectors

`ModelDrivenAppLocators` covers the model-driven app runtime: the sitemap, grid, form, command bar, and dialogs. The `GridComponent` and `FormComponent` use these internally — use them directly only when you need a selector the component doesn't expose.

```typescript
import { ModelDrivenAppLocators } from 'power-platform-playwright-toolkit';

// Grid row by index (used internally by GridComponent)
const row = page.locator(ModelDrivenAppLocators.Runtime.Content.Grid.RowByIndex(0));
// => [role="row"][row-index="0"]

// Column header
const header = page.locator(
  ModelDrivenAppLocators.Runtime.Content.Grid.ColumnHeader('Order Number')
);
// => [role="columnheader"][aria-label*="Order Number"]

// Sitemap subarea
const siteMapItem = page.locator(
  ModelDrivenAppLocators.Runtime.SiteMap.SubArea('Orders')
);
// => a[aria-label="Orders"]

// Common command bar buttons
await page.locator(ModelDrivenAppLocators.Runtime.Commands.NewButton).click();
await page.locator(ModelDrivenAppLocators.Runtime.Commands.DeleteButton).click();

// Delete confirmation dialog
const deleteDialog = page.locator(ModelDrivenAppLocators.DeleteDialog.Dialog);
await deleteDialog.locator(ModelDrivenAppLocators.DeleteDialog.DeleteButton).click();
```

> [!NOTE]
> Prefer `ModelDrivenAppPage.grid.*` and `ModelDrivenAppPage.form.*` methods over raw `ModelDrivenAppLocators` selectors. The component methods handle waits, retries, and edge cases that raw selectors don't.

---

## CanvasAppLocators — Studio selectors

`CanvasAppLocators` covers the canvas app studio interface (for tests that edit apps, not play them). The runtime canvas app is accessed through `iframe[name="fullscreen-app-host"]` using `data-control-name` attributes, not through these studio selectors.

```typescript
import { CanvasAppLocators } from 'power-platform-playwright-toolkit';

// Studio command bar
await page.locator(CanvasAppLocators.Studio.CommandBar.SaveButton).click();
await page.locator(CanvasAppLocators.Studio.CommandBar.PublishButton).click();

// Insert a gallery control
await page.locator(CanvasAppLocators.Studio.LeftNav.InsertTab).click();
await page.locator(CanvasAppLocators.Studio.Insert.GalleryControl).click();

// Access a control on the canvas by name (studio edit mode)
const control = page.locator(CanvasAppLocators.Studio.Canvas.Control('Gallery1'));
// => [data-control-name="Gallery1"]

// Get runtime canvas controls (play mode)
const galleryItem = canvasFrame.locator(
  getCanvasControlByName('Gallery1') + ' [data-control-part="gallery-item"]'
);
```

### Helper functions in CanvasAppLocators

```typescript
import {
  getCanvasControlByName,
  getCanvasScreenByName,
  getCanvasDataTestId,
} from 'power-platform-playwright-toolkit';

// Build a selector for a named control
getCanvasControlByName('Button1')   // => [data-control-name="Button1"]
getCanvasScreenByName('HomeScreen') // => [data-screen-name="HomeScreen"]
getCanvasDataTestId('my-hook')      // => [data-testid="my-hook"]
```

---

## iframe scoping

All canvas app play-mode selectors must be scoped to the canvas iframe before they can match:

```typescript
// Get the frame locator
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

// All locator methods work on FrameLocator exactly as on Page
await canvasFrame.getByLabel('Account Name').fill('Contoso');
await canvasFrame.getByRole('button', { name: 'Save' }).click();
await canvasFrame.locator('[data-control-name="Gallery1"]').waitFor({ state: 'visible' });

// Scope a Playwright semantic locator inside the frame
const gallery = canvasFrame.locator('[data-control-name="Gallery1"]');
const item = gallery
  .locator('[data-control-part="gallery-item"]')
  .filter({
    has: canvasFrame
      .locator('[data-control-name="Title1"]')
      .getByText('Contoso', { exact: true }),
  });
```

> [!IMPORTANT]
> Never call `page.locator()` directly for canvas controls — the selectors won't resolve because the controls live inside the iframe. Always start from `canvasFrame.locator()` or `canvasFrame.getBy*()`.

---

## Chaining and filtering

Playwright locators compose cleanly. Use these patterns to narrow selections without resorting to `nth-child`:

```typescript
// Filter a list to the item that contains specific text
const specificOrder = page
  .locator('[role="row"]')
  .filter({ hasText: 'ORD-001' });

// Filter using a nested locator (more precise than hasText)
const specificGalleryItem = canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .filter({
    has: canvasFrame.getByText('Contoso Ltd', { exact: true }),
  });

// Scope a locator inside another locator
const dialog = page.getByRole('dialog');
const saveInDialog = dialog.getByRole('button', { name: 'Save' });

// Use .and() to combine conditions on the same element
const visibleSaveButton = page
  .getByRole('button', { name: 'Save' })
  .and(page.locator(':visible'));
```

---

## Troubleshoot selector issues

| Symptom | Likely cause | Fix |
|---|---|---|
| `Locator resolved to N elements` (strict mode) | Selector too broad | Add `.filter()`, `.first()`, or a more specific attribute |
| `Timeout waiting for locator` in canvas app | Not scoped to iframe | Use `canvasFrame.locator()` instead of `page.locator()` |
| `nth-child` breaks after grid filter | ag-Grid rebuilds rows | Use `[row-index="${n}"]` (built into `GridComponent`) |
| `getByRole('button')` matches the wrong button | Multiple buttons with same role | Add `{ name: 'exact label' }` to narrow by accessible name |
| Canvas control not found by `data-control-name` | App was regenerated | Re-inspect in DevTools; control name may have changed |
| `getByLabel` returns no match | Input has no associated label | Use `getByPlaceholder()` or `getByAriaLabel()` instead |

## Next steps

- [Page Object Model](page-object-model.md)
- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)

## See also

- [API reference](api-reference.md)
- [Write, debug, and run tests locally](local-development.md)
- [Playwright locators documentation](https://playwright.dev/docs/locators)
