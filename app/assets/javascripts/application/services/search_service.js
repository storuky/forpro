app.service('Search', ['$http', 'Position', 'Map', '$rootScope', 'ngNotify', function ($http, Position, Map, $rootScope, ngNotify) {
  var Search = this;

  Search.tags = [];

  Search.go = function (options) {
    var params = {
      query: Search.query,
      tags: Search.tags
    }

    $http.get(Routes.search_path({format: "json"}), {params: params})
      .then(function (res) {
        Search.result = Position.serialize(res.data);
        Map.drawMarkers(Search.result, options);
        Search.updateInView();
      })
  }

  $rootScope.$watch(function () {
    return Search.query
  }, function (query) {
    if (query === "") {
      Search.go()
      var contacts = store.get('contacts') || {};
      if (contacts.lat && contacts.lng)
        map.setView([contacts.lat, contacts.lng], 13);
    }
    else if (query !== undefined) {
      Search.go({fitBounds: true})
    }
  })

  Search.updateInView = function () {
    var inBounds = [],
        bounds = map.getBounds();

    _.each(Map.markers, function(marker) {
        if (bounds.contains(marker.getLatLng())) {
          inBounds.push(marker.options);
        }
    });

    Search.inView = inBounds.length;
  }

  Search.addTag = function (tag) {
    if (!tag.product_id) {
      ngNotify.set("Укажите категорию", "error")
      return false;
    }

    if (tag.id) {
      Search.tags[tag.id-1] = angular.copy(tag);
    } else {
      tag.id = Search.tags.length + 1;
      Search.tags.push(angular.copy(tag))
    }
    Search.params = {}
    Search.go()
  }

  Search.removeTag = function (tag) {
    Search.tags = _.select(Search.tags, function (_tag) {
      return tag.id != _tag.id;
    })

    Search.go(Search.tags)
  }

  Search.setTag = function (tag) {
    Search.params = angular.copy(tag);
  }

  Search.reset = function () {
    Search.query = "";
    Search.tags = [];
  }

}])