
<%@ page  import="java.sql.*" import="databaseconnection.*" %>

<%
String title="";
%>

<%@ include file="header.jsp"%>


<%
String email=request.getParameter("id");
session.setAttribute("email",email);
%>


<form  action="upload22.jsp" ENCTYPE="multipart/form-data" method="post" >   



					<h3 class="inner-tittle t-inner">Upload Profile Pic</h3>
					<BR><BR>
											<div class="form-group">							

	<input  type="file"  name="pic" accept="image/*" class="form-control" required>
<br>
													<div class="form-group">
												<button type="submit" class="btn btn-primary disabled">Submit</button>
											</div>



</form>




					<div class="clearfix"></div>
										   </div>


</h2>
<br><br><br><br><br>
<%@ include file="footer.jsp"%>