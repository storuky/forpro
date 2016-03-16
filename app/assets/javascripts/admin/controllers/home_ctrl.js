app.controller('AdminHomeCtrl', ['$http', function($http){
  var ctrl = this;
  
  $http.get('/admin/stats').then(function (res) {
    ctrl.stats = res.data;
  })
}])