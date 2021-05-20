<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<%@ include file="../include/include.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <style>
 
        @font-face {
            font-family: "parisienne";
            src: url("../fonts/parisienne_regular.ttf");
        }
        @font-face {
            font-family: "gilroy";
            src: url("../fonts/gilroy_light.otf");
        }
        @font-face {
            font-family: "gmarket";
            src: url("../fonts/GmarketSansMedium.otf");
        }
        @font-face {
            font-family: "nanum";
            src: url("../fonts/nanumbarungothic.ttf");
        }
        /*
        @media (max-width:900px) {
            #top_menu ul li a{
                font-size: 10px;
            }
            #mid_menu #logo_box{
                display: block;
                margin: 0 auto;
            }
            #mid_menu #logo_box #logo{
                width: 50px;
                display: inline-block;
            }
            #mid_menu #logo_box #logo_text{
                font-size: 30px;
            }
            #mid_menu #search_box{
                display: none;
            }
            .header #main_menu{
                height: 40px;
            }
            #main_menu  ul li:first-child{
                display: block;
            }
      
            #main_menu ul li a{
                font-size: 10px;
            }
            #main_menu ul li{
                width: 16%;
            }
            .header #header_line{
                height: 30px;
            }   
        }   
        */
        *{
            margin: 0;
            padding: 0;
        }
        ul,li {
            list-style-type: none;
            float: left;
            marker: none;
            text-align: center;
        }
        a{
            text-decoration:none;
            color: black;
            text-align: center;
        }
        input{
            outline:none;
        }
        button{
            cursor: pointer;
            border: 0;
        }
        .topmenu:hover{
            transform:scale(1.1);
        }
        .header{
            width: 100%;
        }
        #top_menu{
            list-style-type: none;
            margin-top: 5%;
            height: 100%;
            width: 100%;
            display: inline-block;
        }
        #top_menu ul{
            float: right;
            margin-right: 1%;
        }
        #top_menu ul li{
            margin-right: 10px;
        }
        #top_menu a,p{
            font-family: "gmarket";
        }
        /************************* mid *****************************/
        #mid_menu{
            margin-top: 2%;
        }
        #logo_box{
            display: inline-block;
            margin-left: 10%;
            width: 45%;
        }
        #logo{
            width: 15%;
            height: 15%;
            vertical-align: middle;
        }
        #logo_text{
            font-family: "parisienne";
            font-size: 60px;
            vertical-align: middle;
        }
        #search_box{
            float: right;
            width: 35%;
            height: 60px;
        }
        #search_text{
            padding-right: 5%;
            height: 60px;
            background-color:rgba(196, 196, 196, 1);
            border: 0;
            border-radius: 10px;
            padding-left: 25px;
            font-style: oblique;
            font-family: "nanum";
            text-align: left;
            width: 90%;
            margin-top: 5%;
        }
        #searchBtn{
            width: 30px;
            height: 30px;
            background-image: url(../images/search.svg);
            background-color: rgba(196, 196, 196, 1);
            margin-left: -50px;
            vertical-align: middle;
            border: 0;
            box-shadow: none;
        }
        /***************************main menu**************************/
        #main_menu{
            width: 100%;
            height: 120px;
            font-family: "gilroy";
            text-align: center;
        }
        #main_menu ul{
            margin-top: 3%;
            width: 100%;
        }
        #main_menu li{
            font-size:24px;
            width: 20%;
        }
        /*
        #main_menu li:first-child{
            display: none;
        }*/
        #main_menu a{
            font-weight: bold;
            font-size: 24px;
            display: block;
            text-align: center;
        }
        #header_line{
            background-color: #664B8E;
            width: 100%;
            height: 75px;
        }
        .menu_bg { 
            width: 100%; 
            height: 500px; 
            top:0px; 
            left:0px; 
            overflow:hidden; 
            display: none; 
            z-index: 999;
        }
		.menu { 
            position:absolute; 
            top:143px; left:0px; 
            width:100%; height: 100%; 
            background-color:white; 
        }
		.menu #exBtn { 
            font-size: 18px;
            width: 100%;
            background-color: #664B8E;
        }
        .menu #exBtn div{
            width: 17px;
            margin-left: 350px;
        }

    </style>
    
    <script>
    
        var giMenuDuration = 700;

        // 전체 메뉴를 오른쪽으로 슬라이드하여서 보여준다.
        function ShowMenu(){
            $('.menu_bg' ).css( { 'display' : 'block' } );
            $('.menu' ).css( { 'left' : '-100%' } );
            $('.menu' ).animate( { left: '0px' }, { duration: giMenuDuration } );
        }

        // 전체 메뉴를 왼쪽으로 슬라이드하여서 닫는다.
        function HideMenu(){
            $('.menu' ).animate( { left: '-100%' }, { duration: giMenuDuration, complete:function(){ $('.menu_bg' ).css( { 'display' : 'none' } ); } } );
        }

        // 확장 메뉴를 보여주거나 닫는다.
        function ShowSubMenu( strId ){
            var lySubMenu = $( strId );

            if( lySubMenu.first().is( ":hidden" ) ){
                $( strId ).slideDown( 300 );
            } else{
                $( strId ).slideUp( 300 );
            }
        }

        $( document ).ready( function()
            {
                $('.menu_2' ).hide();
        });
        
    </script>


	<script type="text/javascript">
	
	$(function(){
		$("#searchBtn").click(function(){
			document.searchform.action="search.do";
			document.searchform.submit();
		});
	});
		
	</script>
	
