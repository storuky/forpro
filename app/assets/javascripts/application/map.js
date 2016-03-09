L.mapbox.accessToken = 'pk.eyJ1IjoiYWdyb2ZvciIsImEiOiJjaWxmOWJoeHMwMDNldzRsejFzaGZwd2poIn0.nXIc1EU4R5zdQvDvjd9RjQ';

var contacts = store.get('contacts') || {};

window.map = L.mapbox.map('map', 'mapbox.streets', {zoomControl: false})
    .setView([contacts.lat || 55.878876, contacts.lng || 36.994409], 13);

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