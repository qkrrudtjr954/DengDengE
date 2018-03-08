<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.AfterBbsDto"%>
<%@page import="java.util.List"%>
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
<style>
h7{
	font-family: 나눔고딕;
	color: #424242;
}
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}

30%
{
color




:





yellow




;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>



</head>

<body>
	<%@include file="./layout/header.jsp" %>
	<%@include file="./layout/jumbotron.jsp" %>

	<main role="main">

	<%@include file="./layout/menubar.jsp" %>

	<div class="album py-5 bg-light">
		<div class="container">

			<div class="row">
				<h1>&nbsp;입양후기</h1>
			</div>

			<div class="row">
				<span style="font-size: small" >*댕댕이를 통해 가족이된 분들의 이야기입니다.</span>

			</div>
			<hr>

			<%
				List<AfterBbsDto> afterBbslist = (List<AfterBbsDto>) request.getAttribute("afterBbslist");
			%>

			<%-- <%
 String msg = (String)request.getAttribute("msg");
 String afterwirtemsg = (String)request.getAttribute("afterwirtemsg");
 String msg2 = (String)request.getAttribute("msg2");

 %>  --%>



			<%-- 아직 진행 안됨  진행중 --%>
			<%-- <c:if test="${cookie.afterwirtemsg.value != null }">
	<div class="alert alert-success" role="alert">
	  ${cookie.successMsg.value }
	</div>
</c:if> --%>


				<form name="searchform" method="post" action="AfterBbsController" id="myform">
					<input type="hidden" name="command" value="AfterBbsSearch">
					<div class="row" style="margin:0 auto;width:900px;">
						<div class=" offset-md-2 input-group-prepend">
							<select class="custom-select" id="inputGroupSelect01"
								name="Searchtype" style="width: 150px">
								<option value="email">글쓴이</option>
								<option value="title">제목</option>
							</select>
							<input type="text" class="form-control"
								aria-label="Text input with segmented dropdown button" size="50"
								name="SearchWord" id="text">
						</div>
						<div class="serach">
							<input type="button" class="btn btn-success" id="btnsearch" value="검색">
						</div>
						<div>
							<a href="AfterBbsController?command=AfterBbswrite" class="offset-md-10 btn btn-outline-secondary"
							style="width: 90px; background-color: #28A745; color: #fff">글쓰기</a>
						</div>
					</div>
				</form>

			<br><br>

			<div class="row">
				<c:if test="${afterBbslist.size()==0 }">
					<span style="margin:0 auto;width:900px;">검색결과 없음.</span>
				</c:if>

				<c:forEach items="${afterBbslist }" var="item" varStatus="i">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img-top"
								src="${(empty item.pic1) ? './img/no-img.png' : item.pic1  }"
								alt="./img/no-img.png">
							<div class="card-body">
								<p class="card-text">
								<span id="aftertitle">
									${item.title } </span><br>
								<p>
									${item.user_email} <span style="font-size: 12px;"></span>
									<c:choose>
										<c:when test="${item.likecount==0 }">
											<img src="./img/empty_heart.png" height="40">
											<span id="likecount">${item.likecount }</span>
										</c:when>
									<c:otherwise>
										<img src="./img/heart.png" height="40">
										<span id="likecount">${item.likecount }</span>
										</c:otherwise>
									</c:choose>
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a
											href="AfterBbsController?command=AfterBbsDetail&seq=${item.seq }"
											class="btn btn-sm btn-outline-secondary">View</a>
									</div>

									 <!-- 몇일 전, 몇시간전 방금전 등록 되었는지 표시하는 소스  -->
									<c:set var="reg" value="${item.reg_date}" />
									<%
										String temp = (String) pageContext.getAttribute("reg"); //No exception.
											Calendar cal = Calendar.getInstance();

											int cur_day = cal.get(Calendar.DAY_OF_MONTH);
											int cur_hour = cal.get(Calendar.HOUR_OF_DAY);
											int cur_month = cal.get(Calendar.MONTH) + 1;

											SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm", Locale.KOREA);
											cal.setTime(format.parse(temp));

											int reg_day = cal.get(Calendar.DAY_OF_MONTH);
											int reg_hour = cal.get(Calendar.HOUR_OF_DAY);
											int reg_month = cal.get(Calendar.MONTH) + 1;

											int range_month = cur_month - reg_month;
											int range_day = cur_day - reg_day;
											int range_hour = (cur_hour < reg_hour) ? (cur_hour + 24 - reg_hour) : (cur_hour - reg_hour);

											String result = "";
											if (range_month < 1) {
												if (range_day < 1) {
													if (range_hour < 1) {
														result = "방금 전";
													} else {
														result = range_hour + " 시간 전";
													}
												} else {
													result = range_day + " 일 전";
												}
											} else {
												result = range_month + " 달 전 ";
											}

											request.setAttribute("range", result);
									%>




									<small class="text-muted">${ range }</small>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>




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
	<%@include file="./layout/sendmaster.jsp" %>


	<script type="text/javascript">
		$(document).ready(function () {
			sendMasterTableSet();
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
	</script>
	<%-- button  --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$("#btnlist").click(function() {
			// alert("목록으로 돌아 갑니다");
			document.form1.action = "AfterBbsController?command=AfterBbslist";
			document.form1.submit();

		});

		$("#btnWrite").click(function() {
			//alert("글쓰기 화면으로 넘어갑니다");
			document.form1.action = "AfterBbsController?command=AfterBbswrite";
			document.form1.submit();
		});

		$("#btnsearch").click(function() {
			//alert("클릭");
			var no_selection = document.getElementById("no_selection");
			var target_user_seq = document.getElementById("target_user_seq");
			var title = document.getElementById("title");
			var text = $("#text").val();
			if (text === "") {
				alert("검색창이 비웠습니다");
				$("#text").focus();

			} else {
				$("#myform").submit();

			}

		});
	</script>

</body>
</html>
