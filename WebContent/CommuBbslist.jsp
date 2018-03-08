<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="dto.CommuBbsDto"%>
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
<link
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">



<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">

<%!public String toDate(String mdate) {
		String s = mdate.substring(2, 4) + "/" // yyyy
				+ mdate.substring(5, 7) + "/" // MM
				+ mdate.substring(8, 10); // dd
		return s;
	}

	public String toDay() {
		Date today = new Date();
		System.out.println(today);

		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");

		String todate = (String) date.format(today);

		return todate;
	}%>
</head>

<body>
	<%@include file="./layout/header.jsp" %>
	<%@include file="./layout/jumbotron.jsp" %>

	<main role="main">

	<%@include file="./layout/menubar.jsp" %>

	<div class="album py-5 bg-light">
		<!--------- 본문페이지         -------->
		<%
			List<CommuBbsDto> bbslist = (List<CommuBbsDto>) request.getAttribute("bbslist");
		%>

		<div id="hello">
			<div class="row">
				<!-- <div class="offset-md-1"></div> -->
				<div class="offset-md-2 col-md-8">
					<form name="form1" action="CommuBbsController">
						<h1>커뮤니티</h1>
						<hr>
						<a href="CommuBbsController?command=list#hello" class="btn btn-outline-secondary"
							style="width: 90px; background-color: #28A745; color: #fff">전체보기</a>

						<c:forEach items="${categories }" var="category" varStatus="i">
							<button type="button" class="btn btn-success"
								onclick=" classify(${category.seq})">${category.title }</button>
						</c:forEach>

					</form>
				</div>
				<!-- <div class="offset-md-1"></div> -->
			</div>
		</div>
		<br>

		<div class="row">
			<div class="offset-md-2"></div>

			<div class="col-md-8">
				<table class="table table-striped table-sm" id="myTable">
						<col width="7%">
						<col width="13%">
						<col width="43%">
						<col width="20%">
						<col width="10%">
						<col width="7%">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<tbody>
						<%
						if (bbslist == null || bbslist.size() == 0) {
						%>
						<tr>
							<td colspan="6">작성된 글이 없습니다</td>
						</tr>

						<%
						}

						for (int i = 0; i < bbslist.size(); i++) {
							CommuBbsDto bbs = bbslist.get(i);
						%>

						<tr>
							<td><%=i + 1%></td>
							<td><%=bbs.getCategory_name()%></td>
							<td id="td_title">
								<a href="CommuBbsController?command=read&seq=<%=bbs.getSeq()%>">
									&nbsp;&nbsp;<%=bbs.getTitle()%>
								</a> &nbsp;
								<%
								 String reddate = toDate(bbs.getReg_date());
								 String today = toDay();

								 if (reddate.equals(today)) {
								 %>
								 <span class="badge badge-pill badge-success">new</span>
								 <%
								 }
								 %>
							</td>
							<td><%=bbs.getUser_email()%></td>
							<td><%=toDate(bbs.getReg_date())%></td>
							<td><%=bbs.getReadcount()%></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<div class="offset-md-2"></div>
		</div>


		<%--
			<div class="row">
				<div class="offset-md-2"></div>
				<div class="col-md-8">
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
						<div class="col-md-4">
							<a href="CommuBbsController?command=read&seq=<%=bbs.getSeq()%>">
								<%=bbs.getTitle()%>
							</a>
							&nbsp;<%
							String reddate = toDate(bbs.getReg_date());
							String today = toDay();
							if(reddate.equals(today)){
							%>
		 					<span class="badge badge-pill badge-success">new</span>
							<%
							}
							%>
						</div>
						<div class="col-md-3" style="text-align: center;"><%=bbs.getUser_email() %></div>
						<div class="col-md-1" style="text-align: center;"><%=toDate(bbs.getReg_date())%></div>
						<div class="col-md-1" style="text-align: center;"><%=bbs.getReadcount()%></div>
					</div>
					<hr>
					<%
						}
					%> --%>
		<div class="offset-md-2"></div>
	</div>
	<div class="row offset-md-9 col-md-2">
		<button type="button" class="btn btn-success bt n-lg" id="btnWrite">글쓰기</button>
	</div>

	<nav class="navbar navbar-light bg-light offset-md-4">
		<form class="form-inline" id="searchform" name="searchform"
			method="get" action="CommuBbsController">
			<input type="hidden" name="command" value="search" />

			<div class="input-group">
				<div class="input-group-prepend">
					<label class="input-group-text" for="inputGroupSelect01">검색조건</label>
				</div>
				<select class="custom-select" name="Searchtype">
					<option value="email">글쓴이</option>
					<option value="A.title">제목</option>
				</select>
			</div>
				<input class="form-control mr-sm-2" type="text"
				id="SearchWord" name="SearchWord" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" id="search"
				type="submit">Search</button>

		</form>
	</nav>


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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
      feather.replace()
    </script>


	<script type="text/javascript">
	$(document).ready(function(){
		$('#helloworld').tooltip();
	})
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

		$("#search").click(function () {
			var strS = document.getElementById('SearchWord');
			if( strS.value == '' || strS.value == null ){
			    alert( '검색어를 입력해주세요.' );
			    $("#SearchWord").focus();
		        return false;
			}
			$('#searchform').submit();


		});
	</script>
	<script>


		/* $(document).ready(function () {
			 $("#btnAll").click(function () {
			        location.href="CommuBbsController?command=list#hello";

			    });

		    $("#btnCatg1").click(function () {
		        $("form[name=form1]")
		        .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val()+"#hello", method:"post"}).submit();

		    });


		    $("#btnCatg2").click(function () {
		    	 $("form[name=form1]")
		         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val()+"#hello", method:"post"}).submit();
		    });


		    $("#btnCatg3").click(function () {
		    	 $("form[name=form1]")
		         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val()+"#hello", method:"post"}).submit();
		    });
		    */
		    /* $("#btnAll").click(function () {
		        location.href="CommuBbsController?command=list#hello";

		    }); */

		    $("#btnWrite").click(function () {
		   	 location.href="CommuBbsController?command=write";
		   });

		   function classify(seq) {
			   $("form[name=form1]").attr({action:"CommuBbsController?command=classify&target_category="+seq+"#hello", method:"post"}).submit();
		   }




		</script>
		<%@include file="./layout/sendmaster.jsp" %>
		<script type="text/javascript">
    			$(document).ready(function() {
        			$('#myTable').DataTable( {
	        			"order": [[ 0, "asc" ]]
	    			});


				sendMasterTableSet();

			});
    </script>
</body>
</body>
</html>
