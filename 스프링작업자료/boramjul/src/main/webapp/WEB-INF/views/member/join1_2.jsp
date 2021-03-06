<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOIN1_2</title>
    <%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="../css/join1_2.css">
</head>
<body>
<div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">개인정보 수집 및 이용동의</a>
    <div id="box2">
        <a>이용자의 개인정보는 원칙적으로 회원탈퇴 시 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>

            ① 회사 내부 방침에 의한 정보보유 사유<br>
            - 보존 항목 : 아이디(ID), 회원번호<br>
            - 보존 근거 : 서비스 이용의 혼선 방지<br>
            - 보존 기간 : 영구<br>
            ② 관계 법령에 의한 정보보유 사유
            ‘상법’, ‘전자상거래 등에서의 소비자보호에 관한 법률’ 등 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 관계 법령에서 정한 일정한 기간 동안 개인정보를 보관합니다.<br>
            이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존 기간은 아래와 같습니다.<br>
            1. 계약 또는 청약철회 등에 관한 기록
            - 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률
            - 보존 기간 : 5년<br>
            2. 대금결제 및 재화 등의 공급에 관한 기록
            - 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률
            - 보존 기간 : 5년<br>
            3. 소비자의 불만 또는 분쟁처리에 관한 기록
            - 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률
            - 보존 기간 : 3년<br>
            4. 웹사이트 방문기록
            - 보존 근거 : 통신비밀보호법
            - 보존 기간 : 3개월</a>
        </div>
     <button id="btn" type="submit"><a style="color: white;
                                            font-family: Roboto;
                                            font-style: normal;
                                            font-weight: bold;
                                            font-size: 18px;
                                            line-height: 21px;
                                            font-family: mainfont;
                                            text-decoration:none;"
        href="${path }/member/join1.do">뒤로가기</a></button><br><br> 
    </div>
</body>
</html>