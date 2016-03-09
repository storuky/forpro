app.run(['Position', '$location', function (Position, $location) {
  Position.goTo = function (position, event) {
    $location.url('/positions/'+position.id)
    if (event) event.stopPropagation();
  }

  Position.serialize = function (positions) {
    var pluck_fields = ['id', 'product_id', 'trade_type', 'weight', 'weight_dimension_id', 'price', 'price_weight_dimension_id', 'currency_id', 'min_weight', 'min_weight_dimension_id', 'color', 'lat', 'lng']
    return _.map(positions, function (position_fields) {
      var position = {};
      _.each(position_fields, function (field, index) {
        position[pluck_fields[index]] = field;
      })

      position.currency = gon.data.currency_by_index[position.currency_id];
      position.product = gon.data.product_by_index[position.product_id];
      position.weight_dimension = gon.data.weight_dimension_by_index[position.weight_dimension_id];
      position.min_weight_dimension = gon.data.weight_dimension_by_index[position.min_weight_dimension_id];
      position.price_weight_dimension = gon.data.weight_dimension_by_index[position.price_weight_dimension_id];
      position.trade_type_title = gon.data.trade_type[position.trade_type];
      return position;
    })
  }
}])