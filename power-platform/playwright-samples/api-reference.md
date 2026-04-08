---
title: API reference for Power Platform Playwright Samples
description: Reference documentation for all classes, methods, and types exported by the power-platform-playwright-toolkit package.
author: microsoft
ms.author: deepak.kamboj
ms.topic: reference
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# API reference

This article documents the public API of the `power-platform-playwright-toolkit` package.

## AppProvider

Entry point for launching Power Platform apps. Instantiate once per test, then call `launch()`.

```typescript
class AppProvider {
  constructor(page: Page, context: BrowserContext)

  launch(options: AppLaunchOptions): Promise<void>
  getModelDrivenAppPage(): ModelDrivenAppPage
  getCanvasAppPage(): CanvasAppPage
}
```

### AppLaunchOptions

```typescript
interface AppLaunchOptions {
  app: string;                  // Display name of the app
  type: AppType;                // Canvas | ModelDriven
  mode: AppLaunchMode;          // Play | Edit
  skipMakerPortal?: boolean;    // true: use directUrl, skip maker portal navigation
  directUrl?: string;           // Full URL when skipMakerPortal is true
}
```

### AppType

```typescript
enum AppType {
  Canvas = 'canvas',
  ModelDriven = 'model-driven',
}
```

### AppLaunchMode

```typescript
enum AppLaunchMode {
  Play = 'play',
  Edit = 'edit',
}
```

---

## ModelDrivenAppPage

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

## GridComponent

Wraps the ag-Grid used in model-driven list views. Accessed via `ModelDrivenAppPage.grid`.

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

### OpenRecordOptions

```typescript
interface OpenRecordOptions {
  rowNumber?: number;         // 0-based row index
  columnName?: string;        // column to match (display name or schema name)
  columnValue?: string;       // value to match in the column
}
```

---

## FormComponent

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

### execute()

Runs arbitrary code in the browser's form context with full access to the Xrm Client API:

```typescript
const value = await mda.form.execute(
  (ctx) => ctx.getAttribute('nwind_ordernumber')?.getValue()
);
```

See [API testing through form context](api-testing.md) for detailed usage.

---

## CommandingComponent

Wraps the model-driven app command bar. Accessed via `ModelDrivenAppPage.commanding`.

```typescript
class CommandingComponent {
  clickButton(ariaLabel: string): Promise<void>
  clickMoreCommands(): Promise<void>
}
```

---

## CanvasAppPage

Returned by `AppProvider.getCanvasAppPage()`. Provides the canvas iframe frame locator.

```typescript
class CanvasAppPage {
  getFrame(): FrameLocator
  waitForLoad(controlName?: string): Promise<void>
}
```

---

## Utility functions

### buildCanvasAppUrlFromEnv

Reads `CANVAS_APP_URL` from the environment:

```typescript
function buildCanvasAppUrlFromEnv(): string
```

### getStorageStatePath

Returns the path to the Maker Portal storage state file for the given email:

```typescript
function getStorageStatePath(email: string): string
// Returns: packages/e2e-tests/.playwright-ms-auth/state-<email>.json
```

### ConfigHelper

```typescript
class ConfigHelper {
  static checkStorageStateExpiration(
    statePath: string
  ): { expired: boolean; expiresOn?: number }
}
```

---

## Locator utilities

### LocatorUtils

```typescript
class LocatorUtils {
  static getByControlName(frame: FrameLocator, controlName: string): Locator
  static getGalleryItem(frame: FrameLocator, titleText: string): Locator
}
```

---

## Type exports

All types are exported from the package root:

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
