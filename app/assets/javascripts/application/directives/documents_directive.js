app.directive('documents', [function(){
  // Runs during compile
  return {
    // name: '',
    // priority: 1,
    // terminal: true,
    scope: {
      documents: "=",
      edit: "="
    }, // {} = isolate, true = child, false/undefined = no change
    // controller: function($scope, $element, $attrs, $transclude) {},
    // require: 'ngModel', // Array = multiple requires, ? = optional, ^ = check parent elements
    // restrict: 'A', // E = Element, A = Attribute, C = Class, M = Comment
    template: function () {
      var template =  '<div>'
                      + '<ul class="position-documents">'
                        + '<li class="position-documents__item" ng-repeat="document in documents">'
                          + '<div class="position-documents__item__extension" ng-bind="document.extension"></div>'
                          + '<a class="position-documents__item__link link" ng-href="{{document.body.url}}" ng-bind="document.filename" target="_blank"></a>'
                          + '<i class="position-documents__item__size">'
                            + '({{document.size}})'
                          + '</i>'
                          + '<i ng-show="$parent.edit" class="icon-trash position-documents__item__trash" ng-click="delete(document)"></i>'
                        + '</li>'
                      + '</ul>'
                      + '<ng-transclude></ng-transclude>'
                    + '</div>'

      return template;
    },
    // templateUrl: '',
    // replace: true,
    transclude: true,
    // compile: function(tElement, tAttrs, function transclude(function(scope, cloneLinkingFn){ return function linking(scope, elm, attrs){}})),
    link: function($scope, iElm, iAttrs, controller) {
      $scope.delete = function (document) {
        $scope.documents = _.select($scope.documents, function (_document) {
          return _document.id != document.id;
        })
      }
    }
  };
}]);