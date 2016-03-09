app.filter('expireDate', ['$filter', function($filter){
    return function(date) {
      var date = date ? new Date(date) : new Date();

      date.setDate(date.getDate()+7);

      return $filter("date")(date, "dd.MM.yyyy в HH:mm")
    };
}]);