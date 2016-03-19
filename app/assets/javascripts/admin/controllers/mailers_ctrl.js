app.controller('AdminMailersCtrl', ['$scope', 'action', 'AdminMailer', function ($scope, action, AdminMailer) {
  var ctrl = this;

  action('index', function () {
    ctrl.send = function () {
      AdminMailer.create(ctrl.mail, function (argument) {
        ctrl.mail = {}
      })
    }
  })
}])