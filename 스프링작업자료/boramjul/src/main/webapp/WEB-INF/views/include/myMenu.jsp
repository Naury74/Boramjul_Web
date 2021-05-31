<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>my menu</title>
	<%@ include file="../include/include.jsp" %>

<style>

    *{
        margin: 0;
        padding: 0;
    }
    @font-face {
        font-family: "gilroy";
        src: url("../fonts/gilroy_light.otf");
    }
    @font-face {
        font-family: "nanum";
        src: url("../fonts/nanumbarungothic.ttf");
    }
    @font-face {
        font-family: "gmarket";
        src: url("../fonts/GmarketSansMedium.otf");
    }
    /*
    @media (max-width:900px) {
        #my_menu {
            height: 300px;
        }
        #my_menu #my_menu_list ul{
            height: 300px;
        }
        #my_menu #my_menu_list ul li{
            margin-top: 30px;
            width: 100%;
            text-align: left;
            margin-left: 40px;
        }
        #my_menu #my_menu_list ul li .topmenu{
            font-size: 17px;
            font-weight: normal;
        }
        #my_menu #my_menu_list #Mdiv{
            width: 100%;
            height: 100px;
            background-color: #664B8E;
            position: relative;
        }
        #my_menu #my_menu_list #Mdiv #Mspan{
            color: white;
            position: absolute;
            font-size: 35px;
            left: 20px;
            top: 40px;
            font-family: "gilroy";
            font-weight: bold;
        }
    }
    */
    #my_menu{
        width: 20%;
    	display: inline-block;
   		float: left;
        height: 1000px;
        font-family: "gmarket";
        border-right: solid 1px #A1A1A1;
    }
    #my_menu_list{
        border-right: solid 1px #A1A1A1;
        width: 100%;
    }
    #my_menu_list ul {
        height: 1000px;
        width: 100%;
        list-style-type: none;
        float: left;
        marker: none;
        text-align: center;
    }
    #my_menu_list ul li{
        margin-top: 50px;
        float: none;

    }
    #my_menu_list ul li a{
        display: inline-block;
        cursor: pointer;
        color: black;
        text-decoration:none;
        font-size: 20px;
        text-align: center;
    }
    #my_menu_list ul li a:visited{
        border-bottom: solid 10px #E9CD39;
    }
    #my_menu_list ul li a:hover{
        border-bottom: solid 10px #E9CD39;
    }
    .topmenu:hover{
        transform:scale(1.1);
    }
    #my_menu_list ul li:first-child{
        margin-top: 50%;
    }

</style>

</head>
<body>

<div class="myMenu">

    <div id="my_menu">
        <div id="my_menu_list">
            <ul>
                <li><a class="topmenu" href="${path }/mypage/myList.do?email=${sessionScope.email}">주문내역 조회</a></li>
                <li><a class="topmenu" href="${path }/mypage/myCart.do?email=${sessionScope.email}">장바구니</a></li>
                <li><a class="topmenu" href="${path }membership.do?email=${sessionScope.email}">나의 등급</a></li>
                <li><a class="topmenu" href="${path }/mypage/myReview.do?email=${sessionScope.email}">나의 후기</a></li>
                <li><a class="topmenu" href="${path }/mypage/myInfo.do?email=${sessionScope.email}">회원정보 변경</a></li>
            </ul>
        </div>
    </div><!--my_menu-->

</div>

</body>
</html>