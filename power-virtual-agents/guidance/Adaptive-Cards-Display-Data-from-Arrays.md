---
title: "Display Data from Arrays in Adaptive Cards"
description: "Guidance on displaying arrays in Adaptive Card in Power Virtual Agents."
author: nesrivastavaMS
ms.date: 10/18/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: nesrivastava
ms.reviewer: iawilt
---

# Display data from arrays in Adaptive Cards

Adaptive Cards are a versatile tool that can be used to create interactive and engaging conversations in Power Virtual Agents. In this document, you learn how to display array items in Adaptive Cards in Power Virtual Agents. We use a hard-coded example for simplicity, but in a real-life scenario, you would likely get the data from a more dynamic source like a SharePoint list etc. by using Power Automate.

Let’s say that you have a list of tasks in an array, and you want to show the list of tasks in the bot.

![Finaloutput](./media/AdaptiveCard/EMPtask.png)

## Initialize a variable with the task list

1. Select **Add node (+)** to add a node, and then select **Set a variable value**.
1. Select the box under **Set variable**, and then select **Create a new variable**.
1. Name your variable something meaningful, such as *EmployeeTaskList*.

   ![Var](./media/AdaptiveCard/TaskTable.png)

1. Paste the following JSON Data into **Value**:

    ```json
    {
        "employeeName": "Alice",
        "employeeID": "E12345",
        "employeeDepartment": "HR",
        "employeeTasks": [
            {
                "taskID": "T001",
                "taskDescription": "Review employee benefits",
                "dueDate": "2023-10-15"
            },
            {
                "taskID": "T002",
                "taskDescription": "Conduct new hire orientation",
                "dueDate": "2023-09-30"
            },
            {
                "taskID": "T003",
                "taskDescription": "Update HR policies",
                "dueDate": "2023-11-05"
            }
        ]
    }
    ```

## Parse the JSON data into a table

1. Use the **Parse value** node to convert the JSON string into table.
1. Copy and paste the same JSON into the **From sample data** section of the **Data type** settings. The sample data automatically generates the schema and datatype.
1. Save the parsed table as a variable, which you can reference later. For example, save it as a variable named *TaskTable*.

![Task Table](./media/AdaptiveCard/TaskTable.png)

## Display the data in an Adaptive Card

1. To display the data in an Adaptive Card, add a **Question** node.
1. From the dropdown, add the Adaptive Card to your topic.
1. Paste the following JSON code.

    ```json
    
    {
      type: "AdaptiveCard",
      version: "1.5",
      body: [
        {
          type: "TextBlock",
          text: "Employee Information",
          weight: "bolder",
          size: "large"
        },
        {
          type: "TextBlock",
          text: "Employee Name: " & Topic.TaskTable.employeeName,
          separator: true
        },
        {
          type: "TextBlock",
          text: "Employee ID: " & Topic.TaskTable.employeeID,
          separator: true
        },
        {
          type: "TextBlock",
          text: "Department: " & Topic.TaskTable.employeeDepartment,
          separator: true
        },
        {
          type: "TextBlock",
          text: "Tasks",
          weight: "bolder",
          size: "medium",
          separator: true
        },
        {
          type: "Container",
          items: 
            ForAll(Topic.TaskTable.employeeTasks,
              {
                type: "TextBlock",
                text: "- Task ID: " & taskID & ",  Description: " & taskDescription & ", Due Date: " & dueDate ,
                wrap: true
              }
          )
        }
      ]
    }
    ```

    1. Now we can refer the JSON record properties using expressions like "Topic.TaskTable.employeeName."

    1. To display array items in an Adaptive Card, use the **Container** element with the items property.

       The items property accepts an array of elements as its value. Each element in the array is displayed in the Adaptive Card, using the ['ForAll'](/power-platform/power-fx/reference/function-forall) function. Reference the "Topic.TaskTable.employeeTasks" array, as it allows access to each of its properties.

    Paste the YAML code in the code editor view. You can access this option at the top right corner of a new topic.

    ``` yaml
    kind: AdaptiveDialog
    beginDialog:
      kind: OnRecognizedIntent
      id: main
      intent:
        displayName: Untitled
        triggerQueries:
          - array
    
      actions:
        - kind: SetVariable
          id: setVariable_uFs69M
          variable: Topic.EmployeeTasklist
          value: "{     \"employeeName\": \"Alice\",     \"employeeID\": \"E12345\",     \"employeeDepartment\": \"HR\",     \"employeeTasks\": [         {             \"taskID\": \"T001\",             \"taskDescription\": \"Review employee benefits\",             \"dueDate\": \"2023-10-15\"         },         {             \"taskID\": \"T002\",             \"taskDescription\": \"Conduct new hire orientation\",             \"dueDate\": \"2023-09-30\"         },         {             \"taskID\": \"T003\",             \"taskDescription\": \"Update HR policies\",             \"dueDate\": \"2023-11-05\"         }     ] }"
    
        - kind: ParseValue
          id: 58zKdp
          variable: Topic.TaskTable
          valueType:
            kind: Record
            properties:
              employeeDepartment: String
              employeeID: String
              employeeName: String
              employeeTasks:
                type:
                  kind: Table
                  properties:
                    dueDate: String
                    taskDescription: String
                    taskID: String
    
          value: =Topic.EmployeeTasklist
    
        - kind: SendActivity
          id: sendActivity_oNXY1r
          activity:
            attachments:
              - kind: AdaptiveCardTemplate
                cardContent: |-
                  ={
                    type: "AdaptiveCard",
                    version: "1.5",
                    body: [
                      {
                        type: "TextBlock",
                        text: "Employee Information",
                        weight: "bolder",
                        size: "large"
                      },
                      {
                        type: "TextBlock",
                        text: "Employee Name: " & Topic.TaskTable.employeeName,
                        separator: true
                      },
                      {
                        type: "TextBlock",
                        text: "Employee ID: " & Topic.TaskTable.employeeID,
                        separator: true
                      },
                      {
                        type: "TextBlock",
                        text: "Department: " & Topic.TaskTable.employeeDepartment,
                        separator: true
                      },
                      {
                        type: "TextBlock",
                        text: "Tasks",
                        weight: "bolder",
                        size: "medium",
                        separator: true
                      },
                      {
                        type: "Container",
                        items: 
                          ForAll(Topic.TaskTable.employeeTasks,
                            {
                              type: "TextBlock",
                              text: "- Task ID: " & taskID & ",  Description: " & taskDescription & ", Due Date: " & dueDate ,
                              wrap: true
                            }
                        )
                      }
                    ]
                  }
    
    ```

    > [!div class="nextstepaction"]
    > [Add feedback for every response](Adaptive-Card-Add-feedback-for-every-response.md)
