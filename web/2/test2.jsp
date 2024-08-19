<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2.jsp</title>
<script>
    let xhr=null;
    function find(){
        const id=document.getElementById("id").value;
        xhr=new XMLHttpRequest();
        xhr.onreadystatechange=callback;
        xhr.open('get','findpwd.jsp?id=' + id,true);
        xhr.send();
    }
    function callback(){
        if(xhr.readyState==4 && xhr.status==200){
            let xml=xhr.responseXML;
         //   alert(xml);
            const code=xml.getElementsByTagName("code")[0].firstChild.nodeValue;
            const div=document.getElementById("result");
            if(code=='fail'){
                div.innerHTML="<h1>해당 정보가 존재하지 않습니다</h1>";
            }else if(code=='success'){
                const pwd=xml.getElementsByTagName("pwd")[0].firstChild.nodeValue;
                div.innerHTML="<h1>비밀번호 :"+ pwd +"</h1>";
            }
        }
    }
</script>
</head>
<body>
<h1>비밀번호찾기</h1>
아이디 <input type="text" name="id" id="id"><br>
<input type="button" value="찾기" onclick="find()">
<div id="result">
</div>
</body>
</html>