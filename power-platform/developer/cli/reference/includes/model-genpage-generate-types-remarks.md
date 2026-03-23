### Examples

Generate TypeScript types for the `account` and `contact` tables and write them to `./src/RuntimeTypes.ts`:

```bash
pac model genpage generate-types \
  --data-sources "account,contact" \
  --output-file ./src/RuntimeTypes.ts
```

Generate types for a single table into a specific output directory:

```bash
pac model genpage generate-types \
  --data-sources "opportunity" \
  --output-file ./pages/opportunity/RuntimeTypes.ts
```

> [!NOTE]
> Always run `generate-types` before writing page code that queries Dataverse tables.
> The generated file contains strongly-typed column names, foreign key fields, and enum values
> for each table. Relying on the generated types prevents runtime errors caused by
> misspelled or non-existent column names.
