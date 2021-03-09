---
title: Microsoft Power Fx YAML Formula Grammar | Microsoft Docs
description: Microsoft Power Fx YAML formula syntax
author: gregli-msft
manager: kvivek
ms.reviewer: nabuthuk
ms.service: power-platform
ms.topic: reference
ms.custom: canvas
ms.date: 02/24/2021
ms.author: gregli
search.audienceType: 
  - maker
search.app: 
  - PowerApps
---

# Power Fx YAML formula grammar

> [!NOTE]
> Microsoft Power Fx is the new name for the formula language for canvas apps. These articles are a work in progress as we extract the language from canvas apps, integrate it with other Microsoft Power Platform products, and make it available as open source. Start with the [Microsoft Power Fx overview](overview.md) for an introduction to the language.

Microsoft Power Fx has a well-established grammar for expressions based on Excel. However, when used in Power Apps and other hosts where UI provides the name-to-expression binding for a formula, there is no standard way of editing the formula binding as text.

We've selected the industry standard [YAML](https://yaml.org/spec/1.2/spec.html) as our language for this binding. There are already a large number of editors, tools, and libraries for working with YAML. This article describes how we represent formulas in YAML.

At this time, we support only a restricted subset of YAML. Only the constructs described in this article are supported.

Not everything that defines a canvas app is represented here; additional information flows through other files that the tool produces and consumes.

## Leading equal sign
<!--note from editor: "Equal sign" rather than "equals sign" is via Writing Style Guide.-->
First and foremost, all expressions must begin with a leading equal sign `=`:

```
Visible: =true
X: =34
Text: |
	="Hello, " &
	"World"
```

We use the `=` in this manner for three reasons:

