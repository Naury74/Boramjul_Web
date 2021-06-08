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
	        var $quantity = $(ths).parents("td").find("input[name='quantity']");
	        var count = Number($quantity.val());
	
	        if(type=='p'){
	            if(count >=0) $quantity.val(Number(count)+1);
	        }else{
	            if(count >1) $quantity.val(Number(count)-1);    
	        }
	    }
    	
        //체크박스 함수
        $(function(){
            $("#allCheck").click(function(){
            	var allchk = $("#allCheck").prop("checked");
            	
                if(allchk) {
                    $(".check").prop("checked",true);
                } else {
                    $(".check").prop("checked",false); 
                } 
            });
        }) ;

		$(function(){
			$('#buyBtn').click(function(){
				var confirm_val = confirm("구매하시겠습니까?");
				
				if(confirm_val){
					var checkArr = new Array();
					
					$("input[class='check']:checked").each(function(){
						checkArr.push($(this).attr("data-cartnum"));
					});
					
					$.ajax({
						url:"/mypage/order_insert.do",
						type:"post",
						data:{check:checkArr},
						success: function(result){
							if(result == 1){
								location.href="${path}/mypage/order.do?email=${sessionScope.email}";
							} else{
								alert('구매 실패');
							}
						}//ajax
					})
				}//if
			});
			
			$('#updateBtn').click(function(){
				document.form.submit();
			});
			
			$('#delBtn').click(function(){
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				
				if(confirm_val){
					var checkArr = new Array();
					
					$("input[class='check']:checked").each(function(){
						checkArr.push($(this).attr("data-cartnum"));
					});
					
					$.ajax({
						url:"/mypage/cart_delete.do",
						type:"post",
						data:{check:checkArr},
						success: function(result){
							if(result == 1){
								location.href="${path}/mypage/myCart.do";
							} else{
								alert('삭제 실패');
							}

						}//ajax
					})
				}//if
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
                    <td></td>
                    <td>책 제목</td>
                    <td>판매가</td>
                    <td>수량</td>
                    <td>합계</td>
                    <td><input type="checkbox" name="allCheck" class="check" id="allCheck" ></td>
                </tr>
                <c:choose>
                    <c:when test="${map.count == 0 }">
	                	<tr>
	                		<td colspan="6">장바구니가 비었습니다</td>
	                	</tr>
                	</c:when>
                	
                	<c:otherwise>
                		<form name="form" method="post" action="${path}/mypage/cart_update.do">
	                	<c:forEach var="row" items="${map.list }">
		                	<tr>
			                    <td><img src="${row.image}" alt="책 이미지" class="bookimg"></td>
			                    <td>${row.prodname }</td>
			                    <td><fmt:formatNumber value="${row.price }" pattern="#,###,###"/>원
			                    	<input type="hidden" name="price" value="${row.price }"/>
			                    </td>
			                    <td>
			                        <div class="num">
			                            <button  class="numBtn" type="button" onclick="Count('m', this);">-</button>
			                            <input class="num_input" type="text" name="quantity" value="<fmt:formatNumber value="${row.quantity}"/>" readonly="readonly" size="1"/>
			                            <button class="numBtn" type ="button" onclick="Count('p',this);">+</button>
			                        </div>
			                    </td>
			                    <td><fmt:formatNumber value="${row.totalprice }" pattern="#,###,###"/>원</td>
			                    <td>
			                    	<input type="checkbox" name="check" class="check" data-cartnum="${row.cartnum }"/>
			                    	<input type="hidden" name="cartnum" value="${row.cartnum }" />

			                    </td>
		                	</tr>   
	                	</c:forEach>
	                	</form>
                	</c:otherwise>  
               	</c:choose>       
            </table>
        </div><!--table-->
		<c:choose>
			<c:when test="${map.count == 0 }">
			</c:when>
			
			<c:otherwise>
				<div id="tot"><p>총 합계: <fmt:formatNumber value="${map.cart_tot }" pattern="#,###,###"/>원</p></div>
		
		        <div id="cart_btn">
		            <button id ="delBtn" name="delBtn" type="submit" data-cartnum="${row.cartnum }">선택 삭제</button>
		            <button id ="updateBtn">수정 하기</button>
		            <button id="buyBtn" name="buyBtn" type="submit" data-cartnum="${row.cartnum }">구매 하기</button>
		        </div>
			</c:otherwise>

        </c:choose>	 
         
    </div><!--box-->
         
    <%@ include file="../include/footer.jsp" %>

</div><!--wrap-->


</body>
</html>