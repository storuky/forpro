app.controller('MainCtrl', ['$scope', 'Map', 'Search', 'User', function ($scope, Map, Search, User) {
  var ctrl = this;

  $scope.Map = Map;
  $scope.Search = Search;

  $scope.setLocale = function (locale) {
    User.locale({locale: locale})
  }

  Search.go()
}])