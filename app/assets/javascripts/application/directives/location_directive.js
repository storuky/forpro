app.directive('location', ['$http', 'Map', function ($http, Map) {
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      lat: "=",
      lng: "=",
      address: "=",
      draggable: "=",
      position: "=",
    }, // {} = isolate, true = child, false/undefined = no change
    // controller: function($scope, $element, $attrs, $transclude) {},
    // require: 'ngModel', // Array = multiple requires, ? = optional, ^ = check parent elements
    restrict: 'C', // E = Element, A = Attribute, C = Class, M = Comment
    // template: '',
    // templateUrl: '',
    // replace: true,
    // transclude: true,
    // compile: function(tElement, tAttrs, function transclude(function(scope, cloneLinkingFn){ return function linking(scope, elm, attrs){}})),
    link: function($scope, iElm, iAttrs, controller) {
      var initMap = $scope.$watch('lat', function () {
        if ($scope.lat) {
          $scope.map = L.mapbox.map(iElm[0], 'mapbox.streets')
                               .setView([$scope.lat, $scope.lng], 13);

          $scope.map.scrollWheelZoom.disable();
          
          $scope.marker = L.marker([$scope.lat, $scope.lng], {
                  icon: L.divIcon({
                    html: ''
                  }),
                  draggable: $scope.draggable
              });
          $scope.marker.addTo($scope.map)

          $scope.marker.on('dragend', function (e) {
            geo(e.target._latlng.lat, e.target._latlng.lng);
          })

          if ($scope.draggable) {
            $scope.map.on('click', function(e) {
              $scope.marker.setLatLng(e.latlng);
              geo(e.latlng.lat, e.latlng.lng);
            });
          }
          
          initMap();
        }
      })

      $scope.$watch('position', function (position) {
        if (position && position.trade_type && $scope.marker) {
          $scope.marker._icon.innerHTML = Map.markerLayout(position);
          if (!position.address && $scope.lat && $scope.lng) geo($scope.lat, $scope.lng)
        }
      }, true)

      var geo = function (lat, lng) {
        $http.jsonp("https://geocode-maps.yandex.ru/1.x/?geocode="+lng+","+lat+"&format=json&callback=JSON_CALLBACK").success(function (res) {
          $scope.city = res.response.GeoObjectCollection.featureMember[0].GeoObject.description;
          $scope.lat = lat;
          $scope.lng = lng;
          $scope.address = res.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.text;
        })
      }
    }
  };
}]);