<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	try{
		String sql ="delete from person1216 where name=? and id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		System.out.println("퇴사 처리 성공 : "+id+" "+name);
		%>
		<script>
			alert("<%=name %>님의 퇴사처리가 완료되었습니다.");
			location.href="selectEmployee.jsp";
		</script>
		<%		
	}catch(SQLException e){
		System.out.println("퇴사처리 실패");
		%>
		<script>
			alert("퇴사처리 실패!");
			history.back(-1);
		</script>
		<%
		e.printStackTrace();
	}
%>
</body>
</html>