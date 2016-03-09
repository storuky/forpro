app.service('Map', ['$rootScope', '$filter', function ($rootScope, $filter) {
  var Map = this;

  Map.markerLayout = function (position) {
    var position = position || {weight_dimension: {}, currency: {}, price_weight_dimension: {}, product: {}};
    var marker = "<a class='marker-label marker-label--"+position.color+"'>"
                  + "<div class='marker-label__head'>" + gon.data.trade_type[position.trade_type] + " " + (position.weight || 0) + " " + gon.data.weight_dimension_by_index[position.weight_dimension_id].title + ", " + (position.price || 0) + " " + gon.data.currency_by_index[position.currency_id].title + "/" + gon.data.weight_dimension_by_index[position.price_weight_dimension_id].title + "</div>"
                  + "<div class='marker-label__body'>" + (position.product_id ? gon.data.product_by_index[position.product_id].title : gon.translations.position.product) + "</div>"
                + "</a>";

    return marker;
  }

  Map.buildCluster = function () {
    Map.cluster = new L.MarkerClusterGroup({
      iconCreateFunction: function(cluster) {
        return L.divIcon({
          'marker-symbol': cluster.getChildCount(),
          html: "<div class='marker-label cluster marker-label--green'>"
                    + "<div class='marker-label__body'>"+cluster.getChildCount()+" " + $filter("plur")(cluster.getChildCount(), ["позиция", "позиции", "позиций"]) + "</div>"
               + "</div>"
        });
      }
    });
  }

  Map.buildMarker = function (position) {
    var marker = L.marker([position.lat, position.lng], {
            icon: L.divIcon({
              html: Map.markerLayout(position)
            })
        });
    marker.on('click', function () {
      Position.goTo(position);
      $rootScope.$apply();
    })

    return marker;
  }


  Map.drawMarkers = function (positions) {
    Map.markers = {};
    if (Map.cluster) {
      Map.cluster.clearLayers()
    } else {
      Map.buildCluster();
    }

    _.each(positions, function (position) {
      Map.markers[position.id] = Map.buildMarker(position)
      Map.cluster.addLayer(Map.markers[position.id]);
    })

    map.addLayer(Map.cluster);
    if (positions.length)
      map.fitBounds(Map.cluster.getBounds());
  }

  Map.addMarker = function (position) {
    Map.markers[position.id] = Map.buildMarker(position);
    Map.cluster.addLayer(Map.markers[position.id]);
  }

  Map.updateMarker = function (position) {
    Map.markers[position.id]._icon.innerHTML = Map.markerLayout(position)
  }
}])