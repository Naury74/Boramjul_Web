<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>검색결과</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<body>
<div class=wrap>
	<%@ include file="../include/header.jsp" %>
  <div class="dividing_line">
    <h1 id="BP-h1"> "${dto.search }"의 검색결과</h1>
  </div>  
  <div class="List-wrapper"> 
    <div class="List-left">
      <h3 id="List-h3">도서 분야</h3>
      <ul>
        <li class="">
          <a href="Category-Novel.do" class="">소설</a>
        </li>  
        <li class="">
          <a href="Category-Essay.do">시/에세이</a>
        </li>
        <li class="">
          <a href="Category-Economy.do">경제/경영</a>
        </li>
        <li class="">
          <a href="Category-SelfHelp.do">자기계발</a>
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="Category-Humanities.do">인문</a>
        </li>
    
        <li class="">
          <a href="Category-History.do">역사/문화</a>
        </li>
        <li class="">
          <a href="Category-Religion.do">종교</a>
        </li>
        <li class="">
          <a href="Category-Politics.do">정치/사회</a> 
        </li>
        <li class="">
          <a href="Category-Art.do">예술/대중문화</a>
        </li>
        <li class="">
          <a href="Category-Science.do">과학</a>
        </li>
        <li class="">
          <a href="Category-Technology.do">기술/공학</a>
        </li>    
        <li class="">
          <a href="Category-IT.do">컴퓨터/IT</a>        
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="Category-Toddler.do">유아(0~7세)</a></li>    
        <li class="">
          <a href="Category-Children.do">어린이(초등)</a>
        </li>
    
        <li class="">
          <a href="Category-ChildrenComp.do">어린이전집</a>          
        </li>
    
        <li class="">
          <a href="Category-ChildrenEng.do" class="">어린이영어</a>          
        </li>    
        <li class="">
          <a href="Category-Teenager.do">청소년</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="Category-Elementary.do" class="">초등참고서</a>          
        </li>    
        <li class="">
          <a href="Category-MiddleHigh.do">중/고등참고서</a>        
        </li>    
        <li class="">
          <a href="Category-University.do">대학교재</a>
        </li>        
        <li class="">
          <a href="Category-OpenUniversity.do">방송통신대교재</a>
        </li>    
        <li class="">
          <a href="Category-Job.do" class="">취업/수험서</a>          
        </li>    
        <li class="">
          <a href="Category-Language.do">외국어</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="Category-Family.do">가정/육아</a>          
        </li>    
        <li class="">
          <a href="Category-Health.do">건강</a>          
        </li>    
        <li class="">
        <a href="Category-Travel.do">여행</a>          
        </li>    
        <li class="">
          <a href="Category-Cooking.do">요리</a>
        </li>    
        <li class="">
          <a href="Category-Hobby.do">취미/실용/스포츠</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="Category-Magazine.do">잡지</a>          
        </li>    
        <li class="">
          <a href="Category-Comics.do" class="">만화</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="Category-Korea.do">한국소개도서</a>            
        </li>    
      </ul>
    </div>
    <div class="List-right">
      <div id="related_books">
        
        <div class="clearBoth"></div>
        <div class="page-move">
          <a href="javascript:;" onclick="searchList(1)" class="prev"><span></span>이전</a>
          <a href="javascript:;" onclick="searchList(1)" class="page-on">1</a>
          <a href="javascript:;" onclick="searchList(2)">2</a>
          <a href="javascript:;" onclick="searchList(3)">3</a>
          <a href="javascript:;" onclick="searchList(4)">4</a>
          <a href="javascript:;" onclick="searchList(5)">5</a>
          <a href="javascript:;" onclick="searchList(6)">6</a>
          <a href="javascript:;" onclick="searchList(7)">7</a>
          <a href="javascript:;" onclick="searchList(8)">8</a>
          <a href="javascript:;" onclick="searchList(9)">9</a>
          <a href="javascript:;" onclick="searchList(10)">10</a>
          <a href="javascript:;" onclick="searchList(11)" class="next">다음<span></span></a>
          <a href="javascript:;" style="display:none;" onclick="searchList(2)" class="accesskey_118" accesskey="v"></a>
        </div>
      </div>
    
    </div>  
  </div>
     <%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>