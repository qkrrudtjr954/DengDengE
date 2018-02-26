<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="./icon/favicon.ico">

    <title>Deng Deng E list</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">
  </head>

  <body>
	<header>
		    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
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
      <section>
	      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	        <ul class="nav menu justify-content-center">
			  <li class="nav-item menu-item">
			    <a class="nav-link active " href="#">Active</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Disabled</a>
			  </li>
			</ul>
  		</nav>
      </section>

      <div class="album py-5 bg-light">
        <div class="container">
        
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


<h1 align="center">댕댕이 반려 동물 입양 후기</h1>

<h1>디테일</h1>
<form action="AfterBbsController" method="post">
 <input type="hidden" name="command" value="AfterBbsUpdate">
 <input type="hidden" name="seq"  value="<%=bbs1.getSeq() %>"> 
   
<table border="3">
<col width="150"><col width="750">


<tr>
  <%--  <td colspan="2"><%=bbs1.getTitle() %></td> --%>
  <td><%=bbs1.getTitle() %></td>
  <td><%=bbs1.getSeq() %></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=bbs1.getRdate() %>&nbsp;&nbsp;&nbsp; 조회수 :<%=bbs1.getReadcond() %> </td>
</tr>
<tr>
 <td colspan="2" col height="550"><%=bbs1.getContent() %></td> 


<%-- <td colspan="2">
<textarea rows="100" cols="150"  
name="content" readonly="readonly"><%=bbs1.getContent() %>
</textarea>
</td> --%>


</tr>
<tr>
 <%--  <td colspan="2" align="right"><button><a href="AfterBbsController?command=AfterDelete&seq=<%=bbs1.getSeq() %>"></a>삭제하기</button> --%>
   <!-- <td><input type="submit" value="수정하기"></td> -->
   <td><a href="AfterBbsController?command=AfterBbsUpdate&seq=<%=bbs1.getSeq() %>">수정하기</a></td>
   <td><a href="AfterBbsController?command=AfterDelete&seq=<%=bbs1.getSeq() %>">삭제하기</a></td>
  
</tr>
</table>

<a href="AfterBbsController?command=AfterDelete&seq=<%=bbs1.getSeq() %>"></a>

</form>
        
        
        
        
        
        
		
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
	
	
	<script type="text/javascript">
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');
				
		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
	</script>
  </body>
</html>
