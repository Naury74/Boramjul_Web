<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOIN-1</title>
    <%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="../css/join1.css">
</head>
<script type="text/javascript">
        $(function(){
    	
   		 $("#btnCheck").click(function(){
                if($("#check1").is(":checked") && $("#check2").is(":checked")) { 
                	
                    location.href="${path}/member/join.do";
                    return true;
                } else {
                	alert('필수항목 체크해주세요.');
                }
           }); //click()
           
          $("#allCheck").click(function(){
        	  if($("#allCheck").is(":checked")) { 
        		  $("#check1").prop("checked",true);
        		  $("#check2").prop("checked",true);
        		  $("#check3").prop("checked",true);
        		  return true;
        	  } else {
        		  $("#check1").prop("checked",false);
        		  $("#check2").prop("checked",false);
        		  $("#check3").prop("checked",false);
        		  $("#check1").click(function(){});
        		  $("#check2").click(function(){});
        		  $("#check3").click(function(){});
        		  return true;
        	  }
       	   
          })
          
           
   	})
        </script>
<body>
    <div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">약관 및 동의</a>
    <input type="checkbox" id="allCheck" class="check" style="position: absolute;
                                            width: 30px;
                                            height: 30px;
                                             left: 120px; top:227px;"><a style="position: absolute; left: 170px; top: 233px; font-family: detailfont;
                                                                                font-style: normal; font-size: 23px;font-weight: bold;
                                                                                ">이용약관 모두 동의</a><br><br>
      <hr style="position: absolute; width: 500px; height: 0px; left: 100px; top: 260px; border: 1px solid #A1A1A1;"  >
                                                                     
     <input type="checkbox" name="check" id="check1" class="check" style="position: absolute;
     width: 25px;
     height: 25px;
      left: 200px; top:280px;"><a style="position: absolute; left: 250px; top: 286px; font-family: detailfont;
                                         font-style: normal; font-size: 20px;font-weight: bold;
                                         ">이용약관(필수)</a><br><br>
    <button style="position: absolute;
                                    width: 30px;
                                    height: 30px;
                                    left: 530px;
                                    top: 280px;
                                    border:none;
                                    
                                    font-family: detailfont;
                                    font-weight: 300;
                                    font-size: 10.5px;
                                    line-height: 18px;
                                    text-align: center;
                                   
                                    background-color:white;"><a style="color: black; text-decoration:none; font-weight: bold;" href="${path}/member/join1_1.do" >></a></button>
     <hr style="position: absolute; width: 400px; height: 0px; left: 160px; top: 310px; border: 1px solid #A1A1A1;"  >   

     <input type="checkbox" name="check" id="check2"  class="check" style="position: absolute;
     width: 25px;
     height: 25px;
      left:200px; top:333px;"><a style="position: absolute; left: 250px; top: 340px; font-family: detailfont;
                                         font-style: normal; font-size: 20px;font-weight: bold;
                                         ">개인정보 수집 및 이용동의(필수)</a><br><br>
     <button style="position: absolute;
     width: 30px;
     height: 30px;
     left: 530px;
     top: 335px;
     border:none;
     
     font-family: detailfont;
     font-weight: 300;
     font-size: 10.5px;
     line-height: 18px;
     text-align: center;
    
     background-color: white;"><a style="color:black; text-decoration:none; font-weight: bold;" href="${path }/member/join1_2.do" >></a></button>                                    
     <hr style="position: absolute; width: 400px; height: 0px; left: 160px; top: 365px; border: 1px solid #A1A1A1;"  >                                        
     <input type="checkbox" name="check" id="check3" class="check" style="position: absolute;
     width: 25px;
     height: 25px;
      left: 200px; top:390px;"><a style="position: absolute; left: 250px; top: 395px; font-family: detailfont;
                                         font-style: normal; font-size: 20px;font-weight: bold;
                                         ">홍보성 수신동의(선택)</a><br><br>                                                                                                                                                                               
   
        <a style="position: absolute;
        width: 400px;
        height: 72px;
        left: 150px;
        top: 440px;
        
        font-family: detailfont;
        font-weight: 300;
        font-size: 10.5px;
        line-height: 18px;
        text-align: center;
        
        color: #000000;">보람줄에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(보라줄앱 알림 또는 문자), 
            이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 보람줄 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 
            개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.</a>
   
     <button id="btnCheck"  style="color: white;
	        font-family: mainfont;
	        font-style: normal;
	        font-weight: bold;
	        font-size: 18px;
	        line-height: 21px;
	        text-decoration:none;" >동의
	        <!-- 
	     <a style="color: white;
	        font-family: mainfont;
	        font-style: normal;
	        font-weight: bold;
	        font-size: 18px;
	        line-height: 21px;
	        text-decoration:none;"
	        href="${path}/member/join.do">동의 후 계속하기</a>
	         -->
     </button>
     <br><br> 
     </div>
       
</body>
</html>