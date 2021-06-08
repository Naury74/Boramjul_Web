<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
    <%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path }/css/mypage2.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="my_line">
    <span id="mypage">공지사항</span>
</div>

<div class="wrap">
    <div class="box">
		<div style="float:right; margin-right:150px; margin-bottom:15px;">
		<c:if test="${sessionScope.name == '보람관리자'}">
		<button class="qnawrite_btn" style="width: 100px; height: 50px; background-color: #664B8E;">
			<a style="color: white;
		        font-family: gmarket;
		        font-style: normal;
		        font-weight: bold;
		        font-size: 18px;
		        line-height: 21px;
		        font-family: mainfont;
		        text-decoration:none;"
		        href="${path }/admin/QnA_write.do">글 작성
	        </a>
        </button>
        </c:if>

  		<button class="qna_btn" style="width: 100px; height: 50px; background-color: #434CA5;">
  			<a style="color: white;
		            font-family: gmarket;
		            font-style: normal;
		            font-weight: bold;
		            font-size: 18px;
		            line-height: 21px;
		            font-family: mainfont;
		            text-decoration:none;"
		            href="${path }/etc/faqbutton.do">문의하기
            </a>
        </button>
        </div>

            <div class="table">
                <table>
                    <tr style="height: 40px; font-family: nanum;">
                        <td>글 번호</td>
                        <td>제목</td>
                        <td>분류</td>
                        <td>날짜</td>
                    </tr>
                    <c:forEach var="row" items="${map.list }">
                    <c:set var="i" value="${i+1 }"/>
                    <tr>
                        <td>${i }<input type="hidden" value="${row.qnanum }" name="qnanum"></td>
                        <td><a href="${path }/etc/detail.do?qnanum=${row.qnanum}">${row.name }</a></td>
                        <td>${row.kind}</td>
                        <td><fmt:formatDate value="${row.qnadate }" pattern="yyyy.MM.dd"/></td>
                    </tr>
                    </c:forEach>
            </table>
            
        </div> <!--table-->
    </div> <!--box-->
</div><!--wrap-->
<%@ include file="../include/footer.jsp" %>
</body>
</html>