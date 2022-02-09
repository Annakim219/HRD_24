<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉수정</title>
<style>
tr{
	height:30px;
}
th{
	width:200px;
	background:lightgrey;
}
td{
	width:370px;
}
span{
	font-size:0.9em;
}
#in1{
	margin-left:2px;
	height:22px;
	width:70%;
}	
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String send_dunggub = request.getParameter("dunggub");
		System.out.println("send_dunggub: "+send_dunggub);
	
		try{
			String sql = "select * from hobong0209 where dunggub=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dunggub);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String dunggub = rs.getString(1);
				String salary = rs.getString(2);
				System.out.println("데이터 조회 성공");
	%>
		<h2>인사관리 호봉 수정 화면</h2>
		<form name="form" method="post" action="hobongUpdate_process.jsp">
			<table>
				<tr>
					<th>직 급</th>
					<td>
						<select id="sel1" name="dunggub">
							<option value="1" <%if(dunggub.equals("1")){%>selected<%}%>>1급</option>
							<option value="2" <%if(dunggub.equals("2")){%>selected<%}%>>2급</option>
							<option value="3" <%if(dunggub.equals("3")){%>selected<%}%>>3급</option>
							<option value="4" <%if(dunggub.equals("4")){%>selected<%}%>>4급</option>
							<option value="5" <%if(dunggub.equals("5")){%>selected<%}%>>5급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>급 여</th>
					<td><input id="in1" type="text" name="salary" value="<%=salary %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
						<input id="btn1" type="submit" value="수정">
						<input id="btn1" type="button" value="취소" onclick="location.href='/HRD_0209/hobong0209/hobongSelect.jsp'">
					</td>
				</tr>
					
			</table>
		</form>
		
	<%
			}
			
			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>	
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>