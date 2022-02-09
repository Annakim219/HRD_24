<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉등록</title>
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
	<section>
		<h2>인사관리 호봉 등록 화면</h2>
		<form name="form" method="post" action="addHobong_process.jsp">
			<table>
				<tr>
					<th>직 급</th>
					<td>
						<select id="sel1" name="dunggub">
							<option value="1" selected>1급</option>
							<option value="2">2급</option>
							<option value="3">3급</option>
							<option value="4">4급</option>
							<option value="5">5급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>급 여</th>
					<td><input id="in1" type="text" name="salary"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
						<input id="btn1" type="submit" value="등록">
						<input id="btn1" type="button" value="취소" onclick="location.href='/index.jsp'">
					</td>
				</tr>
					
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>