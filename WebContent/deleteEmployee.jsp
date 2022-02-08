<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템 ver1.0</title>
<style>
tr{
	height:30px;
}
th{
	width:100px;
}
td{
	width:350px;
}
#in1{
	height:25px;
	width: 80%;
}
</style>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.id.value==""){
			alert("사원번호가 입력되지 않았습니다.");
			document.form.id.focus();
		}else{
			document.form.submit();
		}
	}
	
	function retry(){
		location.href="index.jsp";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<section>
		<br>
		<h2>인사관리 퇴사처리 화면</h2>
		<form name="form" method="post" action="deleteEmployee_process.jsp">
			<table border=1>
				<tr>
					<th>성명</th>
					<td><input id="in1" type="text" name="name"></td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td><input id="in1" type="text" name="id"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="삭  제" onclick="check()">
					<input id="btn1" type="button" value="취  소" onclick="retry()">
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>