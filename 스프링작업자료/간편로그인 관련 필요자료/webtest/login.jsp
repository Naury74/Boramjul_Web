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
<!-- 
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="948877643364-88pdva5a86v5rp94ia5j3gjlm7frfr33.apps.googleusercontent.com">
 -->
</head>

<body>

	<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>  -->
	<!-- 
	<a id="googleLoginBtn">
		<img id="googleLoginImg" src="google.png">
	</a> -->
	
	<!-- <button onclick="trySampleRequest();">Try sample request</button> -->

	<a id="kakao_id_login" href="javascript:kakaoLogin();"><img src="kakao.png"></a>
	<div id="naver_id_login"></div>

	<script type="text/javascript">
		/*
	  var YOUR_CLIENT_ID = '948877643364-88pdva5a86v5rp94ia5j3gjlm7frfr33.apps.googleusercontent.com';
	  var YOUR_REDIRECT_URI = 'http://localhost:8090/webtest/google_request.do';
	  var fragmentString = location.hash.substring(1);

	  // Parse query string to see if page request is coming from OAuth 2.0 server.
	  var params = {};
	  var regex = /([^&=]+)=([^&]*)/g, m;
	  
	  while (m = regex.exec(fragmentString)) {
	    params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
	  }
	  
	  if (Object.keys(params).length > 0) {
	    localStorage.setItem('oauth2-test-params', JSON.stringify(params) );
	    
	    if (params['state'] && params['state'] == 'try_sample_request') {
	      trySampleRequest();
	    }
	  }

	  // If there's an access token, try an API request.
	  // Otherwise, start OAuth 2.0 flow.
	  function trySampleRequest() {
	    var params = JSON.parse(localStorage.getItem('oauth2-test-params'));
	    
	    if (params && params['access_token']) {
	      var xhr = new XMLHttpRequest();
	      
	      xhr.open('GET',
	          'https://www.googleapis.com/drive/v3/about?fields=user&' +
	          'access_token=' + params['access_token']);
	      
	      xhr.onreadystatechange = function (e) {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	          console.log(xhr.response);
	        } else if (xhr.readyState === 4 && xhr.status === 401) {
	          // Token invalid, so prompt for user permission.
	          oauth2SignIn();
	        }
	      };
	      xhr.send(null);
	    } else {
	      oauth2SignIn();
	    }
	  }


	   * Create form to request access token from Google's OAuth 2.0 server.

	  function oauth2SignIn() {
	    // Google's OAuth 2.0 endpoint for requesting an access token
	    var oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';

	    // Create element to open OAuth 2.0 endpoint in new window.
	    var form = document.createElement('form');
	    form.setAttribute('method', 'GET'); // Send as a GET request.
	    form.setAttribute('action', oauth2Endpoint);

	    // Parameters to pass to OAuth 2.0 endpoint.
	    var params = {'client_id': '948877643364-88pdva5a86v5rp94ia5j3gjlm7frfr33.apps.googleusercontent.com',
	                  'redirect_uri': 'http://localhost:8090/webtest/google_request.do',
	                  'scope': 'https://www.googleapis.com/auth/email/profile/drive.metadata.readonly',
	                  'state': 'try_sample_request',
	                  'include_granted_scopes': 'true',
	                  'response_type': 'token'};

	    // Add form parameters as hidden input values.
	    for (var p in params) {
	      var input = document.createElement('input');
	      input.setAttribute('type', 'hidden');
	      input.setAttribute('name', p);
	      input.setAttribute('value', params[p]);
	      form.appendChild(input);
	    }
	    
	    var email = params.scope.profile;
	    alert(email);

	    // Add form to page and submit it to open the OAuth 2.0 endpoint.
	    document.body.appendChild(form);
	    form.submit();
	  }
	  */

	/*
 	const onClickGoogleLogin = (e) => {
 		window.location.replace(
			"https://accounts.google.com/o/oauth2/v2/auth?client_id=948877643364-88pdva5a86v5rp94ia5j3gjlm7frfr33.apps.googleusercontent.com&redirect_uri=http://localhost:8090/webtest/google_request.do&response_type=code&scope=email%20profile%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive.file&access_type=offline"
 		)}
	
	const googleLoginBtn = document.getElementById("googleLoginBtn");
	googleLoginBtn.addEventListener("click", onClickGoogleLogin) 
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
		
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			var token = googleUser.getAuthResponse().id_token;
			
			console.log('Name: ' + profile.getName());
			console.log("Email: " + profile.getEmail());
			console.log("google token: " + token);
			
			redirect_uri: 'http://localhost:8090/webtest/google_request.do';
		}
*/
		///////////////////////////////////////////////////////////////////////////
		
		Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');
		
		function kakaoLogin(){
			Kakao.Auth.authorize({
				redirectUri: 'http://localhost:8090/webtest/kakao_request.do',
			});
		}

		///////////////////////////////////////////////////////////////////////////
		
		var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/webtest/naver_request.do");
		var state = naver_id_login.getUniqState();
		
		naver_id_login.setButton("green", 1,70);
		naver_id_login.setDomain("http://localhost:8090");
		naver_id_login.setState(state);
	
		naver_id_login.init_naver_id_login();

	</script>
	
</body>
</html>