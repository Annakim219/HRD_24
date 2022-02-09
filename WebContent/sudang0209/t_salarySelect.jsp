<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당정보</title>
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
	text-align:right;
	margin-right:5px;
}
#p1{
	color:blue;
	text-align:right;
	margin-right:5px;
}
#th1{
	 width:120px;
	 background:lightblue;
}	
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>급여 정보 조회</h2>
		<table>
			<tr>
				<th width=30>no</th>
				<th width=100>사원번호</th>
				<th width=100>이름</th>
				<th width=100>급여</th>
				<th width=100>가족수당</th>
				<th width=100>직책수당</th>
				<th width=100>근속수당</th>
				<th width=100>기타수당</th>
				<th id="th1">급여합계</th>
			</tr>

				<% 
					DecimalFormat fo=new DecimalFormat("###,###");
					int no = 0;
					
					try{
						String sql = "select a.id, a.name, b.salary, c.gajok, c.jikchak, c.gunsok, c.gitasudang, (b.salary+c.gajok+c.jikchak+c.gunsok+c.gitasudang) from info0209 a, hobong0209 b, sudang0209 c where a.id=c.id and a.position=b.dunggub order by a.id";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while(rs.next()){
							String id = rs.getString(1);
							String name = rs.getString(2);
							String salary = rs.getString(3);
							String gajok = rs.getString(4);
							String jikchak = rs.getString(5);
							String gunsok = rs.getString(6);
							String gitasudang = rs.getString(7);
							String t_salary = rs.getString(8);
							no++;
							System.out.println("급여 정보 조회 실패");

				%>
				
			<tr>
				<td align=center><%=no %></td>
				<td align=center><%=id %></td>
				<td align=center><%=name %></td>
				<td><p><%=fo.format(Integer.parseInt(salary)) %></p></td>
				<td><p><%=fo.format(Integer.parseInt(gajok)) %></p></td>
				<td><p><%=fo.format(Integer.parseInt(jikchak)) %></p></td>
				<td><p><%=fo.format(Integer.parseInt(gunsok)) %></p></td>
				<td><p><%=fo.format(Integer.parseInt(gitasudang)) %></p></td>
				<td><p id="p1"><%=fo.format(Integer.parseInt(t_salary)) %></p></td>
				<td align=center></td>
			</tr>				
				<%
						}
						
					}catch(SQLException e){
						System.out.println("급여 정보 조회 실패");
						e.printStackTrace();
					}
	
				%>		
		</table>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>