<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<%@ include file="../include/include.jsp" %>
<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<div class=wrap>
    <div class="dividing_line">
        <h1 id="BP-h1">리뷰 작성</h1>
    </div>
    <div class="write-review-wrapper">
    <div id="searched_reviewing_book">
        <div class="searched-reviewing-book">   
        <div><img src="images/rules.jpg" alt="책 이미지" id="searched_bookimg"></div> 
        <div class="searched_books_info">
            <div class="searched_books_title">질서 너머</div>
            <div class="searched_books_info_d">
              <span class="book_author">조던 B. 피터슨</span><span> 저</span>
              <span class="divi">|</span>
              <span class="book_publisher">웅진지식하우스</span>
              <span class="divi">|</span>
              <span class="book_author">Beyond Order : 12 More Rules for Life</span>          
            </div>
            <div class="searched_books_price">판매가:
              <span class="price-of-searched-books">14,400원</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점3.svg" alt="별점" class="star"> 6.0</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 2222건</span>
            </div>
        </div>
        </div>     
        <div class="clearBoth"></div>
    </div>    
    <table class="myrating" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                    <th>
                        <span style="padding-right: 5px;">별점:</span> 
                    </th>
                    <td>
                        <img class="star"  src="images/별점1.svg" style="cursor: pointer;" score="1">
                        <img class="star"  src="images/별점1.svg" style="cursor: pointer;" score="2">
                        <img class="star"  src="images/별점1.svg" style="cursor: pointer;" score="3">
                        <img class="star"  src="images/별점1.svg" style="cursor: pointer;" score="4">
                        <img class="star"  src="images/별점1.svg" style="cursor: pointer;" score="5">
                    </td>
                </tr>
            </tbody></table>
        
            
    <tbody>
        <tr>
            <td><input type="text" class="write-review-boxT" placeholder="Enter your review title" name="write-review-title" maxlength="50" style="display: block; height: 20px;"></td>
        </tr>
        <tr>
            <td><textarea class="write-review-boxC" placeholder="Enter your review" name="write-review-content" maxlength="10000" style="display: block; height: 800px;"></textarea></td>            
        </tr>
        
    </tbody>
    <div class="clearBoth"></div>
        <div><input type="submit" id="post_btn" value="리뷰 등록"></div>
    <div class="clearBoth"></div>        
    </div>
</div>        
</body>
</html>