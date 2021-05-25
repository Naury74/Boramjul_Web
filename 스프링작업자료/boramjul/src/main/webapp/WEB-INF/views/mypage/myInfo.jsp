<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
    <link rel="stylesheet" href="${path}/css/mypage.css">
    <%@ include file="../include/include.jsp" %>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
	function showPostCode(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var addr = '';
	            var extraAddr = '';
	            
	            if (data.userSelectedType == 'R') {  //사용자가 도로명 주소('R')를 선택했을 경우
	            	addr = data.roadAddress;
	            } else {//   //사용자가 지번 주소('J')를 선택했을 경우
	            	addr = data.jibunAddress;
	            }
	
	            document.getElementById('address').value = addr;
	            document.getElementById('address').focus();
	        } // oncomplete: function(data);
	    }).open();
	}// showPostCode();

	$(function(){
		$('#infoBtn').click(function(){
	        var pwReg = /^[a-zA-Z0-9]{4,12}$/;
	        var phReg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
	        
			var passwd = $('#passwd').val();
			var phone = $('#phone').val();
			var birth = $('#birth').val();
			var address = $('#address').val();
		        
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return false;
			}
			if (phone == ""){
				alert('전화번호를 입력하세요.');
				$('#phone').focus();
				return false;
			}
			if (birth == ""){
				alert('생년월일을 입력하세요.');
				$('#birth').focus();
				return false;
			}
			if (address == ""){
				alert('주소를 입력하세요.');
				$('#address').focus();
				return false;
			}    
		
	        if(!phReg.test(phone)) {
				alert("010-0000-0000와 같은 형식으로 입력하여 주세요");
				$('#phone').focus();
	          	return false;
	        }
	        if(!pwReg.test(passwd)) {    
				alert("패스워드는 4~12자의 영문 대소문자와 숫자로만 입력하여주세요");
				$('#passwd').focus();
	          	return false;
	        }
		
	        alert("수정이 완료되었습니다.");
	
			document.update.action = "/member/update.do";
			document.update.submit();
		});
	});
	
	</script>
		
		
		
</head>
<body>

<div class="wrap">

    <%@ include file="../include/header.jsp" %>

    <div class="box">
    
        <div class="my_line">
            <span id="mypage">My page</span>
            <span id="mypage2">${sessionScope.name}님의 마이페이지 입니다.</span>
        </div>

        <%@ include file="../include/myMenu.jsp" %>

        <div class="menu_name">
            <p>PERSONAL INFORMATION</p>
        </div>

        <div class="menu_line"></div>
		
		<form method="post" name="update" accept-charset="UTF-8">
        <div id="info_box">
            <table id="info_table">
                <tr>
                    <td>이메일</td>
                </tr>
                <tr>
                    <td><input type="email" name="email" value="${dto.email}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                </tr>
                <tr>
                    <td><input type="password" id="passwd" name="passwd" value="${dto.passwd}"></td>
                </tr>
                <tr>
                    <td>이름</td>
                </tr>
                <tr>
                    <td><input type="text" name="name" value="${dto.name}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                </tr>
                <tr>
                    <td><input type="date" name="birth" id="birth" value="${dto.birth}"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                </tr>
                <tr>
                    <td><input type="tel" name="phone" id="phone" value="${dto.phone}"></td>
                </tr>
                <tr>
					<td width="170">주소</td>
				</tr>
                <tr>
                    <td>
                    	<input name="address" id="address"  value="${dto.address }"size="60">
                    	<td><input type="button" value="검색" onclick="showPostCode()"
                    		style="width:80px; margin-left:15px;"></td>
                    </td>
                </tr>
                <tr>
                    <td><button id="infoBtn" name="infoBtn" type="submit">수정하기</button></td>
                </tr>
            </table>
        </div><!--info_box-->
        </form>

    </div><!--box-->
    
    <%@ include file="../include/footer.jsp" %>
</div><!--wrap-->

</body>
</html>