<%@ page language="java" contentType="text/html; charset=UTF-8"
	buffer="none"
    pageEncoding="UTF-8"%>

    <!-- 태그 라이브러리 선언 -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 컨텍스트 패스(경로) 변수로 선언 -->
    <c:set var="path" value="${pageContext.request.contextPath }" />
    
    <!-- jQuery 라이브러리 연결  -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
