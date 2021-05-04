<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
로그인 성공
<button type="button" onclick="signOut();">google </button>
<button type="button" onclick="Kakao.Auth.logout();">kakao</button>

	<script type="text/javascript">
		var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/member/login_result.do");
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
		  alert(naver_id_login.getProfileData('email'));
		  alert(naver_id_login.getProfileData('name'));
		}
	</script>

<!-- 네이버 삭제 토큰: 내 도메인주소, 클라이언트아이디, 클라이언트비번, 토큰주소를 url창에 넣고 엔터를 치면 로그인 정보가 삭제됨
https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER -->

</body>
</html>