app.controller('MainCtrl', ['$scope', 'Map', 'Search', 'User', function ($scope, Map, Search, User) {
  var ctrl = this;

  $scope.Map = Map;
  $scope.Search = Search;

  $scope.setLocale = function (locale) {
    User.locale({locale: locale})
  }

  Search.go()

  map.on('move', function() {
    $scope.safeApply(Search.updateInView)
  });

  $scope.safeApply = function(fn) {
    var phase = this.$root.$$phase;
    if(phase == '$apply' || phase == '$digest') {
      if(fn && (typeof(fn) === 'function')) {
        fn();
      }
    } else {
      this.$apply(fn);
    }
  };
}])