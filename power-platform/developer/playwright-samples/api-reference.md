---
title: API reference for Power Platform Playwright samples
description: "Explore the Power Platform Playwright toolkit API reference for classes, methods, and types to automate testing of canvas and model-driven apps. Start building tests today."
author: deepakkamboj
ms.author: dekamb
ms.topic: reference
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# API reference

This Power Platform Playwright toolkit API reference documents public classes, methods, and types you can use to automate end-to-end testing of canvas and model-driven apps.

## `AppProvider`

Entry point for launching Power Platform apps. Instantiate once per test, then call `launch()`.

```typescript
class AppProvider {
  constructor(page: Page, context: BrowserContext)

  launch(options: AppLaunchOptions): Promise<void>
  getModelDrivenAppPage(): ModelDrivenAppPage
  getCanvasAppPage(): CanvasAppPage
  getGenUxPage(): GenUxPage
}
```

### `AppLaunchOptions`

Options passed to `AppProvider.launch()` to configure which app to open and how.

```typescript
interface AppLaunchOptions {
  app: string;                  // Display name of the app
  type: AppType;                // Canvas | ModelDriven
  mode: AppLaunchMode;          // Play | Edit
  skipMakerPortal?: boolean;    // true: use directUrl, skip make.powerapps.com navigation
  directUrl?: string;           // Full URL when skipMakerPortal is true
}
```

### `AppType`

Specifies the type of Power Platform app to launch.

```typescript
enum AppType {
  Canvas = 'canvas',
  ModelDriven = 'model-driven',
}
```

### `AppLaunchMode`

Determines whether the app opens in play mode or edit mode.

```typescript
enum AppLaunchMode {
  Play = 'play',
  Edit = 'edit',
}
```

---

## `ModelDrivenAppPage`

Returned by `AppProvider.getModelDrivenAppPage()`. Provides navigation and component access.

```typescript
class ModelDrivenAppPage {
  readonly grid: GridComponent
  readonly form: FormComponent
  readonly commanding: CommandingComponent

  navigateToGridView(entityLogicalName: string): Promise<void>
  navigateToFormView(entityLogicalName: string): Promise<void>
}
```

---

## `GridComponent`

