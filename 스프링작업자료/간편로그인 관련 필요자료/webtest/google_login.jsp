<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글 로그인 결과</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<h1>Google Login 완료</h1>
	
	<script type="text/javascript">

	$(function(){
		var sns = 2;

		$.ajax({
			type: "get",
			data: {sns},
			url : "/webtest/login_result.do",
			success : function(data) {
				alert("성공");
			}
		});// ajax()
	})
	
	</script>


</body>
</html>