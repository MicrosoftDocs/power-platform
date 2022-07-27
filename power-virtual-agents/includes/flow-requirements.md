> [!IMPORTANT]
> To use flows within Power Virtual Agents, they must meet the following requirements:
>
> - A flow can only be called from a topic located in the same [Microsoft Dataverse environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>
> - Flows must also be in a solution in Power Automate. You can [move flows into solutions](../advanced-flow-create.md#optionally-move-a-flow-to-another-solution) so they're listed in the authoring canvas.
>
> - [Flow values must be returned synchronously to Power Virtual Agents](../advanced-flow-create.md#turn-off-asynchronous-responses-in-the-flow).