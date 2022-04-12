# Microsoft Power Fx in Power Virtual Agent 

We are excited to announce the availability of Microsoft Power Fx in Power Virtual Agent (PVA) Technology Preview release.

Power Fx is a low-code language that makers can work with directly in an Excel-like formula bar. For example, you can use Power Fx to create complex bot logic using formulas to manipulate data, such as setting the value of variables, parsing the string, or using expressions in conditionals.

For more information, see [Power Fx overview](https://docs.microsoft.com/en-us/power-platform/power-fx/overview) and [formula reference](https://aka.ms/pfx-reference) documentation.

# **Use Power Fx expression in a topic**

In this exercise, we will prompt the user for their name and then use Power Fx to convert the name to uppercase.

Create a new topic and in your bot as shown below:

A new topic is created with a single **Trigger Phrases** node as shown below:

![Chart Description automatically generated with medium confidence](media/advanced-power-fx/image2.png)

Click on the ellipses and choose **Edit trigger** **phrases** as shown below:

In the **Trigger phrases** (0) pane, type *What's up?* in the**Add phrases** textbox and press enter.

Your **Trigger Phrases** node should look like the following:

![Chart Description automatically generated](media/advanced-power-fx/image5.png)

Next, create **Ask a question** node by clicking on the (**+**) sign as shown below:

Next select **Ask a question** as shown below**:**

A new question node is created as shown below:

![Graphical user interface  text  application  email Description automatically generated](media/advanced-power-fx/image8.png)

In this node for **Enter a response***,* type*What is your name?*

To select a data type, click (**&gt;**) in the **Identify** box. Select **Person name** for the data type.

Then, create a variable to store the user's response. Click on (**&gt;**) in **Save response as** box and click on **Create a new variable**.

After you are done, the **Question** node should look like the following:

Add a new node under the **Question** node you just worked on by clicking on (**+**) icon as shown below:

From the given choices select **Set a property** as shown below:

You should end up with a node that looks like this:

![Graphical user interface  text  application Description automatically generated](media/advanced-power-fx/image14.png)

The above node is used to convert the user's name to uppercase. Here we'll use Power Fx's *Upper* and*Text* functions to convert the value stored in Var1 and store the new value in Var2.

Click on (**&gt;**) arrow in the **Set variable** box, then choose **Create a new variable** as shown below:

Your node should look like the following:

![Graphical user interface  text  application  email Description automatically generated](media/advanced-power-fx/image16.png)

Next, enter the formula in the **To value** text box by clicking on the arrow on the right side. Convert the username to uppercase by using **Upper** and **Text** functions as shown below.

Click **Insert**.

Next, add a new **Send a message** node after the **Set Variable Value** node. Enter the text and variable shown below.

Your **Send a message** node should look like the following:

Save your topic.

When you test your bot using the trigger phrase, it should prompt you to enter a name and then display that name using all caps.

# **Using Power Fx expressions in Conditions**

Create a new topic and in your bot as shown below:

A new topic is created with a single **Trigger Phrases** node as shown below:

![Chart Description automatically generated with medium confidence](media/advanced-power-fx/image2.png)

Click on the ellipses and choose **Edit trigger** **phrases** as shown below:

In the **Trigger phrases** (0) pane, type *Reservation* in the**Add phrases** textbox and press enter.

Your **Trigger Phrases** node should look like the following:

Next, create **Ask a question** node by clicking on the (**+**) sign as shown below:

Next select **Ask a question** as shown below**:**

You'll end up with a Question node as shown below:

![Graphical user interface  text  application  email Description automatically generated](media/advanced-power-fx/image24.png)

In the **Question** node, type a prompt for user in the **Enter a response** textbox as shown below:

Next, click the arrow in the **Identify** box, select **Date and time** as shown below:

Next, click on the arrow (&gt;) in **Select a variable** box and then click on **Create a new variable** as shown below:

The completed **Question** node looks like the following:

![Graphical user interface  text  application  email Description automatically generated](media/advanced-power-fx/image28.png)

Next create **Add a condition** node using the (**+**) icon.

Two condition nodes are created. The **ConditionItem** node is for when a specific condition is met and the other (**All Other Conditions)** for all other cases.

![Graphical user interface Description automatically generated with low confidence](media/advanced-power-fx/image30.png)

In the **ConditionItem** node, click on the three dots, select **Change to formula** as shown below:

The ConditionItem node should look like the following:

![Graphical user interface  application Description automatically generated](media/advanced-power-fx/image32.png)

Next, to calculate whether a booking qualifies for discount, the booking date must be 14 days in advance. To open formula editor, click on the (**&gt;**) in the **Enter or select a value** box. And in the **Enter formula** pane, type:

Topic.Var1 &gt; (DateAdd (Now(), 14))

Next, click **Insert**.

Save the topic.

Next add two **Send a message** nodes to inform the user about discount as shown below.

Save the topic.

To test the bot, enter *What's up*, answer the question*Are you a member or not?* using**Yes** or **No**. The bot should display appropriate response.

# **Language Generation**

Language Generation (LG) can create a more natural conversation experience by defining multiple variations on a phrase to achieve a coherent personality, tone of voice for your bot. For example, you can use multiple phrases to welcome users as shown in the example below.

# Add Language Generation to your bot

Create a new topic and in your bot as shown below:

A new topic is created with a single **Trigger Phrases** node as shown below:

![Chart Description automatically generated with medium confidence](media/advanced-power-fx/image2.png)

Click on the ellipses and choose **Edit trigger** **phrases** as shown below:

In the **Trigger phrases** (0) pane, type *Pinging bot* in the**Add phrases** textbox and press enter.

Next, click on (**+**) to create to create a **Send a Message** node as shown below:

A new Send a Message node is created as shown below:

![Graphical user interface  application Description automatically generated](media/advanced-power-fx/image37.png)

Next, type *Welcome* in the**Enter a response** box. Press enter. This is the message the bot will send to the user.

Add another message, *Hello*, in the**Enter a response** box. The completed node should look like the following:

![Graphical user interface  text  application Description automatically generated](media/advanced-power-fx/image39.png)

Save the topic.

When you test your bot by typing *Pinging bot*, the bot will randomly select one of the greetings and display it. Test it a few times to see this behavior.

# Add variables to Language Generation

With Language Generation, you can also reference variables in a message. The following steps will show you how to do that.

Click on (**+**) on the **Send a Message** node to create a **Question** node. In the **Question** node type a message, *Hi, what's your name?* Next, in the **Identify** box, click **(&gt;)** arrow, and select **Person name**.

Next, in the **Select a variable** box, click on **(&gt;)** to **Create a new variable** as shown below:

The completed node will look like the following:

![Graphical user interface  text  application Description automatically generated](media/advanced-power-fx/image42.png)

Add a new **Send a Message** node under the **Question** node. Add two messages: *Hello* and*Welcome*.

Put the cursor next to the *Hello* message. Click on the {x} icon above and select the variable that you want to concatenate. For example, in our example we are concatenating Var1 as shown below:

Do the same for the *Welcome* phrase. Your node should look like this:

![Graphical user interface  text  application Description automatically generated](media/advanced-power-fx/image44.png)

Save your work.

When you test your bot, it will now randomly select the phrase and display the value Var1 contains.
