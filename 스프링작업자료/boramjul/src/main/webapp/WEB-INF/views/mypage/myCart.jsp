<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/mypage.css">
	
	<script type="text/javascript">
	
    	//넘버박스 함수
	    function Count(type, ths){
	        var $num = $(ths).parents("td").find("input[name='quantity']");
	        var count = Number($quantity.val());
	
	        if(type=='p'){
	            if(count >=0) $quantity.val(Number(count)+1);
	        }else{
	            if(count >0) $quantity.val(Number(count)-1);    
	        }
	    }
    	
        //체크박스 함수
        $(function(){ 
            $("#allCheck").click(function(){
                if($("#allCheck").prop("checked")) { 
                    $("input[type=checkbox]").prop("checked",true);
                } else { 
                    $("input[type=checkbox]").prop("checked",false); } 
            }) 
        }) 
        
		$(function(){

			$('#buyBtn').click(function(){
				document.form1.submit();
			});
			
			$('#delBtn').click(function(){
				if(confirm("장바구니를 비우겠습니까?")){
					location.href="${path}/shop/cart/deleteAll.do";
				} 
			});					
		});
	</script>
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
            <p>CART</p>
        </div>

        <div class="table">
            <table>
                <tr style="height: 40px;">
                    <td colspan="2"></td>
                    <td>책 제목</td>
                    <td>판매가</td>
                    <td>수량</td>
                    <td><input type="checkbox" name="check" class="check" id="allCheck" checked ></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                    <td>아몽드</td>
                    <td>12000원</td>
                    <td>
                        <div class="num">
                            <button  class="numBtn" type="button" onclick="Count('m', this);">-</button>
                            <input class="num_input" type="text" name="quantity" value="1" readonly="readonly" size="1"/>
                            <button class="numBtn" type ="button" onclick="Count('p',this);">+</button>
                        </div>
                    </td>
                    <td><input type="checkbox" name="check" class="check" checked></td>
                </tr>
                
            </table>
        </div><!--table-->

        <div id="tot"><p>총 합산 금액: <strong>36000</strong>원</p></div>

        <div id="cart_btn">
            <button id ="delBtn" name="delBtn" type="submit">선택 삭제</button>
            <button id="buyBtn" name="buyBtn" type="submit">구매 하기</button>
        </div>

    </div><!--box-->

    <%@ include file="../include/footer.jsp" %>

</div><!--wrap-->


</body>
</html>