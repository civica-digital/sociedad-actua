var markersArray = [];

    function loadMapLanding(){


      handler = Gmaps.build('Google');
      infowindow = new google.maps.InfoWindow();
      handler.buildMap({ internal: {id: 'geolocation'} }, function(){
        geocoder = new google.maps.Geocoder();
        if(navigator.geolocation){
          navigator.geolocation.getCurrentPosition(centerOnMap);
 
        }  
      });
    }

  function show_marker(){
   var project_name = $("#tag_name").val()+"";
    if(project_name == null || project_name == "" ){
      marker_visible(true,project_name)
    }else{
      marker_visible(false,project_name)
    }

    
  }

  function marker_visible(visible,project_name){
    for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].serviceObject.setVisible(visible);
      handler.getMap().setZoom(12);
      if(project_name-1 == i){
        markersArray[i].serviceObject.setVisible(true);
        handler.map.centerOn(markersArray[i].serviceObject.position)
        handler.getMap().setZoom(18);
      }
    }
  }
