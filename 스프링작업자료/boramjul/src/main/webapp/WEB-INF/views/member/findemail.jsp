<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BORAMJUL-ID</title>
    <link rel="stylesheet" href="../css/findemail.css">
    <%@ include file="../include/include.jsp" %>
</head>
<body>
<form name="form" method="post">
 <div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">이메일 찾기</a>
    <a id="name">본인확인 전화번호</a><br><br>
    <input type="text" name="phone" id="phone" style="width:400px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 170px; 
                                top: 350px;"><br><br>
    <br><br>
     <button id="btnCheck" type="submit" style="color: white;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;">찾기
        </button>
        <br><br> 
        </div>
        </form>
        <script type="text/javascript">
        $(function(){
    		$('#btnCheck').click(function(){
    			
    			
    			
    			var phone = $('#phone').val();
    			
    			if (phone == ""){
    				alert('전화번호를 입력하세요.');
    				$('#phone').focus();
    				return false;
    			}
    			document.form.action = "/member/findemailok.do";
    			document.form.submit();
    			
    		});
    	});
		</script>
</body>
</html>