<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 카테고리 메뉴</title>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
	<%@ include file="../include/include.jsp" %>
</head>

<script type="text/javascript">

	$(function category(){
		console.log('jqueryok');
	});

	function goCategory(url, category){
		location.href="${path}/books/"+category+".do";
	}

</script>
<body>
<div class="List-left">
      <h3 id="List-h3">도서 분야</h3>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Novel')">소설</a>
        </li>  
        <li class="">
          <a href="javascript:goCategory('/books/', 'Essay')">시/에세이</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Economy')">경제/경영</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'SelfHelp')">자기계발</a>
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Humanities')">인문</a>
        </li>
    
        <li class="">
          <a href="javascript:goCategory('/books/', 'History')">역사/문화</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Religion')">종교</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Politics')">정치/사회</a> 
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Art')">예술/대중문화</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Science')">과학</a>
        </li>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Technology')">기술/공학</a>
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'IT')">컴퓨터/IT</a>        
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Toddler')">유아(0~7세)</a></li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Children')">어린이(초등)</a>
        </li>
    
        <li class="">
          <a href="javascript:goCategory('/books/', 'ChildrenComp')">어린이전집</a>          
        </li>
    
        <li class="">
          <a href="javascript:goCategory('/books/', 'ChildrenEng')">어린이영어</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Teenager')">청소년</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Elementary')">초등참고서</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'MiddleHigh')">중/고등참고서</a>        
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'University')">대학교재</a>
        </li>        
        <li class="">
          <a href="javascript:goCategory('/books/', 'OpenUniversity')">방송통신대교재</a>
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Job')">취업/수험서</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Language')">외국어</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Family')">가정/육아</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Health')">건강</a>          
        </li>    
        <li class="">
        <a href="javascript:goCategory('/books/', 'Travel')">여행</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Cooking')">요리</a>
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Hobby')">취미/실용/스포츠</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Magazine')">잡지</a>          
        </li>    
        <li class="">
          <a href="javascript:goCategory('/books/', 'Comics')">만화</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="javascript:goCategory('/books/', 'Korea')">한국소개도서</a>            
        </li>    
      </ul>
    </div>
</body>
</html>