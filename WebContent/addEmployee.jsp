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
	width:150px;
}
td{
	width:250px;
}
#in1{
	height:25px;
	width: 80%;
}
#sel1{
	height:25px;
	width: 40%;
}
</style>
<script>
	function check(){
		if(document.form.id.value==""){
			alert("사번이 입력되지 않았습니다.");
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
	<%@ include file="DBconn.jsp"%>
	<%
		int seq = 0;
	
		try{
			String sql = "select seq_id.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				seq = rs.getInt(1);
			}
			
		}catch(SQLException e){
			System.out.println("시퀀스 오류");
			e.printStackTrace();
		}
	
	%>
	<section>
		<br>
		<h2>인사관리 시스템</h2>
		<form name="form" method="post" action="addEmployee_process.jsp">
			<table border=1>
				<tr>
					<th>성명</th>
					<td><input id="in1" type="text" name="name"></td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td><input id="in1" type="text" name="id" value="<%=seq %>"></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
					<select id="sel1" name="dept">
						<option value="인사부" selected>인사부</option>
						<option value="기획부">기획부</option>
						<option value="홍보부">홍보부</option>						
						<option value="영업부">영업부</option>
						<option value="경리부">경리부</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
					<select id="sel1" name="position">
						<option value="1" selected>1급</option>
						<option value="2">2급</option>
						<option value="3">3급</option>						
						<option value="4">4급</option>

					</select>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td><input id="in1" type="text" name="duty"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="in1" type="text" name="phone"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="등  록" onclick="check()">
					<input id="btn1" type="button" value="취  소" onclick="retry()">
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>