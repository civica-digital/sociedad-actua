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
        document.getElementById('organization_lat').value = latitude;
        document.getElementById('organization_lng').value = longitude;
        clearOverlays(latitude, longitude);

      } 
    });
    $('#spinner').hide();
  }

  function loading(){
    $('#spinner').show();
  }   


  function codeLatLngEvents(lat, lng) {

      $('#spinner').show();
      try {
          document.getElementById('organization_lat').value = lat;
          document.getElementById('organization_lng').value = lng;
      } catch (e) { };
      var latlng = new google.maps.LatLng(lat,lng);
      geocoder.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            try {
                document.getElementById('organization_address').value = results[1].formatted_address;
            } catch (err) {}
            $('#spinner').hide();
          }
          else{
            alert("Geocoder Not results "+ status);
          }
        } else {
          alert("Geocoder failed due to: " + status);
        }
      });
      $('#organization_address').keyup(function() {
        delay(function(){
          address_latlng(document.getElementById('organization_address').value);
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
            codeLatLngEvents(this.getPosition().lat(),this.getPosition().lng());
          });
      }



function validate_private_public_sum(selected_button){

    var private_id = $("#organization_rate_private").val();
    var public_id = $("#organization_rate_public").val();
    var auto_id = $("#organization_rate_auto").val(); 

    if(selected_button == 'is_private'){
      var resta = parseInt(private_id) + parseInt(public_id);
      if(resta>100){
        document.getElementById('organization_rate_public').selectedIndex = 100-parseInt(private_id);
        document.getElementById('organization_rate_auto').selectedIndex = 0;
      }else{
        document.getElementById('organization_rate_auto').selectedIndex = 100-resta;
      }
    }else if(selected_button == 'is_public'){
      var resta = parseInt(private_id) + parseInt(public_id);
      if(resta > 100){
        document.getElementById('organization_rate_private').selectedIndex = 100 - parseInt(public_id);
        document.getElementById('organization_rate_auto').selectedIndex = 0;
      }else{
        document.getElementById('organization_rate_auto').selectedIndex = 100-resta;
      }
    }else if(selected_button =='auto'){
      var resta = parseInt(private_id) + parseInt(public_id) + parseInt(auto_id);
      if(resta > 100){
        document.getElementById('organization_rate_public').selectedIndex = 100- parseInt(auto_id);
        document.getElementById('organization_rate_private').selectedIndex = 0;
      }else{
        document.getElementById('organization_rate_private').selectedIndex = 100-resta;
      }
    }   
  }

  function validate_national_sum(selected_button){
    if(selected_button=='national'){
      var nacional_id = $("#organization_rate_national").val();
      document.getElementById('organization_rate_international').selectedIndex = 100-nacional_id;
    }else if(selected_button=='international'){
      var internacional_id = $("#organization_rate_international").val();
      document.getElementById('organization_rate_national').selectedIndex = 100-internacional_id;
    }
  }
