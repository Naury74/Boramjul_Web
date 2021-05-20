<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <title>주변 서점 검색</title>
    <meta name="viewport" id="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width" />
    <link rel="stylesheet" href="${path }/css/order.css">
   <%@ include file="../include/include.jsp" %>
</head>
<body>
<%@ include file="../include/header.jsp" %>
 <!-- container -->
    <section id="container">
        <div class="contents">

            <section class="map">
                <p>주변서점검색</p>
                <div class="map_area">
                    <iframe src="http://naver.me/xpPdQTsP" frameborder="0" width="100%" height="600"></iframe>
                </div>
                <ul>
                    <li>* 주변 검색을 위해 고객님의 위치 정보를 이용합니다.</li>
                    <li>* 주변 정보가 검색되지 않을 경우, 지도의 현재 위치를 드래그하여 옮기거나 다시 검색을 눌러 주세요.</li>
                </ul>
            </section>
            
        </div>
    </section>
<%@ include file="../include/footer.jsp" %>
</body>

</html>