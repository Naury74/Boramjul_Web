<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

    <link rel="stylesheet" href="../css/login.css">
    
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

</head>

<body>

<div id="box1">
    <form action="/member/login_result.do">
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Login</a><br><br>
    <a id="id">아이디</a><br><br>
    <input type="text" name="id" id="userid" style="width:500px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 122px; 
                                top: 280px;"><br><br>
                                
    <a id="pwd">비밀번호</a><br><br>
    <input type="password" name="passwd" id="passwd" style="width:500px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 122px; 
                                top: 400px;"><br><br>
                                
    <input type="checkbox" name="loging" style="position: absolute;
                                            width: 15px;
                                            height: 15px;
                                             left: 120px; top:450px;"><a style="position: absolute; left: 150px; top: 452px; font-family: detailfont;
                                                                                font-style: normal; font-weight: bold;
                                                                                ">로그인유지</a><br><br>
    <button id="btn" type="submit"><a style="color: white;
                                            font-family: Roboto;
                                            font-style: normal;
                                            font-weight: bold;
                                            font-size: 18px;
                                            line-height: 21px;
                                            font-family: mainfont;
                                            text-decoration:none;"
     								>로그인</a></button><br><br> </form>
        
     
     <a href="findID.html" id="findid" style="text-decoration:none;">아이디찾기</a>
     <a href="findPWD.html" id="findpwd"style="text-decoration:none;">비밀번호찾기</a>
     <a href="join1.html" id="join" style="text-decoration:none;">회원가입</a>
     <a id="or">또는</a>
	 <a id="kakao_id_login" href="javascript:kakaoLogin();"><img src="../images/kakao.png"></a>
	<div id="naver_id_login"></div>
    </div>


	<script type="text/javascript">
	
	$(function(){
		$('#btn').click(function(){
			
			var id = $('#userid').val();
			var passwd = $('#passwd').val();
			var sns = 1;
			
			if (id ==""){
				alert('아이디를 입력하세요.');
				$('#userid').focus();
				return;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return ;
			}

			document.login.action = "/member/login_result.do";
			document.login.submit();
			
		});
	});


	///////////////////////////////////////////////////////////////////////////
		
		Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');
		
		function kakaoLogin(){
			Kakao.Auth.authorize({
				redirectUri: 'http://localhost:8090/member/kakao_request.do',
			});
		}

		///////////////////////////////////////////////////////////////////////////
		
		var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/member/naver_request.do");
		var state = naver_id_login.getUniqState();
		
		naver_id_login.setButton("green", 1,70);
		naver_id_login.setDomain("http://localhost:8090");
		naver_id_login.setState(state);
	
		naver_id_login.init_naver_id_login();

	</script>
	
</body>
</html>