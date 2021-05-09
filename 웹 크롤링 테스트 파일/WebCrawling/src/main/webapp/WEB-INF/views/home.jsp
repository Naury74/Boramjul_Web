<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
  	@charset "UTF-8";

*{
    margin: 0;
    padding: 0;
}

@font-face {
    font-family: "gilroy";
    src: url("../fonts/gilroy_light.otf");
}

@font-face {
    font-family: "gmarketM";
    src: url("../fonts/GmarketSansMedium.otf");
}

@font-face {
  font-family: "gmarketL";
  src: url("../fonts/GmarketSansLight.otf");
}

@font-face {
  font-family: "nanum";
  src: url("../fonts/nanumbarungothic.ttf");
}

@font-face {
    font-family: "nanumL";
    src: url("../fonts/nanumbarungothiclight.ttf");
}
p{
  font-family: "nanumL";
  font-size: 16px;
  line-height: 150%;
}
ul{
  list-style:none;
}
.wrap {
  max-width: 1280px;
  margin: auto;
}
.BP-wrapper {
  display: grid;
  grid-template-columns: 450px 2fr;
}
.List-wrapper {
  display: grid;
  grid-template-columns: 250px 2fr;
}
.List-wrapper ul{
  padding: 15px;
  font-size: 20px;
  
  border-bottom:1px solid #A1A1A1;
}
.List-wrapper a{
  text-decoration: none;
  color:black;
}
.BP-top_left {
  padding: 20px 20px 20px 0px;
  margin:0px;
  position: static;
  width:360px;
  height:850px;        
}
.List-left {
  margin-top: 20px;
  padding:0px;
  position: static;
  width:250px;
  box-sizing: border-box; 
  text-align: left;
  border:3px solid #A1A1A1;
  background-color: #EFEFEF;
  height: 1120px;  
}
.BP-top_right {
  padding:0px;
  margin-left: 0px;
  margin-right: 0px;
  margin-top:0px;
  margin-bottom:10px;
  position: static;
  box-sizing: border-box; 
  height: 890px;
  text-align: left;        
}
.List-right {
  padding:0px;
  margin-left: 0px;
  margin-right: 0px;
  margin-top:0px;
  margin-bottom:10px;
  position: static;
  box-sizing: border-box; 
  text-align: left;        
}
.cart_btn {
  font-size: 25px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #664B8E;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 18px;
  border-radius: 20px;
  padding-top: 15px;
  padding-bottom: 15px;
  padding-right: 65px;
  padding-left: 65px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 320px;
  height: 60px;
  justify-content: center;                    
}
.buy_btn {
  font-size: 25px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #434CA5;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 18px;
  border-radius: 20px;
  padding-top: 15px;
  padding-bottom: 15px;
  padding-right: 92px;
  padding-left: 92px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 320px;
  height: 60px;
  justify-content: center;
}
.btn_searched {
  float: right; 
  width: 320px;
  margin-left: 0px;
  margin-right: 0px;
  margin-top:14px;
  margin-bottom:14px;
  text-align: center;
  box-sizing: border-box; 
}
#review_btn {
  font-size: 25px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #434CA5;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 0px;
  border-radius: 20px;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px;
  padding-left: 20px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 180px;
  height: 30px;
  justify-content: center;
  float: right; 
  box-sizing: border-box;
}
#post_btn {
  font-size: 25px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #434CA5;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 0px;
  border-radius: 20px;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px;
  padding-left: 20px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 180px;
  height: 30px;
  justify-content: center;
  float: right; 
  box-sizing: border-box;
  margin-right: 20px;
  margin-bottom: 20px;
}
#like_btn {
  font-size: 20px;
  font-family: "gmarketM";
  color: black;
  background: white;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 0px;
  border-radius: 20px;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px;
  padding-left: 20px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 180px;
  height: 45px;
  justify-content: center;
  box-sizing: border-box;
  margin-right: 20px;
  margin-bottom: 10px;
}
.thumbs-up_btn{
  background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
}
.reply-comment_btn{
  background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
}
#comment-btn {
  font-size: 20px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #434CA5;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 0px;
  border-radius: 20px;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px;
  padding-left: 20px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 180px;
  height: 45px;
  justify-content: center;
  box-sizing: border-box;
  margin-right: 20px;
  margin-bottom: 10px;
  float:right;
}
#list-btn {
  font-size: 20px;
  font-family: "gmarketM";
  color: aliceblue;
  background: #664B8E;
  cursor: pointer;
  appearance: none;
  text-align: center;
  text-decoration: none;
  margin-top: 0px;
  border-radius: 20px;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px;
  padding-left: 20px;
  transition: 0.5s;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  position: static;
  width: 180px;
  height: 45px;
  justify-content: center;
  box-sizing: border-box;
  margin-left: 20px;
  margin-bottom: 10px;
  float:left;
}
#like_btn_wrap {
  text-align: center;
  margin: 30px 30px 0px 30px;
}
.num_btn{
  appearance: none;
  text-decoration: none;
  border: none;
  width: 40px;
  height: 40px;
  cursor: pointer;
  font-size: 26px;
  float: left;
  background-color: rgb(231, 231, 231);
}
.num_btn:focus{
  outline: none;
}
.num_input{
  height: 40px;
  text-align: center;
  float: left; 
  border: 0;
}
.num{
  margin-top: 18px;    border: solid 1px rgb(231, 231, 231);
  border-right: 0;
  display: inline-block;
}
.price {
  width: 320px;
  color: rgba(0, 0, 0, 1);
  letter-spacing: 0%;
  text-align: left;
  font-family: gmarketL;
  font-size: 24px;
  margin-top: 18px;
}    
.price-of-book{
    font-size: 30px;
    font-family: gmarketL;
  }    
  .shipping {
      width: 320px;
      color: rgba(0, 0, 0, 1);
      letter-spacing: 0%;
      text-align: left;
      font-family: gmarketL;
      font-size: 24px;
      margin-top: 18px;
    }
    .price-of-shipping{
      font-size: 26px;
      font-family: gmarketL;
    }
    .bookimg{
      width: 350px;
      height: 500px;
    }
    #BP-h1 {
      font-family: "gmarketM";
      font-size:50px;
      font-weight: 700;
      margin-left: 25px;
      margin-top: 0px;
      margin-bottom: 0px;
      padding-left:20px;
      padding-top: 55px;
      color: white;
    }
    #BP-h2 {
      font-family: "gmarketM";
      font-size:40px;
      font-weight: 700;
      margin-top: 10px;
      margin-bottom: 25px;
    }
    #BP-h3 {
      font-family: "gmarketM";
      font-size:35px;
      font-weight: 500;
      margin: 18px;
    }
    #List-h3 {
      font-family: "gmarketM";
      font-size:35px;
      font-weight: 500;
      margin: 0px;
      padding: 20px;
      background-color: #434CA5;
      color: white;
      text-align: center;
    }
    #review-h3 {
      font-family: "gmarketM";
      font-size:35px;
      font-weight: 600;
      margin: 0px;
      padding: 20px 0px 10px 0px;
      text-align: left;
      border-bottom: 1px solid rgb(231, 231, 231);
    }
    #BP-h4 {
      font-family: "gmarketM";
      font-size:30px;
      font-weight: 400;
      margin-left: 25px;
      margin-top: 0px;
      margin-bottom: 0px;
      padding:20px;
      color: white;
    }
