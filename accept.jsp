
<%@ page  import="java.sql.*" import="com.mysql.*" import="CT.*" %>



<% String mail=request.getParameter("mail");
String email=(String)session.getAttribute("email");

//System.out.println("00000000"+mail);
//System.out.println("00000000"+email);
%> 



<%
try{


String sen=mail;

String rec=email;
////System.out.println(sen+" ...........");
//System.out.println(rec+" "+sen);
Connection con = DatabaseCon.getConnection();
Statement st=con.createStatement();
String sql="insert into friends values('"+sen+"','"+rec+"')";
//System.out.println(sql);
st.executeUpdate(sql);
sql="insert into friends values('"+rec+"','"+sen+"')";
st.executeUpdate(sql);

st.executeUpdate("update frequest set requ='accepted' where uto='"+email+"' && ufrom='"+mail+"' ");

response.sendRedirect("u_home.jsp?id=ok");
}
catch(Exception e){
	//System.out.println("00000000"+e);
}
%>