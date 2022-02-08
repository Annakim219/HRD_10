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
		String send_id = request.getParameter("id");
	
		try{
			String sql = "select * from person1216 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String dept = rs.getString(3);
				String position = rs.getString(4);
				String duty = rs.getString(5);
				String phone = rs.getString(6);
				System.out.println("사원 정보 조회 성공");
				%>

	<section>
		<br>
		<h2>인사관리 시스템</h2>
		<form name="form" method="post" action="updateEmployee_process.jsp">
			<table border=1>
				<tr>
					<th>성명</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>" readonly></td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
					<select id="sel1" name="dept">
						<option value="인사부" <%if(dept.equals("인사부")){%>selected<%}%>>인사부</option>
						<option value="기획부" <%if(dept.equals("기획부")){%>selected<%}%>>기획부</option>
						<option value="홍보부" <%if(dept.equals("홍보부")){%>selected<%}%>>홍보부</option>						
						<option value="영업부" <%if(dept.equals("영업부")){%>selected<%}%>>영업부</option>
						<option value="경리부" <%if(dept.equals("경리부")){%>selected<%}%>>경리부</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
					<select id="sel1" name="position">
						<option value="1" <%if(position.equals("1")){%>selected<%}%>>1급</option>
						<option value="2" <%if(position.equals("2")){%>selected<%}%>>2급</option>
						<option value="3" <%if(position.equals("3")){%>selected<%}%>>3급</option>						
						<option value="4" <%if(position.equals("4")){%>selected<%}%>>4급</option>

					</select>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td><input id="in1" type="text" name="duty" value="<%=duty %>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="in1" type="text" name="phone" value="<%=phone %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="수  정" onclick="check()">
					<input id="btn1" type="button" value="취  소" onclick="retry()">
			</table>
		</form>
						<%
			}
			
		}catch(SQLException e){
			System.out.println("사원 정보 조회 실패");
			e.printStackTrace();
		}
	
	%>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>