Wraps the [AG Grid](https://www.ag-grid.com/) used in model-driven list views. Accessed via `ModelDrivenAppPage.grid`.

```typescript
class GridComponent {
  waitForGridLoad(): Promise<void>

  filterByKeyword(keyword: string): Promise<void>
  filterByColumn(columnName: string, value: string): Promise<void>

  getCellValue(rowIndex: number, columnName: string): Promise<string | null>
  getRowCount(): Promise<number>
  isGridEmpty(): Promise<boolean>

  openRecord(options: OpenRecordOptions): Promise<void>
  selectRow(rowIndex: number): Promise<void>
  selectRows(rowIndexes: number[]): Promise<void>
}
```

### `OpenRecordOptions`

Options for identifying which record to open from the grid.

```typescript
interface OpenRecordOptions {
  rowNumber?: number;         // 0-based row index
  columnName?: string;        // column to match (display name or schema name)
  columnValue?: string;       // value to match in the column
}
```

---

## `FormComponent`

Wraps the Dynamics 365 form runtime. Accessed via `ModelDrivenAppPage.form`.

```typescript
class FormComponent {
  getAttribute(fieldName: string): Promise<string | null>
  setAttribute(fieldName: string, value: string): Promise<void>

  save(): Promise<void>
  isDirty(): Promise<boolean>
  isValid(): Promise<boolean>

  navigateToTab(tabName: string): Promise<void>

  setFieldVisibility(fieldName: string, visible: boolean): Promise<void>
  setFieldDisabled(fieldName: string, disabled: boolean): Promise<void>
  setFieldRequiredLevel(
    fieldName: string,
    level: 'none' | 'recommended' | 'required'
  ): Promise<void>

  execute<T>(
    fn: (formContext: Xrm.FormContext) => T | Promise<T>
  ): Promise<T>
}
```

### `FormComponent.execute()`

Runs arbitrary code in the browser's form context with full access to the Xrm Client API:

```typescript
const value = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_ordernumber')?.getValue()
);
```

See [API testing through form context](api-testing.md) for detailed usage.

---

## `CommandingComponent`

Wraps the model-driven app command bar. Accessed via `ModelDrivenAppPage.commanding`.

```typescript
class CommandingComponent {
  clickButton(ariaLabel: string): Promise<void>
  clickMoreCommands(): Promise<void>
}
```

---

## `CanvasAppPage`

Returned by `AppProvider.getCanvasAppPage()`. Provides the canvas iframe frame locator.

```typescript
class CanvasAppPage {
  getFrame(): FrameLocator
  waitForLoad(controlName?: string): Promise<void>
}
```

---

## `GenUxPage`

Returned by `AppProvider.getGenUxPage()`. Provides interactions with the Power Apps Maker Portal GenUX AI designer for creating, generating, inspecting, and publishing model-driven apps from AI prompts.

```typescript
class GenUxPage {
  readonly previewFrame: FrameLocator  // UCI Preview iframe locator

  // Power Apps navigation
  goToAppsPage(): Promise<void>
  navigateToStartWithPageDesign(): Promise<void>
  createAppWithName(appName: string): Promise<void>
  addNewPage(): Promise<void>

  // AI generation
  waitForUCIPreviewFrameAndFillPrompt(prompt: string): Promise<void>
  waitForUCIPreviewFrameAndSelectTemplate(templateText: string): Promise<void>
  verifyThoughtStreaming(): Promise<void>
  verifyCodeAndPreviewTabsAvailable(): Promise<void>
  verifyCodeStreaming(): Promise<void>

  // Inspection
  clickPreviewTab(): Promise<void>
  clickCodeTab(): Promise<void>
  waitForGeneratedContent(): Promise<void>
  waitForCodeTabContent(): Promise<void>
  getPreviewTabDom(): Promise<string>
  getCodeTabContent(): Promise<string>

  // Publishing
  publishApp(): Promise<void>
  buildCanvasPlayUrl(): string

  // Form interaction
  submitForm(): Promise<void>
  waitForSubmitSuccess(timeout?: number): Promise<void>

  // App management
  getAppIdFromUrl(): string
  searchAndPlayApp(appName: string, context: BrowserContext): Promise<Page | null>
  deleteAppsMatchingPrefix(prefix: string): Promise<void>
  deleteAppFromAppListIfFound(appName: string): Promise<void>
}
```

### `GenUxPage.previewFrame`

Exposes the `FrameLocator` for the UCI Preview iframe. Use this property to query generated form elements directly:

```typescript
const input = genUxPage.previewFrame.getByRole('textbox', { name: 'First Name' });
await expect(input).toBeVisible();
```

### `GenUxPage.verifyThoughtStreaming()`

Checks for transient GenUX streaming indicators, such as thought text, Stop button, and Agent Thoughts. Each check is best-effort - generation might complete before all indicators appear. The only hard assertion is that either streaming is in progress or `"Your page is now generated"` is visible.

### `GenUxPage.searchAndPlayApp()`

Returns `null` when Play is disabled (app isn't yet published) rather than throwing an error. Use `test.skip()` on a `null` return:

```typescript
const appPage = await genUxPage.searchAndPlayApp(appName, context);
if (!appPage) test.skip();
```

---

## Utility functions

Standalone helper functions for common setup and configuration tasks.

### `buildCanvasAppUrlFromEnv`

Reads `CANVAS_APP_URL` from the environment:

```typescript
function buildCanvasAppUrlFromEnv(): string
```

### `getStorageStatePath`

Returns the path to the [Power Apps](https://make.powerapps.com) storage state file for the given email:

```typescript
function getStorageStatePath(email: string): string
// Returns: packages/e2e-tests/.playwright-ms-auth/state-<email>.json
```

### `ConfigHelper`

Provides configuration helpers, such as checking whether the cached storage state expired.

```typescript
class ConfigHelper {
  static checkStorageStateExpiration(
    statePath: string
  ): { expired: boolean; expiresOn?: number }
}
```

---

## Locator utilities

Helper methods for locating Power Apps controls within iframes.

### `LocatorUtils`

Static methods for finding canvas app controls and gallery items by name.

```typescript
class LocatorUtils {
  static getByControlName(frame: FrameLocator, controlName: string): Locator
  static getGalleryItem(frame: FrameLocator, titleText: string): Locator
}
```

---

## Type exports

Export all types from the package root:

```typescript
import {
  AppProvider,
  AppType,
  AppLaunchMode,
  AppLaunchOptions,
  ModelDrivenAppPage,
  GridComponent,
  FormComponent,
  CommandingComponent,
  CanvasAppPage,
  GenUxPage,
  buildCanvasAppUrlFromEnv,
  getStorageStatePath,
  ConfigHelper,
  LocatorUtils,
} from 'power-platform-playwright-toolkit';
```

## Next steps

- [Environment variables](environment-variables.md)
- [Configuration reference](configuration.md)
- [Sample tests](samples.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [API testing through form context](api-testing.md)
