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
//= require oxymoron
//= require_self
//= require_tree .

var app = angular.module("forpro", ["oxymoron", "ui.router", "ngTouch"])

L.mapbox.accessToken = 'pk.eyJ1IjoiYWdyb2ZvciIsImEiOiJjaWxmOWJoeHMwMDNldzRsejFzaGZwd2poIn0.nXIc1EU4R5zdQvDvjd9RjQ';

var map = L.mapbox.map('map', 'mapbox.streets', {zoomControl: false})
    .setView([47.226039, 39.693642], 13);

