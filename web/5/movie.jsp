<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/5/movie.jsp</title>
<style>
	.comm{width:400px;height: 100px;border:1px solid #aaa;margin-top: 5px;margin-bottom: 5px;}
</style>
<script type="text/javascript">
	function commentsList(){
		const xhr=new XMLHttpRequest();
		xhr.onload=function(){
			const xml=xhr.responseXML;
			//alert(xml);
			const comm=xml.getElementsByTagName("comm");
			const commList=document.getElementById("commList");

			//기존의 댓글 지우기
			const child=commList.childNodes;//자식노드(댓글) 얻어오기
			const length=child.length;//댓글수 구하기
			for(let i=length-1;i>=0;i--){
				const comments=child.item(i);
				commList.removeChild(comments);
			}

			// xml로 받아온 댓글 div에 append하기
			for(let i=0;i<comm.length;i++){
				const num=comm[i].getElementsByTagName("num")[0].textContent;
				const mnum=comm[i].getElementsByTagName("mnum")[0].textContent;
				const id=comm[i].getElementsByTagName("id")[0].textContent;
				const comments=comm[i].getElementsByTagName("comments")[0].textContent;
				const div=document.createElement("div");
				div.innerHTML="아이디:" + id +"<br>" +
							  "내용:" + comments +"<br>" +
							  "<a href='javascript:delComm("+ num +")'>삭제</a>";
							 // "<a href='javascript:delComm(\""+ id + "\")'>삭제</a>";
				div.className="comm";			  
				commList.appendChild(div);
			}			
		};
		xhr.open('get','/ajax01/comm/list?mnum=${vo.mnum}',true);
		xhr.send();
	}
	//ajax로 댓글 삭제 ()
	function delComm(num){

	}

	function addComm(){
		const xhr=new XMLHttpRequest();
		xhr.onload=function(){
			const xml=xhr.responseXML;
			const code=xml.getElementsByTagName("code")[0].textContent;
			//alert(code);
			if(code=='success'){
				commentsList();	
			}else{
				alert('댓글 등록 실패');
			}
		};
		xhr.open('post','/ajax01/comm/insert',true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		//post인 경우 콘텐츠 타입 지정해야 함
		const id=document.getElementById("id").value;
		const comments=document.getElementById("comments").value;
		const param="id=" + id +"&comments=" + comments + "&mnum=${vo.mnum}" ;
		xhr.send(param);
	}

	window.onload=function(){
		commentsList();
	}
</script>
</head>
<body>
<div style="width:400px;height:200px;background-color:#ccc">
	<h1>${vo.title }</h1>
	<p>
		내용:${vo.content }<br>
		감독:${vo.director }<br>
	</p>
</div>
<div>
	<!-- 댓글목록이 보여질 div -->
	<div id="commList"></div>
	<div id="commAdd">
		아이디<br>
		<input type="text" id="id"><br>
		영화평<br>
		<textarea rows="3" cols="50" id="comments"></textarea><br>
		<input type="button" value="등록" onclick="addComm()">
	</div>
	
</div>
</body>
</html>




