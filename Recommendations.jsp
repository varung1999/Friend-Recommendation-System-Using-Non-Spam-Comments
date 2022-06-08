<%String title="Serach Results";%>


<%@ include file="uheader.jsp"%>

<%@ page  import="java.sql.*" import="com.mysql.*" %>
<%@ page  import="java.sql.*" import="com.ct.*" %>



<% String mail=request.getParameter("email");
%> 

<%
try{
Connection con = DatabaseCon.getConnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
st2.executeUpdate("delete from temp");
String sql="select * from users where  email!='"+session.getAttribute("email")+"'";

System.out.println(sql);
ResultSet rs=st.executeQuery(sql);
while(rs.next()){
ResultSet rs2=st2.executeQuery("select * from friends where user1='"+session.getAttribute("email")+"' and user2='"+rs.getString("email")+"' ");
if(rs2.next()){

}else{
Similarity.main(session.getAttribute("email")+"",rs.getString("email"));
}

}
%>
<form method="post" action="search2.jsp">
<table align="center" >

<tr><td>
<tr><td> <h2>Recommendations are</h2>
<%
 rs=st.executeQuery("select * from temp order by score desc");
while(rs.next()){

%>

<tr><td> <img src="view1.jsp?id=<%=rs.getString("user_")%>" alt="" style="width:258px;height:251px;" >
<tr><td > <h3>Email:	<%=rs.getString("user_")%>
<input type="hidden" name="mail" value="<%=rs.getString("user_")%>"/>
<tr><td ><input  class="form-control1"  type="submit" value="Send Friend Reqest"/>			
</form><tr><td><br><br>

<%
}
}
catch(Exception e){
}
%>
</table>

<%@ include file="ufooter.jsp"%>
