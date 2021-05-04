<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="948877643364-88pdva5a86v5rp94ia5j3gjlm7frfr33.apps.googleusercontent.com">


</head>
<body>

	<a href="javascript:kakaoLogin();"><img src="kakao.png" style="width:70px;"/></a>
	<div id="naver_id_login"></div>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	
	
	<script type="text/javascript"> //네이버
		var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/member/login_result.do");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 1,70);
		naver_id_login.setDomain("http://localhost:8090");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

  
	<script> //카카오
		Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');
		console.log(Kakao.isInitialized());
		
		function kakaoLogin(){
			window.Kakao.Auth.authorize({

				scope:'profile, account_email',
				redirectUri: 'http://localhost:8090/member/login_result.do',

				success: function(authObj){
					console.log(authObj);
					
					window.Kakao.API.request({
						url:'/v2/user/me',
						data:{
							property_keys:["kakao_account.profile", "kakao_account.email"]
						},
						success: function(response){
							console.log(response);
						},
						file:function(error){
							console.log(error);
						}

					});
				}
			});
		}
		
	</script>
	
	
 
	<script>//구글
		function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		  console.log('Full Name: ' + profile.getName());
		  console.log("Image URL: " + profile.getImageUrl());
		  console.log("Email: " + profile.getEmail());
		
		  var id_token = googleUser.getAuthResponse().id_token;
		  console.log("ID Token: " + id_token);
		}
	</script>
</body>
</html>