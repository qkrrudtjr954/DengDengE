<%@page import="dto.User"%>
<%@page import="dto.CommuBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="./icon/favicon.ico">

    <title>Deng Deng E list</title>
    
    <style type="text/css">
    #btnLike{
     background: url(button_search.png) no-repeat;
     border: none;
     outline: none;
    }
    
    </style>

   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">

  
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
				<a class="navbar-brand offset-md-2" href="MainControl?command=start">DengDengE</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav offset-md-7">
						<c:choose>
							<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignIn">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignUp">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=signout">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=myPage">마이 페이지</a>
							</li>
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
          <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely.</p>
          <p>
            <a href="#" class="btn btn-success my-2">Main call to action</a>
          </p>
        </div>
      </section>
      
      <%@include file="./layout/menubar.jsp" %>

      <div class="album py-5 bg-light">
        <div class="container">
					<!--------- 본문페이지         -------->
<%
CommuBbsDto comdto = (CommuBbsDto)request.getAttribute("comdto");
%>
	<div class="row">
		
		
		<form name="form1" action="CommuBbsController" method="post">
   		<input type="hidden" name="seq" value="<%=comdto.getSeq() %>">
						<h1>커뮤니티</h1>								
		
	</div>
	<hr>	
<div class="row">
	<div class="offset-md-1 col-md-2" align="right">	
	<div class="p-3 mb-2 bg-success text-white" style="text-align: center;">
	<b><%=comdto.getCategory_name() %></b>
	</div>
	</div>
	<div class="col-md-8">
			<p><h4><%=comdto.getTitle() %></h4></p>
	</div> 
</div>

<hr>
<div class="row offset-md-6">
<p><b>작성자</b>  <%=comdto.getUser_email() %> &nbsp;&nbsp;&nbsp;<b>작성일</b>  <%=toDate(comdto.getLast_update()) %>&nbsp;&nbsp;&nbsp;<b> 조회수 </b> <%=comdto.getReadcount() %>&nbsp;</p>
</div>

<div class="row">
	<div class="offset-md-1"></div>	
	<div class="col-md-10">
		<br>
		<br>
		<%=comdto.getContent() %>
		<br>
		<br>
	</div>
	<div class="offset-md-1"></div>	
</div>
<hr>
<!-- 댓글 달기/ 좋아요 -->

<div class="col-md-4" id="likeArea">
	<button type="button" id="btnLike" >
		<img src="${ isLiked == true ? './img/heart.png' : './img/empty_heart.png' }" id="like_img" height="50px" width="50px">
	</button>
	<span id="like_count">${like_count }</span>&nbsp;&nbsp;&nbsp; 
	<img src="./img/comment_1.png" height="30px" width="30px">&nbsp;&nbsp;&nbsp;&nbsp;
	<span id="commentCount">${comments.size() }</span>
</div>
<!-- 댓글 달기/ 좋아요 끝 -->
<div class="row">
			<div class="offset-md-1 col-md-8">
				<input type="text" class="form-control" name="content" id="content0" size="90" placeholder="댓글을 입력해주세요"> 
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-outline-success" value="comment" onclick="addComment(${comdto.seq}, 0, 0, 0)">
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
								<input type="button" class="btn btn-outline-success col" value="comment" onclick="addComment(${comdto.seq}, ${comment.step }, ${comment.depth }, ${i.index+1 })" >
							</div>
						</div>
						<hr>
					</c:forEach>

			</div>

<%-- ${comments } --%>




<br>
<div class="row">


<%
String sid =((User)session.getAttribute("current_user")).getEmail();

if(comdto.getUser_email().equals(sid)){
%>

<button type="button" class="btn btn-success offset-md-4 col-md-2"  id="btnUpdate">수정하기</button>
&nbsp;

<button type="button" class="btn btn-outline-secondary col-md-2"  id="btnDelete" >삭제하기</button>
<%
}else{%>
<button type="button" id="btnBack" class="btn btn-outline-secondary  offset-md-5 col-md-2">돌아가기</button>
<%
}
%>
</form>
</div>


		
		
		<!-- ---------- -->
        </div>
      </div>

    </main>

    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting started guide</a>.</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>


	
	<script type="text/javascript">
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');
				
		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
		
		
		$('#btnLike').click(function ()  {
		
			$.ajax({
				url:"CommuBbsController",
				data: {command: 'like', seq: ${comdto.seq }, userid: ${current_user.seq }},
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
				url : 'CommuCommentController',
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
					'<input type="button" value="comment" class="btn btn-outline-success col"  onclick="addComment(${comdto.seq}, '+comment.step+', '+comment.depth+', '+index+')">'+
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
				url : 'CommuCommentController',
				method : 'POST',
				data : { command:'deleteComment', seq : seq, ref : ref},
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



<script>
    $(document).ready(function(){
        $("#btnDelete").click(function(){
        if(confirm("정말 삭제하시겠습니까?")==true){
         document.form1.action ="CommuBbsController?command=delete";
         document.form1.submit(); 
        }else{
        	return;
        }
        });
        
        $("#btnUpdate").click(function(){    
            document.form1.action="CommuBbsController?command=update";
            document.form1.submit();
        });
        
        $("#btnBack").click(function () {
	        location.href="CommuBbsController?command=list";

	    });
        
    });
</script>
	



	
 <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>	
	<script type="text/javascript">
$(document).ready(function() {
     $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
     
     $("#btnBack").click(function () {
	        location.href="CommuBbsController?command=list";

	    });
});

	</script>
	


  </body>
</html>
