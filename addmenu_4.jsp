<%@ page  import="java.sql.*" import="java.io.*" import="com.mysql.*" %>

<%
String levels=request.getParameter("level3");
String[]temp=levels.split(",");
String level1=temp[0];
String level2=temp[1];
String level3=temp[2];
String sub=request.getParameter("sub");
String cost=request.getParameter("cost");
String des=request.getParameter("des");
%>
<%
int i=0;
try{

Connection con = DatabaseCon.getConnection();

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(menu3) from menu3");
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
	st.executeUpdate("insert into menu3(menu1,menu2,menu3,subject_,cost,des) values('"+level1+"','"+level2+"','"+i+"','"+level4+"','"+cost+"','"+des+"')");
	response.sendRedirect("uploadpic.jsp?id="+i);
	}
	catch(Exception e)
	{
		System.out.println(e);
		return;
	}
	

%>	