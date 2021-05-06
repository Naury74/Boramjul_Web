

// 결제수단 선택
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


// payment
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


// 쉼표빼기
function RemoveComma(str){
	return parseInt(str.replace(/,/g,""));
}

// 쉼표 추가
function commify(n) {
	var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	n += '';                          // 숫자를 문자열로 변환

	while (reg.test(n))
	  n = n.replace(reg, '$1' + ',' + '$2');
	return n;
  }
  
  