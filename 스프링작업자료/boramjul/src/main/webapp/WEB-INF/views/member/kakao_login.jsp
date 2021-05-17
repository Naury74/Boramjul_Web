<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 완료</title>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="${path}/css/joinok.css">
    <%@ include file="../include/include.jsp" %>
</head>
<body>

<script type="text/javascript">

Kakao.init('d38e52a9c37afa01561ed0bdf7215d7b');
/*
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
					url : "/member/kakao_request.do",
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
*/
</script>


    <div id="box1">
    
    <img id="logohead1" src="${path}/images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">로그인 완료</a>
    <img id="chk" src="${path}/images/checkmark 2.png"><br><br>
    <a id="name">${dto.name }님 로그인을 축하드립니다<br><br>보람줄과 함께 즐거운 쇼핑 되세요!<br><br>:-D</a><br>
     <button id="btn" type="submit"><a style="color: white;
        font-family: btn;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;"
        href="/">메인으로</a></button><br><br> 
        </div>


</body>
</html>