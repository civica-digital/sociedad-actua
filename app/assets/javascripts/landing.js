var markersArray = [];

    function loadMaplanding(){
      handler = Gmaps.build('Google');
      infowindow = new google.maps.InfoWindow();
      handler.buildMap({ internal: {id: 'geolocation'} }, function(){
        geocoder = new google.maps.Geocoder();
        if(navigator.geolocation){
          navigator.geolocation.getCurrentPosition(centerOnMap);
 
        }  
      });
    }

    //mostramos en el mapa la ubicacion del usuario
    function centerOnMap(position){
      handler.map.centerOn([position.coords.latitude,position.coords.longitude]);
      handler.getMap().setZoom(18);
  }