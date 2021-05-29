<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<body>
	<div class=wrap>
	<%@ include file="../include/header.jsp" %>
  <div class="dividing_line">
      <h1 id="BP-h1">도서 정보</h1>
  </div>
  <div class="BP-wrapper">
  <c:forEach var="row" items="${detaillist}" varStatus="status"> 
    <div class="BP-top_left">
        <img src="${row.image }" alt="책 이미지" class="bookimg">
        <div class="price">판매가:
          <span class="price-of-book">${row.price }</span>
        </div>
        <div class="shipping">배송비: 
          <span class="price-of-shipping">2,500원</span>
        </div>
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
    
    <div class="BP-top_right">
      <h2 id="BP-h2">${row.name }</h2>
      <div class="book_info">
        <span class="book_author">${row.content }</span>
      </div>
      <div class="book_reviews">
        <span class="book_scores"><img src="../images/별점5.svg" alt="별점" class="star"> 9.9
        </span>
        <span class="divi">|</span>
        <img src="../images/리뷰.svg" alt="리뷰" class="review-img">
        <span class="number_of_reviews">회원리뷰: 1000건</span>
      </div>
      <div class="book_details">
        <h3 id="BP-h3">책 소개</h3>
          <div class="about_book">  
          <p>${row.detail}</p>
          </div>
        <h3 id="BP-h3">저자 소개</h3>
          <div class="about_author">
          <p>토론토 대학교 심리학과 교수, 임상심리학자. 《12가지 인생의 법칙12 Rules for Life》으로 일약 베스트셀러  작가가 되었다. 앨버타 대학교에서 정치학 학사학위를 받았고, 맥길 대학교에서 임상심리학 박사학위를 받았다.  하버드 대학교 심리학과에서 1993~1998년 동안 교수로 재직했다. 〈스펙테이터〉지는 피터슨을 “수년 동안  세계무대에 나타난 중요한 사상가 중 한 명”이라고 평했다. 피터슨의 유튜브 채널과 온라인 정신건강 프로그램은  폭발적인 조회 수를 기록하며 수많은 사람의 성원을 받고 있다. 지은 책으로 《의미의 지도Maps of Meaning》 등이  있다.</p>
          </div>
          <h3 id="BP-h3">책 속으로</h3>
          <div>
            <div class="into_the_book">
              <p class="content" style="display: block;">
                이 두 번째 12가지 법칙은 첫 번째 12가지 법칙보다 조금 더 현명하게 제시되었기를 바란다. 내가 생각을 체계화하는 과정에서 전 세계 독자들이 개인적으로, 유튜브로, 또는 팟캐스트와 블로그를 통해 훌륭한 피드백을 보내주었다. 그 덕분에 전작에서 미진한 상태로 남겨두었던 몇 가지 주제를 더 명료하게 풀어냈을 뿐 아니라 독창적인 생각도 많이 제시할 수 있었다. 마지막으로 사람들이 12가지 법칙을 발견했을 때처럼 이 책 역시 쓸모 있다고 느끼기를 바란다. (21쪽) <a href="#" class="btn_more">더보기</a>
                
              </p>
              <!--  현재 미구현
                <div class="content" style="display: none;">
                  이 두 번째 12가지 법칙은 첫 번째 12가지 법칙보다 조금 더 현명하게 제시되었기를 바란다. 내가 생각을 체계화하는 과정에서 전 세계 독자들이 개인적으로, 유튜브로, 또는 팟캐스트와 블로그를 통해 훌륭한 피드백을 보내주었다. 그 덕분에 전작에서 미진한 상태로 남겨두었던 몇 가지 주제를 더 명료하게 풀어냈을 뿐 아니라 독창적인 생각도 많이 제시할 수 있었다. 마지막으로 사람들이 12가지 법칙을 발견했을 때처럼 이 책 역시 쓸모 있다고 느끼기를 바란다. (21쪽)
                  <br>
          
                  <br>
                  위계 구조의 밑바닥을 경험하는 것은 유용하다. 감사와 겸손의 싹을 틔우는 데 도움이 되기 때문이다. 왜 ‘감사’인가? 전문 지식이 당신보다 탁월한 사람들이 있다. 당신이 현명하다면 그 사실에 기뻐해야 한다. 세상에는 복잡하고 심각한 문제를 해결하기 위해 반드시 채워야 하는 자리가 무수히 많다. 믿을 만한 기술과 경험을 가진 사람들이 그 자리를 채우고 있다는 사실은 진정 감사해야 할 일이다. ‘겸손’은 또 무슨 말인가? 충분히 안다 생각하고 꽉 막힌 사람이 되기보다는 모른다 생각하고 가르침을 청하는 편이 낫다. …… 궁지에 몰려 옴짝달싹하지 못하게 되었을 때 도움이 되는 것은 항상 우리가 아직 배우지 못한 것들이다. (43쪽)
                  <br>
          
                  <br>
                  모든 게 순조로웠으나 주제가 정치로 넘어가자 대화가 꼬이기 시작했다. 그녀는 세계의 상황이 전반적으로 한심하다고 목소리를 높였다. 인간의 활동이 환경에 악영향을 끼쳤고 그로 인해 곧 재앙이 닥칠 거라고 주장했다. 물론 요즘 같은 시대에 지구 환경에 대한 걱정을 표현하는 게 잘못은 아니다. 하지만 삶에 긍정적인 일은 하나도 없고 침대에서 일어나는 것조차 힘들어하는 20대 초반의 젊은이가 그런 문제에 관한 자신의 지식을 과대평가하는 것은 잘못이다. 그런 상황에서는 우선순위를 명확히 할 필요가 있다. 가장 먼저 꿰어야 할 단추는 자신의 문제를 해결하는 데 필요한 겸손함을 갖추는 것이다. (58쪽)
                  <br>
          
                  <br>
                   나는 누구인가, 그리고 나는 어떤 사람이 될 수 있는가? 우리는 끔찍한 미지의 세계에 끊임없이 자발적으로 맞서는 영원한 힘의 일부이기도 하고, 순진함을 초월해 악을 이해하면서도 악이 어두운 굴에 서 나오지 못하게 하는 영원한 힘의 일부이기도 하고, 혼돈에 맞서 그것을 생산적인 질서로 변화시키거나 지나치게 구속적인 질서를 포획해 혼돈으로 환원한 뒤 다시 생산적인 질서로 만드는 영원한 힘의 일부이기도 하다. (82쪽)
                   <br>
          
                  <br>
                  문제는 이것이다. 그런 일들이 백 가지 천 가지 쌓이면 당신의 삶은 비참해지고 결혼 생활은 파탄 난다. 따라서 행복하지 않다면 행복한 체하지 마라. 서로 협의해 적절한 해결책을 마련할 수 있다면 상의하라. 싸움을 두려워하지 마라. 그 순간에는 불쾌할지라도 낙타 등에 붙은 작은 지푸라기를 떼어내야 한다. 모두가 사소하게 여기는 일상적인 사건일수록 이런 조언은 특히 중요하다. 삶은 반복이며, 반복되는 잘못을 바로잡는 일은 충분히 가치가 있다. (115쪽)
                  <br>
          
                  <br>
                  목적이 없으면 긍정적인 감정이 사라진다. 우리가 희망을 품고 전진할 수 있는 힘은 진심으로 원하고 필요로 하는 어떤 것에 다가가는 경험에서 대부분 나온다. 목적이 없다면 우리는 견디기 어려운 불안에 항상 시달리게 된다. 우리 주변에는 수많은 가능성이 널려 있어 선택의 폭이 너무 넓다. 우리는 목적에 집중함으로써 참을 수 없는 혼돈을 억누를 수 있다. (129쪽)
                  <br>
          
                  <br>
                  목표는 없고 재능만 있는 스물다섯 살 젊은이의 매력적인 잠재성은 서른 살에는 절망적이고 애처로워 보이고, 마흔 살이 되면 완전히 만료된다. 여러분은 자신의 다층적인 잠재성을 희생해 실질적인 알맹이를 확보해야 한다. (145쪽)
                  <br>
          
                  <br>
                  어떤 것에 순간적으로 행복을 느낀다고 해서 그것이 본인에게 가장 유익하다고 할 수는 없다. 그렇게만 되면 인생은 정말 간단하겠지만, 지금의 당신이 있는 것처럼 내일의 당신이 있고 다음 주의 당신, 내년의 당신, 5년 뒤의 당신, 10년 뒤의 당신이 있으니, 가혹할지언정 당신은 모든 ‘당신들’을 고려해야 한다. 이 저주는 인간이 미래를 발견하고 그로 인해 일의 필요성을 깨달은 것과 관련이 있다. 일을 한다는 건 앞에 놓인 것의 잠재적 향상을 위해 현재의 즐거움을 희생한다는 뜻이다.(155쪽)
                  <br>
          
                  <br>
                  세상에는 우리가 모든 걸 잊고 전념할 만한 일이 많다. 대안은 차고 넘치며 노력을 요구하는 체제가 부패했다는 점을 들먹이며, 어떤 일에 전념하는 건 자의적이고 심지어 무의미하다는 말도 일리는 있다. 하지만 어떤 일에 전념하는 것도 똑같이 일리가 있다. 한 방향을 선택하지 않는 사람은 길을 잃어버린다. 모든 것으로 남으려다 아무것도 되지 못하느니 실제로 어떤 것이 되는 편이 훨씬 낫다. 그 과정에 끼어드는 모든 한계와 실망에도 말이다. 냉소적인 사람은 이 세상에 나쁜 결정이 차고 넘친다고 한탄한다. 하지만 그런 냉소를 초월한 사람은 다음과 같이 반론을 제기한다. 최악의 결정은 결정을 내리지 않는 것이라고. (220쪽)
                  <br>
          
                  <br>
                  흔히 ‘왜 나에게 이런 일이 일어날까?’에는 부당함에 대한 원망이 담겨 있다. 그래서 “세상에는 나쁜 사람이 널려 있는데, 다들 악행을 저지르고도 벌받지 않고 지나간다” 또는 “세상 사람들은 모두 운이 좋아 건강하게 잘 사는데, 나는 그렇지 못하다니 얼마나 불공평한가?”라고 말한다. 이렇듯 ‘왜 나에게?’라는 질문을 던질 때, 우리는 불공평하다는 피해의식에 물들어 있다. (391쪽)
                  <br>
          
                  <br>
                  미래의 잠재성을 지금의 현실로 바꾸는 것은 우리 개인의 능력으로 충분히 할 수 있는 일이다. 세계가 어떤 모습으로 변할지는 우리의 윤리적·의식적 선택으로 결정된다. 우리는 아침에 일어나 그 모든 가능성, 그 모든 공포와 함께 하루를 맞는다. 그리고 좋든 나쁘든 방향을 가늠하고 경로를 정한다. 우리는 악하게 행동한 결과로 끔찍한 일들이 벌어질 수 있음을 잘 알고 있다. 하지만 또한 큰일은 아니더라도 선하게 행동할 수 있다는 것도 알고 있다. 책임감을 갖고 올바르게 행동하는 것, 진실하고 겸손하고 감사하는 태도를 유지하는 것이야말로 좋은 가능성을 높이는 최선의 방법이다. (405쪽)
                  <a href="#" class="btn_small btn_more">닫기</a>
                </div>
                -->
            </div>
          </div>
      </div>
    </div>
   </c:forEach>
  </div>
 
  
  <div id="dividing_line">
    <h4 id="BP-h4">관련 도서</h4>
  </div>

  <div class="related_books"> 
    <!-- 책1 -->
    <div class="searched_books_margin">   
      <div><img src="../images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
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
          <div class="searched_book_scores"><img src="../images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
          <img src="../images/리뷰.svg" alt="리뷰" class="review-img">
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
  <div class="clearBoth"></div>
  </div> 
  
  <!-- 리뷰 -->
  <div id="dividing_line">
  <h4 id="BP-h4">회원 리뷰</h4>
  </div>
  
  <div class="book_review">
    <ul>
      <div class="book_review_wrapper">         
        <div class="review_total">
          <span class="number_of_reviews">1000</span><span>명의 보람줄 회원이 평가한 평균별점</span>
        <div class="total_book_scores"><img src="../images/별점5.svg" alt="별점" id="total_star"><span style="font-size: 60px;"> 9.9</span> / 10
        </div>
      </div>
      <div class="please_write">책에 대한 고객님의 생각을 들려주세요 
      <button id="review_btn" type="button" onclick=>리뷰 작성</button>
      </div>
      <li>
          <div class="searched_books_margin">
          <div class="searched_books_review">
            <div class="searched_books_review_title">리뷰 제목</div>
            <div class="searched_reviewer_info">
              <span class="member_id">아이디 </span>
              <span class="divi"> | </span>
              <span class="review_date"> 2021.04.26 </span>
              <span class="divi">|</span>
              <img src="../images/별점1.svg" alt="별점" class="star">
              <span class="divi">|</span>          
              <img src="../images/comment.svg" alt="댓글" class="comment-img">
              <span>500</span>
              <span class="divi">|</span>
              <img src="../images/heart.svg" alt="좋아요" class="heart-img">
              <span>4444</span>              
            </div>            
            <p class="preview" style="display: block;">
              그녀는 세계의 상황이 전반적으로 한심하다고 목소리를 높였다. 인간의 활동이 환경에 악영향을 끼쳤고 그로 인해 곧 재앙이 닥칠 거라고 주장했다. 물론 요즘 같은 시대에 지구 환경에 대한 걱정을 표현하는 게 잘못은 아니다. 하지만 삶에 긍정적인 일은 하나도 없고 침대에서 일어나는 것조차 힘들어하는 20대 초반의 젊은이가 그런 문제에 관한 자신의 지식을 과대평가하는 것은 잘못이다. 그런 상황에서는 우선순위를 명확히 할 필요가 있다. <a href="#" class="btn_small btn_more">더보기</a></p>  
          </div> 
          
            
              <div class="clearBoth"></div>
      </div>        
      </li>
     
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
      </ul>
  </div>
</div>
</body>
    <%@ include file="../include/footer.jsp" %>
</html>