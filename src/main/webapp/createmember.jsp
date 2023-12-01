<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<% 
    Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	//out.print(conn);
int custno=0;
String sql="select member_custno_seq.nextval from dual";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	//custno=rs.getInt("nextval");
	custno=rs.getInt(1);
}
rs.close();ps.close();conn.close();
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
<script>
function valuecheck() {
	var custname=document.getElementById("custname");
	var phone=document.getElementById("phone");
	var address=document.getElementById("address");
	var joindate=document.getElementById("joindate");
	var grade=document.getElementById("grade");
	var city=document.getElementById("city");
	if(custname.value==""){
		alert("회원이름이 입력되지 않았습니다")
		custname.focus();
		return false;
	}
	if(custname.value==""){
		alert("회원이름이 입력되지 않았습니다")
		custname.focus();
		return false;
	}
	if(custname.value==""){
		alert("회원이름이 입력되지 않았습니다")
		custname.focus();
		return false;
	}
	if(custname.value==""){
		alert("회원이름이 입력되지 않았습니다")
		custname.focus();
		return false;
	}
	if(custname.value==""){
		alert("회원이름이 입력되지 않았습니다")
		custname.focus();
		return false;
	}
}
</script>
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
	<td>회원번호(자동발생)</td><td><input type="text" id="custno" name="custno" value="<%=custno%>"></td>
</tr>
<tr>
	<td>회원 성명</td><td><input type="text" id="custname" name="custname"></td>
</tr>
<tr>
	<td>회원전화</td><td><input type="text" id="phone" name="phone"></td>
</tr>
<tr>
	<td>회원주소</td><td><input type="text" id="address" name="address"></td>
</tr>
<tr>
	<td>가입일자</td><td><input type="text" id="joindate" name="joindate"></td>
</tr>
<tr>
	<td>고객등급(A:VIP,B:일반,C:직원)</td><td><input type="text" id="grade" name="grade"></td>
</tr>
<tr>
	<td>도시코드</td><td><input type="text" id="city" name="city"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="등록">
	<input type="button" value="조회" onclick="javasdipt:location.href='memberlist.jsp?custno=<%=custno %>'">
	</td>
</tr>
</table>
</form>
</p>
</section>
<footer>HRDKOREA copyright</footer>
</body>
</html>