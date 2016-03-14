app.directive('products', [function(){
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      ngModel: "=",
      ngModelTitle: "="
    }, // {} = isolate, true = child, false/undefined = no change
    // controller: function($scope, $element, $attrs, $transclude) {},
    // require: 'ngModel', // Array = multiple requires, ? = optional, ^ = check parent elements
    restrict: 'A', // E = Element, A = Attribute, C = Class, M = Comment
    template: function () {
      var result =  '<div click-outside="opened=false" click-outside-if="opened">'
                      + '<div ng-transclude ng-click="opened = !opened" ng-class="{\'select--opened\': opened}"></div>'
                      + '<div class="select__list" ng-if="opened">'
                        + '<div class="select__list__input">'
                          + '<input ng-init="focus()" class="form-control" placeholder="Поиск..." type="text" ng-model="search">'
                        + '</div>'
                        + '<div class="select__list__scroll">'
                          + '<div class="select__category" ng-repeat="category in gon.data.categories | filter:search">'
                            + '<strong ng-bind="::category.title"></strong>'
                            + '<div ng-click="setActive(product)" class="select__option" ng-repeat="product in category.products | filter:search" ng-bind="::product.title"></div>'
                          + '<div>'
                        + '</div>'
                      + '</div>'
                  + '</div>';

      return result;
    },
    // templateUrl: '',
    // replace: true,
    transclude: true,
    // compile: function(tElement, tAttrs, function transclude(function(scope, cloneLinkingFn){ return function linking(scope, elm, attrs){}})),
    link: function($scope, iElm, iAttrs, controller) {
      $scope.gon = gon;
      var placeholder = iElm[0].querySelector('.select__selected span').innerText;

      $scope.focus = function () {
        iElm[0].querySelector('input').focus();
      }

      $scope.setActive = function (product) {
        $scope.ngModel = product.id;
        $scope.opened= false;
      }

      $scope.$watch('ngModel', function (ngModel) {
        if (ngModel) {
          $scope.ngModelTitle = _.findWhere(gon.data.products, {id: ngModel}).title;
          iElm[0].querySelector('.select__selected span').innerText = $scope.ngModelTitle;
        } else {
          iElm[0].querySelector('.select__selected span').innerText = placeholder;
        }
      })
    }
  };
}]);