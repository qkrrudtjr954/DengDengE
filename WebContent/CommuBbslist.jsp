<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="dto.CommuBbsDto"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Deng Deng E list</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">

<%!
public String toDate(String mdate){
	String s = mdate.substring(2, 4) + "/"    // yyyy
	         + mdate.substring(5, 7) + "/"   // MM
	         + mdate.substring(8, 10);    // dd
	return s;
}

public String toDay(){
	Date today = new Date();
	System.out.println(today);
	
	SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
	
	String todate =(String)date.format(today);
	
	return todate;
} 

%>

<script>
   
   
$(document).ready(function () {
	 $("#btnAll").click(function () {
	        location.href="CommuBbsController?command=list";

	    });
	
    $("#btnCatg1").click(function () {
        $("form[name=form1]")
        .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();

    });
    

    $("#btnCatg2").click(function () {
    	 $("form[name=form1]")
         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();
    });
    

    $("#btnCatg3").click(function () {
    	 $("form[name=form1]")
         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();
    });
    
    $("#btnWrite").click(function () {
   	 location.href="CommuBbsController?command=write";
   });
   

});
   
 
</script>

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
				<li class="nav-item menu-item"><a class="nav-link active "
					href="#">Active</a></li>
				<li class="nav-item menu-item"><a class="nav-link" href="#">Link</a>
				</li>
				<li class="nav-item menu-item"><a class="nav-link" href="#">Link</a>
				</li>
				<li class="nav-item menu-item"><a class="nav-link" href="#">Disabled</a>
				</li>
			</ul>
		</nav>
	</section>

	<div class="album py-5 bg-light">
		<div class="container">
			<!--------- 본문페이지         -------->
			<%
				List<CommuBbsDto> bbslist = (List<CommuBbsDto>) request.getAttribute("bbslist");
			%>


			<div class="row">
				<div class="offset-md-1"></div>
				<div class="col-md-10">
					<form name="form1" action="CommuBbsController">
						<h1>커뮤니티</h1>
						<hr>
						<button type="button" class="btn btn-success" id="btnAll">전체보기</button>
						&nbsp;
						<button type="button" class="btn btn-success" id="btnCatg1"
							value="1">애견Tip</button>
						&nbsp;
						<button type="button" class="btn btn-success" id="btnCatg2"
							value="2">중고장터</button>
						&nbsp;
						<button type="button" class="btn btn-success" id="btnCatg3"
							value="3">자유게시판</button>
				
				</form>
				</div>
				<div class="offset-md-1"></div>
			</div>

			<div class="row">
				<div class="offset-md-1"></div>

				<div class="col-md-10">
					<hr>
					<div class="row">
						<div class="col-md-2" style="text-align: center;">
							<b>카테고리</b>
						</div>
						<div class="col-md-1" style="text-align: center;">
							<b>번호</b>
						</div>
						<div class="col-md-5" style="text-align: center;">
							<b>제목</b>
						</div>
						<div class="col-md-2" style="text-align: center;">
							<b>작성자</b>
						</div>
						<div class="col-md-1" style="text-align: center;">
							<b>작성일</b>
						</div>
						<div class="col-md-1" style="text-align: center;">
							<b>조회수</b>
						</div>
					</div>
					<hr>
				</div>

				<div class="offset-md-1"></div>
			</div>

			<div class="row">
				<div class="offset-md-1"></div>
				<div class="col-md-10">
					<%
						if (bbslist == null || bbslist.size() == 0) {
					%>
					<div class="offset-md-5 col-md-5">작성된 글이 없습니다.</span></div>
					<hr>
				

					<%
						}
						for (int i = 0; i < bbslist.size(); i++) {
							CommuBbsDto bbs = bbslist.get(i);
					%>
					<div class="row">
						<div class="col-md-2" style="text-align: center;"><%=bbs.getCategory_name()%></div>
						<div class="col-md-1" style="text-align: center;"><%=i + 1%></div>
						<div class="col-md-5">
							<a href="CommuBbsController?command=read&seq=<%=bbs.getSeq()%>">
								<%=bbs.getTitle()%>
							</a>
						</div>
						<div class="col-md-2" style="text-align: center;"><%=bbs.getTarget_user_seq()%></div>
						<div class="col-md-1" style="text-align: center;"><%=toDate(bbs.getReg_date())%></div>
						<div class="col-md-1" style="text-align: center;"><%=bbs.getReadcount()%></div>
					</div>
					<hr>
					<%
						}
					%>
					<div class="offset-md-1"></div>
				</div>
<div class="row offset-md-9 col-md-2">
<button type="button" class="btn btn-success btn-lg" id="btnWrite">글쓰기</button>
</div>				
				
<nav class="navbar navbar-light bg-light offset-md-3">
<form class="form-inline" name="searchform" method="get" action="CommuBbsController">
	<input type="hidden" name="command" value="search" />

	<div class="input-group">
  		<div class="input-group-prepend">
   		 <label class="input-group-text" for="inputGroupSelect01">검색조건</label>
 		 </div>
	<select class="custom-select" name="Searchtype">
			<option value="target_user_seq">글쓴이</option>
			<option value="A.title">제목</option>	
	</select>
	</div>
&nbsp;&nbsp;
 <input class="form-control mr-sm-2" type="text" name="SearchWord" placeholder="Search" aria-label="Search">
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

</form>
</nav>


				<!-- 	-------------------------- -->
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<script type="text/javascript">
		$('.menu-item').on(
				'mouseover',
				function() {
					$(this).css('background', 'green').css('border',
							'1px solid green').css('border-radius', '15px');
					$(this).children('.nav-link').css('color', 'white');

				});
		$('.menu-item').on(
				'mouseout',
				function() {
					$(this).css('background', '').css('border',
							'1px solid white').css('border-radius', '5px');
					$(this).children('.nav-link').css('color', 'white');
				});
	</script>
</body>
</html>
