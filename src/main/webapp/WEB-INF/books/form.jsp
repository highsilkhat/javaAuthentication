<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Book</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>

<h1>Add a book to your shelf</h1>

<form:form action="/book/post" method="post" modelAttribute="book">

<form:hidden path="user" value="${ user.id }"/>

<p>
	<form:label class= "form-label" path = "title">Title</form:label>
	<form:errors path= "title"/>
	<form:input class= "form-control" path="title"/>
	
</p>
<p>

	<form:label class= "form-label" path = "author">Author</form:label>
	<form:errors path= "author"/>
	<form:input class= "form-control" path="author"/>
</p>
<p>
	<form:label class= "form-label" path = "thoughts">My Thoughts</form:label>
	<form:errors path= "thoughts"/>
	<form:textarea class= "form-control" path="thoughts"/>
</p>

<input type="submit" class="btn btn-primary" value="Submit"/>

</form:form>

</body>
</html>