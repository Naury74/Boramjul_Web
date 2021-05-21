<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지 글 작성(관리자)</title>
	<%@ include file="../include/include.jsp" %>
	<script type="text/javascript">

		function QnA_write() {
			console.log('등록 click');
			var name = document.form.name.value;
			var content = document.form.content.value;

			if (name.length == 0) {
				alert("제목을 입력하세요.");
				document.form.name.focus();
				return false;	
			}

			document.form.action = "${path}/admin/QnA_insert.do";
			document.form.submit();
		}
		
		</script>
		
		<style type="text/css">
		
		.border{
            margin-top: 100px;
            margin-bottom:300px;
            width: 60%;
            margin-left: 5%;
        }
        .border p, .btntd{
            text-align: center;
        }
		
		</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
    <!-- 파일 업로드시 enctype="multipart/form-data" 옵션이 반드시 기술해야 함. "     -->
 <form name="form" id="form" method="post">
    <table class="border" border="1" cellpadding="5">
        <tr>
            <td width="200" class="firsttd"><p>공지 제목</p></td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td><p>공지 내용</p></td>
            <td>
                <textarea rows="10" cols="100" name="content" id="content" ></textarea>
           </td>				
        </tr>
        <tr>
            <td class="btntd" colspan="2">
                <input type="button" value="등록" onclick="QnA_write()" />
                <input type="button" value="공지 목록"  onclick="location.href='${path}/etc/QnA.do'">
                <input type="hidden" name="id" value="${sessionScope.id}"/}>
            </td>
        </tr>  		  					
    </table>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>