# Power Fx formula reference sync

Leverage. It's why we have Power Fx. It started with leverage of existing Excel formula knowledge to Power Apps, which has grown to leverage of existing Power Apps formula knowledge to Copilot Studio, Dataverse, Power Automate, Prompt Builder, and beyond.

This leverage is dependent on consistency. The same functions and operators work the same way no matter which Power Fx host you are using. And there is no better way to ensure consistency then to have one single doc set for all products. You have landed in the home of those docs.

But to make this work, the docs need to reflect the reality in the products. Each product can choose which set of functions and signals are included and can contribute their own. The files and scripts in this directory help us do this.

## Contents

### validate.ps1

This script runs as part of the doc build process for each PR that touches a file in the Power Fx directory. It must pass or the PR cannot be merged. This script does not modify any files, it is purely read only.

It checks for:
- Consistency between the reference/include/* files and the .json and .json.errata files in this directory.
- Consistency between the formula-reference-* files and the reference/* files augmented with .md.errata files.
- Consistency between the TOC.yml and formula-reference-* files.

### add-update-appliesto.ps1

Run this script after updating the .json or .errata files in this directory. It doesn't verify, it makes things right.

It will:
- Apply updates to the "Applies to:" in each of the reference/include/* files.
- Update the TOC.yml to use the same links that are in formula-reference-* files

### hostmap.ps1

This file provides the human product name to file name map, for example "Power Platform CLI" to "pac-cli". Each new product will need a mapping pair placed in this file.

It also contains common setup code and functions for the other scripts.

### *.json files

This is the manifest of the functions and other formula elements that are offered by each of the products. This is a copy from the product's source repo, updated here when the product team is ready to update the docs.

See below for sample code to test that the .json file is being kept in sync.

### *.errata files

For each .json and .md file, there can be also be an .errata file with overrides. For example, perhaps the product still offers a function but it has been deprecated and the product team no longer wants it to be advertised in the docs, yet it can't be yanked from the product quite yet. It can be turned off in the docs here.

For .json files, use a line starting with `+` to add a function name, and use a line starting with `-` to remove a function name.

In addition for .md files, use `> AllProducts` to add a formula element for all products that isn't in the title of the article. This will be rare, see Operators.md.errata for an example.

Please include a comment, a line starting with `#`, for each entry to so we can understand why the override was put in place and what should happen next with it.

### formula-reference-*.md files

This is the per product TOC with explanations that are product specific. It provides short one line descriptions. This is one of the most used articles in the Power Apps docs.

### reference/*.md files

These are the articles for each formula element offered by Power Fx. Groups of functions that are similar or work together are included in the same article, for example Left, Right, and Mid are together, as are Group and UnGroup.

### reference/includes/*-applies-to.md files

These contain the "Applies to" block for each article in the reference directory. This is broken out for two reasons:
- It is more common for "Applies to" than the article itself, for example when a product starts using or updates their Power Fx version. This helps us to more easily see when the article itself has been changed.
- Avoids the doc build system worrying about the structure and readability of these files.

In a given article, if all the formula elements are covered by the same set of products, then only one "Applies to:" section will be added. If the some products offer some of the elements, but not others, a small applies to table will be used to split them out.

### TOC.yml

This is the master table of contents that appears in the left hand navigation pane when reading the docs. 

It is a superset of *all* the Power Fx products; no one product will use them all and that's OK. The "Applies to:" at the top of each article clarifies which elements are used where. The per product formula-reference-*.md files, with short descriptions, provides a per product manifest.

## Step 1: Product 

## Step 2: 

## Sample code for keeping the .json file up to date

Run this code, properly modified, to ensure the .json file in the product's source repo is consistent with the formula elements actually offered in the product.

```csharp
using FluentAssertions;
using FluentAssertions.Json;

using Microsoft.PowerFx;
using Microsoft.PowerFx.Types;

using Newtonsoft.Json;

using Xunit;

namespace Microsoft.YourPowerProduct.UnitTests.PowerFx;

// Documentation team needs to know which Power Fx functions are actually supported.
// These are listed in the PowerFxFunctions.json file, which is then provided to docs team.
// This test ensures that file is actually consistent with the current implementation. 
public class PowerFxDocumentationTests
{
    [Fact]
    public void TestDocumentation()
    {
        // Get same engine that we use during actual eval. 
        Engine engine = new PowerFxEvalService(null).Engine;

        var engineDoc = new EngineDocumentation()
        {
            FunctionNames = engine.GetAllFunctionNames().OrderBy(x => x).ToArray(),

            MinVersion = RecalcEngine.AssemblyVersion,

            // This is where we can describe any additional objects that your project may inject into
            // expressions global scope. Like PowerApps "Host"  or MCS's "Env". 
            HostObjects = new string[]
            {                    
            }
        };

        string expectedJson = JsonConvert.SerializeObject(engineDoc, Formatting.Indented);

        // If this test fails, then PowerFX has probably added a new function
        // If this is the case, just update the json file
        // If some function was removed, then this should be considered as breaking changes and we should reach out to Power Fx folks.

        // If there are functions that are missing, they may need to be enabled on the configuration. Reach out to Power Fx folks for how to do that. 

        string actualJson = new StreamReader(
                typeof(PowerFxDocumentationTests).Assembly.GetManifestResourceStream("Microsoft.YourPowerProduct.UnitTests.PowerFx.PowerFxFunctions.json")).ReadToEnd().Trim();

        Assert.Equal(expectedJson, actualJson);
    }
}
```