.book_info {
  font-family: gmarketL;
  font-size:20px;
  margin-bottom: 18px
}

.book_details{
  border:3px solid #A1A1A1;
  padding:10px;
  margin:0px;
  position: static;
}
.about_book{
  margin-left: 18px;
}
.about_author {
  margin-left: 18px;
}
    .into_the_book {
      margin-left: 18px;  
    }
    .dividing_line{
      background-color: #664B8E;
      width: 100%;
      height: 160px;
    }
    #dividing_line{
        background-color: #434CA5;
        width: 100%;
        height: 80px;
    }
    .related_books{
      border:3px solid #A1A1A1;
      padding-left:10px;
      padding-right:10px;
      padding-top:10px;
      padding-bottom:30px;
      margin:20px;
      position: relative;
    }
    #related_books{
      border:3px solid #A1A1A1;
      padding-left:10px;
      padding-right:0px;
      padding-top:10px;
      padding-bottom:30px;
      margin:20px 0px 20px 20px;
      position: relative;
    }
    .book_review{
      border:3px solid #A1A1A1;
      padding-left:10px;
      padding-right:10px;
      padding-top:10px;
      padding-bottom:30px;
      margin:20px;
      position: relative;
    }
#search_text{
  width: 550px;
  height: 60px;
  background-color:rgba(196, 196, 196, 1);
  border: 0;
  border-radius: 10px;
  padding-left: 25px;
  font-style: oblique;
  font-family: "nanum";
  text-align: left;
}
#searchBtn{
  width: 30px;
  height: 30px;
  background-color: rgba(196, 196, 196, 1);
  margin-left: -50px;
  vertical-align: middle;
  border: 0;
  box-shadow: none;
}
.searched_bookimg{
  width: 175px;
  height: 250px;
  float: left;
  margin-right: 25px;
   box-sizing: border-box; 
}
#searched_bookimg {
  width: 175px;
  height: 250px;
  float: left;
  margin-right: 25px;
  margin-left: 20px;
  box-sizing: border-box;  
}
.myrating {
  font-size: 30px;
  padding: 30px 20px 0px 30px;
  font-family: 'gmarketL';
  font-weight: 600;
}
.write-review-boxT {
  margin: 30px;
  width: 92%;
  padding: 20px;
  font-size: 20px;
  font-family: "nanumL";
  line-height: 150%;
}
.write-review-boxC {
  margin: 30px;
  width: 92%;
  padding: 20px;
  font-size: 20px;
  font-family: "nanumL";
  line-height: 150%;
}
#comment-write-box {
  margin: 30px 30px 10px 30px;
  width: 92%;
  padding: 20px;
  font-size: 20px;
  font-family: "nanumL";
  line-height: 150%;
}
.searched_books_info {
  float: left; 
  width: 50%;
  height: 250px;
  margin-top: 0px;
  margin-left: 0px;
  margin-right: 0px;
  box-sizing: border-box;
  font-family: gmarketL; 
}
#searched_books_info {
  float: left; 
  width: 45%;
  height: 250px;
  margin-top: 0px;
  margin-left: 0px;
  margin-right: 0px;
  box-sizing: border-box;
  font-family: gmarketL; 
}
.searched_books_review {
  float: left; 
  width: 100%;
  height: 200px;
  margin-top: 0px;
  margin-left: 0px;
  margin-right: 0px;
  box-sizing: border-box;
  font-family: gmarketL; 
}
#searched_books_review {
  float: left; 
  width: 75%;
  height: 200px;
  margin-top: 0px;
  margin-left: 20px;
  margin-right: 0px;
  box-sizing: border-box;
  font-family: gmarketL; 
}
.searched_books_title {
  font-size: 25px;
  font-weight: 700;
  margin-bottom: 25px;
}
.searched_books_review_title {
  font-size: 25px;
  font-weight: 700;
  margin-bottom: 10px;
}
#searched_books_title_for_review {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 10px;
}
#searched_books_review_title {
  font-size: 25px;
  font-weight: 700;
  margin-bottom: 15px;
}
.searched_books_info_d {
  font-size: 20px;
  margin-bottom: 20px;
}
.searched_reviewer_info {
  font-size: 20px;
  margin-bottom: 10px;
}
.searched_books_price {
  margin-bottom: 20px;
}
.price-of-searched-books {
  font-size: 20px;
}
.searched_book_reviews {
  font-size:25px;
  font-weight: 400;
  margin-bottom: 20px;
  font-family: gmarketL;
}
.book_reviews {
  font-size:30px;
  font-weight: 500;
  margin-bottom: 18px;
  font-family: gmarketL;
}
.searched_book_scores {
  margin-bottom: 20px;
}
.star{
  height: 25px;
}
.review-img{
  height: 25px;
}
.heart-img {
  height: 25px;
}
.comment-img {
  height: 25px;
}
.like-img {
  height: 25px;
}
.reply-img {
  height: 20px;
}
.thumbs-up-img {
  height: 20px;
}
.divi { 
  margin-left: 5px;
  margin-right: 5px;
}
.btnset_for_comment {
  margin-left: 0px;
  margin-right: 0px;
  margin:0px;
  text-align: center;
  box-sizing: border-box; 
}

