<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Welcome To Student Portal</h3>
<br><br>
<form action="id" method="get">
Enter the Id <input type="text" name="id"><br>
<input type="submit" value="submit">
</form>
<br><br>
<button onclick="InsertTable()">Insert New Student</button>
<br><br>
<button onclick="AllStudent()">All Students</button>
<br><br>
<button onclick="UpdateId()">Update Student</button>
<br><br>
<button onclick="DeleteTable()">Delete Student</button>
<br><br>
<div id="mydiv"></div>
</body>

<script type="text/javascript">


function DeleteTable() {
	var div="";
	div+="<table><table border='2' width='30%' cellpadding='2'>"  
	+"<tr><th>Id</th><td><input type='text' id='deleteid' ></td></tr>"  
	+"<tr><td><button onclick='Delete()'>Delete</button>";
	$("#mydiv").html(div);
}

function Delete() {
	var div="";
	var id=$("#deleteid").val();
	$.ajax({	  	 	
		type:"GET",		
		url : getContextPath()+"/delete",
		data: "id="+id,				
		success:function(response)
		{
			div+="<br><br><h3>Delete Successfully</h3>";
			$("#mydiv").append(div);
		} 
		});
}

function UpdateId() {
	var div="";
	div+="<table><table border='2' width='30%' cellpadding='2'>"  
	+"<tr><th>Id</th><td><input type='text' id='tableid' ></td></tr>"  
	+"<tr><td><button onclick='UpdateTable()'>Update</button>";
	$("#mydiv").html(div);
}

function UpdateTable() {
	var div="";
	var id=$("#tableid").val();
	$.ajax({	  	 	
		type:"GET",		
		url : getContextPath()+"/updateid",
		data: "id="+id,				
		success:function(response)
		{
			var div="";
			div+="<table><table border='2' width='20%' cellpadding='2'>"  
			+"<tr><th>Id</th><td><div id='uid'>"+response.id+"</div></td></tr>"  
			+"<tr><th>Name</th><td><input type='text' id='uname' value="+response.name+"></td></tr>"
			+"<tr><th>Marks</th><td><input type='text' id='umarks' value="+response.marks+"></td></tr>"
			+"<tr><td><button onclick='Update()'>Update</button>";
			$("#mydiv").html(div);
		} 
		});
}

function Update() {
	var div="";
	var data = {}
	data["id"] = $("#uid").text();
	data["name"] = $("#uname").val();
	data["marks"] = $("#umarks").val();
	
	$.ajax({	  	 	
		type:"POST",	
		contentType : "application/json",
		url : getContextPath()+"/update",
		data : JSON.stringify(data),			
		success:function(response)
		{
			div+="<br><br><h3>Update Successfully</h3>";
			$("#mydiv").append(div);
		} 
		});
}

function AllStudent() {
	
	$.ajax({	  	 	
		type:"GET",		
		url : getContextPath()+"/all",			
		success:function(response)
		{
			var div="";
			div+="<table><table border='2' width='30%' cellpadding='2'>"
			+"<tr><th>Id</th><th>Name</th><th>Marks</th></tr>";
			$.each(response, function(k, v) {
				div+="<tr><td>"+v.id+"</td><td>"+v.name+"</td><td>"+v.marks+"</td></tr>";
		   	 	});
			div+="</table>";
			$("#mydiv").append(div);
		} 
		});
}


function InsertTable() {
	
	var div="";
	div+="<table><table border='2' width='30%' cellpadding='2'>"  
	+"<tr><th>Id</th><td><input type='text' id='insertid' ></td></tr>"  
	+"<tr><th>Name</th><td><input type='text' id='insertname' ></td></tr>"
	+"<tr><th>Marks</th><td><input type='text' id='insertmarks' ></td></tr>"
	+"<tr><td><button onclick='Insert()'>Insert</button>";
	$("#mydiv").html(div);
	
}

function Insert() {
	
	var div="";
	var data = {}
	data["id"] = $("#insertid").val();
	data["name"] = $("#insertname").val();
	data["marks"] = $("#insertmarks").val();
	
	$.ajax({	  	 	
		type:"POST",	
		contentType : "application/json",
		url : getContextPath()+"/insert",
		data : JSON.stringify(data),			
		success:function(response)
		{
			div+="<br><br><h3>Insert Successfully</h3>";
			$("#mydiv").append(div);
		} 
		});
}


function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	}
</script>

</html>