- It's consistent with Excel, which uses a leading `=` to bind an expression to a cell.<!--note from editor: Via Writing Style Guide, "don't use the possessive form of Microsoft trademarks and product, service, or feature names." -->
- It effectively escapes the formula language's syntax so that YAML doesn't attempt to parse it. Normally, YAML would treat `text: 1:00` as minutes and seconds, converting it to a number. By inserting an `=`, YAML won't use its implicit typing rules and formulas won't be harmed.<!--note from editor: Is this what you meant?--> Using `=` covers most cases, but not all, and those exceptions are described in the following section, [Single-line formulas](#single-line-formulas).
- In the future, we can support both formulas (starts with `=`) and non-formulas (no `=`) in the same file, just as Excel does.<!--note from editor: I'm not sure what this means. Should this be "In the future, we'll support both..."? And if so, can you make a note somewhere to revisit this paragraph when the feature is released?--> We can do this in YAML and non-YAML files alike across Microsoft Power Platform source files. Anywhere a formula is supported, the leading `=` differentiates a Power Apps formula expression from a static scalar value.

## Single-line formulas

Single-line formulas are written in the form:

*Name* `:` `SPACE` `=` *Expression*

The space between the colon and the equal sign is required to be YAML-compliant. The equal sign disrupts YAML's normal interpretation of the expression, allowing the rest of the line to be interpreted as Power Fx.<!--note from editor: Edit okay?--> 

For example:

```
Text1: ="Hello, World"
Text2: ="Hello " & ", " & "World"
Number1: =34
Boolean1: =true
Time1: =1:34
```

The number sign `#` and colon `:` aren't allowed anywhere in single-line formulas, even if they're in a quoted text string or identifier name. To use a number sign or colon, you must express the formula as a multiline formula. The number sign is interpreted as a comment in YAML, and the colon is interpreted as a new name map in YAML. To add a comment to a single-line comment, use the Power Fx<!--note from editor: Edit okay?--> line comment starting with `//`.

Using normal YAML escaping with single quotes and C-like backslashes isn't supported; use a multiline formula instead. This is for consistency and to facilitate cut/paste between the formula bar in Power Apps Studio and YAML source files.<!--note from editor: Edits suggested. I didn't know what "If these would be required" meant here. Also, what did "We do this" mean.-->

See the canvas apps [operators and identifiers](https://docs.microsoft.com/powerapps/maker/canvas-apps/functions/operators) documentation for details on allowed names and the structure of an expression.

## Multiline formulas
<!--note from editor: Our style guide says "multiline" is one of the "multi-" words that doesn't need a hyphen (along with multilingual).-->
Formulas can span multiple lines by using YAML's block scalar indicators:  

*Name* `:` `SPACE` ( `|` or `|+` or `|-` )
&emsp;`=` *Expression-Line*
&emsp;*Expression-Line*
&emsp;...

All lines that are a part of the block must be indented at least one space in from the level of the first line.

For example:

```
Text1: |
    ="Hello, World"
Text2: |
    ="Hello" &
    "," &
    "World"
```

All forms of YAML multiline scalar notations are accepted on import, including `>+`, for example. However, to ensure that whitespace is properly preserved, only `|`, `|+`, or `|-` are produced.

## Component instance

Components are instanced by using YAML object notation. The type of the object is established with the `As` operator as a part of the left-side<!--note from editor: Via Writing Style Guide, don't use "left-hand".--> YAML tag. For container controls, objects can be nested.

*Name*&emsp;`As`&emsp;*Component-Type*&emsp;[ `.`&emsp;*Component-Template* ]&emsp;`:`
&emsp;( *Single-Line-Formula* or *Multi-Line-Formula* or *Object-instance* )
&emsp;...

All lines that are a part of the block must be indented at least one space in from the level of the first line.

For example:

```
Gallery1 As Gallery.horizontalGallery:
    Fill: = Color.White
    Label1 As Label:
        Text: ="Hello, World"
        X: =20
        Y: =40
        Fill: |
            =If( Lower( Left( Self.Text, 6 ) ) = "error:",
                Color.Red,
                Color.Black
            ) 
```

*Component-Type* can be any canvas component or control. Base types, such as *Number*, aren't supported.

*Component-Template* is an optional specifier for components that have different templates, such as the Gallery. Not all components have templates.

If *Name* contains special characters and is wrapped with single quotation marks, the entire phrase to the left side of the colon will need to be escaped. This can be done in one of the following ways: 

- Use single quotation marks to wrap the entire left side, which requires that the existing single quotation marks be used twice:
    ```
    '''A name with a space'' As Gallery':
    ```
- Use double quotation marks to wrap the entire left side, but be sure that there are no double quotation marks in the name:
    ```
    "'A name with a space' As Gallery":
    ```

## Component definition

Similarly, components are defined by creating an instance of one of the supported base types. The base types can't be instanced directly. Within an object definition, properties can be added to what the base type provides.

The supported base types are: CanvasComponent

### Simple property definition

Components use properties to communicate with the app in which they're hosted.

*Name* `:` ( *Single-Line-Expression* or *Multi-Line-Expression* )

The type of the formula is implied by the type of the expression.

For input properties, the expression provides the default to be inserted into the app when the component is instanced. The maker can modify this expression as they see fit, but can't change the type.

For output properties, the expression provides the calculation to be performed. The maker can't modify this expression, it's encapsulated in the component. 

At this time, all properties are data flow only and can't contain side effects.

At this time, additional metadata about the property isn't defined here but is instead defined<!--note from editor: Edit okay?--> in the other files of the `.msapp` file, for example the property's description. 

For example:

```
DateRangePicker As CanvasComponent:
    DefaultStart: |-
		=// input property, customizable default for the component instance
		Now()                      
    DefaultEnd: |-
		=// input property, customizable default for the component instance
		DateAdd( Now(), 1, Days )    
    SelectedStart: =DatePicker1.SelectedDate   // output property
    SelectedEnd: =DatePicker2.SelectedDate     // output property
```

## YAML compatibility 

### YAML comments

YAML line comments delimited by the number sign `#` aren't preserved anywhere in the source format. Instead, within a formula, delimit line comments with `//` characters or block comments with `/*` and `*/`. More information: [Comments](expression-grammar.md#comments)<!--note from editor: Suggested.-->

### Errors for common pitfalls

There are a few places where the Power Fx<!--note from editor: Edit okay?--> and YAML grammars are incompatible or might be confusing for a user. In these cases, an error is thrown.<!--note from editor: Passive voice is okay sometimes, especially if it helps avoid using "we" (which the style guide wants us to avoid).-->

For example, in the following:

```
Text: ="Hello #PowerApps"
Record: ={ a: 1, b: 2 }
```

the number sign `#` is treated as a comment by YAML, even though it's embedded in what Excel considers a text string (wrapped by double quotation marks). To avoid confusion, this case will throw an error during import. A YAML multiline form can be used instead.

In the case of the value for `record`, YAML considers `a:` and `b:` to be another name map binding. YAML allows the same name map to be reused, with the last one silently overriding any previous definitions. Because this can be confusing for a low-code maker and can result in the loss of a property formula, an error is thrown if the same name is encountered twice.<!--note from editor: Edits in these last two paragraphs okay? I was confused by the sequence of the sentences here.-->
