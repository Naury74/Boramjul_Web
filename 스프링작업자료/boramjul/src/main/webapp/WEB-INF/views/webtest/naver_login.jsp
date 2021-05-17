<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 결과</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
네이버 로그인 성공


<script type="text/javascript"> //네이버

	var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/webtest/naver_request.do");

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	var token = naver_id_login.oauthParams.access_token;

	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	
		var email = naver_id_login.getProfileData('email');
		var name = naver_id_login.getProfileData('name');
		var sns = 4;

		$.ajax({
			type: "get",
			data: {name,email,sns},
			url : "/webtest/login_result.do",
			success : function(data) {
				console.log("naver token :"+token);
			}
		});// ajax()
	}
	
</script> 

<!-- 네이버 삭제 토큰: 내 도메인주소, 클라이언트아이디, 클라이언트비번, 토큰주소를 url창에 넣고 엔터를 치면 로그인 정보가 삭제됨
https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER -->

</body>
</html>