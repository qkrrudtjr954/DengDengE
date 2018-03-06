<%@page import="dto.User"%>
<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<h1 class="jumbotron-heading">Album example</h1>
			<p class="lead text-muted">Something short and leading about the
				collection below—its contents, the creator, etc. Make it short and
				sweet, but not too short so folks don't simply skip over it
				entirely.</p>
			<p>
				<a href="#" class="btn btn-success my-2">Main call to action</a>
			</p>
		</div>
	</section>
	<section>
		    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	        <ul class="nav menu justify-content-center">
			 <li class="nav-item menu-item">
			    <a class="nav-link" href="AnimalBbsController?command=animlist">분양 동물 보기</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="AfterBbsController?command=AfterBbslist">입양 후기 보기</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="CommuBbsController?command=list">커뮤니티</a>
			  </li>
			  <li class="nav-item menu-item">

			  	<a class="nav-link" href="FindPlaceController?command=findPlace">분양소 찾기</a>
			  </li>
			</ul>
  		</nav>
	</section>


			<%

AfterBbsDto bbs1 = (AfterBbsDto)request.getAttribute("bbs1");
String msg = (String)request.getAttribute("msg");

System.out.println("bbs1 = "  + bbs1);


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
				<div class="offset-md-1"></div>
				<div class="col-md-10">
					<form action="AfterBbsController" method="post">
						<input type="hidden" name="command" value="AfterBbsUpdate">
						<input type="hidden" name="seq" value="<%=bbs1.getSeq()%>">

						<h1>입양후기</h1>
						<hr>

						<div class="row">
							<div class="offset-md-1"></div>
							<div class="col-md-2" align="right">
								<div class="p-3 mb-2 bg-success text-white"
									style="text-align: center;">
									<b>입양후기</b>

								</div>
							</div>

							<div class="col-md-8">
								<p>
								<h4><%=bbs1.getTitle() %></h4>
								</p>
							</div>

							<div class="offset-md-1"></div>
						</div>

						<hr>
						<div class="row offset-md-6">
							<p>
								<b>작성자</b>
								<%=bbs1.getUser_email()%>
								&nbsp;&nbsp;&nbsp;<b>작성일</b>
								<%=toDate(bbs1.getReg_date())%>&nbsp;&nbsp;&nbsp;<b> 조회수 </b>
								<%=bbs1.getReadcond()%>&nbsp;
							</p>
						</div>

						<div class="row">
							<div class="offset-md-1"></div>
							<div class="col-md-10">
								<br> <br>
								<%=bbs1.getContent()%>
								<br> <br>

							</div>
							<div class="offset-md-1"></div>
						</div>
						<hr>
					</form>
				</div>
				<!-- 댓글 달기/ 좋아요 -->

				<div class="offset-md-1 col-md-4" id="likeArea">
					<button type="button" id="btnLike">
						<img
							src="${ isLiked == true ? './img/heart.png' : './img/empty_heart.png' }"
							id="like_img" height="50px" width="50px">
					</button>
					<span id="like_count">${like_count }</span> &nbsp;&nbsp;&nbsp; 
					<img src="./img/comment_1.png" height="30px" width="30px">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="commentCount">0</span>
				</div>
			</div>
			<!-- 댓글 달기/ 좋아요 끝 -->
			<div class="row offset-md-3 col-md-9">
				<input type="text" name="content" id="content0" size="50"> <input type="button" value="comment" onclick="addComment(${bbs1.seq}, 0, 0, 0)">
			</div>
			<br><br>
				<div class="comment-area">
					<c:forEach begin="0" items="${comments }" var="comment" varStatus="i">
						<div class="row">
							<div class="comment-email col-md-2" style="background:pink;height: 50px;">
								${comment.user_email }
							</div>
							<div class="comment-box col-md-8" style="background:lightblue;height: 50px;">
								<div class="row">
									<div class="col-md-${comment.depth }" style="background:red; height:50px;text-align:right;">
										ㄴ>
									</div>
									<div class="col comment-content">
										${comment.content }
									</div>
								</div>
							</div>
							<div class="comment-email col-md-1" style="background:lightyellow;height: 50px;">
								<input type="button" value="comment" id="showComment" onclick="showCommentArea(this)">
							</div>
							<div class="comment-date col-md-1" style="background:green;height: 50px;">
								${comment.reg_date }
							</div>

							<div class="comment-input offset-md-2 col-md-8" style="background: red;display:none;">
								<input type="text" name="content" id="content${i.index+1 }">
								<input type="button" value="comment" onclick="addComment(${bbs1.seq}, ${comment.step }, ${comment.depth }, ${i.index+1 })">
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
	        //alert("클릭");
	         document.form1.action="AfterBbsController?command=AfterDelete";
	         document.form1.submit();
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
			})
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

						for(var i= 0; i < comments.length; i++){

							printCommentHtml(comments[i], (i+1));

						}
					}
				})
			}

			function printCommentHtml(comment, index) {
				var html =
					'<div class="row">'+
						'<div class="comment-email col-md-2 col-xs-6" style="background:pink;height: 50px;">'+
							comment.user_email+
						'</div>'+
						'<div class="comment-box col-md-8 col-xs-12" style="background:lightblue;height: 50px;">'+
							'<div class="row">'+
								'<div class="col-md-'+comment.depth+' col-xs-'+comment.depth+'" style="background:red; height:50px;text-align:right;">'+
									'ㄴ>'+
								'</div>'+
								'<div class="col col-xs-12 comment-content">'+
									comment.content+
								'</div>'+
							'</div>'+
						'</div>'+
						'<div class="comment-email col-md-1" style="background:lightyellow;height: 50px;">'+
							'<input type="button" value="comment" id="showComment" onclick="showCommentArea(this)">'+
						'</div>'+
						'<div class="comment-date col-md-1" style="background:green;height: 50px;">'+
							comment.reg_date+
						'</div>'+

						'<div class="comment-input offset-md-2 col-md-8" style="background: red;display:none;">'+
							'<input type="text" name="content" id="content'+index+'">'+
							'<input type="button" value="comment" onclick="addComment(${bbs1.seq}, '+comment.step+', '+comment.depth+', '+index+')">'+
						'</div>'+
					'</div>'+
					'<hr>';
					console.log(html);
					$('.comment-area').append(html);
			}


	</script>
</body>
</html>
