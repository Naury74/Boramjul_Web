<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path}/css/mypage.css">
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

        <div class="tabs">
            
            <div class="menu_name">
                <p>MY REVIEW</p>
            </div>
            
            <input id="myReview" type="radio" name="tabs" checked> 
            <label for="myReview">게시글</label> |
            
            <input id="myReply" type="radio" name="tabs">
            <label for="myReply">댓글</label>
       
            <section id="content1">
                <div class="table">
                    <table>
                        <tr style="height: 40px;">
                            <td colspan="2"></td>
                            <td>책 제목</td>
                            <td>글 제목</td>
                            <td>별점</td>
                            <td>작성일시</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                            <td>아몬드</td>
                            <td>ㄹㅇ후기 미쳤다 이 책 다들 사라</td>
                            <td><img src="${path}/images/별점5.svg" alt="별점" class="star"></td>
                            <td>2020.12.29</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                            <td>아몬드</td>
                            <td>아몬드 먹으면서 아몬드 읽은 썰 푼다.</td>
                            <td><img src="${path}/images/별점1.svg" alt="별점" class="star"></td>
                            <td>2018.08.18</td>
                        </tr>
                        
                    </table>
                </div><!--table-->
            </section>

            <section id="content2">
                <div class="table">
                    <table>
                        <tr style="height: 40px;">
                            <td colspan="2"></td>
                            <td>책 제목</td>
                            <td>글 제목</td>
                            <td>댓글 내용</td>
                            <td>작성일시</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                            <td>아몬드</td>
                            <td><a href="#" class="review">ㄹㅇ후기 미쳤다 이 책 다들 사라</a></td>
                            <td>님 말 맞는듯. 이 책 짱임 ㅇㅇ</td>
                            <td>2020.12.29</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                            <td>누가 내 치즈를 훔쳐갔을까나용</td>
                            <td><a href="#" class="review">아몬드 먹으면서 아몬드 읽은 썰 푼다.</a></td>
                            <td>ㅋㅋㅋ먼솔</td>
                            <td>2018.08.18</td>
                        </tr>
                    </table>
                </div><!--table-->
            </section>
        
        </div><!--tabs-->

    </div><!--box-->

    <%@ include file="../include/footer.jsp" %>

</div><!--wrap-->

</body>
</html>