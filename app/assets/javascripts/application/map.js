L.mapbox.accessToken = 'pk.eyJ1IjoiYWdyb2ZvciIsImEiOiJjaWxmOWJoeHMwMDNldzRsejFzaGZwd2poIn0.nXIc1EU4R5zdQvDvjd9RjQ';

var contacts = store.get('contacts') || {};

window.map = L.mapbox.map('map', null, {zoomControl: false})
    .setView([contacts.lat || 54.76267040025495, contacts.lng || 37.37548828125], 6);

L.mapbox.styleLayer('mapbox://styles/agrofor/cim938xcs004ubolzydnzdhmh').addTo(map);

map.on('locationfound', function(e) {
  var contacts = store.get('contacts') || {};
  contacts.lat = e.latlng.lat
  contacts.lng = e.latlng.lng
  store.set("contacts", contacts)

  map.setView(e.latlng, 13);
})

if (!contacts.lat || !contacts.lng) {
  map.locate();
}