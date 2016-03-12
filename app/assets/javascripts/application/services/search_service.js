app.service('Search', ['$http', 'Position', 'Map', '$rootScope', function ($http, Position, Map, $rootScope) {
  var Search = this;

  Search.go = function (params, options) {
    $http.get(Routes.search_path({format: "json"}), {params: params})
      .then(function (res) {
        Search.result = Position.serialize(res.data);
        Map.drawMarkers(Search.result, options);
        Search.updateInView();
      })
  }

  $rootScope.$watch(function () {
    return Search.query
  }, function (query) {
    if (query === "") {
      Search.go({query: query})
      var contacts = store.get('contacts') || {};
      if (contacts.lat && contacts.lng)
        map.setView([contacts.lat, contacts.lng], 13);
    }
    else if (query !== undefined) {
      Search.go({query: query}, {fitBounds: true})
    }
  })

  Search.updateInView = function () {
    var inBounds = [],
        bounds = map.getBounds();

    _.each(Map.markers, function(marker) {
        if (bounds.contains(marker.getLatLng())) {
          inBounds.push(marker.options);
        }
    });

    Search.inView = inBounds.length;
  }
}])