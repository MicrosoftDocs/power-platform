---
title: Create and manage masking rules (preview)
description: Learn how to create and manage masking rules in Microsoft Power Apps.
ms.component: pa-admin
ms.date: 02/20/2025
ms.topic: overview
ms.custom: "admin-security"
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - srpoduri
---
 
# Create and manage masking rules (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Data masking helps protect sensitive information during customer interactions and prevents data leaks. Data masking, also known as de-identification or obfuscation, replaces sensitive data with masked strings. The masked strings ensure that the original, unmasked values remain hidden. Only authorized users can read the unmasked values—one record at a time. In the context of customer interactions, frontline support users are prevented from exposing sensitive information like credit card numbers, social security numbers, or any personal data.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## How does masking work?

- You create *masking rules* to set how sensitive information should be masked.

- These rules use *regular expressions* to identify specific patterns, for example a credit card number, social security number, and email address.

- These patterns are detected and the sensitive fields are replaced with masked characters when the row is retrieved. 

## Create masking rules

Get a predefined set of masking rules, to start, or you can create your own.

1. Create a solution: [Create a solution in Power Apps](/power-apps/maker/data-platform/create-solution).

1. Create a new component: [Create components in a solution](/power-apps/maker/data-platform/create-solution#create-components-in-a-solution).

1. Select the **Security** menu option and choose **Secured masking rule**.  

   :::image type="content" source="media/create-and-manage-masking-rules/security-masking-rule-menu.png " alt-text="Screenshot showing the location of the Secured masking rule button in Power Apps.":::

   The **New Masking Rule** form appears.

1. In this form, enter a rule **Name** in this format: `prefix_name` where `prefix` can be `CLS_` or `New_`.

   :::image type="content" source="media/create-and-manage-masking-rules/new-masking-rule-form.png" alt-text="Screenshot that shows the New masking rule form and some example field values." lightbox="media/create-and-manage-masking-rules/new-masking-rule-form.png":::

1. Enter a **Display Name** and **Description**.

1. Enter a **Regular Expression**, chosen from the [Regular Expression Language](/dotnet/standard/base-types/regular-expression-language-quick-reference).  

   For example, to mask the first five digits of a social security number, use: `\d(?=\d{2}-\d{2}-\d{4}|\d-\d{2}-\d{4}|-\d{2}-\d{4}|\d-\d{4}|-\d{4})`

   > [!NOTE]
   > Your regular expression can have multiple masking rules separated by a pipe `|`.
   >
   > **Example**: `\d(?=\d{2}-\d{2}-\d{4}|\d-\d{2}-\d{4}|-\d{2}-\d{4}|\d-\d{4}|-\d{4})| \S+@\S+\.\S+|[STFGM]\d{4}|(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})`

1. Enter a **Masked Character**, for example `#`.

1. Enter an original value in the **Enter Plain Text Test Data** field, such as a social security number, or email address.

1. Enter an original value in the **Enter Rich Text Test Data** field, such as a social security number, or email address (for testing Text Data type with Rich text format columns).

    > [!NOTE]
    > For **Rich text** field, the raw value of the field needs to be taken into account when defining the **Regular Expression**. You can view the raw value using a Web API to query the table/column with rich text. For example, 
    > `https://<org url>/api/data/v9.2/maskingrules(<id>)?$select=richtestdata`
    >
    > (result)
    >
    > "richtestdata": "<div class=\"ck-content\" data-wrapper=\"true\" dir=\"ltr\" style=\"--ck-image-style-spacing: 1.5em; --ck-inline-image-style-spacing: calc(var(--ck-image-style-spacing) / 2); --ck-color-selector-caption-background: hsl(0, 0%, 97%); --ck-color-selector-caption-text: hsl(0, 0%, 20%); font-family: Segoe UI; font-size: 11pt;\"><p style=\"margin: 0;\">123-45-789<//p><//div>"
>

1. Select **Save**.

   **Masked Plain Text test data**, and **Masked Rich Text test data** display on the screen.

   Your masked values might be masked like this:

    |Regular expression | Original values         | Masked values         |
    |---------|-----------------------------------|-----------------------|
    | `\d(?=\d{2}-\d{2}-\d{4}|\d-\d{2}-\d{4}|-\d{2}-\d{4}|\d-\d{4}|-\d{4})`| **SSN** `123-45-6789` | **SSN** `###-##-6789` |
    |`[STFGM]\d{4}` | **AccountNbr** `S1234567z` | **AccountNbr** `#567z` |
    | `(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})` | **MasterCard** `5678912345678912` | **MasterCard** `#` |
    | `(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})` | **Visa** `4567891234567891` | **Visa** `#` |
    | `\S+@\S+\.\S+` | **Email** `name@sample.com` | **Email** `#` |

     When a customer sends you an email with sensitive data and the email has this masking rule, only the masked values display in the body of the email:

     :::image type="content" source="media/create-and-manage-masking-rules/masking-rule-applied.png" alt-text="Screensot showing the result of applying the masking rule in the body of the email.":::

## Manage masking rules

### Get the list of masking rules

1. Go to the [Power Apps portal](https://make.powerapps.com).

1. Select the environment where you want to display the list of masking rules.

1. Select **Tables** and choose the **All** filter.

1. Enter *masking rule* in the search bar.

1. Select the line Table **Masking Rule** with Name **maskingrule**.

   A list of masking rules is displayed. You can expand the list by selecting the **+ more** dropdown.

### Add a masking rule to a secured column

1. Go to the [Power Apps portal](https://make.powerapps.com).

1. Select the environment where you want to add a masking rule to a column.

1. Select **Tables** from the navigation menu and choose your preferred table with a secured column.

1. Select **Columns** under the **Schema** section.

   :::image type="content" source="media/create-and-manage-masking-rules/select-columns-schema.png" alt-text="Screenshot that shows the location of the Columns option under the Schema section." lightbox="media/create-and-manage-masking-rules/select-columns-schema.png":::

1. Select a column to open and edit it. The **Edit column** pane displays.

1. Expand **Advanced options**.

   1. Check **Enable column security** if the box isn't checked.

   1. Select the **Masking rule** dropdown.

   1. Select a masking rule.

   :::image type="content" source="media/create-and-manage-masking-rules/select-masking-rule.png" alt-text="Screenshot showing the components that need to be selected in the Edit column pane." lightbox="media/create-and-manage-masking-rules/select-masking-rule.png":::

1. Select **Save**.

> [!NOTE]
> Data types for masking rules: 
> 1. Text (single-line and multi-line).
> 1. Number.

### Grant permissions to a secured column with a masking rule

Permissions to read masked fields are granted using the [Column security profiles](/power-platform/admin/set-up-security-permissions-field#associate-security-profiles-and-set-permissions).

Users or Teams groups can be granted access through column security:

:::image type="content" source="media/create-and-manage-masking-rules/edit-column-security.png" alt-text="Screenshot that shows the Edit column security panel where you can set permissions to users or Teams groups.":::

- **Read**

  **Allowed**: Read secured column is allowed. Masked values are shown if masking rule is applied to the column.

- **Read unmasked**

  **Not Allowed**: When **Read** is allowed and **Read unmasked** isn't allowed, masked values are shown.

  **One Record**: Users are allowed to read unmasked values. Unmasked values are only returned when you request one record at a time. These values should be allowed for users who manage and maintain secured columns.

  **All records**: Users are allowed to retrieve and read multiple records with unmasked values. This setting is highly privileged. **Read unmasked** should only be allowed for backend services that require unmasked values for backend processing.

- **Update**
  
  **Allowed**: Users are allowed to update records.

- **Create**

  **Allowed**: Users are allowed to create records.
  
> [!NOTE]
> System and application users with **Read** and **Read unmasked** permissions get masked values by default. To read unmasked values, go to [options for viewing masked fields](#options-for-viewing-masked-fields).

### View all columns that have a masking rule

You can get a list of all secured columns from all tables with masking rules.

1. Go to the [Power Apps portal](https://make.powerapps.com).

1. Select the environment where you want to view all the columns with masking rule.

1. Select **Tables** and choose the **All** filter.

1. Enter *attributemaskingrule* in the search bar.

1. Select the **AttributMaskingRule** table.

   A list of columns with masking rules is displayed. You can expand the list by selecting the **+ more** dropdown.

### How are masked fields displayed?

If you have permission to **Read** unmasked fields, you see masked values by default here:

| **Field type** | **Masked columns returned with masked values?** |
|----------------|-------------------------------------------------|
| Grid           | Always                                          |
| Form           | Always                                          |
| Copilot        | Always                                          |
| Excel report   | Always                                          |

> [!NOTE]
> Audit log shows unmasked values in the before-and-after update events. Grant reading audit logs to only authorized users.

### Options for viewing masked fields

> [!NOTE]
> These options are available during preview.

Permission to read unmasked values is required. You can read unmasked values in a record.

In these examples, replace `<url>`, `<table collection name>`, and `<recordid>` with your own values.

- Example for all masked columns in a record:

  `https://<url>/api/data/v9.1/<table collection name>(<recordid>)?UnMaskedData=true`

- Example for individual masked columns:

  Replace `<column_name>` with your secured column name.

  `https://<url>/api/data/v9.1/<table collection name>(<recordid>)?$select=<column_name>&UnMaskedData=true`

## Known limitations

- **Reading unmasked values on the form**

  Masked values are displayed on the detail/main form. In future releases, there should be a button to allow users who have the *Read unmasked* permission to read the unmasked values.

- **Creating and updating unmasked values on the form**

  When you create a new record, you enter the sensitive field as unmasked values. After you save, the form automatically refreshes, and the sensitive field is immediately masked. You can update the field but make sure that you enter the unmasked values.

- **Audit log**

  Unmasked values are displayed in the audit log. In future releases, these are masked with option to read unmasked for users who have **Read unmasked** permission.
