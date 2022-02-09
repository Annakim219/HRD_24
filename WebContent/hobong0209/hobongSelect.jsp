<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉정보</title>
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
		<h2>호봉 정보 조회</h2>
		<table>
			<tr>
				<th width=30>no</th>
				<th width=80>등급</th>
				<th width=150>급여</th>
				<th width=120>구분</th>
			</tr>

				<% 
					DecimalFormat fo=new DecimalFormat("###,###");
					int no = 0;
					String t_dunggub ="";
					
					try{
						String sql = "select * from hobong0209 order by dunggub";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while(rs.next()){
							String dunggub = rs.getString(1);
							String salary = rs.getString(2);
							no++;
							System.out.println("호봉 정보 조회 성공");
							
							if(dunggub.equals("1")){t_dunggub="1급";}
							else if(dunggub.equals("2")){t_dunggub="2급";}
							else if(dunggub.equals("3")){t_dunggub="3급";}
							else if(dunggub.equals("4")){t_dunggub="4급";}
							else if(dunggub.equals("5")){t_dunggub="5급";}
				%>
				
			<tr>
				<td><%=no %></td>
				<td><%=t_dunggub %></td>
				<td><p><%=fo.format(Integer.parseInt(salary)) %></p></td>
				<td>
				<a href="/HRD_0209/hobong0209/hobongUpdate.jsp?dunggub=<%=dunggub%>">수정</a>
				<span>|</span>
				<a href="/HRD_0209/hobong0209/hobongDelete.jsp?dunggub=<%=dunggub%>" onclick="delOK()">삭제</a></td>								
			</tr>				
				<%
						}
						
					}catch(SQLException e){
						System.out.println("호봉 정보 조회 실패");
						e.printStackTrace();
					}
	
				%>		
		</table>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>