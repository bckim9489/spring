<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./common/header.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=acc52117f73ac68dcfec6bb8c3e48438&libraries=services,clusterer,drawing"></script>
<style>

	div.div_left {
		float: left;
		margin-left:10px;
	}
	div.div_right {

		display: inline-block;
		margin-left:10px;
	}
</style>
<div class="container">

	<div class="div_left">
		<div id="map" style="width:600px;height:600px;"></div>
	</div>


	<div class="div_right">
	<form action="/mailSend" method="post">
		<div align="center">
      		도착지: <input type="text" id="dist" size="20" class="form-control>"/>
      		<input type="hidden" id="mail_address" name="address" size="120" style="width:70%;" class="form-control" >
			<button type="button" name="search_btn" id="search_btn" class="">찾기</button>
    	</div>
  	</form>
  	</div>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);

	if (navigator.geolocation) {

	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {

	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도

	        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition);
	        fn_busStop(lat,lon);

	      });

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

	    displayMarker(locPosition);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: locPosition
	    });

	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);
	}

	function fn_search(srch_key){
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(srch_key, function(result, status) {

		    // 정상적으로 검색이 완료됐으면
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		});
	}

	function fn_busStop(x,y){
		var url='http://openapi.gbis.go.kr/ws/rest/busstationservice/searcharound';
		var serviceKey = 'X1wotYBQyrDA64pxlX6t374Ta7O5SL%2F1lj4aL6K5ka2hEdGD%2BG%2BMtUW939ZpjNLeYF1xodpZrD1JQjV1LQrdPg%3D%3D';

		$.ajax({
			url: url,
			data: {
				"serviceKey" : serviceKey,
				"x": x,
				"y": y
			},
			type:"GET",
			success: function(data){
				console.log(data);
			}
		});
	}

	$("#search_btn").on("click", function(){
		var srch_key = $("#dist").val();
		fn_search(srch_key);
	});
</script>
<%@include file="./common/footer.jsp" %>