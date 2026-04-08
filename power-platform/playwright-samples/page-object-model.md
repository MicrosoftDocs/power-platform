---
title: Page Object Model for Power Platform Playwright Samples
description: Structure your Power Platform Playwright tests using the Page Object Model pattern to encapsulate selectors, improve maintainability, and reuse interaction logic.
author: deepakkamboj
ms.author: dekamb
ms.topic: concept-article
ms.date: 04/07/2025
ms.subservice: developer
---

# Page Object Model

The Page Object Model (POM) is a design pattern that encapsulates the selectors and actions for a specific page or component into a dedicated class. Tests call methods on the page object instead of using raw locators, which makes tests more readable and easier to maintain when the UI changes.

## Why use POM for Power Platform tests

Power Platform apps have several characteristics that make POM especially valuable:

- **Canvas apps have many `data-control-name` attributes** — centralizing them in a class means renaming a control only requires one change
- **Model-driven form field schema names** can change if tables are modified — isolating them in a POM limits the blast radius
- **Common actions** (navigate to gallery, click Add, save record) are repeated across many tests — POM avoids duplication

## Toolkit built-in page objects

The `power-platform-playwright-toolkit` provides ready-made page objects:

| Class | App type | Key methods |
|---|---|---|
| `CanvasAppPage` | Canvas | `waitForLoad()`, `getFrame()` |
| `ModelDrivenAppPage` | Model-driven | `navigateToGridView()`, `navigateToFormView()` |
| `GridComponent` | MDA grid | `filterByKeyword()`, `getCellValue()`, `openRecord()`, `selectRow()` |
| `FormComponent` | MDA form | `getAttribute()`, `setAttribute()`, `save()`, `isDirty()` |
| `CommandingComponent` | MDA command bar | `clickButton()`, `clickMoreCommands()` |

Access them through `AppProvider`:

```typescript
const app = new AppProvider(page, context);
await app.launch({ ... });

const mda = app.getModelDrivenAppPage();
// mda.grid, mda.form, mda.commanding are ready to use
```

## Create a custom POM for your canvas app

Extend the toolkit by creating your own page object for your specific app:

```typescript
// pages/accounts/AccountsCanvasPage.ts
import { Page, FrameLocator, expect } from '@playwright/test';

export class AccountsCanvasPage {
  private readonly frame: FrameLocator;

  constructor(private readonly page: Page) {
    this.frame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  }

  // --- Locators ---

  get gallery() {
    return this.frame.locator('[data-control-name="Gallery1"]');
  }

  get addButton() {
    return this.frame.locator('[data-control-name="IconButton_Add1"] [role="button"]');
  }

  get saveButton() {
    return this.frame.locator('[data-control-name="IconButton_Accept1"] [role="button"]');
  }

  get accountNameInput() {
    return this.frame.locator('input[aria-label="Account Name"]');
  }

  get phoneInput() {
    return this.frame.locator('input[aria-label="Main Phone"]');
  }

  // --- Actions ---

  async waitForLoad(): Promise<void> {
    await this.gallery
      .locator('[data-control-part="gallery-item"]')
      .first()
      .waitFor({ state: 'visible', timeout: 60000 });
  }

  async clickAdd(): Promise<void> {
    await this.addButton.waitFor({ state: 'visible' });
    await this.addButton.click();
  }

  async fillAccountForm(accountName: string, phone: string): Promise<void> {
    await this.accountNameInput.fill(accountName);
    await this.phoneInput.fill(phone);
  }

  async save(): Promise<void> {
    await this.saveButton.click();
  }

  async findAccount(name: string) {
    return this.gallery
      .locator('[data-control-part="gallery-item"]')
      .filter({
        has: this.frame
          .locator('[data-control-name="Title1"]')
          .getByText(name, { exact: true }),
      });
  }

  async expectAccountVisible(name: string): Promise<void> {
    const item = await this.findAccount(name);
    await expect(item).toBeVisible({ timeout: 30000 });
  }

  async getItemCount(): Promise<number> {
    return this.gallery.locator('[data-control-part="gallery-item"]').count();
  }
}
```

## Use the POM in tests

