<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="${path}/css/login.css">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<%@ include file="../include/include.jsp" %>
</head>

<body>

<div id="box1">
    <form name="login" method="post">
    <img id="logohead1" src="${path}/images/logo.png" alt="보람줄 로고" ><a id="logohead2">Login</a><br><br>
    <a id=id>이메일</a><br><br>
    <input type="text" name="email" id="email" style="width:500px;
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
     								>로그인</a></button><br><br> 
    </form>
        
     
     <a href="${path}/member/findemail.do" id="findid" style="text-decoration:none;">이메일찾기</a>
     <a href="${path}/member/findpwd.do" id="findpwd"style="text-decoration:none;">비밀번호찾기</a>
     <a href="${path}/member/join1.do" id="join" style="text-decoration:none;">회원가입</a>
     <a id="or">또는</a>
	 <a id="kakao_id_login" href="javascript:kakaoLogin();" style="position: absolute;
															    width: 87px;
															    height: 86px;
															    left: 280px;
															    top: 730px;"><img src="${path}/images/kakao.png"></a>
	<div id="naver_id_login" style="position: absolute;
    width: 87px;
    height: 86px;
    left: 400px;
    top: 730px;"></div>
    </div>
    

	<c:if test="${message == 'error' }">
		<div style="color:red">email 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>


	<script type="text/javascript">
	
	$(function(){
		$('#btn').click(function(){
			
			var email = $('#email').val();
			var passwd = $('#passwd').val();
			var sns = 1;
			
			if (email == ""){
				alert('이메일을 입력하세요.');
				$('#email').focus();
				return ;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return ;
			}

			document.login.action = "/member/login_check.do";
			document.login.submit();
			
		});
	});


	///////////////////////////////////////////////////////////////////////////
		
		Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');
		
		function kakaoLogin() {
			
			Kakao.Auth.login({
				success: function(authObj){
			 
					Kakao.API.request({
					    url: '/v2/user/me',

					    success: function(res){
					        var token = authObj.access_token;
					        var email = res.kakao_account.email;
					        var name = res.properties.nickname;
							var sns = 3;
							
							Kakao.Auth.authorize({
								redirectUri: 'http://localhost:8090/member/kakao_request.do',
							});
					        
							$.ajax({
								type: "post",
								data: {name,email,sns},
								url : "/member/kakao_request.do",
								success : function(data) {
									alert("ajax 전송 완료");
								},
							    fail: function(error){
							        alert(error);
								}
					    	})// ajax()
					
					

						},
					    fail: function(error) {
					        alert(error);
					    }
						
					});
		  		}
			})
		}//kakaoLogin()

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