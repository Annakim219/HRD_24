<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당등록</title>
<style>
tr{
	height:30px;
}
th{
	width:120px;
	background:lightyellow;
}
td{
	width:150px;
}
span{
	font-size:0.9em;
}
#in1{
	margin-left:2px;
	height:22px;
	width:139px;
}	
#in2{
	margin-left:2px;
	height:22px;
	width:97%;
}	
</style>
<script>
	function check(){
		document.form.action="addSudang_process.jsp"
		document.form.submit();
	}

	function changesubmit(){
		document.form.submit();
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String id = request.getParameter("id");
		String gajok = request.getParameter("gajok");
		String jikchak = request.getParameter("jikchak");
		String gunsok = request.getParameter("gunsok");
		String gitasudang = request.getParameter("gitasudang");
		String name="";
		
		if(id==null){
			id="";
			name="";
			gajok="";
			jikchak="";
			gunsok="";
			gitasudang="";
		}
		
		try{
			String sql = "select id, name from info0209 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				name = rs.getString(2);
			}else if(id!=""){
				%>
					<script>
						alert("등록되어 있지 않는 사원번호 입니다.");
					</script>
				<%
			}
			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
		<h2>수당 정보 등록</h2>
		<form name="form" method="post" action="addSudang.jsp">
			<table>
				<tr>
					<th>사원번호</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>" onchange="changesubmit();"></td>
					<th>이 름</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>가족수당</th>
					<td><input id="in1" type="text" name="gajok" value="<%=gajok %>"></td>
					<th>직책수당</th>
					<td><input id="in1" type="text" name="jikchak" value="<%=jikchak %>"></td>
				</tr>
								<tr>
					<th>근속수당</th>
					<td><input id="in1" type="text" name="gunsok" value="<%=gunsok %>"></td>
				</tr>
				<tr>
					<th>기타수당</th>
					<td colspan=3><input id="in2" type="text" name="gitasudang" value="<%=gitasudang %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=4 align=center>
						<input id="btn2" type="button" value="목록" onclick="location.href='/HRD_0209/sudang0209/sudangSelect.jsp'">
						<input id="btn2" type="button" value="저장" onclick="check()">
					</td>
				</tr>
					
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>