</head>
<body>

 <div class="header">

        <div id="top_menu">
            <ul>
            	<c:choose>
            		<c:when test="${sessionScope.email == null }">
            			<li><a href="${path }/member/login.do" class="topmenu">로그인</a></li>
                		<li><a href="${path }/member/join1.do" class="topmenu">회원가입</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><p>${sessionScope.name}님</p></li>
            			<li><a href="/member/logout.do">로그아웃</a>
            			<li><a href="${path}/mypage/myCart.do?email=${sessionScope.email}" class="topmenu">카트</a></li>
            		</c:otherwise>
            	</c:choose>
                <li><a href="/event.do" class="topmenu">이벤트</a></li>
                <li><a href="/QnA.do" class="topmenu">고객센터</a></li>
            </ul>
        </div><!--top_menu-->

        <div id="mid_menu">
            <div id="logo_box">
                <img id="logo" src="../images/logo.png" alt="보람줄 로고" >
                <a id="logo_text" href="/">Boramjul</a>
            </div>  
			
            <div id="search_box">
                <div id="search">
                	<form name="searchform" method="get" >
	                    <input id="search_text" name="search" type="search" placeholder="Search...">
	                    <button id="searchBtn" type="submit"></button>
                    </form>
                </div>
            </div>

        </div><!--mid_menu-->

        <div id="main_menu">

                <ul>
                <!--  모바일 css버전으로 만든거라 일딴 보류해놓을게요
                    <li>
                        <img class="menuBar"src="../images/menubar.svg" width="25" height="17" onclick="ShowMenu()">
                        <div class="menu_bg">
                            <div class="menu">
                                <div id="exBtn" onclick="HideMenu()"><div>x</div></div>
                                <div id="my_menu">
                                    <div id="my_menu_list">
                                        <div id="Mdiv"><span id="Mspan">My page</span></div>
                                            <ul>
                                                <li><a class="topmenu" href="../mypage/myList.html">주문내역 조회</a></li>
                                                <li><a class="topmenu" href="../mypage/myCart.html">장바구니</a></li>
                                                <li><a class="topmenu" href="../mypage/membership.html">나의 등급</a></li>
                                                <li><a class="topmenu" href="../mypage/myReview.html">나의 후기</a></li>
                                                <li><a class="topmenu" href="../mypage/myInfo.html">회원정보 변경</a></li>
                                            </ul>
                                    </div>
                                </div>
                            </div>
                            </div>
                    </li>
                     -->
                    <li><a href="BestSellers.do" class="topmenu">BEST SELLERS</a></li>
                    <li><a href="NewBooks.do" class="topmenu">NEW BOOKS</a></li>
                    <li><a href="ReviewsList.do" class="topmenu">BOOK REVIEWS</a></li>
                    <li><a href="map.do" class="topmenu">BOOK STORES</a></li>
                    <li><a href="${path }/mypage/myList.do?email=${sessionScope.email}" class="topmenu">MEMBERSHIP</a></li>
                </ul>
        </div><!--main_menu-->

        <div id="header_line"></div>

    </div>
    
</body>
</html>