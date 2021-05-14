<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 결과</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
카카오 로그인 성공

<script type="text/javascript">

Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');

Kakao.Auth.login({
	success: function(authObj){
 
		Kakao.API.request({
		    url: '/v2/user/me',

		    success: function(res){
		        var token = authObj.access_token;
		        var email = res.kakao_account.email;
		        var name = res.properties.nickname;
				var sns = 3;
		        
				$.ajax({
					type: "get",
					data: {name,email,sns},
					url : "/webtest/login_result.do",
					success : function(data) {
						console.log("kakao token :"+token);
					}
				});// ajax()
		    }
		});
	},
    fail: function(error) {
        console.log(error);
    }
});

</script>
</body>
</html>