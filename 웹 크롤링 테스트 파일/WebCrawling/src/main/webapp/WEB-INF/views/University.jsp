<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대학교재 분야 베스트셀러</title>
<link href="resources/css/PagesForBooks.css" rel="stylesheet" >
</head>
<body>
<div class=wrap>
  <div class="dividing_line">
    <h1 id="BP-h1">베스트셀러 - 대학교재</h1>
  </div>  
  <div class="List-wrapper"> 
    <div class="List-left">
      <h3 id="List-h3">도서 분야</h3>
      <ul>
        <li class="">
          <a href="" class="">소설</a>
        </li>  
        <li class="">
          <a href="">시/에세이</a>
        </li>
        <li class="">
          <a href="">경제/경영</a>
        </li>
        <li class="">
          <a href="">자기계발</a>
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="">인문</a>
        </li>
    
        <li class="">
          <a href="">역사/문화</a>
        </li>
        <li class="">
          <a href="">종교</a>
        </li>
        <li class="">
          <a href="">정치/사회</a> 
        </li>
        <li class="">
          <a href="">예술/대중문화</a>
        </li>
        <li class="">
          <a href="">과학</a>
        </li>
        <li class="">
          <a href="">기술/공학</a>
        </li>    
        <li class=""><a href="">컴퓨터/IT</a>        
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="">유아(0~7세)</a></li>    
        <li class="">
          <a href="">어린이(초등)</a>
        </li>
    
        <li class="">
          <a href="">어린이전집</a>          
        </li>
    
        <li class="">
          <a href="" class="">어린이영어</a>          
        </li>    
        <li class="">
          <a href="">청소년</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="" class="">초등참고서</a>          
        </li>    
        <li class="">
          <a href="">중/고등참고서</a>        
        </li>    
        <li class="">
          <a href="">대학교재</a>
        </li>        
        <li class=""><a href="">방송통신대교재</a>
        </li>    
        <li class="">
          <a href="" class="">취업/수험서</a>          
        </li>    
        <li class="">
          <a href="">외국어</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="">가정/육아</a>          
        </li>    
        <li class="">
          <a href="">건강</a>          
        </li>    
        <li class="">
        <a href="">여행</a>          
        </li>    
        <li class="">
          <a href="">요리</a>
        </li>    
        <li class="">
          <a href="">취미/실용/스포츠</a>          
        </li>
      </ul>
      <ul>
        <li class="">
          <a href="">잡지</a>          
        </li>    
        <li class="">
          <a href="" class="">만화</a>          
        </li>    
      </ul>
      <ul>
        <li class="">
          <a href="">한국소개도서</a>            
        </li>    
      </ul>
    </div>
    <div class="List-right">
      <div id="related_books">
        <c:forEach var="row" items="${universitylist}" varStatus="status"> 
        <!-- 책1 -->
        <div id="searched_books_margin">   
          <div><img src=${row.image } alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${row.name }</div>
            <div class="searched_books_info_d">
              <span class="book_author">${row.content }</span>
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${row.price }</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="/resources/images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="resources/images/review.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>
          <div class="btn_searched"> 
          <div class="num">
            <button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
            <input class="num_input" type="text" name="num" value="0" readonly="readonly" size="1"/>
            <button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
          </div>
          <div>
            <button class="cart_btn" type="button" onclick=>장바구니 추가</button>
          </div>
          <div>
            <button class="buy_btn" type="button" onclick=>바로 구매</button>
          </div>
          </div>
          <div class="clearBoth"></div>     
 		</div>  
        </c:forEach>
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
</div>
</body>
</html>