# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js./
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module("ElBienOrganizado")
.controller("ElBienOrganizadoCtrl", ['$scope', '$http', ($scope, $http) ->
  $http.get('http://codeforamerica.org/api/organizations.geojson')
  .success((data, status, headers, config) ->
    $scope.organizations = []

    data.features.forEach((element, index, array) ->
      $scope.organizations[index] =
        'type': element.type
        'geometry':
           'type': element.geometry.type
           'coordinates': element.geometry.coordinates
        'id': element.id
    )

    updatePoints($scope.organizations)
    $scope.map = map
    console.log(data)
  ).error((data, status, headers, config) ->
    console.log("error")
  )
])


map = L.map 'map',
  center: [41.8781, -87.62981],
  zoom: 3

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  attribution: '&copy; OpenStreetMap contributors'
).addTo map


updatePoints = (points) ->
  L.geoJson(points,
    pointToLayer:  (feature, latlng) ->
      if (typeof (feature.properties) isnt 'undefined' and
          typeof (feature.properties.circle) isnt 'undefined' and
          feature.properties.circle is 'true')
        L.circle(latlng, feature.properties.radius)
      else
        marker = L.marker(latlng, clickable: true)
        marker.on('click', (e) ->
          console.log(feature)
          console.log(latlng)
          # point = L.point(latlng.lat, latlng.lng)
          point = map.latLngToLayerPoint(marker.getLatLng())
          point.y -= marker.options.icon.options.iconSize[1]
          console.log(marker.options.icon)

          point = map.layerPointToLatLng(point)

          L.popup()
          .setContent(feature.id)
          .setLatLng(point)
          .openOn(map)
        )
  ).addTo map
