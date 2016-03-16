app.controller('MainCtrl', ['$http', '$interval', function ($http, $interval) {
  var main = this;

  $interval(function () {
    getStat()
  }, 10000)

  getStat()

  function getStat() {
    $http.get('/admin/stats').then(function (res) {
      main.stats = res.data;
    })
  }
}])