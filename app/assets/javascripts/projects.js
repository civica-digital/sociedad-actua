 //Cargamos el mapa y llamamos la localizacion del usuario
   var markersArray = [];

  //funcion para hacer un delay en el uso de georeferencia
  var delay = (function(){
    var timer = 0;
    return function(callback, ms){
      clearTimeout (timer);
      timer = setTimeout(callback, ms);
    };
  })();

  //obtiene las coordenadas a partir de una direccion en Mexico
  function address_latlng(address){
    $('#spinner').show();
    geocoder.geocode( { 'address': address, 'region':  'mx',}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng();
        document.getElementById('project_lat').value = latitude;
        document.getElementById('project_lng').value = longitude;
        clearOverlays(latitude, longitude);

      } 
    });
    $('#spinner').hide();
  }

  function loading(){
    $('#spinner').show();
  }   


  function codeLatLng(lat, lng) {
      $('#spinner').show();
      document.getElementById('project_lat').value = lat;
      document.getElementById('project_lng').value = lng;
      var latlng = new google.maps.LatLng(lat,lng);
      geocoder.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            document.getElementById('project_direction').value = results[1].formatted_address;
            document.getElementById('project_lat').value = lat;
            document.getElementById('project_lng').value = lng;
            $('#spinner').hide();
          }
          else{
            alert("Geocoder Not results "+ status);
          }
        } else {
          alert("Geocoder failed due to: " + status);
        }
      });
      $('#project_direction').keyup(function() {
        delay(function(){
          address_latlng(document.getElementById('project_direction').value);
        }, 3000 );
      });
  }


  function clearOverlays(latitude, longitude) {
          for (var i = 0; i < markersArray.length; i++ ) {
            markersArray[i].serviceObject.setVisible(false);
          }
          marker = handler.addMarker({
            lat: latitude,
            lng: longitude
          },{ draggable: true});
          markersArray.push(marker);
          handler.map.centerOn(marker);
          handler.getMap().setZoom(18);
          google.maps.event.addListener(marker.serviceObject, 'dragend', function() {
            codeLatLng(this.getPosition().lat(),this.getPosition().lng());
          });
      }