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
