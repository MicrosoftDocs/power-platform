---
title: CoE CLI development adding a new command (Deprecated)
description: Learn how to add a new command to the Center of Excellence command-line interface application.
author: Grant-Archibald-MS
ms.author: grarchib
ms.date: 08/27/2025
ms.update-cycle: 3650-days
ms.subservice: guidance-toolkit
ms.topic: how-to
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---

# CoE CLI development adding a new command (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

To add a new sample command, use the following command to template the initial setup of the TypeScript command and the Jest JavaScript testing framework unit test.

```bash
cd coe-cli
coe cli add -n sample
```

## Connect the command to the command line

Once you have the unit test completed for your new command, perform these tasks:

1. Review [https://www.npmjs.com/package/commander](https://www.npmjs.com/package/commander) on commands, options.

1. Update [commands.ts](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/src/commands/commands.ts) to include a new command or sub command.

   - Import your files at the top of the file.

       ```typescript
       import { SampleArguments, SampleCommand} from './sample';
       ```

   - Add a function for mock injection.

       ```typescript
       createSampleCommand: () => SampleCommand
       ```

   - Create the command in the constructor function.

       ```typescript
       this.createSampleCommand = () => new SampleCommand
       ```

   - Add the function.

       ```typescript
        AddSampleCommand(program: commander.Command) {
            var run = program.command('sample')
                .description('A new sample command')
                .option('-c, --comment <comment>', 'The comment for the command')
                .action(async (options: any) : Promise<void> => {
                    let args = new SampleArguments();
                    args.comment = options.comment;
                    let command = this.createSampleCommand();
                    await command.execute(args)
                });
        }
       ```

   - Register the new command to init function.

       ```typescript
       this.AddSampleCommand(program);
       ```

1. Update [commands.spec.ts](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/test/commands/commands.spec.ts) to include the unit tests.

   - Include a reference to the command.

       ```typescript
       import { SampleCommand } from '../../src/commands/sample'
       ```

   - Add a set of Jest tests.

       ```typescript
       describe('Sample', () => {
           test('Execute', async () => {
               // Arrange
               var commands = new CoeCliCommands();
               let mockSampleCommand = mock<SampleCommand>(); 

               commands.createSampleCommand = () => { return mockSampleCommand }

               mockSampleCommand.execute.mockResolvedValue()
           
               // Act
               await commands.execute(['node', 'commands.spec', 'sample', '-c', 'Some comment'])

               // Assert
               expect(mockSampleCommand.execute).toHaveBeenCalled()
           })
       });
       ```

1. Run the unit tests with the new changes.

   ```bash
   npm run test

   ```

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
