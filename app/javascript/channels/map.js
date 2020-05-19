import mapboxgl from 'mapbox-gl';

const url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/';
const token = 'pk.eyJ1IjoidGhpYmF1dGQiLCJhIjoiY2s5b21jZGtsMDIyNzN0cXBrMWNmOHNmOSJ9.XuTBydiiqkxezNIDDb9Z7A';
const submit = document.getElementById("search-input");
const form = document.querySelector('#search-form');
const coordinates = document.getElementById("coordinates");

// Callback to fetch adress and Show map using mapbox
const fetchAdress = (query) => {
  fetch(url.concat(query, '.json?access_token=', token))
    .then(response => response.json())
    .then((data) => {
      const mapcoordinates = `${data.features[3].geometry.coordinates}`;
      const maparray = [];
      maparray.push(parseFloat(mapcoordinates.split(',')[0], 10));
      maparray.push(parseFloat(mapcoordinates.split(',')[1], 10));
      // console.log(maparray);
      coordinates.insertAdjacentHTML('afterend', `<span class="badge badge-primary mx-2">${mapcoordinates}</span>`);
      mapboxgl.accessToken = token;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: maparray,
        zoom: 12
      });

      new mapboxgl.Marker()
        .setLngLat(maparray)
        .addTo(map);
    });
};

// const maplng = parseFloat(mapcoordinates.split(',')[0], 10));
// const maplat = parseFloat(mapcoordinates.split(',')[1], 10);
// `{lng: ${maplng}, lat: ${maplat}}`)

// Eventlistener
form.addEventListener('submit', (e) => {
  e.preventDefault();
  coordinates.innerHTML = '';
  console.log(submit.value);
  fetchAdress(submit.value);
});

// https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=pk.eyJ1IjoidGhpYmF1dGQiLCJhIjoiY2s5b21jZGtsMDIyNzN0cXBrMWNmOHNmOSJ9.XuTBydiiqkxezNIDDb9Z7A
