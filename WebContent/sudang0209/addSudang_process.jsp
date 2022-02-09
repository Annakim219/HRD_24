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
	String gajok = request.getParameter("gajok");
	String jikchak = request.getParameter("jikchak");
	String gunsok = request.getParameter("gunsok");
	String gitasudang = request.getParameter("gitasudang");
	
	try{
		String sql = "insert into sudang0209 values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, gajok);
		pstmt.setString(3, jikchak);
		pstmt.setString(4, gunsok);
		pstmt.setString(5, gitasudang);
		pstmt.executeUpdate();
		System.out.println("수당 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href="/HRD_0209/sudang0209/sudangSelect.jsp";
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