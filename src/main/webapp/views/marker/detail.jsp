<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #map {
        width: 400px;
        height: 400px;
        border: 1px solid gray;
    }
</style>

<script>
    let marker_detail_map = {
        map:null,
        init:function (){
            var mapContainer = document.querySelector('#map');// 지도를 표시할 div
            var mapOption = {
                center: new kakao.maps.LatLng(${dmarker.lat}, ${dmarker.lng}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            var markerPosition  = new kakao.maps.LatLng(${dmarker.lat}, ${dmarker.lng});

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/uimg/${dmarker.img}" style="width:10vw"><div style="padding:5px;">${dmarker.title}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });
            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                location.href='${dmarker.target}';
            });
        }
    }
    let marker_detail = {
        init:function(){
            $('#update_btn').click(function(){
                marker_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href="/marker/deleteimpl?id=${dmarker.id}";
                }
            });
        },
        send: function(){
            $('#detail_form').attr({
                'action':'/marker/updateimpl',
                'method':'post',
                enctype: 'multipart/form-data'
            });
            $('#detail_form').submit();
        }
    };

    $(function(){
        marker_detail_map.init();
        marker_detail.init();
    });
</script>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">${dmarker.id}</h6>
            </div>
            <div class="card-body">
                <div id="container">
                    <div class="row content">
                        <div class="col-sm-8  text-left ">
                            <h1>Marker Information</h1>
                            <form id="detail_form" class="form-horizontal well">
                                <input type="hidden" name="id" value="${dmarker.id}">
<%--                                폼 태그 안에 있는 정보만 날아가기 때문에 id를 위쪽에서 출력하긴 했지만 정보를 보내기 위해 폼 안에 히든 속성으로 하나 더 써주는 것--%>
                                <input type="hidden" name="img" value="${dmarker.img}">
<%--                                이것도 만약에 밑에서 이미지를 추가하지 않고 업데이트를 치면 이미지가 삭제되어 버리기 때문에 히든 속성으로 하나 더 써주는거!--%>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <img src="/uimg/${dmarker.img}" style="width: 500px; height: 500px; margin: 20px 0">
                                    </div>
                                    <label class="control-label col-sm-4" for="id">ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" id="id" value="${dmarker.id}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="title">Title:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="title" class="form-control" id="title" value="${dmarker.title}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="target">Target:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="target" class="form-control" id="target" value="${dmarker.target}" style="margin-bottom:5px">
                                        <a href="${dmarker.target}"><span>바로가기</span></a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="lat">Latitude:</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="lat" class="form-control" id="lat" value="${dmarker.lat}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="lng">Longitude:</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="lng" class="form-control" id="lng" value="${dmarker.lng}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="loc">Location:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="loc" class="form-control" id="loc" value="${dmarker.loc}" style="margin-bottom:5px">
                                        <span>서울이면 s, 부산이면 b, 제주도면 j를 입력하세요.</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="imgfile">Image:</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="imgfile" class="form-control" id="imgfile" placeholder="Input image">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="update_btn" type="button" class="btn btn-primary" style="margin-top:10px">Update</button>
                                        <button id="delete_btn" type="button" class="btn btn-primary" style="margin-top:10px">Delete</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10" id="map"></div>

                </div>
            </div>
        </div>
    <!-- /.container-fluid -->
    </div>