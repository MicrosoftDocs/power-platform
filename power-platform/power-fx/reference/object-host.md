---
title: Host object in Power Apps
description: Reference information including syntax and examples for the Host object in Power Apps.
author: jorisdg
ms.topic: reference
ms.custom: canvas
ms.reviewer: 
ms.date: 02/08/2023
ms.author: jorisde
search.audienceType: 
  - maker
contributors:
  - jorisdg
---
# Host object in Power Apps

The **Host** object in Power Apps provides information about the current host running the app.

## Description

Similar to a control or [the **App** object](object-app.md), the **Host** object provides properties that identify information from the host running the app. Every app has a **Host** object.  

Use this information to debug an app that is operating differently on a specific browser or device.  The strings provided here can be easily shown in the app UI with a **Text label** control or you can log the information to App insights.

> [!NOTE]
> The host object is currently only available in custom pages and canvas apps.


To access the **Host** object, expand the  [**App**](object-app.md) object at the top of the **Tree view** pane and then select it. In this example, the **Host** object doesn't have any properties that accept formulas.

> [!div class="mx-imgBorder"]
> ![The Host object in the Tree view pane.](media/object-host/hostobject.png)

## BrowserUserAgent property

The text property **BrowserUserAgent** contains the complete user agent string that the browser uses to identify itself when running the app

For example, a browser user agent string might be:

- Mozilla/5.0 (Windows NT 10.0; Win64; x64) 
- AppleWebKit/537.36 (KHTML, like Gecko) 
- Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.78`

> [!NOTE]
> If you're running Power Apps in a native app or using the [the wrap](/power-apps/maker/common/wrap/wrap-how-to) feature in Power Apps, the app is presented via a browser control, which supplies a user agent string.


## OSType property

The **OSType** property provides the name of the operating system where the app is running. The **OSType** is determined from the user agent string sent by the browser to Power Apps. The following are examples of common values for **OSType**:

| Value |
| --- |
| Windows |
| macOS |
| iOS |
| Android |
| Linux |
| ... |

> [!NOTE]
> Don't use the **OSType** to change experience or functionality of your app based on the reported operating system.

The **OSType** text can be used in any formula, such as showing it in a label's text property:

```powerapps-dot
Label1.Text: "You're running " & Host.OSType
```

## SessionID property
The **SessionID** property returns the GUID that identifies the current session. This can be useful for troubleshooting purposes.

> [!NOTE]
> In embedded scenarios such as Power Apps in Power BI, the SessionID property returns the underlying Power Apps session ID, not the Power BI session ID.

```powerapps-dot
Label1.Text: $"Provide session ID { Host.SessionID } to your administrator."
```

## TenantID property

The **TenantID** property provides the Globally Unique Identifier (GUID) that specifies the Azure Active Directory (AAD) tenant associated with the presently authenticated user.

> [!NOTE]
> Similar to **SessionID**, in embedded scenarios such as Power Apps in Power BI, the tenant ID is the tenant used for the Power Apps session authentication.

```powerapps-dot
Label1.Text: Host.TenantID
```

## Version property

The **Version** property provides the version identification and version number of the Power Apps player.  Similar to **BrowserUserAget**, more than one version number may be returned, separated by spaces.

The **Version** property will always be an empty string when working in Power Apps Studio.

```powerapps-dot
Label1.Text: Host.Version
```

## Examples

1. Create a new app
1. Add a label control and set the `Text` property to `"Host.BrowserUserAgent: " & Host.BrowserUserAgent`.
1. Add a label control and set the `Text` property to `"Host.OSType: " & Host.OSType`.
1. Add a label control and set the `Text` property to `"Host.SessionID: " & Host.SessionID`.
1. Add a label control and set the `Text` property to `"Host.TenantID: " & Host.TenantID`.
1. Add a label control and set the `Text` property to `"Host.Version: " & Host.Version`.

Running your app in Power Apps Studio on Windows with the Microsoft Edge browser, you will see something similar to (note that Host.Version will always be blank in Power Apps Studio):
```
Host.BrowserUserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.76
Host.OSType: Windows
Host.SessionID: ee2eed1a-8455-4e68-a433-a709302d0c71
Host.TenantID: 5da56e5c-97b6-468f-a448-a6e432c48269
Host.Version: 
```

Running your app in the Power Apps mobile player on iOS, you will see something similar to:

```
Host.BrowserUserAgent: Mozilla/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 PowerApps/e1c23ff9-4822-4e75-a003-01c91407a4d2
Host.OSType: Windows
Host.SessionID: 3ebec22f-ee2e-412a-b3eb-45d97db34863
Host.TenantID: 5da56e5c-97b6-468f-a448-a6e432c48269
Host.Version: PowerApps-Native/3.23084.8(iOS)
```

Running your app in a Firefox web browser on Windows, you will see something similar to:

```
Host.BrowserUserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0
Host.OSType: Windows
Host.SessionID: 283309a4-d88b-4b2a-88de-73b47d1b62d0
Host.TenantID: 5da56e5c-97b6-468f-a448-a6e432c48269
Host.Version: PowerApps-Web/3.23084.6(Windows)
```

Running your app in a web browser on iOS, you will see something similar to:

```
Host.BrowserUserAgent: Mozilla/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1
Host.OSType: iOS
Host.SessionID: a09a946d-ce71-4c1f-bd35-519c79849c8d
Host.TenantID: 5da56e5c-97b6-468f-a448-a6e432c48269
Host.Version: PowerApps-Web/3.23084.6(iOS)
```
