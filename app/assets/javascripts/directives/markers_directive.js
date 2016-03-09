app.directive('markers', [function(){
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      ngModel: "=",
      position: "=position"
    }, // {} = isolate, true = child, false/undefined = no change
    // controller: function($scope, $element, $attrs, $transclude) {},
    // require: 'ngModel', // Array = multiple requires, ? = optional, ^ = check parent elements
    // restrict: 'A', // E = Element, A = Attribute, C = Class, M = Comment
    template: function () {
      var result =  "<div class='markers-choose' ng-repeat='marker in markers' ng-class='[{active: marker.name == $parent.ngModel}, \"markers-choose--\"+marker.name]' ng-click='$parent.ngModel = marker.name'>"
                      + "<a class='marker-label marker-label--{{marker.name}}'>"
                        + "<div class='marker-label__head'>{{position.trade_type_title}} {{position.weight || 0}} {{position.weight_dimension_title || position.weight_dimension.title}}, {{position.price || 0}} {{position.currency_title || position.currency.title}}/{{position.price_weight_dimension_title || position.price_weight_dimension.title}}</div>"
                        + "<div class='marker-label__body'>{{position.product_title || position.product.title || '"+gon.translations.position.product+"'}}</div>"
                      + "</a>"
                      + "<div class='markers-choose__description'>"
                        + "{{marker.title}}"
                        + "<div class='markers-choose__price'>{{marker.price}}</div>"
                      + "</div>"
                  + "</div>"
      return result;
    },
    // templateUrl: '',
    // replace: true,
    // transclude: true,
    // compile: function(tElement, tAttrs, function transclude(function(scope, cloneLinkingFn){ return function linking(scope, elm, attrs){}})),
    link: function($scope, iElm, iAttrs, controller) {
      $scope.markers = gon.data.markers;
      $scope.ngModel = $scope.ngModel || $scope.markers[0].name;
      $scope.$watch('ngModel', function (ngModel, old) {
        if (!ngModel && old) {
          $scope.ngModel = old;
        }
      })
    }
  };
}]);