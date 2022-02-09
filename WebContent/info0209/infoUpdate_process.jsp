<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/DBconn.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String duty = request.getParameter("duty");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	try{
		String sql = "update info0209 set name=?, dept=?, position=?, duty=?, phone=?, address=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, duty);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, id);
		pstmt.executeUpdate();
		System.out.println("사원 정보 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="/HRD_0209/info0209/infoSelect.jsp";
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("수정 실패");
		%>
			<script>
				alert("수정 실패!");
				history.back(-1);
			</script>
		<%
		e.printStackTrace();
	}

%>

</body>
</html>