app.service('Search', ['$http', 'Position', 'Map', '$rootScope', function ($http, Position, Map, $rootScope) {
  var Search = this;

  Search.go = function (params) {
    $http.get(Routes.search_path({format: "json"}), {params: params})
      .then(function (res) {
        Search.result = Position.serialize(res.data);
        Map.drawMarkers(Search.result)
      })
  }

  $rootScope.$watch(function () {
    return Search.query
  }, function (query) {
    if (query !== undefined)
      Search.go({query: query})
  })
}])