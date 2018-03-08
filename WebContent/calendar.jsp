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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.css' />

<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">
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

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<h4>댕댕이와 함께하는 축제 일정 </h4>
				<div id="calendar"></div>
				
			</div>
			
			<div class="modal" tabindex="-1" role="dialog" id="showEvent">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title show-event-title"></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body show-event-body">
								<div class="show-event-range">
									<div class="col">
										<span id="start2"></span>
									</div>
									<div class="col">
										<span id="end2"></span>
									</div>
								</div>
								<div class="show-event-location"></div>
								<div class="show-event-content"></div>
								<div id="map2"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="addEvent">일정 등록하기</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
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
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- fullcalendar and moment javascript -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.js'></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${initParam.DAUM_API_KEY }&libraries=services"></script>

	<script type="text/javascript">
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function drowMap(addr, mapContainer) {
		    
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        /* 
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">hello</div>'
			        });
			        infowindow.open(map, marker);
			 		*/
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		}
	</script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$.ajax({
				url : 'CalendarController',
				data : { command : 'getEvents' },
				method : 'POST',
				success : function (data) {
					var events = [];
					var temp = JSON.parse(data);
					
					for(var i=0; i<temp.length; i++){
						var obj = {};
						obj.title = temp[i].title;
						obj.start = temp[i].start;
						obj.end = temp[i].end;
						obj.target = temp[i].seq;
						
						events[i] = obj;
					}
					
					$('#calendar').fullCalendar({
					    events: events,
					    selectable: true,
						eventClick: function(calEvent, jsEvent, view) {
							showEvent(calEvent.target);
						}
				    })
				}
			})
		    
			
		});
		
		function showEvent(target) {
			$.ajax({
				url : 'CalendarController',
				method : 'POST',
				data : { command : 'getEvent', target : target},
				success : function (data) {
					var event = JSON.parse(data);
					$('#showEvent').modal();
					$('.show-event-title').html(event.title);
					$('#start2').html(event.start);
					$('#end2').html(event.end);
					$('.show-event-location').html(event.location);
					$('.show-event-content').html(event.content);
					
					var mapContainer = document.getElementById('map2');
					$('#map2').css('width', '100%');
					$('#map2').css('height', '350px');
					drowMap(event.location, mapContainer);
				}
			})
		}
		</script>
</body>
</html>
