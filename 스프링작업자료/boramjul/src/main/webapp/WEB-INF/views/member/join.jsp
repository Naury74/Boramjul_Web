<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path }/css/join.css">
<%@ include file="../include/include.jsp" %>
<title>회원 가입</title>

</head>
<body>
<form name="join" id="form" method="post" accept-charset="UTF-8">
<div id="box1">
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Join</a><br><br>
    <table id="info_table">
        <tr>
            <td>이메일</td>
        </tr>
        <tr>
            <td><input type="text" id="email" name="email" style="width:350px;
                font-size: 20px;
                border:none;
                outline:none;
                border-bottom:3px solid #664B8E;"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
        </tr>
        <tr>
            <td><input type="password" id="passwd" name="passwd" style="width:350px;
                font-size: 20px;
                border:none;
                outline:none;
                border-bottom:3px solid #664B8E;"></td>
        </tr>
        <tr>
            <td>이름</td>
        </tr>
        <tr>
            <td><input type="text" id="name" name="name" style="width:350px;
                font-size: 20px;
                border:none;
                outline:none;
                border-bottom:3px solid #664B8E;"></td>
        </tr>
        <tr>
            <td>생년월일</td>
        </tr>
        <tr>
            <td><input type="date" id="birth" name="birth" style="width:350px;
                font-size: 20px;
                border:none;
                outline:none;
                border-bottom:3px solid #664B8E;"></td>
        </tr>
        <tr>
            <td>전화번호</td>
        </tr>
        <tr>
            <td><input type="tel" id="phone" name="phone" style="width:350px;
                font-size: 20px;
                border:none;
                outline:none;
                border-bottom:3px solid #664B8E;"></td>
        </tr>
        <tr>
            <td><button id="infoBtn" type="submit"><a style="color: white;
                font-family: btn;
                font-style: normal;
                font-size: 25px;
                line-height: 21px;
                text-decoration:none;" href="${path }/member/insert.do">가입하기</a></button></td>
        </tr>
    </table>
    </div>
    </form>
    
    <script type="text/javascript">
	$(function(){
		$('#infoBtn').click(function(){
			
			var email = $('#email').val();
			var passwd = $('#passwd').val();
			var name = $('#name').val();
			var birth = $('#birth').val();
			var phone = $('#phone').val();
			
			if (email == ""){
				alert('이메일을 입력하세요.');
				$('#email').focus();
				return false;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return false;
			}
			if (name == ""){
				alert('이름을 입력하세요.');
				$('#name').focus();
				return false;
			}
			if (birth == ""){
				alert('생일을 입력하세요.');
				$('#birth').focus();
				return false;
			}
			if (phone == ""){
				alert('전화번호를 입력하세요.');
				$('#phone').focus();
				return false;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return false;
			}

			document.join.action = "/member/insert.do";
			document.join.submit();
			

		});
	});
    
    </script>
</body>
</html>