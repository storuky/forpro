app.controller('PositionsCtrl', ['$scope', 'action', 'Map', 'Position', function ($scope, action, Map, Position) {
  var ctrl = this;

  Map.blur = true;
  $scope.Position = Position;

  action('index', function () {
    Position.query(function (res) {
      ctrl.positions = res;
    });

    ctrl.destroy = function (position) {
      if (confirm("Вы уверены?")) {
        Position.destroy({id: position.id}, function (res) {
          ctrl.positions = _.select(ctrl.positions, function (_position) {
            return _position.id != position.id
          })
        })
      }
    }
  })

  action('new', function () {
    Position.new(function (res) {
      angular.extend(res, store.get('contacts'));
      ctrl.position = res;
    })
    ctrl.save = function (params) {
      Position.create(params, function (res) {
        Map.addMarker(res.position);
        if (!gon.current_user) {
          gon.current_user = res.current_user;
        } else {
          gon.current_user.position_ids.push(res.position.id)
        }
      }, function (res) {
        scrollToError(res)
      })
    };

    $scope.$watch('ctrl.position.weight_dimension_id', function (weight_dimension_id) {
      if (weight_dimension_id) {
        ctrl.position.price_weight_dimension_id = weight_dimension_id;
        ctrl.position.min_weight_dimension_id = weight_dimension_id;
      }
    })
  })

  action('edit', function (params) {
    Position.edit({id: params.id}, function (res) {
      res.email = atob(atob(res.email));
      ctrl.position = res;
    })

    ctrl.save = function (params) {
      Position.update(params, function (res) {
        Map.updateMarker(res.position);
      }, function (res) {
        scrollToError(res)
      })
    }

  })

  action(['new', 'edit'], function () {
    $scope.$watch('ctrl.position', function (position) {
      if (position && (position.name || position.email || position.phone || position.website || position.logo || position.address || position.currency_id)) {
        var contacts = store.get('contacts') || {};
        angular.extend(contacts, _.compactObject(_.pick(position, 'name', 'email', 'phone', 'currency_id', 'website', 'logo', 'lat', 'lng', 'address')))
        store.set('contacts', contacts);
      }
    }, true)

    ctrl.deleteImage = function (image) {
      ctrl.position.images = _.select(ctrl.position.images, function (_image) {
        return image.id != _image.id
      })
    }
  })

  action('show', function (params) {
    ctrl.position = Position.get({id: params.id})

  })

  action(['show', 'index'], function () {
    ctrl.touch = function (position) {
      Position.touch({id: position.id}, function (res) {
        position.updated_at = res.updated_at;
      })
    }
  })


  function scrollToError (res) {
    if (res.data.errors) {
      var overlay = angular.element(document.querySelector('.overlay')),
          element = angular.element(document.querySelector('[name="position['+_.keys(res.data.errors)[0]+']"]'));
      overlay.scrollTo(element, 30, 300);
    }
  }
}])