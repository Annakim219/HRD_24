<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보수정</title>
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
<script>
	function check(){
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
			String send_id = request.getParameter("id");
		
			try{
				String sql = "select * from info0209 where id=?";
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
					String address = rs.getString(7);
					System.out.println("데이터 조회 성공");
		%>
		
		<h2>인사관리 사원 수정 화면</h2>
		<form name="form" method="post" action="infoUpdate_process.jsp">
			<table>
				<tr>
					<th>사원번호</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>" readonly>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
						<select id="sel1" name="dept">
							<option value="10" <%if(dept.equals("10")){%>selected<%}%>>인사부</option>
							<option value="20" <%if(dept.equals("20")){%>selected<%}%>>기획부</option>
							<option value="30" <%if(dept.equals("30")){%>selected<%}%>>홍보부</option>
							<option value="40" <%if(dept.equals("40")){%>selected<%}%>>영업부</option>
							<option value="50" <%if(dept.equals("50")){%>selected<%}%>>경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직 급</th>
					<td>
						<input id="ra1" type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%>>1급
						<input id="ra1" type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%>>2급
						<input id="ra1" type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%>>3급
						<input id="ra1" type="radio" name="position" value="4" <%if(position.equals("4")){%>checked<%}%>>4급
						<input id="ra1" type="radio" name="position" value="5" <%if(position.equals("5")){%>checked<%}%>>5급
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
				<tr>
					<th>주소</th>
					<td><input id="in1" type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
						<input id="btn1" type="button" value="수정" onclick="check()">
						<input id="btn1" type="button" value="취소" onclick="location.href='/HRD_0209/info0209/infoSelect.jsp'">
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