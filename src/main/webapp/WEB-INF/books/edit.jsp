<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>

<h1>Edit <c:out value="${ book.title }"/></h1>
<form:form action="/books/${book.id}" method="post" modelAttribute="book">
	 <input type="hidden" name="_method" value="put">
	 <form:hidden path="user" value="${ user.id }"/>

<p>
        <form:label class= "form-label" path="title">Title</form:label>
        <form:errors path="title"/>
        <form:input class= "form-control" path="title"/>
    </p>
    <p>
        <form:label class= "form-label" path="author">Author</form:label>
        <form:errors path="author"/>
        <form:textarea class= "form-control" path="author"/>
    </p>
    <p>
        <form:label class= "form-label" path="thoughts">Thoughts</form:label>
        <form:errors path="thoughts"/>
        <form:input class= "form-control" path="thoughts"/>
    </p>
    
    <input type="submit" class= "btn btn-primary" value="Submit"/>
</form:form>

<a href="/home"> Home</a>


</body>
</html>