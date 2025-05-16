---
title: "Test Engine Providers Reference"
description: "Comprehensive explanation of providers in Power Apps Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/16/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Understanding Test Engine Providers

Test Engine uses a provider-based architecture that allows it to support testing across different application types. Each provider is optimized for a specific application type, allowing for efficient test automation while providing a consistent testing experience.

## What are Providers?

Providers are specialized modules within Test Engine that handle the specifics of interacting with different application types:

- They abstract the complexity of testing different application technologies
- They provide type-specific implementation of testing actions
- They handle authentication and context appropriately for each application type
- They determine how tests are executed and interpreted

## Provider Types

### Web-based Providers

Web-based providers extend Playwright's browser automation capabilities by adding application-specific abstractions, making it easier to test web applications without dealing with low-level DOM elements.

#### Canvas Application Provider

The Canvas Application Provider (`canvas`) is specialized for testing Power Apps canvas applications:

- **Abstraction Level**: Works with control names as defined in the app maker studio
- **Technology**: Extends Playwright for browser-based automation
- **Key Capabilities**: 
  - Accesses canvas app controls by logical names
  - Handles canvas-specific control types and events
  - Supports gallery control navigation and interaction

**Command Example**:
```powershell
pac test run `
   --provider canvas `
   --test-plan-file testplan.te.yaml `
   --tenant aaaabbbb-0000-cccc-1111-dddd2222eeee `
   --environment-id 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

For detailed information, see [Test Canvas Applications](./canvas-application.md).

#### Model-driven Application Provider

The Model-driven Application Provider (`mda`) is specialized for Dataverse model-driven applications:

- **Abstraction Level**: Works with model-driven application elements like forms, views, and business process flows
- **Technology**: Extends Playwright for browser-based automation
- **Key Capabilities**:
  - Navigates complex model-driven app interfaces
  - Handles form data entry and validation
  - Supports entity record operations

**Command Example**:
```powershell
pac test run `
   --provider mda `
   --test-plan-file testplan.te.yaml `
   --tenant aaaabbbb-0000-cccc-1111-dddd2222eeee `
   --environment-id 00aa00aa-bb11-cc22-dd33-44ee44ee44ee `
   --domain "https://contoso.crm.dynamics.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=entityrecord&etn=account"
```

For detailed information, see [Test Model-driven Applications](./model-driven-application.md).

### API-based Providers

API-based providers interact directly with backend services without necessarily using a browser interface.

#### Power Fx Provider

The Power Fx Provider (`powerfx`) allows direct execution of Power Fx formulas, useful for Dataverse integration testing:

- **Authentication**: Uses OAuth tokens obtained via Azure CLI (`az login`)
- **Technology**: Directly calls Dataverse API endpoints
- **Key Capabilities**:
  - Performs CRUD operations on Dataverse tables
  - Executes business logic without UI interaction
  - Enables focused integration testing

**Command Example**:
```powershell
pac test run `
   --provider powerfx `
   --test-plan-file testplan.te.yaml `
   --tenant aaaabbbb-0000-cccc-1111-dddd2222eeee `
   --environment-id 00aa00aa-bb11-cc22-dd33-44ee44ee44ee `
   --domain "https://contoso.crm.dynamics.com"
```

For detailed information, see [Test Dataverse Extensions](./dataverse.md).

## Technical Implementation

### Architecture

Test Engine's provider architecture follows a layered approach:

1. **Core Engine Layer**: Contains shared functionality across all providers
2. **Provider Layer**: Implements application-specific testing logic
3. **Authentication Layer**: Handles identity and security context
4. **Extension Layer**: Allows custom functionality to be added

### Authentication Flow

Providers use different authentication flows based on their requirements:

- **Web Providers** (Canvas, Model-driven): Use browser-based authentication with storage state
- **API Providers** (Power Fx): Use OAuth tokens from Azure CLI for direct API access

### Dataverse Integration

All providers can benefit from Dataverse integration, which enables:

- Direct table access via Power Fx functions
- Data seeding and cleanup operations
- Verification of backend state changes

To enable Dataverse integration, add the following to your test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
```

See [Dataverse Extensions](./dataverse.md) for more information.

## Choosing the Right Provider

Select a provider based on your application type and testing requirements:

| Application Type | Provider | Best For |
|------------------|----------|----------|
| Canvas apps | canvas | UI testing, control interaction, screen navigation |
| Model-driven apps | mda | Forms, views, business process flows, entity operations |
| Pure Dataverse integration | powerfx | Backend logic, table operations, plugin validation |

## See Also

- [Canvas Applications](./canvas-application.md)
- [Model-driven Applications](./model-driven-application.md)
- [Dataverse Extensions](./dataverse.md)
- [Extensibility](./extensibility.md)
- [Test Engine and Playwright](./playwright.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
