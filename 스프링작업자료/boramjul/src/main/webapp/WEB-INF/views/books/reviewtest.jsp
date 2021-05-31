<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>리뷰</title>
    <%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path }/css/mypage2.css">

</head>
<body>
<div class="wrap">

<%@ include file="../include/header.jsp" %>

    <div class="box">

        <div class="my_line">
            <span id="mypage">리뷰</span>
        </div>
		<c:if test="${sessionScope.id == 'boramAdmin' } ">
		<button style="position: absolute; width: 100px; height: 50px; left:85%; top: 29%; background-color: #434CA5; " type="button"><a style="color: white;
		            font-family: gmarket;
		            font-style: normal;
		            font-weight: bold;
		            font-size: 18px;
		            line-height: 21px;
		            font-family: mainfont;
		            text-decoration:none;"
		            href="${path }/books/ReviewWrite.do">글쓰기</a></button>
		              
		    <br><br> 
  				</c:if>
            <div class="table">
                <table>
                    <tr style="height: 40px; font-family: nanum;">
                        <td>글 번호</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>날짜</td>
                    </tr>
                    <c:forEach var="row" items="${map.list }">
                    <c:set var="i" value="${i+1 }"/>
                    <tr>
                        <td><a href="${path }/books/detail/${row.renum}">${row.renum }</a></td>
                        <td>${row.rename }</td>
                        <td>${row.email}</td>
                        <td><fmt:formatDate value="${row.redate }" pattern="yyyy.MM.dd"/></td>
                    </tr>
                    </c:forEach>

            </table>
            
        </div> <!--table-->

    </div> <!--box-->
   <%@ include file="../include/footer.jsp" %>
</div><!--wrap-->
</body>
</html>