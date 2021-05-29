<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
<script type="text/javascript">

function QnA_update(){
	document.form.action = "${path}/admin/QnA_update.do";
	document.form.submit();
}

</script>
</head>
<body>
<form name="form" id="form" method="post">
    <table class="border" border="1" cellpadding="5">
        <tr>
            <td width="200" class="firsttd"><p>공지 제목</p></td>
            <td><input type="text" name="name" value="${dto.name }"></td>
            <input type="hidden" name="qnanum" value="${dto.qnanum }">
        </tr>
        <tr>
        	<td><p>분류</p></td>
        	<td><input type="text" name="kind" value="${dto.kind }"></td>
        </tr>
        <tr>
            <td><p>공지 내용</p></td>
            <td>
                <textarea rows="10" cols="100" name="content" id="content">${dto.content }</textarea>
           </td>				
        </tr>
        <tr>
            <td class="btntd" colspan="2">
                <input type="button" value="수정" onclick="QnA_update()" />
                <input type="button" value="공지 목록"  onclick="location.href='${path}/etc/QnA.do'">
            </td>
        </tr>  		  					
    </table>
</form>
</body>
</html>