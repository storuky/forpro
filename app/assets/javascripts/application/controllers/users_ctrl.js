app.controller('UsersCtrl', ['$scope', 'action', 'User', function ($scope, action, User) {
  var ctrl = this;

  action('confirm', function () {
    ctrl.restore = function () {
      ctrl.inProgress = true;
      User.restore({email: ctrl.email}, function (res) {
        ctrl.result = res.msg;
        ctrl.link = "http://"+ctrl.email.split("@")[1];
      }, function () {
        ctrl.inProgress = false;
      })
    }
  })
}])