app.directive('dimension', [function(){
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      collection: "=",
      ngModel: "=",
      ngModelTitle: "=",
      disabled: "=",
      prefix: "="
    }, // {} = isolate, true = child, false/undefined = no change
    // controller: function($scope, $element, $attrs, $transclude) {},
    // require: 'ngModel', // Array = multiple requires, ? = optional, ^ = check parent elements
    restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment
    template:   '<div class="dimension" ng-class="{disabled: disabled}" click-outside="isOpened = false" click-outside-if="isOpened">'
                + '<div class="dimension__selected" ng-click="toggle()" ng-bind="ngModelTitle"></div>'
                + '<div class="dimension__list" ng-show="isOpened">'
                  + '<div ng-click="checkItem(item)" class="dimension__item" ng-repeat="item in collection" ng-bind="prefix + item.title"></div>'
                + '</div>'
              + '</div>',
    // templateUrl: '',
    // replace: true,
    // transclude: true,
    // compile: function(tElement, tAttrs, function transclude(function(scope, cloneLinkingFn){ return function linking(scope, elm, attrs){}})),
    link: function($scope, iElm, iAttrs, controller) {
      $scope.prefix = $scope.prefix || '';

      $scope.$watchCollection('collection', function (collection) {
        if (collection) {
          if (!$scope.ngModel) $scope.ngModel = collection[0].id;
        }
      })

      $scope.$watch('ngModel', function (ngModel) {
        if (ngModel) {
          $scope.ngModelTitle = $scope.prefix + _.findWhere($scope.collection, {id: ngModel}).title;
        }
      })

      $scope.$watch('ngModelTitle', function (ngModelTitle, old) {
        if (!ngModelTitle && old) $scope.ngModelTitle = old;
      })

      $scope.checkItem = function (item) {
        $scope.ngModel = item.id;
        $scope.isOpened = false;
      }

      $scope.toggle = function () {
        $scope.isOpened = $scope.disabled ? false : !$scope.isOpened;
      }
    }
  };
}]);