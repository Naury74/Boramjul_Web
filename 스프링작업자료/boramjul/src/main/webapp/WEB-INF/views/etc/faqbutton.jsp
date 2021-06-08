<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path }/css/mypage2.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="wrap">
        <div id="header"></div>

        <div class="box">
            <div class="my_line">
                <span id="mypage">고객센터</span>
            </div>
            
            <div id="myMenu"></div>

            <div class="menu_name">
                <p>문의하기</p>
            </div>

            <div class="menu_line"></div>

            <div id="info_box">
                <table id="info_table">
                    <tr>
                        <td>자세한 문의는
                            보람줄 고객센터 000-000-000<br>
                            보람줄 이메일 boramjul@boramjul.net<br>
                            로 연락주시기 바랍니다.</td>
                    </tr>
                    <tr>
                        <td><button id="infoBtn" name="infoBtn" type="submit" onclick="location.href='${path }/etc/QnA.do'">뒤로가기</button></td>
                    </tr>
                </table>
            </div><!--info_box-->


        </div><!--box-->
        <div id="footer"></div>
    </div><!--wrap-->
    <%@ include file="../include/footer.jsp" %>
</body>
</html>