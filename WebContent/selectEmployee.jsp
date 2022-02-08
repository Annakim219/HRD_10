<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템 ver1.0</title>
<style>
th{
	height:30px;
}
td{
	height:25px;
	text-align:center;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<%@ include file="DBconn.jsp"%>
	<section>
		<br>
		<h2>직원 정보 조회</h2>
		<table border=1>
			<tr>
				<th width=30>no</th>
				<th width=70>성명</th>
				<th width=50>사번</th>
				<th width=50>직급</th>
				<th width=50>직책</th>
				<th width=150>연락처</th>
				<th width=100>소속부서</th>
			<tr>
			
			<%
				int no = 0;
			
				try{
					String sql = "select * from person1216 order by id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String duty = rs.getString(5);
						String phone = rs.getString(6);
						no++;
						System.out.println("테이블 조회 성공");
						%>
						
				<tr>
					<td><%=no %></td>
					<td><%=name %></td>
					<td><a href="updateEmployee.jsp?id=<%=id %>"><%=id %></a></td>
					<td><%=position %></td>
					<td><%=duty %></td>
					<td><%=phone %></td>
					<td><%=dept %></td>
				</tr>					
					
					<%
						}
				}catch(SQLException e){
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
						
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>