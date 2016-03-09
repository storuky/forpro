app.directive('switcher', [function(){
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      ngModel: "=",
      ngModelTitle: "=",
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
      var switcher_items = angular.element(iElm[0].querySelectorAll('.switcher__item'));

      switcher_items.bind('click', function () {
        $scope.ngModel = this.getAttribute('value');
        $scope.$apply();
      })

      $scope.$watch('ngModel', function (ngModel) {
        if (ngModel) {
          switcher_items.removeClass('active');
          var el = angular.element(iElm[0].querySelectorAll('.switcher__item[value="'+ngModel+'"]'))
          el.addClass('active');
          $scope.ngModelTitle = el.text().trim();
        }
      })
    }
  };
}]);