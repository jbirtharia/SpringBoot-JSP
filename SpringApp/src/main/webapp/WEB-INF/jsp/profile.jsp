<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Student Details</h3>
<br><br><br>
<table border="2" width="30%" cellpadding="2">    
  <tr>  
  <th>Id </th><td> ${student.id}</td> 
  </tr>
  <tr> 
  <th>Name</th><td>${student.name}</td>  
  </tr>
  <tr>
  <th>Marks</th><td>${student.marks}</td>  
  </tr>
</table>
</body>
</html>