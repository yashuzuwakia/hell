<%@ page import="java.util.*" %>

<!-- This code performs an import of the package java.util. 
We make use of the List and ArrayList from this package. -->

<html>

<body>

<!-- Step 1: Create HTML form -->

<form action="todo-demo.jsp">

Add new item:<input type="text" name="theItem"/>

<input type="submit" value="Submit" />

</form>

<!-- This code creates an HTML form. 
The action will point back to the same JSP. 
So effectively, we are submitting form data back to ourselves. 
This form will read a text input from the user. 
The field is named "theItem". 
We'll read this field later to add it to your list. 
The form also includes a submit button. -->

<br>
Item entered: <%=request.getParameter("theItem") %>
<!-- Step 2: Add new item, to 'TO-DO' list-->

<%
	//get the TO DO items from the session
	List<String> items = (List<String>) session.getAttribute("myToDoList");
	
	/* This section of code access the JSP session object. 
	   The session object is unique for each web user. 
	   We attempt to get the TO DO items from the session. 
	   We make use of the attribute name "myToDoList". 
	   This is basically the key/label to look up data from the session.

       The session.getAttribute method will always return something of type java.lang.Object. 
	   We downcast this to List<String> because we are making use of 
	   strings to keep track of our to do items.

       This is assigned to the variable "items". 
       This variable holds an object reference to the data 
       that we retrieved from the session object. 
       We can use this variable later in the program to add 
       items and also display items. */
       
	//if the TO DO items doesn't exist, then create a new one
	if(items==null){
		items=new ArrayList<String>();
		session.setAttribute("myToDoList", items);
		
	}
	   
	   /*This section of code checks to see if the TO DO items doesn't exist. 
	     If checks the variable "items" to see if it is null. 
	     If "items" is null then that means the TO DO items do not exist. 
	     Think of this as like a shopping cart .... your cart doesn't exist.

		 As a result, we need to create a new list and assign to items.

         Then we place the items in the session. 
         We make use of the name, value pair.  
         The attribute name is "myToDoList" and the object is the "items" variable. */
		
	// see if there is form data to add
	String theItem=request.getParameter("theItem");
	if(theItem!=null)
	{
		items.add(theItem);
	}
	
		/*This section of code checks to see if there is form data to add. 
		  It reads the form data with the request.getParameter("theItem").  
		  This is assigned to a variable. If the theItem variable is not null, 
		  then that means the user entered some data. 
		  Then we add theItem to our "items" array list.

          Since we're using object references, remember that "items" is 
          a variable that holds a reference to an object. 
          Then it points to the same area of memory that is used 
          by the session. So in effect, the users's session has 
          now been updated with this new entry*/
	
%>

<!-- Step 3: Display all "TO-DO" item from session-->

	<hr>
	<b>To List Items</b>
	
	<ol>
		<%
			for(String temp:items)
			{
				out.println("<li>" +temp+ "</li>");
			}
		%>
	</ol>
	
	<!-- This section of code displays all of the "To Do" items from 
	     the session.

         We make use of our variable "items" because it is our 
         object reference to the data.

	     We use the "items" variable in the for loop to display 
	     the contents of each string in our array list.

		 To display data, we make use of "out.println". -->

</body>

</html>