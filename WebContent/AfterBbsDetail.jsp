<%@page import="dto.User"%>
<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon" href="./icon/favicon.ico">

<title>Deng Deng E list</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">
    <style type="text/css">
    #btnLike{
     background: url(button_search.png) no-repeat;
     border: none;
     outline: none;
    }

    </style>

     <%!
public String toDate(String mdate){
	String s = mdate.substring(2, 4) + "/"    // yyyy
	         + mdate.substring(5, 7) + "/"   // MM
	         + mdate.substring(8, 10);    // dd
	return s;
}
     
public String CommenttoDate(String mdate) {
 		String s = mdate.substring(1, 4) + "/" // yyyy
 				+ mdate.substring(5, 7) + "/" // MM
 				+ mdate.substring(8, 10) + "<br>"// dd
 				+ mdate.substring(10, 16)
 			/* 	+ mdate.substring(14, 17)+"/" */;
 		return s;
 	}

  %>


</head>

<body>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav offset-md-7">
					<c:choose>
						<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignIn">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignUp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=signout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=myPage">마이 페이지</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</header>
	<main role="main">

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">믿고 맡기는 분양센터</h1>
			<p class="lead text-muted">새로운 가족을 찾는 아이들과 
			갈 곳이 없어진 불쌍한 아이들을 <br> 당신의 곁으로 데려가 주세요</p>
			<p>
				<a href="AnimalBbsController?command=animlist" class="btn btn-success my-2">분양 동물 보러가기</a>
			</p>
		</div>
	</section>
	<%@include file="./layout/menubar.jsp" %>


			<%

AfterBbsDto bbs1 = (AfterBbsDto)request.getAttribute("bbs1");
String msg = (String)request.getAttribute("msg");


