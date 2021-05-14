<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>스프링 보람줄 테스트</title>
 <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<%--  include 적용 --%>
<jsp:include page="include/menu.jsp"></jsp:include>



<h2>스프링 보람줄 기능 테스트 페이지</h2>
<hr>
<h3>${message}</h3>
<h1>작업현황</h1>
<h4><a href="/member/list.do">1. DB 회원 정보 연결 (mysql)</a></h4>
<h4><a href="/member/memberinfojson.do">2. 회원 정보 json 형식으로 내보내기</a></h4>
<h4><a href="/member/jsonToParsing.do">3. json 형식으로 받아서 파싱하여 리스트 띄우기</a></h4>
<h4><a href="/member/androidsignup.do">4. 안드로이드에서 회원가입 insert </a></h4>
<h4><a href="/member/join.do">5. 웹 회원가입 jsp 작업</a></h4><br><br><br>

<h1>현재 작업 중</h1>
<h4><a href="/home">6. 웹 login 작업 </a></h4>
<h4><a href="/home">7. jsoup </a></h4><br><br><br>


<h4><a href="/webtest/login.do">간편로그인 테스트</a></h4>

</body>
</html>