.searched_books_margin {
  margin-bottom: 0px;
  padding-left: 40px;
  padding-right: 40px;
  padding-top:30px;
  padding-bottom:30px;
  border-bottom: solid 1px rgb(231, 231, 231);
}
.reviewed_books_margin {
  margin-left: 30px;
  margin-right: 30px;
  margin-top: 20px;
  margin-bottom: 20px;
  padding-left: 10px;
  padding-right: 10px;
  padding-top:10px;
  padding-bottom:10px;
  border: solid 1px rgb(231, 231, 231);
}
#searched_review_margin {
  margin-bottom: 0px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top:30px;
  padding-bottom:30px;
  border-bottom: solid 1px rgb(231, 231, 231);
}
#searched_reviewing_book {
  margin-bottom: 0px;
  padding-left: 0px;
  padding-right: 0px;
  padding-top: 20px;
  padding-bottom:20px;
  border-bottom: solid 1px black;
}
#searched_books_margin {
  margin-bottom: 0px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top:30px;
  padding-bottom:30px;
  border-bottom: solid 1px rgb(231, 231, 231);
}
.clearBoth {
  clear: both;
  }
.searched_results_wrapper {
  border:0px;
  padding:10px;
  margin:20px;
  position: relative;
}
.write-review-wrapper {
  border:0px;
  margin: 10px 0px 10px 0px;
  position: relative;
  border: 1px solid black; 
}
.post-comment-wrap {
  border:0px;
  margin: 10px 10px 10px 10px;
  padding: 20px 10px 20px 10px;
  position: relative;
  border: 1px solid black;
  width: 100%; 
}
.review-view-wrapper{
  border:0px;
  margin: 10px 0px 10px 0px;
  position: relative;
  padding-bottom: 20px;
}
.book_review_wrapper {
  border:0px;
  padding:10px;
  margin:20px;
  position: relative;
}
.book_review_wrapper li {
  list-style: none;
}
.please_write {
  font-family: "gmarketM";
  font-size:30px;
  font-weight: 400;
  height: 60px;
  width: 98%;
  margin-bottom: 10px;
  padding-left: 20px;
  padding-right: 20px;
  padding-top:10px;
  padding-bottom:10px;
  vertical-align: middle
}
.page-move {
  text-align: center;
  padding-top: 25px;
  font-family: "gmarketL";
  font-size:20px;
}
.page-move a {
  text-decoration: none;
  color:black;
}
#page-move-view {
  padding-bottom: 25px;
}
.review_total {
  text-align: center;
  font-family: "gmarketM";
  font-size:35px;
  font-weight: 400;
  background-color: #C5B8D1;
  margin:0px 0px 20px 0px;
  padding:20px;
}
.review_search {
  text-align: left;
  font-family: "gmarketL";
  font-size:35px;
  font-weight: 400;
  background-color: #C5B8D1;
  margin:0px 0px 20px 0px;
  padding:20px;
}
.total_book_scores {
  margin: 20px 0px 0px 0px;
}
#total_star { 
  height:40px;
}
.review-header {
  font-family: "gmarketL";
  font-size: 20px;
  padding-top: 10px;
}
.review_data {
  padding-top: 10px;
  padding-bottom: 10px;
}
#review_data_right { 
  float:right;
}
#review_data_left {
  float:left;
}
.post-content {
  font-family: "nanumL";
  font-size: 20px;
  line-height: 150%;
  float:left;
  padding: 10px 15px 15px 15px;
  display: block;
}
#cmt_1 {
  border-bottom: 1px solid black;
  padding-bottom: 10px;
}
#cmt_2 {
  border-bottom: 1px solid black;
  padding-bottom: 10px;
}
@media(max-width:1250px) {
  .BP-wrapper {
  display: block;
  }
  .searched_results_wrapper{
    display: block;
  }
}
.comment-group .comment-item::after {
  content: "";
  display: block;
  clear: both;
}
.comment-top-box {
  margin-right: 20px;
  padding: 10px 5px 5px 5px;
  font-size: 20px;
  font-family: "gmarketL";
  height: 35px;
}
.comment-content {
  font-size: 20px;
  font-family: "nanumL";
  line-height: 150%;
}
.reply-comment-content {
  font-size: 20px;
  font-family: "nanumL";
  line-height: 150%;
}
        
  </style>
  <title>베스트셀러</title>
