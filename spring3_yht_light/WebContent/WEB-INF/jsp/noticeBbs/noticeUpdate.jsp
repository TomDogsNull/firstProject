<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="css/noticeWrite.css"/>

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<div align="center" style="margin-top: 10%;">

<form id="frm" action="noticeUpdateAf.do" method="post">
<input type="hidden" name="notice_seq" value="${noticeUpdate.notice_seq }">
<table border="1" class="type11">
<col width="200"><col width="400"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50px" 
			value="${login.id }">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50px" value="${noticeUpdate.title }">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" name="content">${noticeUpdate.content }</textarea>		
	</td>
</tr>
<tr>
	<td colspan="2" align="center">

		<span>
			<button type="button" class="joinButton btn_s_blue btn_205" id="_writeBtn">확인</button>
		</span>
			&nbsp;&nbsp;&nbsp;&nbsp;
		<span>
			<button type="button" class="joinButton btn_s_gray btn_205" onclick="goBack()">취소</button>
		</span>
	</td>
</tr>

</table>

</form>

</div>

<br><br><br><br><br><br><br><br>
<div style="clear:both"></div>

<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
<script type="text/javascript">
$(function () {
	$("#_writeBtn").click(function () {
		$("#frm").submit();
	});
});

function goBack() {
	
	location.href = "noticeBbsList.do";
	
}
</script>






