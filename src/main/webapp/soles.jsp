<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
String sql="select t1.custno custno, t2.custname custname,decode(t2.grade,'A','VIP','B','일반','C','직원') grade,sum(t1.price) price from money_tbl_02 t1,member_tbl_02 t2 where t1.custno=t2.custno group by (t1.custno,t2.custname,t2.grade) order by sum(t1.price) desc";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin: 0;padding: 0;}
header{background-color: rgba(0,0,255); height: 100px; color: white;font-size: 30px;/*text-align: center;line-height: 100px;*/padding: 20px 100px;/* 위아래 좌우 */}
nav{background-color: rgba(255,150,255,0.5); text-align: center;}
nax > ul >li{display: inline-block;/*padding: 20px 30px*/}
section{height: 500px;background-color: rgba(180,180,180);}
senction > h2{text-align: center;padding-top:20px;padding-bottom: 20px}
footer{background-color: rgba(0,0,255); height: 100px; color: white;font-size: 15px;/*text-align: center;line-height: 100px;*/padding: 20px 100px;/* 위아래 좌우 */}
table{margin: auto; /*margin-left:auto;  margin-right:auto;*/ text-align: center; border: 1xp solid black;}
li a{color: white;text-decoration: nono;}
a{color: white;}
</style>
</head>
<body>
<header>쇼핑몰 회뤈 관리 ver1.0</header>
<nav>
<ul>
<li><a href="createmember.jsp">회원등록</a></li>
<li><a href="memberlist.jsp">회원목록 조회/수정</a></li>
<li><a href="soles.jsp">회원매출 조정</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul>
</nav>
<section>
<h2>매출조정</h2>
<p>
<table border="1" width="60%">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getInt(4)%></td>
	<%} 
	rs.close();ps.close();conn.close();%>
</table>
</p>
</section>
<footer>HRDKOREA copyright</footer>
</body>
</html>