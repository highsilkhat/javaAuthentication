<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ book.title }"/></title>
</head>
<body>

<h1><c:out value="${ book.title }"/></h1>

<a href="/home">Back to the Shelves</a>

<p>Here are <c:choose> <c:when test="${ book.user.id != user_id }"><span><c:out value="${ book.user.userName }"/>'s </span> </c:when><c:otherwise> <span>your</span> </c:otherwise></c:choose> thoughts: </p>

<p>
<c:out value="${ book.thoughts }"/>
</p>

<c:if test="${ book.user.id == user_id }">
<a href="/books/${ book.id }/edit">edit</a>
</c:if>
	
	
</body>
</html>