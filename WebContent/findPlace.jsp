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

<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-1" href="#">DengDengE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav offset-md-9">
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
				<a href="AnimalBbsController?command=animlist"
					class="btn btn-success my-2">분양 동물 보러가기</a>
			</p>
		</div>
	</section>
	<section>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<ul class="nav menu justify-content-center">
				<li class="nav-item menu-item"><a class="nav-link"
					href="AnimalBbsController?command=animlist">분양 동물 보기</a></li>
				<li class="nav-item menu-item"><a class="nav-link"
					href="AfterBbsController?command=AfterBbslist">분양 후기 보기</a></li>
				<li class="nav-item menu-item"><a class="nav-link"
					href="CommuBbsController?command=list">커뮤니티</a></li>
				<li class="nav-item menu-item"><a class="nav-link" 
					href="FindPlaceController?command=findPlace">분양소 찾기</a></li>
			</ul>
		</nav>
	</section>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row" style="height:500px;">
						<div class="map-container">
							<div id="map"></div>					
						</div>
					</div>
					<div id="site-list" class="row"></div>
				</div>
				<div class="col-md-3">
					<table class="table table-striped table-dark">
						<tr>
							<td colspan="3" align="center">
								<img src="./img/daum.png" width="80px" alt="Daum"/> 
								<span style="font-weight:bold;font-size:25px;">검색 결과</span>
							</td>
						</tr>
						<c:forEach items="${jsoupList }" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>
									<a href="${item.link }">${item.name }</a> <br>
									<span style="color:gray;font-size:12px;">${item.desc}</span>
								</td>
							</tr>
						</c:forEach>
					</table>
						
						
						
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

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${initParam.DAUM_API_KEY }&libraries=services"></script>

	<script type="text/javascript">
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');
				
		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
		
		
		var map = '';
		var infowindow = new daum.maps.InfoWindow({zIndex:1});
		var container = document.getElementById('map');
		container.style.width='100%';
		container.style.height='100%';
		
		function getLocation() {
			$('#map').css('background-image', 'url("./img/giphy.gif")');
			$('#map').css('background-size', 'contain');
			$('#map').css('background-repeat', 'no-repeat');
			$('#map').css('background-position', 'center');
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(showPosition);
		    } else {
		        x.innerHTML = "Geolocation is not supported by this browser.";
		    }
		}
		function showPosition(position) {
			var options = {
				center: new daum.maps.LatLng(position.coords.latitude, position.coords.longitude),
				level: 3
			};

			map = new daum.maps.Map(container, options);
			
			
			
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
			    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new daum.maps.LatLng(position.coords.latitude, position.coords.longitude); // 마커가 표시될 위치입니다
			

			 // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		      position: markerPosition,
		      image: markerImage // 마커이미지 설정 
		    });

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch('애견 분양', placesSearchCB);
			
		}
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();
				
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
			/*
			{place_url: "http://place.map.daum.net/10582363", category_group_name: "", place_name: "애견분양", distance: "", address_name: "경기 양평군 양동면 고송리 606", …}
address_name
:
"경기 양평군 양동면 고송리 606"
category_group_code
:
""
category_group_name
:
""
category_name
:
"가정,생활 > 애완동물 > 애견샵"
distance
:
""
id
:
"10582363"
phone
:
""
place_name
:
"애견분양"
place_url
:
"http://place.map.daum.net/10582363"
road_address_name
:
"경기 양평군 양동면 양동로 600"
x
:
"127.70218165492261"
y
:
"37.496455768482335"
*/
			
			
			
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    daum.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;"><a href="'+ place.place_url +'" target="_blank">' + place.place_name + ' 자세히 보기 </a></div>');
		        infowindow.open(map, marker);
		    });
		    
		    $('#site-list').append('<div class="col-md-4 map-result"> <a href="'+ place.place_url +'" target="_blank">' + place.place_name + '</a> </div>');
		}
		
		
		$(function () {
			getLocation();
		})
	</script>
</body>
</html>
