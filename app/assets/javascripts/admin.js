// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require oxymoron/angular
//= require oxymoron/angular-resource
//= require oxymoron/angular-touch
//= require oxymoron/angular-ui-router
//= require oxymoron/ng-notify
//= require oxymoron/perfect-scrollbar
//= require oxymoron/store
//= require oxymoron/underscore
//= require oxymoron
//= require angular-no-captcha.min
//= require angular-scroll.min
//= require_self
//= require_tree ./admin

var app = angular.module("forpro", ["oxymoron", "ui.router", "ngTouch", "duScroll"])

app.run(['$rootScope', function ($rootScope) {
  $rootScope.gon = gon;
  $rootScope.Routes = Routes; 
}])