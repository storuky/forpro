app.controller('AdminPositionsCtrl', ['action', 'AdminPosition', function (action, AdminPosition) {
  var ctrl = this;

  action('index', function () {
    ctrl.positions = AdminPosition.query();

    ctrl.moderate = function (position) {
      AdminPosition.moderate({id: position.id}, function () {
        ctrl.positions = _.select(ctrl.positions, function (_position) {
          return position.id != _position.id
        });
      });
    }

    ctrl.destroy = function (position) {
      AdminPosition.destroy({id: position.id}, function () {
        ctrl.positions = _.select(ctrl.positions, function (_position) {
          return position.id != _position.id
        });
      });
    }
  })

}])