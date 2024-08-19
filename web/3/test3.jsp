<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3/test3.jsp</title>
<script type="text/javascript">
	let xhr;
	function getResult(){
		const num1=document.getElementById("num1").value;
		const num2=document.getElementById("num2").value;
		const oper=document.getElementById("oper").value;	
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=callback;
		xhr.open("get","server.jsp?num1="+num1 +"&num2="+num2+"&oper="+ oper,true);
		xhr.send();
	}
	function callback(){
		if(xhr.readyState==4 && xhr.status==200){
			const data=xhr.responseXML;
			const num1=data.getElementsByTagName("num1")[0].firstChild.nodeValue;
			const num2=data.getElementsByTagName("num2")[0].firstChild.nodeValue;
			const num3=data.getElementsByTagName("num3")[0].firstChild.nodeValue;
			const oper=data.getElementsByTagName("oper")[0].firstChild.nodeValue;
			const div=document.getElementById("result");
			div.innerHTML=num1 + oper + num2 + "=" + num3;
		}
	}
</script>
</head>
<body>
<p>두 정수를 입력후 계산 버튼을 누르면 ajax를 사용해서 두수합을 div#result에 출력되도록 해보세요</p>
<p>공유폴더에 코드 올리기(test3.jsp/server.jsp) 퀴즈/0812/ajax01 폴더에 자신이름으로 폴더만들어 올리기</p>
// 12:20
<input type="text" id="num1" size="10">
<select id="oper">
	<option value="1">+</option>
	<option value="2">-</option>
	<option value="3">*</option>
	<option value="4">/</option>
</select>
<input type="text" id="num2" size="10">
<input type="button" value="계산" onclick="getResult()">
<div id="result">
</div>
</body>
</html>