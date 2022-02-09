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
	String salary = request.getParameter("salary");
	
	try{
		String sql = "insert into hobong0209 values(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		pstmt.setString(2, salary);
		pstmt.executeUpdate();
		System.out.println("호봉 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href="/HRD_0209/hobong0209/hobongSelect.jsp";
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("등록 실패");
		%>
			<script>
				alert("등록 실패!");
				history.back(-1);
			</script>
		<%
		e.printStackTrace();
	}

%>

</body>
</html>