# Theming

A theme can be passed to the `Theme` property of each component. The following is an example of setting a global `AppTheme` variable using the output from the [Fluent UI Theme Designer](https://docs.microsoft.com/en-us/power-platform/guidance/creator-kit/creator-kit-explained#theme-editor-app). This enables centralized app theming.

- `AppTheme` can be referenced by canvas components. 
- `AppThemeJson` can be referenced by code components.

The following Power Fx formula should be run on the app's `OnStart` property, which loads before the user starts interacting with the app components. Replace the value between the `/* THEME OBJECT */` comments with your own theme object.  
```powerapps-dot
Set(
    AppTheme,
    /* START THEME OBJECT */
    {
        palette: {
            themePrimary: "#0078d4",
            themeLighterAlt: "#eff6fc",
            themeLighter: "#deecf9",
            themeLight: "#c7e0f4",
            themeTertiary: "#71afe5",
            themeSecondary: "#2b88d8",
            themeDarkAlt: "#106ebe",
            themeDark: "#005a9e",
            themeDarker: "#004578",
            neutralLighterAlt: "#faf9f8",
            neutralLighter: "#f3f2f1",
            neutralLight: "#edebe9",
            neutralQuaternaryAlt: "#e1dfdd",
            neutralQuaternary: "#d0d0d0",
            neutralTertiaryAlt: "#c8c6c4",
            neutralTertiary: "#a19f9d",
            neutralSecondary: "#605e5c",
            neutralPrimaryAlt: "#3b3a39",
            neutralPrimary:"#323130",
            neutralDark: "#201f1e",
            black: "#000000",
            white: "#ffffff"
        }
    }
    /* END THEME OBJECT */
);
Set(
    AppThemeJson,
    JSON(
        AppTheme,
        JSONFormat.IndentFour
    )
);
```