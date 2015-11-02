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
