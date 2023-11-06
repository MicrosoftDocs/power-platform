# Genesys Cloud Integration with PVA

This guide provides supplemental information to the main Genesys documentation for this integration located on [Github](https://github.com/GenesysCloudBlueprints/bot-connector-for-ms-power-virtual-agent])

## Initial Integration

- Ensure that in PVA your Authentication (**Settings** > **Security** and select **Authentication**) is set to **No authentication**
- While the bot connector documentation is for AWS, equilvalent steps are possible in Azure as well. You'll need to modify the 2 Python scripts accordingly.
- Ensure that the DynamoDB table name created matches the one in the bot_sessions.py file.

## Agent Handoff

- Refer to existing [PVA documentation](https://learn.microsoft.com/en-us/dynamics365/customer-service/set-up-multilingual-pva-bot#configure-the-transfer-to-agent-node-by-using-the-escalate-topic) on how to setup in PVA the agent handoff.
- If passing a message to the agent in the transfer
  - Set the message in PVA:
    
    ![PVA Message to Agent](images/agentMessagePVA.png)
  - Include as slot for the Escalate intent in the botconnector API call:
    ```
    {
        "name": "Escalate",
        "slots": {
                   "va_AgentMessage": {
                     "name": "va_AgentMessage",
                     "type": "String"
                }
            }
        }
    ```
  - This will show in Genesys as an output:

    ![Genesys Message to Agent](images/agentMessageGenesys.png)
- If passing any other variable from PVA back to Genesys, follow the same process with "va_{variableName}" as the Slot name

## iFrame setup

- Refer to existing [PVA documentation](https://learn.microsoft.com/en-us/power-virtual-agents/publication-connect-bot-to-web-channels?tabs=preview#add-your-bot-to-your-website) on how to get a URL to your PVA bot. 
  - Copy the iframe src URL, this will be the value to copy into Genesys Cloud
- Follow the [Genesys documentation on how to setup the widget](https://help.mypurecloud.com/articles/set-up-an-interaction-widget-integration/)
  - On step 7, copy your PVA src URL as the **Application URL**