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
	String dunggub = request.getParameter("dunggub");
	
	try{
		String sql = "delete from hobong0209 where dunggub=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		pstmt.executeUpdate();
		System.out.println("삭제 성공");
		%>
		<script>
			alert("삭제가 완료되었습니다.");
			location.href="/HRD_0209/hobong0209/hobongSelect.jsp";
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("삭제 실패");
		%>
			<script>
				alert("삭제 실패!");
				history.back(-1);
			</script>
		<%
		e.printStackTrace();
	}

%>

</body>
</html>