<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
1. Ajax ( Asynchronous Javascript And XML) 
 - 비동기통신 방식의 자바스크립트와 XML
 - 웹브라우져가 아닌 XMLHttpRequest객체를 통해 웹서버와 통신한다.
 - 웹서버의 응답결과는 xml 또는 텍스트(html,json포함)이다.
 - 페이지의 이동없이 결과가 화면에 반영된다.

2. Ajax통신순서
  1) XMLHttpRequest객체 생성하기
  2) XMLHttpRequest객체를 통해서 웹서버에 요청하기
  3) 콜백메소드를 통해 웹서버에서 응답된 정보를 화면에 반영하기
*/
  let xhr=null;
  function getData(){
	  //1. XMLHttpRequest객체 생성하기
	  xhr=new XMLHttpRequest();
	  //2. 콜백함수 설정
	  xhr.onreadystatechange=callback;
	  //3. open메소드로 서버요청에 대한 정보 설정
	  xhr.open('get','book.xml',true);
	  //4. 서버에 요청하기
	  xhr.send();
  }
  function callback(){
	 /*
		xhr.readyState ==> 1 : send호출전
		xhr.readyState ==> 2 : request를 받은 상태
		xhr.readyState ==> 3 : 서버에서 request를 처리중인 상태
		xhr.readyState ==> 4 : 서버에서 응답이 완료된 상태		
	*/
	  console.log('callback....',xhr.readyState);
	 //서버에서 응답이 완료되었고 응답이 성공(200)적으로 된경우
	 if(xhr.readyState==4 && xhr.status==200){
		 //let result=xhr.responseText;//서버에서 응답된 결과를 텍스트로 얻어오기
		 let result=  xhr.responseXML;//서버에서 응답된 결과를 XML DOM으로 얻어오기
		// alert(result);
		 const title=result.getElementsByTagName("title")[0].firstChild.nodeValue;
		 const price=result.getElementsByTagName("price")[0].firstChild.nodeValue;
		 console.log(title,price);
		 const bookinfo=document.getElementById("bookinfo");
		 bookinfo.innerHTML="도서제목:" + title +"<br>" +
		                    "가격:" + price + "원" ;
	 }
  }
</script>
</head>
<body>
<input type="button" value="도서정보" id="btn1" onclick="getData()">
<div id="bookinfo"></div>
</body>
</html>










