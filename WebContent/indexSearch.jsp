<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "com.fumigatorProject.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String untact = request.getParameter("untact");
	String packing = request.getParameter("packing");
	String deliver = request.getParameter("deliver");
	String tripstart = request.getParameter("tripstart");
	String tripclose = request.getParameter("tripclose");
	String eaterycategory = request.getParameter("eaterycategory");
	String categoryname = request.getParameter("categoryname");
	String categorymemo = request.getParameter("categorymemo");
	
	EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();
	ArrayList<EateryfumigatorDTO> eateryList = eateryfumigatorDAO.mainQuery(untact,packing,deliver,tripstart,tripclose,eaterycategory,categoryname,categorymemo);
%>
	
	<jsp:include page="top.jsp" flush="true"/>
	<jsp:include page="Mainsidebar.jsp" flush="true"/>
	<br>
	<br>
	
	<center>
	<div id="map" style="width:800px;height:800px;"></div>
	 <div id="menu_wrap" class="bg_white">
	 
	 <%
	 	for(int i =0; i<eateryList.size(); i++) {
	 		String eateryname = eateryList.get(i).getEateryName();
	 		String eaterytime = eateryList.get(i).getEateryTime();
	 		String eaterytel = eateryList.get(i).getEateryTel();
	 		String fileimage = eateryfumigatorDAO.fileOneQuery(eateryList.get(i).getEaterynumber());
	 		String category = eateryList.get(i).getEaterycategory();
	 		int eaterynumber = eateryList.get(i).getEaterynumber();
	 	
	 %>
   		<div onclick="listclick(<%=eaterynumber%>)">
        	<table class="tablemain">
        		<tr>
        		<td class="td1">
        			<img src="/upload/<%=fileimage%>"width="73" height="70"> 
        			
        		</td>
        		<td class="td1">
        		<a class="td2"><%=eateryList.get(i).getEateryName() %></a><br>
        		<%=eateryList.get(i).getEateryAddr() %>
        		</td>
        		</tr>
        	</table>
   		</div>
   		<%
	 	}
   		%>
   				
   		</div>
	</center>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9820853baf9c374fbc6b13812abb7da7&libraries=services"></script>
	<script>
	var custom = {};

	// 마커를 표시할 위치등 객체 배열
	var positions = [
			<%	
				for(int i = 0; i < eateryList.size(); i++) {
			%>
				{
					eaterynumber : '<%=eateryList.get(i).getEaterynumber() %>',
					title : '<%=eateryList.get(i).getEateryName()%>',
					address : '<%=eateryList.get(i).getEateryAddr()%>',
					Time : '<%=eateryList.get(i).getEateryTime()%>',
					tel : '<%=eateryList.get(i).getEateryTel()%>',
					category : '<%= eateryList.get(i).getEaterycategory()%>',
			<%	
					String name = eateryfumigatorDAO.fileOneQuery(eateryList.get(i).getEaterynumber());
			%>
					fileimagee : '<%=name %>',
				},
			<%
				}
				
			%>
	];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.820263, 127.108998), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	//음식점에 대한 마커 
	var imageSrcCook = '/upload/map_i01.png'; // 음식점 마커이미지의 주소입니다    
	//기타에 대한 마커
    var imageSrcOn = '/upload/map_i02.png'; // 기타 마커이미지의 주소입니다    
    //커피숍에 대한 마커  
	var imageSrcCoffe = '/upload/map_i03.png'; // 커피숍 마커이미지의 주소입니다    
	
	imageSize = new kakao.maps.Size(34, 49), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(19, 55)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    
    var clickedOverlay = null;
	  // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    function myMarker(title,Time,tel, image,category,address,eaterynumber) {
        // 주소로 좌표를 검색
        geocoder.addressSearch(address,function(result, status) {
        	
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
            	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            	
            	var markerImage = null;
        	 	
            	if(category == "cook"){
            		markerImage = new kakao.maps.MarkerImage(imageSrcCook, imageSize, imageOption);
            	}else if(category =="coffe"){
            		markerImage = new kakao.maps.MarkerImage(imageSrcCoffe, imageSize, imageOption);
            	}else {
            		markerImage = new kakao.maps.MarkerImage(imageSrcOn, imageSize, imageOption);
            	}
            	
            	// 결과값으로 받은 위치를 마커로 표시
            	var marker = new kakao.maps.Marker({
            		map : map,
                    position : coords,
                    image : markerImage
                    });   
            	
            	// 커스텀 오버레이가 표시될 위치
                var position = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 커스텀 오버레이를 생성
                var customOverlay = new kakao.maps.CustomOverlay({
                	map : map,
                    position : position,});
            
 					custom[eaterynumber] = customOverlay;	  
                
 					
					customOverlay.setContent(content(title,image,address,Time,tel,eaterynumber));
					customOverlay.setMap(null);
					kakao.maps.event.addListener(marker, 'click', clickListener(eaterynumber));
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
                }
            });
	    }
    for (i = 0; i < positions.length; i++) {
        myMarker(positions[i].title,positions[i].Time, positions[i].tel,positions[i].fileimagee, positions[i].category,positions[i].address,positions[i].eaterynumber);
    }
    
    //목록에서 누를시
    function listclick(eaterynumber){
    	if(custom[eaterynumber].getMap()) {
    		custom[eaterynumber].setMap(null);
    	}else {
    		custom[eaterynumber].setMap(map); 
    	}
    }
    
    // 커스텀을를 클릭하면 다시 보인다 
    function clickListener(eaterynumber) {
    	return function() {
        	if(custom[eaterynumber].getMap()) {
        		custom[eaterynumber].setMap(null);
        	}else {
        		custom[eaterynumber].setMap(map); 
        	}  
        };
    }   
   
	 function formChk(){
	    if(document.SeleteForm.tripstart.value==''){
	      alert("날짜를 정확하게 선택해주세요.");
	      return false;
	    }else if(document.SeleteForm.tripclose.value==''){
	      alert("날짜를 정확하게 선택해주세요.");    
	 	  return false;
	    }
	    document.SeleteForm.submit();
	}
	 
	function content(title,image,address,Time,tel,custom) {
	      var content = '<div class="wrap">' + 
	  		'             <div class="info">' + 
	  	 	'             <div class="title">'+title+ 
	     	'             <div class="close" type="button" onclick="closeOverlay(\'' + custom +'\')" title="닫기"></div>' + 
	   		'              \</div>' + 
			'              <div class="body">' + 
	        '              <div class="img">' +
	        '              <img src="/upload/'+image + '\" width="73" height="70">' +
	        '              </div>' + 
	        '              <div class="desc">' + 
	        '              <div class="ellipsis">'+address+'</div>' + 
	        '                <div class="jibun ellipsis">영업시간 : '+Time+'</div>' + 
	        '                <div class="jibun ellipsis">전화번호 : '+tel+'</div>' +
	        '                <div class="jibun ellipsis"><a href="/CustomView.jsp?eaterynumber='+custom+'")">전체보기</a></div>' +
	        '              </div>' + 
	        '              </div>' + 
	        '             </div>' +    
	        '            </div>';
	    	
	        return content;
	    }
	    
	    function closeOverlay(eaterynumber) {
	    	custom[eaterynumber].setMap(null);
	    	
	    }
 </script>

</body>
</html>