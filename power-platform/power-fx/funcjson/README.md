# Power Fx formula reference sync

Leverage. It's why we have Power Fx. It started with leverage of existing Excel formula knowledge to Power Apps, which has grown to leverage of existing Power Apps formula knowledge to Copilot Studio, Dataverse, Power Automate, Prompt Builder, and beyond.

This leverage is dependent on consistency. The same functions and operators work the same way no matter which Power Fx host you are using. And there is no better way to ensure consistency then to have one single doc set for all products. You have landed in the home of those docs.

But to make this work, the docs need to reflect the reality in the products. Each product can choose which set of functions and signals are included and can contribute their own. The files and scripts in this directory help us do this.

## Contents

### Validate.ps1

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

For each .json and .md file, there can be also be an .errata file with overrides. For example, perhaps the product still offers a function but has been deprecated and the product team no longer wants it to be advertised in the docs, yet it can't be yanked from the product quite yet. It can be turned off here.

For .json files, use a line starting with `+` to add a function name, and use a line starting with `-` to remove a function name.

In addition for .md files, use `> AllProducts` to add a function name for all products. This will be rare, see Operators.md.errata for an example.

Please include a comment, a line starting with `#`, for each entry to so we can understand why the override was put in place and what should happen next with it.

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

            // This is where we can describe any additional objects that Prompt Builder may inject into
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
