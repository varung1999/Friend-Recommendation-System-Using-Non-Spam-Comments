<%@ page  import="java.sql.*" import="com.mysql.*" %>
<%@ include file="uheader.jsp"%>
  <%
                                                       String message=request.getParameter("id");
                                                       
													   
													   if(message!=null && message.equalsIgnoreCase("s1"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Friend Request Sent '); </script>");
                                                       }
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Your Post is posted successfully!! '); </script>");
                                                       }
                                                       if(message!=null && message.equalsIgnoreCase("ok"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Operation successfull!! '); </script>");
                                                       }
                                                       if(message!=null && message.equalsIgnoreCase("s2"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Friend Request already Sent '); </script>");
                                                       }

			    %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.slidecontainer {
  width: 40%;
}

.slider {
  -webkit-appearance: none;
  width: 40%;
  height: 25px;
  background: #d3d3d3;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  background: #4CAF50;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  background: #4CAF50;
  cursor: pointer;
}
</style>
</head>
<body>
<h3>
<%=session.getAttribute("rrr")%>

<%session.setAttribute("rrr","");%>

</h3><%


try{
Connection con1 = DatabaseCon.getConnection();
Statement st1 = con1.createStatement();
	
String sss1 = "select * from purchase where uid='"+session.getAttribute("uid")+"' and status='non' ";

	ResultSet rs1=st1.executeQuery(sss1);
	while(rs1.next())
	{
%>


<form method="post" action="postrating.jsp?pid=<%=rs1.getString("pid")%>">
	<h3>Provide Rating for :<%=rs1.getString("sub")%></h3>
<br>

<div class="slidecontainer">
  <input type="range" min="1" max="5" value="4" class="slider" id="myRange" name="rating">
  <p>Rating: <span id="demo"></span></p>
</div>

<table><tr><td colspan=2><h3> Review<br>
<textarea name="rev" rows="" cols="30" required></textarea>
<tr><td>

<input type="submit" value="Submit"> 
</form>
<td>
<!-- <form method="post" action="postrating2.jsp?pid=<%=rs1.getString("pid")%>">
<input type="submit" value="Skip"> 
</form> -->
</table>

<br><br><br>

<%
		}
}


catch(Exception e1)
{
out.println(e1.getMessage());
}

%>




				<%Vector<String> v=Details.getFriends((String)session.getAttribute("email"));%> 
					<%
					for(String vv:v){
					%>

									<a href="#">
										   <div class="user_img"><img src="view1.jsp?id=<%=vv%>" alt=" " width="130" height="130"alt=""></div>
										   <div class="notification_desc">
											<p><%=Details.getName(vv)%></P>
											<p><span>
												<a href="accept.jsp?mail=<%=vv%>">Accept</a>&nbsp;&nbsp;&nbsp;
												
												<a href="reject.jsp?mail=<%=vv%>">Reject</a></span></p>
								
											</span></p>
											</div>
										   <div class="clearfix"></div>	
										</a>
										


										<%}%>
										

<br><br><br><br><br><br><br><br><br><br><br><br>
										<script>
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
}
</script>

		<%@ include file="ufooter.jsp"%>