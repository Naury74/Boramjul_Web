<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path }/css/order.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<script type="text/javascript">

//주소검색 api
function showPostCode(){
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = '';
            var extraAddr = '';
            
            if (data.userSelectedType == 'R') {  //사용자가 도로명 주소('R')를 선택했을 경우
            	addr = data.roadAddress;
            } else {//   //사용자가 지번 주소('J')를 선택했을 경우
            	addr = data.jibunAddress;
            }

            document.getElementById('address').value = addr;
            document.getElementById('address').focus();
        } // oncomplete: function(data);
    }).open();
}// showPostCode();



//회원 기존정보 불러오기
function getInfo(event){
	const radioId = event.target.id;
	
	if(radioId == 'original'){
		$('input[name="address"]').val(['${memberdto.address}']);
		$('input[name="phone"]').val(['${memberdto.phone}']);
		document.getElementById('address').readOnly = true;
		document.getElementById('phone').readOnly = true;
	}else{
		$('input[name="address"]').val(['']);
		$('input[name="phone"]').val(['']);
		document.getElementById('address').readOnly = false;
		document.getElementById('phone').readOnly = false;
	}
}

//포인트가 변경시 최종결제금액 변경
function changePoint(){
	var v_point = document.getElementById("usereserves").value; //사용할 포인트 (input 입력값)
	var order_tot = ${map.order_tot };//전체금액
	var saleprice = document.getElementById("saleprice").value; //할인받는 금액
	var amt = order_tot - saleprice;

	if(v_point > amt ){ //결제금액보다 포인트가 더 클 때
		v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
		document.getElementById("usereserves").value = v_point; //input 값 재설정
	}
	$('input[name="payprice"]').val(amt - v_point);

}
	

$(function(){
	
	//결제수단 선택
	var $select_pay = $(".select_pay");
	var $card = $(".card");
	var $etc = $(".etc");
	var $other = $(".other");
	
	$select_pay.find("input").on({
		click : function (){
			var $cardChk = $card.is(':checked');
			var $etcChk = $etc.is(':checked');
	
			if($cardChk) {
				$other.find("input").attr("disabled", "true"); 			
			} else if ($etcChk) {
				$other.find("input").attr("disabled", "false");
				$other.find("input").removeAttr("disabled");
			}
		}
	});

	//구매버튼 클릭시
	$('.btn_pay').click(function(){
		var confirm_val = confirm("구매하시겠습니까?");
		
		if(confirm_val){
			var cartarr = new Array();
			
			$("input[name='cartnum']").each(function(){
			cartarr.push($(this).attr("data-cartnum"));
			});
			
			$.ajax({
				url:"/mypage/order_result_3.do",
				type:"post",
				data:{cartnum:cartarr},
				success: function(result){
					if(result == 1){
						document.order.action ="${path}/mypage/completed.do?email=${sessionScope.email}";
						document.order.submit();
					} else{
						arlet('구매 실패');
					}
				}
			});//ajax
		}//if
	});//function()
	
	//기타버튼 클릭시 기타입력창 생성
	$('input[type="radio"][id="request_etc"]').on('click', function(){
		var chkValue = $('input[type=radio][id="request_etc"]:checked').val();
		
		if(chkValue){
			$('#etc_view').css('display','inline-block');
		}else{
			$('#etc_view').css('display','none');
		}
   	 });
	
	var rank = '${memberdto.rank }';//랭크
	var sale = '';//할인율
	var order_tot = '${map.order_tot }';//전체금액
	var saleprice = ''; //할인받는 금액
	var point = $('input[name="usereserves"]').val();;
	var payprice = '';//할인 후 최종금액
	var addreserves = '';
	
	console.log(rank);
	
	//랭크별 할인금액
	if(rank == '브론즈'){
		sale = 0.05;
		saleprice = order_tot*sale;
		payprice = order_tot-saleprice-point;
		addreserves = payprice * 0.01;
		var floor = Math.floor(addreserves);
		$('input[name="saleprice"]').val(saleprice);
		$('input[name="payprice"]').val(payprice);
		$('input[name="addreserves"]').val(floor);
	}else if(rank == '실버'){
		sale = 0.1;
		saleprice = order_tot*sale;
		payprice = order_tot-saleprice-point;
		addreserves = payprice * 0.01;
		var floor = Math.floor(addreserves);
		$('input[name="saleprice"]').val(saleprice);
		$('input[name="payprice"]').val(payprice);
		$('input[name="addreserves"]').val(floor);
	}else{
		sele = 0.15;
		saleprice = order_tot*sale;
		payprice = order_tot-saleprice-point;
		addreserves = payprice * 0.01;
		var floor = Math.floor(addreserves);
		$('input[name="saleprice"]').val(saleprice);
		$('input[name="payprice"]').val(payprice);
		$('input[name="addreserves"]').val(floor);
	}
	
	//포인트 전체 차감
	$('input[type="checkbox"][id="pointChk"]').on('click', function(){
		console.log('포인트 전체 차감');
		var chkValue = $('input[type=checkbox][id="pointChk"]:checked').val();
		var saleprice = $('input[name="saleprice"]').val();
		var mypoint = '${memberdto.reserves }';
		
		if(chkValue){
			if(mypoint>saleprice){
				mypoint = payprice;
				payprice = order_tot-saleprice-mypoint;
			}
			payprice = order_tot-saleprice-mypoint;
			$('input[name="usereserves"]').val(mypoint);
			$('input[name="payprice"]').val(payprice);
		}else{
			payprice = order_tot-saleprice-point;
			$('input[name="usereserves"]').val('0');
			$('input[name="payprice"]').val(payprice);
		}
	});

	

	
});


