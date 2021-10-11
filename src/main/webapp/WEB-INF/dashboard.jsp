<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged In!</title>
</head>
<body>

<h1><c:out value="${ user.userName }"/>, you have registered!</h1>

<a href="logout">Logout</a>

</body>
</html>