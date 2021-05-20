<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path }/css/order.css">
</head>

<script type="text/javascript">
	
$(function(){
	//결제수단 선택
	var $select_pay = $(".select_pay");
	var $card = $("#card");
	var $etc = $("#etc");
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
	
	
	//payment
	var $pay_product = $(".pay_product").text();
	var $pay_delivery = $(".pay_delivery").text();
	var $pay_discount = $(".pay_discount").text();
	var $pay_point = $(".pay_point").text();
	var $pointChk = $(".pointChk");
	var $pay_total = $(".pay_total");
	
	var _point = null;
	var _sum = RemoveComma($pay_product) - RemoveComma($pay_delivery) - RemoveComma($pay_discount);
	
	$pointChk.on({
		click : function () {
			var isChecked = $pointChk.is(':checked');
	
			if(isChecked) {
				_point = RemoveComma($pay_point);
				$pay_total.text(commify(_sum - _point));
			} else {
				$pay_total.text(commify(_sum));
			}
		}
	});
	
	
	//쉼표빼기
	function RemoveComma(str){
		return parseInt(str.replace(/,/g,""));
	}
	
	//쉼표 추가
	function commify(n) {
		var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
		n += '';                          // 숫자를 문자열로 변환
	
		while (reg.test(n))
		  n = n.replace(reg, '$1' + ',' + '$2');
		return n;
	}
	
	$('.btn_pay').click(function(){
		location.href="${path}/etc/completed.do";
	});
	
});
</script>
<body>
<!-- container -->
	<section id="container">
		<%@ include file="../include/header.jsp" %>

	    
	    <div class="contents">
	
	        <section class="order">
	            <div class="menu_name_box">
	                <p class="menu_name">Order</p>
	            </div>
	
	            <div class="order_list">
	                <table>
	                    <tr style="height: 40px;">
	                        <td></td>
	                        <td>책 제목</td>
	                        <td>가격</td>
	                        <td>할인내역</td>
	                        <td>수량</td>
	                    </tr>
	                    <tr>
	                        <td><img src="../images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
	                        <td>아몽드</td>
	                        <td>12000원</td>
	                        <td>실버 등급할인 10%<br>1200원</td>
	                        <td>1권</td>
	                    </tr>
	                </table>
	            </div> <!--order_list-->
	
	            <div class="Recipient_Info">
	                <p class="menu_name">Recipient Info</p>
	                <table>
	                    <tr>
	                        <td>주문인</td>
	                        <td><input type="text" id="name" placeholder="이름" required></td>
	                    </tr>
	                    <tr>
	                        <td>주소</td>
	                        <td>
	                            <input type="text" id="address1" required>
	                            <button>주소검색</button><br>
	                            <input type="text" id="address2"required>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>휴대폰</td>
	                        <td>
	                            <input type="tel" class="phone" placeholder="' - ' 제외하여 입력" required> 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>요청사항</td>
	                        <td>
	                            <div class="inner">
	                                <div class="choice">
	                                    <input type="radio" id="request_01" required>
	                                    <label for="request_01">경비실</label>
	                                </div>
	                                <div class="choice">
	                                    <input type="radio" id="request_02" required>
	                                    <label for="request_02">문 앞</label>
	                                </div>
	                                <div class="choice">
	                                    <input type="radio"id="request_03" required>
	                                    <label for="request_03">무인 택배함</label>
	                                </div>
	                                <div class="choice">
	                                    <input type="radio" id="request_04" required>
	                                    <label for="request_04">직접 수령</label>
	                                </div>
	                                <div class="choice">
	                                    <input type="radio" id="request_05" required>
	                                    <label for="request_05">기타</label>
	                                    <input type="text" placeholder="" required>
	                                </div>
	                            </div>
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
	                                <input type="radio" id="card" name="pay_choice">
	                                <label for="card">신용카드</label>
	                            </li>
	                            <li>
	                                <input type="radio" id="etc" name="pay_choice">
	                                <label for="etc">다른결제수단</label>
	                            </li>
	                            <li class="other">
	                                <input type="radio" id="kakao" class="kakao" name="pay_choice_01">
	                                <img src="../images/ico_kakao.png" alt="">
	                                <label for="kakao">카카오페이</label>
	                                <input type="radio" id="naver" class="naver" name="pay_choice_01">
	                                <img src="../images/ico_naver.png" alt="">
	                                <label for="naver">네이버페이</label>
	                            </li>
	                        </ul>
	                    </div>
	
	                    <div class="payment">
	                        <ul>
	                            <li>
	                                <div class="price">
	                                    <dl>
	                                        <dt>상품금액</dt>
	                                        <dd><span class="pay_product">45,000</span>원</dd>
	                                    </dl>
	                                    <dl>
	                                        <dt>배송비</dt>
	                                        <dd><span class="pay_delivery">0</span>원</dd>
	                                    </dl>
	                                    <dl>
	                                        <dt>할인금액</dt>
	                                        <dd><span class="pay_discount">4,500</span>원</dd>
	                                    </dl>
	                                    <dl>
	                                        <dt>포인트 사용
	                                            <input type="checkbox" class="pointChk">
	                                        </dt>
	                                        <dd><span class="pay_point">500</span>원</dd>
	                                    </dl>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="final">
	                                    <dl>
	                                        <dt>최종 결제 금액</dt>
	                                        <dd><span class="pay_total">40,500</span>원</dd>
	                                    </dl>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="agree">
	                                    <input type="checkbox" id="order_agree">
	                                    <label for="order_agree">주문내역확인 동의(필수)</label>
	                                </div>
	                            </li>
	                            <li>
	                                <button class="btn_pay">결제하기</button>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </section>
	        
	    </div>
	    <%@ include file="../include/footer.jsp" %>
	</section>
        
</body>
</html>