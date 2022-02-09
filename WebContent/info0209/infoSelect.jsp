<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
<style>
th{
	height:30px;
	background:lightgrey;
}
td{
	height:25px;
	text-align:center;
}
p{
	text-align:left;
	margin-left:5px;
}
	
</style>
<script>
	function delOK(){
		if(!confirm('정말로 삭제하시겠습니까?'));
		return false;
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>사원 정보 조회</h2>
		<table>
			<tr>
				<th width=30>no</th>
				<th width=80>사번</th>
				<th width=80>성명</th>
				<th width=50>직급</th>
				<th width=50>직책</th>
				<th width=120>연락처</th>
				<th width=80>소속부서</th>
				<th width=200>주소</th>
				<th width=50>관리</th>
			</tr>
			
			<%
				int no = 0;
			
				try{
					String sql = "select * from info0209 order by id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String duty = rs.getString(5);
						String phone = rs.getString(6);
						String address = rs.getString(7);
						no++;
						System.out.println("사원 정보 조회 성공");
						
						if(dept.equals("10")){dept="인사부";}
						else if(dept.equals("20")){dept="기획부";}
						else if(dept.equals("30")){dept="홍보부";}
						else if(dept.equals("40")){dept="영업부";}
						else if(dept.equals("50")){dept="경리부";}
			%>
			
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD_0209/info0209/infoUpdate.jsp?id=<%=id%>"><%=id %></a></td>
				<td><%=name %></td>
				<td><%=position %></td>
				<td><%=duty %></td>
				<td><%=phone %></td>
				<td><%=dept %></td>
				<td><p><%=address %></p></td>
				<td><a href="/HRD_0209/info0209/infoDelete.jsp?id=<%=id%>" onclick="delOK()">삭제</a></td>
			</tr>
			
			<%
					}
					
				}catch(SQLException e){
					System.out.println("사원 정보 조회 실패");
					e.printStackTrace();
				}			
			%>			
		</table>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>