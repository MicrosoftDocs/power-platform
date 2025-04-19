---
title: EncodeHTML, EncodeUrl, and PlainText functions
description: Reference information including syntax and examples for the EncodeHTML, EncodeUrl, and PlainText functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
  - carlosff
---

# EncodeHTML, EncodeUrl, and PlainText functions
[!INCLUDE[function-encode-decode-applies-to](includes/function-encode-decode-applies-to.md)]



Encodes and decodes strings.

## Description

The **EncodeUrl** function encodes a URL string, replacing certain non-alphanumeric characters with % and a hexadecimal number.

The **EncodeHTML** function encodes a string, replacing certain characters that need to be escaped to appear properly in an HTML context. For example, the characters &lt;, &gt;, and &amp; are replaced by &amp;lt;, &amp;gt;, and &amp;amp;, respectively.

The **PlainText** function removes HTML and XML tags, converting certain tags such as these to an appropriate symbol:

- **&amp;nbsp;**
- **&amp;quot;**

The return value from these functions is the encoded or decoded string. This function doesn't remove all HTML and XML tags.

## Syntax

**EncodeUrl**( _String_ )

- _String_ - Required. URL to be encoded.

**EncodeHTML**( _String_ )

- _String_ - Required. HTML to be encoded.

**PlainText**( _String_ )

- _String_ - Required. String from which HTML and XML tags are stripped.

## Examples

If you show an RSS feed in a text gallery and then set the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of a label in that gallery to **ThisItem.description**, the label might show raw HTML or XML code as in this example:

```html
<p>
  We have done an unusually&nbsp;&quot;deep&quot; globalization and
  localization.
</p>
```

If you set the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of the label to **PlainText(ThisItem.description)**, the text appears as in this example:

```
    We have done an unusually "deep" globalization and localization.
```

With the formula **EncodeHTML(ThisItem.description)**, the HTML tags are encoded so that they show up as text when interpreted as HTML, which can be useful to see the HTML structure:

```
&lt;p&gt;
  We have done an unusually&amp;nbsp;&amp;quot;deep&amp;quot; globalization and
  localization.
&lt;/p&gt;
```

If instead of a label you have an [HTML text control](/power-apps/maker/canvas-apps/controls/control-html-text) in the gallery, and you set the **[HtmlText](/power-apps/maker/canvas-apps/controls/control-html-text)** property of that control to **ThisItem.description** you also see the decoded text, because the HTML text control is interpreting the tags as HTML.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































