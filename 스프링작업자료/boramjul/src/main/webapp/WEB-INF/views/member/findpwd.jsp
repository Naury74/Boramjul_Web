<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BORAMJUL-PWD</title>
    <link rel="stylesheet" href="../css/findpwd.css">
    <%@ include file="../include/include.jsp" %>
</head>
<body>
<form name="form" method="post">
 <div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">비밀번호 찾기</a>
    <a id="name">본인확인 이메일</a><br><br>
    <input type="text" name="email" id="email" style="width:400px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 170px; 
                                top: 450px;"><br><br>
     <button id="btnCheck" type="submit"><a style="color: white;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;">찾기</a></button><br><br> 
        </div>
        </form>
         <script type="text/javascript">
        $(function(){
    		$('#btnCheck').click(function(){
    			
    			
    			
    			var email = $('#email').val();
    			
    			if (email == ""){
    				alert('이메일을 입력하세요.');
    				$('#email').focus();
    				return false;
    			}
    			document.form.action = "/member/findpwdok.do";
    			document.form.submit();
    			
    		});
    	});
		</script>
</body>
</html>