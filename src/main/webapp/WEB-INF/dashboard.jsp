<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Share</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>

<h1>Welcome, <c:out value="${ user.userName }"/></h1>

<a href="/logout">Logout</a>
<a href="/books/new">+ Add a book to my shelf</a>

<h3> Books from everyone's shelves</h3>

<table class="table table-striped">
	<tr>
		<th>
		ID
		</th>
		
		<th>
		Title
		</th>
		
		<th>
		Author Name
		</th>
		
		<th>
		Posted By
		</th>
		
	</tr>
	
	
<tbody>

<c:forEach var="book" items="${ books }">
<tr>
	<td>
	<c:out value="${ book.id }"/>
	</td>
	
	<td>
	<a href="books/${ book.id }"> <c:out value="${ book.title }"/> </a>
	</td>
	
	<td>
	<c:out value="${ book.author }"/>
	</td>
	
	<td>
	<c:out value="${ book.user.userName }"/>
	</td>

</c:forEach>

</tbody>

</table>

</body>
</html>