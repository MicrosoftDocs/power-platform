## Differences between pac solution clone and export

There are situations where you're unsure when to use `pac solution clone` or `pac solution export` command. You can use one of the commands in the following scenarios:

- Use `pac solution clone` when you need to add new components to the solution.
- Use `pac solution export` when you want to modify the existing content in a solution file but not adding any new components to the solution.

### pac solution clone

The exported solution looks like a Visual Studio project when you export the solution using the `pac solution clone` command. Instead of a `.csproj` (as in Visual Studio), you'll see a `cdsproj` file. The `cdsproj` file has all the components information that is required to build the project. The build output is a solution zip file, which you can import into different environments.

:::image type="content" source="../../media/pac-solution-clone.png" alt-text="Pac solution clone." lightbox="../../media/pac-solution-clone.png":::

The developer doesn't have to unpack the cloned solution because it's rendered in an unpacked format within the src (source) folder.

:::image type="content" source="../../media/pac-solution-unpack.png" alt-text="Pac solution unpack." lightbox="../../media/pac-solution-unpack.png":::

Now, if you want to associate a newly created plug-in with this solution, with the solution unpacked, you can use the `pac solution add-reference` command to update the `.cdsproj` file to add the new plug-in. Then, you can build the project using either `dotnet build` or `msbuild`.

It's recommended to do a build restore first before building the project. A build restore (dotnet build does a restore first automatically) will restore the required .NET libraries to generate a packed solution.

### pac solution export

When you export the solution using `pac solution export` you feel like exporting the solution using the maker portal, and the resulting output is a solution zip file.

:::image type="content" source="../../media/pac-solution-export.png" alt-text="Pac solution export." lightbox="../../media/pac-solution-export.png":::

When you unpack the solution zip file (we don't recommend that you open the zip with standard tools and use the appropriate command from CLI). The resulting directory structure is similar to the structure in `pac solution clone`. The only difference is that you can't add references to this unpacked solution, as it doesn't have the `.cdsproj` project file.

:::image type="content" source="../../media/pac-solution-structure.png" alt-text="Pac solution structure." lightbox="../../media/pac-solution-structure.png":::

You can modify the relevant set of files that you want to update and then proceed with the solution pack, which generates the solution zip file again to facilitate importing the solution into the target environment. The result from the action is a solution zip file with updated contents and an updated timestamp.