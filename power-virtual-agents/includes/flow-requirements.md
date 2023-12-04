> [!IMPORTANT]
> To use flows within Microsoft Copilot Studio, they must meet the following requirements:
>
> - A flow can only be called from a topic located in the same [Microsoft Dataverse environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>
> - Flows must also be in a solution in Power Automate. You can [move flows into solutions](../advanced-flow-create.md#optionally-move-the-flow-to-another-solution) so they're available in the authoring canvas.
>
> - [Flow values must be returned synchronously to Microsoft Copilot Studio](../advanced-flow-create.md#turn-off-asynchronous-responses-in-the-flow).
>
> - A cloud flow called from Microsoft Copilot Studio has a 100-second timeout limit to run and return to the chatbot. To be under the 100-second limit, you should optimize the flow logic, queries, and the returned data. If some of the cloud flow logic can continue to run after a result is sent to the chatbot, consider placing these actions after the 'Return value(s) to Microsoft Copilot Studio' step in your cloud flow.
