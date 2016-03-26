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
      map: "=",
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
      var initMap = $scope.$watch('position', function () {
        if ($scope.position) {
          $scope.map = L.mapbox.map(iElm[0])
                               .setView([$scope.lat || 54.76267040025495, $scope.lng || 37.37548828125], 6);
          
          L.mapbox.styleLayer('mapbox://styles/agrofor/cim938xcs004ubolzydnzdhmh').addTo($scope.map);

          $scope.map.scrollWheelZoom.disable();
          

          if ($scope.draggable) {
            $scope.map.on('click', function(e) {
              if ($scope.marker) {
                $scope.marker.setLatLng(e.latlng);
              }
              geo(e.latlng.lat, e.latlng.lng);
            });
          }

          $scope.map.on('locationfound', function(e) {
            var contacts = store.get('contacts') || {};
            contacts.lat = e.latlng.lat
            contacts.lng = e.latlng.lng
            store.set("contacts", contacts)

            if ($scope.marker) {
              $scope.marker.setLatLng(e.latlng);
            }

            $scope.map.setView(e.latlng, 13);
            $scope.lng = contacts.lng;
            $scope.lat = contacts.lat;
            geo(e.latlng.lat, e.latlng.lng);
            $scope.$apply();
          })
          
          initMap();
        }
      })

      var initMarker = $scope.$watch('lat', function () {
        if ($scope.lat) {
          
          $scope.map.setView([$scope.lat, $scope.lng], 13);

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

          initMarker();
        }
      })

      $scope.$watch('[lat, lng]', function () {
        if ($scope.marker) {
          $scope.marker.setLatLng([$scope.lat, $scope.lng]);
          $scope.map.setView([$scope.lat, $scope.lng], $scope.map.getZoom())
        }
      })

      $scope.$watch('position', function (position) {
        if (position && position.trade_type && $scope.marker) {
          $scope.marker._icon.innerHTML = Map.markerLayout(position);
          if (position.address===undefined && $scope.lat && $scope.lng) geo($scope.lat, $scope.lng)
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