<%@ page  import="java.sql.*" import="com.mysql.*" import="com.ct.*"%>
<%@ include file="header.jsp"%>
										       <%
                                                       String message=request.getParameter("m");
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font color='red'><blink>You Entered String is dupicate</blink></font>");
                                                       }
                                               %>

<h1>Add Category..</h1><br><br>

<%
int count=1;
Connection con1=DatabaseCon.getConnection();
//System.out.println(con1);
	Statement st = con1.createStatement();
	ResultSet rs=st.executeQuery("select * from menu1");
%>	

<h3>
       
<table align="center" cellpadding="10" >
<tr><td><h3><font size="" color="#004f9d"><b><b>No&nbsp;&nbsp;&nbsp;<td><h3><font size="" color="#004f9d"><b>Subject
<%while(rs.next())
	{
		%>

<tr><td><%=rs.getString(1)%>
<td><%=rs.getString(2)%>
<%
	}
%>	
<form method="post" action="addmenu_1.jsp">
	
<tr><td><td><br><input required  type="text" name="level1" placeholder="Enter Category Subject" size="40"><input required  type="submit" value="   ADD  ">
</form>
</table>


<hr>
<br><br>
<%@ include file="afooter.jsp"%>