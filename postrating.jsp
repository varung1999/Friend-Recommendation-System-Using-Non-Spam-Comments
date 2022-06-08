<%@ page  import="java.sql.*" import="com.mysql.*" %>
<%@ page  import="java.sql.*" import="com.ct.*" %>
<%@ page import="java.sql.*,databaseconnection.*, java.util.Date, java.text.*"%>



<%String pid=request.getParameter("pid");%>
<%String rating=request.getParameter("rating");%>
<%String review=request.getParameter("rev");%>


<%
try{


String res=AverageContentSimilarity.main(session.getAttribute("email")+"",pid );
System.out.println(res+"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
String  ii="Legitimate";
String  sss="";

if(res.equals("Spam")){
ii="Spam";
sss=sss+"Average Content Similarity: "+res;
}else{
sss=sss+"Average Content Similarity: "+res;
}

res=EarlyTimeFrame.main(session.getAttribute("email")+"",pid);
System.out.println(res+"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEe");
if(res.equals("Spam")){
ii="Spam";
sss=sss+"<br>Early Time Frame: "+res;
}else{
sss=sss+"Early Time Frame: "+res;
}

Connection con1 = DatabaseCon.getConnection();
Statement st1 = con1.createStatement();

	
	Date dNow = new Date( );
    SimpleDateFormat ft = 
    new SimpleDateFormat ("dd/MM/yyyy");
    String date=ft.format(dNow);



	st1.executeUpdate("insert into ratings(user, item, rating, review, date,status) values('"+session.getAttribute("email")+"', '"+pid+"','"+rating+"','"+review+"','"+date+"' ,'"+ii+"')");

	st1.executeUpdate("update purchase set status='done' where uid='"+session.getAttribute("uid")+"' and pid='"+pid+"' ");

session.setAttribute("rrr",sss);
System.out.println(sss);

response.sendRedirect("u_home.jsp?id=ok");

}catch(Exception e1)
{
out.println(e1);
}

%>


<%@ include file="ufooter.jsp"%>