<%@ page  import="java.sql.*" import="java.io.*" import="com.mysql.*" import="javax.swing.JOptionPane"%>

<%
String level1=request.getParameter("level1");
%>
<%
int i=0;
try{

Connection con = DatabaseCon.getConnection();

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(menu1) from menu1");
if(rs.next())
{
	i=rs.getInt(1);
	++i;
}
}
catch(Exception e){
System.out.println("Exception Occured");}



Connection con1=DatabaseCon.getConnection();
Statement st = con1.createStatement();
	try{
	i=st.executeUpdate("insert into menu1 values('"+i+"','"+level1+"')");
	response.sendRedirect("adddata.jsp?id=level-1");
	}
	catch(Exception e)
	{
		System.out.println(e);
		return;
	}
	

%>	
<%@ include file="afooter.jsp"%>
