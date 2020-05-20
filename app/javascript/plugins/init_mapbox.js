import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

// const addMarkerToMap = (map, marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup)
//       .addTo(map);
// };

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

// const fitMapToMarker = (map, marker) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   marker => bounds.extend([ marker.lng, marker.lat ]);
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    console.log(map)
    const markers = JSON.parse(mapElement.dataset.markers);
    // const marker = JSON.parse(mapElement.dataset.marker);
    console.log(marker)
    console.log(markers)
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    // addMarkerToMap(map, marker);
    // fitMapToMarker(map, marker);
  }
};

export { initMapbox };
