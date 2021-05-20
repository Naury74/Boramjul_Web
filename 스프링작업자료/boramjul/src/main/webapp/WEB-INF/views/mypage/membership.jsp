<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 등급</title>
	<link rel="stylesheet" href="${path}/css/mypage.css">
	<%@ include file="../include/include.jsp" %>
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
	        <p>MEMBERSHIP</p>
	    </div>
	
	    <div class="menu_line"></div>
	
	    <div id="info_box" style="border: 0;">
	    
	    	<p id="point_system">현재 적립금은 <span id="myPoint">${dto.reserves }점</span> 입니다<br>
	        구매하시는 금액의 <span id="myPoint">1%</span>씩 자동 적립 됩니다</p>
	        
	        <p id="myTier">나의 등급은 <span id="myPoint">${dto.rank } </span>입니다<br>
	          다음 등급까지 <span id="myPoint">원</span> 남았습니다</p>
	
		    <div id="bronze">
		    	<img src="${path}/images/브론즈.svg" alt="브론즈">
		        <p class="point_system">구매 금액: 0~20만원 구간<br>
		                                온라인 구매 5% 할인</p>
		    </div>
		      
		    <div id="silver" >
		    	<img src="${path}/images/실버.svg" alt="실버">
		        <p class="point_system">구매 금액: 20~50만원 구간<br>
		               					온라인 구매 10% 할인</p>       
		    </div>
		
		    <div id="gold">
		    	<img src="${path}/images/골드.svg" alt="골드">
		        <p class="point_system">구매 금액: 50만원 이상 구간<br>
		              					온라인 구매 15% 할인</p>
		    </div>
	      
	    </div><!-- infobox -->
	</div><!--box-->
	
	<%@ include file="../include/footer.jsp" %>
    </div><!--wrap-->


</body>
</html>