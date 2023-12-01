<%@page import="java.util.ArrayList"%>
<%@page import="mylib.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int custno=Integer.parseInt(request.getParameter("custno"));
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
//out.print(conn);
String sql="update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?)";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1, custname);
ps.setString(2, phone);
ps.setString(3, address);
ps.setString(4, joindate);
ps.setString(5, grade);
ps.setString(6, city);
ps.setInt(7, custno);
int result=ps.executeUpdate();
ps.close();conn.close();
ResultSet rs=ps.executeQuery();
List<Member> list=new ArrayList<Member>();
Member member=new Member();
if(rs.next()){
member.setCustno(rs.getInt("custno"));
member.setCustname(rs.getString("custname"));
member.setPhone(rs.getString("phone"));
member.setAddress(rs.getString("address"));
member.setJoindate(rs.getDate("joindate"));
member.setGrade(rs.getString("grade"));
member.setCity(rs.getString("city"));
}
rs.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin: 0;padding: 0;}
section{height: 500px;background-color: rgba(180,180,180);}
senction > h2{text-align: center;padding-top:20px;padding-bottom: 20px}
footer{background-color: rgba(0,0,255); height: 100px; color: white;font-size: 15px;/*text-align: center;line-height: 100px;*/padding: 20px 100px;/* 위아래 좌우 */}
table{margin: auto; /*margin-left:auto;  margin-right:auto;*/ text-align: center; border: 1xp solid black;}
nav{background-color: rgba(255,150,255,0.5); text-align: center;}
nax > ul >li{display: inline-block;/*padding: 20px 30px*/}
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
<p>
<form action="creatememberproc" method="past" onsubmit="return valuecheck()">
<table border="1">
<tr>
	<th></th><th></th>
</tr>
<tr>
	<td>회원번호(자동발생)</td><td><input type="text" id="custno" name="custno" value="<%=member.getCustno()%>"></td>
</tr>
<tr>
	<td>회원 성명</td><td><input type="text" id="custname" name="custname" value="<%=member.getCustname()%>"></td>
</tr>
<tr>
	<td>회원전화</td><td><input type="text" id="phone" name="phone" value="<%=member.getPhone()%>"></td>
</tr>
<tr>
	<td>회원주소</td><td><input type="text" id="address" name="address" value="<%=member.getAddress()%>"></td>
</tr>
<tr>
	<td>가입일자</td><td><input type="text" id="joindate" name="joindate" value="<%=member.getJoindate()%>"></td>
</tr>
<tr>
	<td>고객등급(A:VIP,B:일반,C:직원)</td><td><input type="text" id="grade" name="grade" value="<%=member.getGrade()%>"></td>
</tr>
<tr>
	<td>도시코드</td><td><input type="text" id="city" name="city" value="<%=member.getCity()%>"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="등록">
	<input type="button" value="조회" onclick="javasdipt:location.href='memberlist.jsp'">
	</td>
</tr>
</table>
</form>
</p>
</section>
<footer>HRDKOREA copyright</footer>
</body>
</html>