</head>
<body>
<div class=wrap>
  <div class="dividing_line">
    <h1 id="BP-h1">베스트셀러</h1>
  </div>  
  <div class="List-wrapper"> 
    <div class="List-left">
      <h3 id="List-h3">도서 분야</h3>
      <ul>
        <li class="">
          <a href="" class=""><em></em>소설</em></a>
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
        <!-- 책 1 -->
        <div id="searched_books_margin">   
          <div><img src="${test6}" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${test1}</div>
            <div class="searched_books_info_d">
              <span class="book_author">${test2}</span>         
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${test4}</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
     <!-- 책 2 -->
        <div id="searched_books_margin">   
          <div><img src="${test6}" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${test1}</div>
            <div class="searched_books_info_d">
              <span class="book_author">${test2}</span>         
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${test4}</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 3 -->
        <div id="searched_books_margin">   
          <div><img src="${test6}" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${test1}</div>
            <div class="searched_books_info_d">
              <span class="book_author">${test2}</span>         
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${test4}</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 4 -->
        <div id="searched_books_margin">   
          <div><img src="${test6}" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${test1}</div>
            <div class="searched_books_info_d">
              <span class="book_author">${test2}</span>         
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${test4}</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 5 -->
        <div id="searched_books_margin">   
          <div><img src="${test6}" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${test1}</div>
            <div class="searched_books_info_d">
              <span class="book_author">${test2}</span>         
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${test4}</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 1 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">질서 너머</div>
            <div class="searched_books_info_d">
              <span class="book_author">조던 B. 피터슨</span><span> 저</span>
              <span class="divi">|</span>
              <span class="book_publisher">웅진지식하우스</span>
              <span class="divi">|</span>
              <span class="book_author">Beyond Order : 12 More Rules for Life</span>          
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">품절</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>     
          <div class="clearBoth"></div>
        </div>  
        <!-- 책 2 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
        <!-- 책 3 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점3h.svg" alt="별점" class="star"> 7.7</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 7777건</span>
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
        <!-- 책 4 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 5 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
        <!-- 책 1 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">질서 너머</div>
            <div class="searched_books_info_d">
              <span class="book_author">조던 B. 피터슨</span><span> 저</span>
              <span class="divi">|</span>
              <span class="book_publisher">웅진지식하우스</span>
              <span class="divi">|</span>
              <span class="book_author">Beyond Order : 12 More Rules for Life</span>          
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">품절</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>     
          <div class="clearBoth"></div>
        </div>  
        <!-- 책 2 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
        <!-- 책 3 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점3h.svg" alt="별점" class="star"> 7.7</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 7777건</span>
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
        <!-- 책 4 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 5 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
        <!-- 책 1 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">질서 너머</div>
            <div class="searched_books_info_d">
              <span class="book_author">조던 B. 피터슨</span><span> 저</span>
              <span class="divi">|</span>
              <span class="book_publisher">웅진지식하우스</span>
              <span class="divi">|</span>
              <span class="book_author">Beyond Order : 12 More Rules for Life</span>          
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">품절</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>     
          <div class="clearBoth"></div>
        </div>  
        <!-- 책 2 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
        <!-- 책 3 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점3h.svg" alt="별점" class="star"> 7.7</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 7777건</span>
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
        <!-- 책 4 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
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
        <!-- 책 5 -->
        <div id="searched_books_margin">   
          <div><img src="images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
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
              <div class="searched_book_scores"><img src="images/별점1h.svg" alt="별점" class="star"> 0.8</div>          
              <img src="images/리뷰.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 4444건</span>
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