if(msg !=null){
%>
<script type="text/javascript">
	alert("<%=msg%>");
</script>
<%
}
%>

	<div class="album py-5 bg-light">
		<div class="container">
		<!-- 본문페이지 -->

			<div class="row">
				
				<div class="col-md-12">
					<form action="AfterBbsController" method="post">
						<input type="hidden" name="command" value="AfterBbsUpdate">
						<input type="hidden" name="seq" value="<%=bbs1.getSeq()%>">

						<h1>입양후기</h1>
						<hr>

						<div class="row">
							<div class="offset-md-1 col-md-2" align="right">
								<div class="p-3 mb-2 bg-success text-white"
									style="text-align: center;">
									<b>입양후기</b>
								</div>
							</div>
							<div class="col-md-9">
								<p>
								<h4><%=bbs1.getTitle() %></h4>
								</p>
							</div>
							<div class="offset-md-10 col-md-2">							
								<button type="button" id="btnBack" class="offset-md-12 btn btn-outline-secondary">돌아가기</button>						
							</div>
						</div>

						<hr>
						<div class="row offset-md-7">
							<p>
								<b>작성자</b>
								<%=bbs1.getUser_email()%>
								&nbsp;&nbsp;&nbsp;<b>작성일</b>
								<%=toDate(bbs1.getReg_date())%>&nbsp;&nbsp;&nbsp;<b> 조회수 </b>
								<%=bbs1.getReadcond()%>&nbsp;
							</p>
						</div>

						<div class="row">
							<div class="col-md-11">
								<br> <br>
								<%=bbs1.getContent()%>
								<br> <br>
								
							</div>
						
						</div>
						
					</form>
					<hr>
				</div>
				
				<!-- 댓글 달기/ 좋아요 -->

				<div class="col-md-4" id="likeArea">
					<button type="button" id="btnLike">
						<img
							src="${ isLiked == true ? './img/heart.png' : './img/empty_heart.png' }"
							id="like_img" height="50px" width="50px">
					</button>
					<span id="like_count">${like_count }</span> &nbsp;&nbsp;&nbsp; 
					<img src="./img/comment_1.png" height="30px" width="30px">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="commentCount">${comments.size() }</span>
				</div>
			</div>
			<br>
			
			<!-- 댓글 달기/ 좋아요 끝 -->
			<div class="row">
			<div class="offset-md-1 col-md-8">
				<input type="text" class="form-control" name="content" id="content0" size="90" placeholder="댓글을 입력해주세요"> 
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-outline-success" value="comment" onclick="addComment(${bbs1.seq}, 0, 0, 0)">
			</div>
			</div>
			<br><br>
				<div class="comment-area">
					<c:forEach begin="0" items="${comments }" var="comment" varStatus="i">
						<div class="row">
							<div class="comment-email col-md-2" style="height: 50px;">
							<img src="./img/user.png" width="30">&nbsp;
								${comment.user_email }
							</div>
							<div class="comment-box col" style="height: 50px;">
								<div class="row">
									<div class="col-md-${comment.depth }" style="height:50px;text-align:right;">
								<c:choose>
								    <c:when test="${comment.depth ==1}">
								    </c:when>	
								    <c:otherwise>
								      	<img src="./img/arrow.png" width="24">
								    </c:otherwise>
								</c:choose>
									</div>
									<div class="col comment-content">
										${comment.content }
									</div>
								</div>
							</div>
							<div class="comment-date col-md-1" style="height: 50px;">
								<fmt:parseDate value="${comment.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
								<fmt:formatDate value="${tempRegDate }" pattern="yyyy/MM/dd" var="regDate"/>
								<font size="2em" color="#696969">${regDate }</font>
							</div>
							
							<div class="comment-email col-md-1" style="height: 50px;">
								<input type="button" value="comment" class="btn btn-outline-success"  id="showComment" onclick="showCommentArea(this)">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="delBtn"onclick="deleteComment(${comment.seq}, ${comment.ref })"><font size="2em" color="#696969"><u>삭제</u></font></button>
							</div>
							

							<div class="comment-input col-md-12" style="display:none;margin-top:10px;">
								<input type="text"  name="content" class="form-control col" id="content${i.index+1 }" size="80">
								<input type="button" class="btn btn-outline-success col" value="comment" onclick="addComment(${comment.seq}, ${comment.step }, ${comment.depth }, ${i.index+1 })" >
							</div>
						</div>
						<hr>
					</c:forEach>

			</div>
					<div class="row">
				<%
					User current_user = (User) session.getAttribute("current_user");

					if (current_user.getEmail().equals(bbs1.getUser_email())) {
				%>

				<form name="form1" class = "offset-md-5" method="post">
					<input type="hidden" name="seq" value="<%=bbs1.getSeq()%>">
					<button id="btnupdete" class="btn btn-success">수정하기</button>
					<button id="btndelete" class="btn btn-outline-secondary">삭제하기</button>
				</form>
				<%
					}
					%>
					
			</div>
		</div>
	</div>

	</main>

	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to top</a>
			</p>
			<p>Album example is &copy; Bootstrap, but please download and
				customize it for yourself!</p>
			<p>
				New to Bootstrap? <a href="../../">Visit the homepage</a> or read
				our <a href="../../getting-started/">getting started guide</a>.
			</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script type="text/javascript">
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');

		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});


		// button
		$("#btnupdete").click(function(){
	        alert("수정화면으로 이동 합니다");
	       document.form1.action ="AfterBbsController?command=AfterBbsUpdate";
	      document.form1.submit();

	     });

	     $("#btndelete").click(function(){
	    	 if(confirm("정말 삭제하시겠습니까?")==true){
	    		 document.form1.action="AfterBbsController?command=AfterDelete";
		         document.form1.submit();
	    	 }else{
	    		 return;
	    	 }
	         
	     });
	    
	     $("#btnBack").click(function(){
	    	 location.href="AfterBbsController?command=AfterBbslist";
		 });

	     $('#btnLike').click(function ()  {

			$.ajax({
				url:"AfterBbsController",
				data: { command: 'like', seq: ${bbs1.seq }, userid: ${current_user.seq }},
				type:"post",
				success : function (data) {

					var result = JSON.parse(data);

					if(result.status == 404){
						$('img#like_img').attr('src', './img/empty_heart.png');
					} else {
						$('img#like_img').attr('src', './img/heart.png');
					}

					$('span#like_count').html(result.like_count);
				}
			});
		});

	     function showCommentArea(commentArea) {
	    	 	var dom = $(commentArea).parent().parent().find('.comment-input');

	    	 	if(dom.css('display') == 'none'){
		    	 	$(commentArea).parent().parent().find('.comment-input').css('display', 'block');
	    	 	} else {
	    	 		$(commentArea).parent().parent().find('.comment-input').css('display', 'none');
	    	 	}
	    	 	
	    	 	
		}

	     function addComment(ref, step, depth, index) {
				$.ajax({
					url : 'AfterCommentController',
					method : 'POST',
					data : { command : 'addComment', ref : ref, step : step, depth : depth, content : $('#content'+index).val() },
					success : function (data) {

						$('.comment-area').children().remove();

						var comments = JSON.parse(data);

						$('#commentCount').html(comments.length);
						for(var i= 0; i < comments.length; i++){

							printCommentHtml(comments[i], (i+1));

						}
						$('#content0').val("");
					}
				})
			}

			function printCommentHtml(comment, index) {
				var html =
					'<div class="row">'+
						'<div class="comment-email col-md-2" style="height: 50px;">'+
							'<img src="./img/user.png" width="30">&nbsp;'+
								comment.user_email+
						'</div>'+
						'<div class="comment-box col" style="height: 50px;">'+
							'<div class="row">'+
								'<div class="col-md-'+comment.depth+'" style=" height:50px;text-align:right;">'+
									depthTest(comment.depth)+
								'</div>'+
								'<div class="col comment-content">'+
									comment.content+
								'</div>'+
							'</div>'+
						'</div>'+
						'<div class="comment-date col-md-1" style="height: 50px;">'+
							'<font size="2em" color="#696969">'+dateTest(comment.reg_date)+'</font>'+
						'</div>'+
						'<div class="comment-email col-md-1" style="height: 50px;">'+
							'<input type="button" value="comment" class="btn btn-outline-success"  id="showComment" onclick="showCommentArea(this)">'+
							'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
							'<button id="delBtn" onclick="deleteComment('+comment.seq+', '+comment.ref+')"><font size="2em" color="#696969"><u>삭제</u></font></button>'+
							'</div>'+
						'<div class="comment-input col-md-12" style="display:none;margin-top:10px;">'+
							'<input type="text" name="content" class="form-control col" id="content'+index+'" size="80">'+
							'<input type="button" value="comment" class="btn btn-outline-success col"  onclick="addComment(${bbs1.seq}, '+comment.step+', '+comment.depth+', '+index+')">'+
						'</div>'+
					'</div>'+
					'<hr>';
					console.log(html);
					$('.comment-area').append(html);
			}
			function depthTest(depth) {
				if(depth == 1) return '&nbsp;';
				else return '<img src="./img/arrow.png" width="24">';
			}
			
			function dateTest(date) {
				var date = new Date(date);
				

				var result =date.getFullYear()+'/'+
		        ((date.getMonth()+1)<10 ? '0'+(date.getMonth()+1) : (date.getMonth()+1))+'/'+
		        (date.getDate()<10 ? '0'+date.getDate() : date.getDate() ) ;
				return result;
			}
			
			function deleteComment(seq, ref) {
				$.ajax({
					url : 'AfterCommentController',
					data : {command: 'deleteComment', seq : seq, ref : ref},
					method : 'POST',
					success : function (data) {
						if(data == "false"){
							alert('본인만 삭제가 가능합니다.');
						} else {
							
							$('.comment-area').children().remove();

							var comments = JSON.parse(data);

							for(var i= 0; i < comments.length; i++){

								printCommentHtml(comments[i], (i+1));

							}
						}
					}
				})
			}
			

	</script>
</body>
</html>