```typescript
// tests/accounts/accounts.test.ts
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';
import { AccountsCanvasPage } from '../../pages/accounts/AccountsCanvasPage';

test.describe('Accounts canvas app', () => {
  let accountsPage: AccountsCanvasPage;

  test.beforeEach(async ({ page, context }) => {
    const app = new AppProvider(page, context);
    await app.launch({
      app: 'Accounts App',
      type: AppType.Canvas,
      mode: AppLaunchMode.Play,
      skipMakerPortal: true,
      directUrl: buildCanvasAppUrlFromEnv(),
    });

    accountsPage = new AccountsCanvasPage(page);
    await accountsPage.waitForLoad();
  });

  test('should display accounts', async () => {
    const count = await accountsPage.getItemCount();
    expect(count).toBeGreaterThan(0);
  });

  test('should create a new account', async () => {
    const name = `Test Account ${Date.now()}`;

    await accountsPage.clickAdd();
    await accountsPage.fillAccountForm(name, '555-9000');
    await accountsPage.save();

    await accountsPage.expectAccountVisible(name);
  });
});
```

## Create a custom POM for model-driven entities

Wrap the toolkit's `ModelDrivenAppPage` for a specific entity:

```typescript
// pages/orders/OrdersPage.ts
import { Page, expect } from '@playwright/test';
import { ModelDrivenAppPage } from 'power-platform-playwright-toolkit';

const ENTITY = 'nwind_orders';
const ORDER_NUMBER_FIELD = 'nwind_ordernumber';
const STATUS_FIELD = 'nwind_orderstatusid';

export class OrdersPage {
  constructor(
    private readonly page: Page,
    private readonly mda: ModelDrivenAppPage,
  ) {}

  async navigateToList(): Promise<void> {
    await this.mda.navigateToGridView(ENTITY);
    await this.mda.grid.waitForGridLoad();
  }

  async filterByOrderNumber(orderNumber: string): Promise<void> {
    await this.mda.grid.filterByKeyword(orderNumber);
    await this.mda.grid.waitForGridLoad();
  }

  async openFirstOrder(): Promise<void> {
    await this.mda.grid.openRecord({ rowNumber: 0 });
  }

  async getOrderNumber(): Promise<string | null> {
    return this.mda.form.getAttribute(ORDER_NUMBER_FIELD);
  }

  async setOrderNumber(value: string): Promise<void> {
    await this.mda.form.setAttribute(ORDER_NUMBER_FIELD, value);
  }

  async saveOrder(): Promise<void> {
    await this.mda.form.save();
    expect(await this.mda.form.isDirty()).toBe(false);
  }

  async deleteFirstOrder(): Promise<void> {
    await this.mda.grid.selectRow(0);
    await this.page.locator('button[aria-label*="Delete"]').first().click();
    const dialog = this.page.locator('[role="dialog"]');
    await dialog.locator('button:has-text("Delete")').click();
  }
}
```

## Folder structure

Organize page objects alongside tests:

```
packages/e2e-tests/
├── pages/
│   ├── accounts/
│   │   └── AccountsCanvasPage.ts
│   ├── orders/
│   │   └── OrdersPage.ts
│   └── northwind/
│       ├── NorthwindCanvasAppPage.ts
│       └── CustomPage.page.ts
├── tests/
│   ├── accounts/
│   │   └── accounts.test.ts
│   └── northwind/
│       ├── canvas/
│       └── mda/
└── playwright.config.ts
```

## POM design guidelines

- **One class per logical page or major UI section** — don't put the entire app in one class
- **Expose locators as getters, not strings** — the locator object provides better type safety and auto-wait
- **Put `waitFor` inside action methods** — callers shouldn't need to know when to wait
- **Keep assertions in tests, not page objects** — POMs should do actions and return data; tests should verify expectations
- **Use descriptive method names** — `clickAdd()` is better than `click()`, `findAccount(name)` is better than `getItem(text)`

## Next steps

- [Configuration reference](configuration.md)
- [CI/CD integration](cicd.md)
- [Sample tests](samples.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [AI-assisted testing overview](ai-overview.md)
