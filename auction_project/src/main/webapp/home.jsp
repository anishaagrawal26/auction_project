<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="bootstrapcdn.jsp" %> 
    <%@  page import="java.sql.* , com.configure.DBconnect ,com.storage.DBData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
String email=(String)session.getAttribute("email");
if(email!=null){
	int b_id = DBData.getBidderId(email);
	String b_name = DBData.getBidderName(email);

%>
<div class="container">
<div class="row">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Auctionn</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Link</a></li>
      <li><a href="#">Link</a></li>
    </ul>
    <a href="Product_form.jsp?id=<%= b_id %>"><button class="btn btn-primary navbar-btn">Create Auction</button></a>
     <ul class="nav navbar-nav navbar-right"></ul>
     <li><a href="LogoutHandler.jsp"><button class="btn btn-danger navbar-btn">Logout</button></a></li>
  </div>
</nav>
</div>

<div class="row">
<div class="col-md-6">

</div>
<div class="col-md-6">
<h3><%="Welcome! "+email %></h3>
</div>
<div class="row">

</div>
<div class="row">
<div class="col-md-4">
<fieldset>
<legend>Bidder Information </legend>
<table class="table">
<% 
try{
	Connection con= DBconnect.takeConnection();
	String query="select* from bidder where email=?";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1, email);
	ResultSet rs=ps.executeQuery();
	
	
	if(rs.next()){
		out.println("<tr><th>Name: </th><td>"+rs.getString("name")+"</td></tr>");
		out.println("<tr><th>Email: </th><td>"+rs.getString("email")+"</td></tr>");
		out.println("<tr><th>Occupation: </th><td>"+rs.getString("occupation")+"</td></tr>");
		out.println("<tr><th>Location: </th><td>"+rs.getString("location")+"</td></tr>");
		out.println("<tr><th>Net Worth : </th><td>"+rs.getString("networth")+"</td></tr>");
		out.println("<tr><th>Mobile : </th><td>"+rs.getString("mobile")+"</td></tr>");
		
	}
	
}catch(Exception e){
	
}
%>
<tr><th><button class="btn btn-info">Edit</button></th></tr>

</table>
</fieldset>
</div>
<div class="col-md-6">
			<!-- Pass & Upcoming Auction --> 
			<jsp:include page="BidderAuctionDetails.jsp">
				<jsp:param name="id" value="<%=b_id %>"></jsp:param>
			</jsp:include>
</div>
</div>
</div>

<%} %>
</body>
</html>