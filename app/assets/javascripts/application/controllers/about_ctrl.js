app.controller('AboutCtrl', ['$scope', '$state', 'User', function ($scope, $state, User) {
  var ctrl = this;

  $scope.$watch('ctrl.recaptcha', function (recaptcha) {
    if (recaptcha) {
      User.create({recaptcha: recaptcha}, function (res) {
        gon.current_user = res.current_user;
        $state.go("root_path")
      })
    }
  })
}])