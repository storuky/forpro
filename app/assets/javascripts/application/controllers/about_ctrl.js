app.controller('AboutCtrl', ['$scope', '$state', 'User', function ($scope, $state, User) {
  var ctrl = this;

  $scope.$watch('ctrl.recaptcha', function (recaptcha) {
    console.log(recaptcha)
    if (recaptcha) {
      User.create({recaptcha: recaptcha}, function () {
        $state.go("root_path")
      })
    }
  })
}])