</script>
</head>
<body>
<!-- container -->
<section id="container">
	<%@ include file="../include/header.jsp" %>
    <div class="contents">

        <section class="order">
            <div class="menu_name_box">
                <p class="menu_name">Order</p>
            </div>
			<form method="post" name="order" accept-charset="UTF-8">
            <div class="order_list">
                <table>
                    <tr style="height: 40px;">
                        <td></td>                       
                        <td>책 제목</td>
                        <td>가격</td>
                        <td>할인내역</td>
                        <td>수량</td>
                    </tr>
                    <c:forEach var="row" items="${map.list }">
                    <tr>
                        <td><img src="${row.image}" alt="책 이미지" class="bookimg">
                        	<input type="hidden" name="cartnum" value="${row.cartnum }" data-cartnum="${row.cartnum }">
                        </td>
                        <td>${row.name }</td>
                        <td><fmt:formatNumber value="${row.price }" pattern="#,###,###"/>원</td>
                        <td>${memberdto.rank }등급 할인<br></td>
                        <td>${row.quantity }권</td>
                    </tr>
                    </c:forEach>
                </table>
            </div> <!--order_list-->

            <div class="Recipient_Info">
                <p class="menu_name">Recipient Info</p>
                <table>
                    <tr>
                        <td>주문인</td>
                        <td class="add_radio">
                        	<input type="text" id="name" placeholder="이름" name="name" value="${memberdto.name}" readonly>
                        	<input type="radio" id="original" name="info_radio" onclick="javascript:getInfo(event)" required/>
                            <label for='original_address'>기존 정보 사용</label>
                            <input type="radio" id="new" name="info_radio" onclick="javascript:getInfo(event)"/>
                            <label for='new_address'>새로운 주문정보 입력</label>
                       	</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td >
                            <input type="text" id="address" name="address"  required/>
                            <input type="button" value="검색" onclick="showPostCode()">
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="tel" class="phone" id="phone" name="phone" placeholder="ex) 010-0000-0000" required> 
                        </td>
                    </tr>
                    <tr>
                        <td>요청사항</td>
                        <td>
                            <div class="del_radio">
                                <input type="radio" id="request" name="request" value="경비실" required>경비실
                                <input type="radio" id="request" name="request" value="문 앞">문 앞
                                <input type="radio" id="request" name="request" value="무인 택배함">무인 택배함
                                <input type="radio" id="request" name="request" value="직접 수령">직접 수령
                                <input type="radio" id="request_etc" name="request" value="기타">기타
                                <div id="etc_view" style="display:none;">
                                <input type="text"  name="request" style="border-bottom: solid 1px rgb(94, 94, 94);
																	      border-top: 0;
																	   	  border-left: 0;
																	      border-right: 0;
																	      width: 270px;"> </div>
                            </div><!-- inner -->
                        </td>
                    </tr>
                </table> 
            </div><!--Recipient_Info-->

            <div class="payment_warp">
                <p class="menu_name">Payment info</p>
                <div class="inner">

                    <div class="select_pay">
                        <ul>
                            <li>
                                <input type="radio" class="card" id="pay" name="pay" value="카드" required>
                                <label for="card">신용카드</label>
                            </li>
                            <li>
                                <input type="radio" class="etc" id="pay" name="pay">
                                <label for="etc">다른결제수단</label>
                            </li>
                            <li class="other">
                                <input type="radio" id="kakao" class="pay" name="pay" value="카카오">
                                <img src="../images/ico_kakao.png" alt="카카오페이 이미지">
                                <label for="kakao">카카오페이</label>
                                <input type="radio" id="naver" class="pay" name="pay" value="네이버">
                                <img src="../images/ico_naver.png" alt="네이버페이 이미지">
                                <label for="naver">네이버페이</label>
                            </li>
                        </ul>
                    </div><!-- select_pay -->

                    <div class="payment">
                        <ul>
                            <li>
                                <div class="price">
                                    <dl>
                                        <dt>상품금액</dt>
                                        <dd><span class="order_tot">
                                        		<fmt:formatNumber value="${map.order_tot }" pattern="#,###,###"/>
                                        		<input type="hidden" value="${map.order_tot }" name="totalprice"/>
                                        	</span>원</dd>
                                    </dl>
                                    <dl>
                                        <dt>배송비</dt>
                                        <dd><span class="pay_delivery">0</span>원</dd>
                                    </dl>
                                    <dl>
                                        <dt>할인금액</dt>
                                        <dd><input type="number" class="saleprice" id="saleprice" name="saleprice" readonly>원</dd>
                                    </dl>
                                    <dl>
                                        <dt>나의 포인트<br><span id="mypoint" class="mypoint">(<fmt:formatNumber value="${memberdto.reserves }" pattern="#,###,###"/>P)</span>
                                            <input type="checkbox" name="checkbox" id="pointChk">전체 사용
                                        </dt>
                                        <dd><span><input type="number" name="usereserves" id="usereserves" class="usereserves" min="0" max="${memberdto.reserves }" 
                                        			 onchange="javascript:changePoint()" value="0" style="width:55px; padding:0;"/>
                                       			 <input type="hidden" name="addreserves" value=""/>
                                    		</span>P</dd>
                                    </dl>
                                </div><!-- price -->
                            </li>
                            <li>
                                <div class="final">
                                    <dl>
                                        <dt>최종 결제 금액</dt>
                                        <dd><input type="number" class="payprice" id="payprice" name="payprice" readonly>원</dd>
                                    </dl>
                                </div><!-- final -->
                            </li>
                            <li>
                                <div class="agree">
                                    <input type="checkbox" id="order_agree" required>
                                    <label for="order_agree">주문내역확인 동의(필수)</label>
                                </div><!-- agree -->
                            </li>
                            <li>
                                <button class="btn_pay">결제하기</button>
                            </li>
                        </ul>
                    </div><!-- payment -->
                </div><!-- inner -->
            </div><!-- payment_warp -->
            </form> 
        </section><!-- order -->
        
    </div><!-- contents -->
    <%@ include file="../include/footer.jsp" %>
</section>
        
</body>
</html>