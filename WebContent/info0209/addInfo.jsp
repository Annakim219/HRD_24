<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록</title>
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
			int id_no = 0;
		
			try{
				String sql = "select max(id) from info0209";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					id_no = rs.getInt(1)+1;
				}
				
			}catch(SQLException e){
				System.out.println("사원번호 조회 실패");
				e.printStackTrace();
			}
		%>
		<h2>인사관리 사원 등록 화면</h2>
		<form name="form" method="post" action="addInfo_process.jsp">
			<table>
				<tr>
					<th>사원번호(자동생성)</th>
					<td><input id="in1" type="text" name="id" value="<%=id_no %>">
					<span>마지막번호+1</span></td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input id="in1" type="text" name="name"></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
						<select id="sel1" name="dept">
							<option value="10" selected>인사부</option>
							<option value="20">기획부</option>
							<option value="30">홍보부</option>
							<option value="40">영업부</option>
							<option value="50">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직 급</th>
					<td>
						<input id="ra1" type="radio" name="position" value="1">1급
						<input id="ra1" type="radio" name="position" value="2">2급
						<input id="ra1" type="radio" name="position" value="3">3급
						<input id="ra1" type="radio" name="position" value="4">4급
						<input id="ra1" type="radio" name="position" value="5" checked>5급
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
				<tr>
					<th>주소</th>
					<td><input id="in1" type="text" name="address"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
						<input id="btn1" type="button" value="등록" onclick="check()">
						<input id="btn1" type="button" value="취소" onclick="location.href='/index.jsp'">
					</td>
				</tr>
					
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>