let n = 100;
let lat = 38.2453034;
let lng = 21.7368943;

const corsProxy = 'https://cors-anywhere.herokuapp.com/';
const overpassUrl = corsProxy + 'https://overpass-api.de/api/interpreter';

const map = L.map('map').fitWorld();

const tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 19,
  attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

let markersLayer = L.layerGroup(); //layer
map.addLayer(markersLayer);

let controlSearch = new L.Control.Search({
  position: "topright",
  layer: markersLayer,
  propertyName: "title",
  initial: false,
  zoom: 20,
  marker: false
});

map.addControl(controlSearch);

function onLocationFound(e) {
  const radius = e.accuracy / 2;
  const locationMarker = L.marker(e.latlng, { draggable: false }).addTo(map);
  console.log(e.latlng);
  locationMarker.bindPopup("<b>Η τοποθεσία σας</b>");

  const locationCircle = L.circle(e.latlng, 500).addTo(map);

  if ("geolocation" in navigator) {
    let url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`;
    fetch(url)
      .then(response => response.json())
      .then(data => {
        let city = data.address.city;
        let state = data.address.state;
        let country = data.address.country;
        document.getElementById("city").innerHTML = `${city}, ${state}, ${country}`;
        fetchSupermarkets(e.latlng); //  fetchSupermarkets
      })
      .catch(error => console.log(error));
  } else {
    console.log("Geolocation not supported by this browser.");
  }
}

function onLocationError(e) {
  alert.message;
}

map.on('locationfound', onLocationFound);
map.on('locationerror', onLocationError);

map.locate({ setView: true, maxZoom: 16, enableHighAccuracy: true });

function createSupermarketPopup(title, lat, lng, isWithinRange) {
  let popupContent = `<b>${title}</b>`;
  
  if (isWithinRange) {
    popupContent += `
      <br>
      <textarea id="userInput-${lat}-${lng}" rows="4" cols="20"></textarea><br>
      <button onclick="commitUserInput(${lat}, ${lng})">Υποβολή Προσφοράς</button>
    `;
  }

  return popupContent;
}

function commitUserInput(lat, lng) {
  const userInput = document.getElementById(`userInput-${lat}-${lng}`).value;
  console.log(`User input for marker at ${lat}, ${lng}: ${userInput}`);
}




function fetchSupermarkets(userLocation) {
  const query = `[out:json][timeout:25];area(3602182851)->.searchArea;(node["shop"~"supermarket|convenience"](area.searchArea););out;>;out skel qt;`;

  fetch(overpassUrl, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `data=${query}`
  })
    .then(response => response.json())
    .then(data => {
      const supermarkets = data.elements;

      supermarkets.forEach(supermarket => {
        if (supermarket.type === "node" && supermarket.tags.shop === "supermarket") {
          const lat = supermarket.lat;
          const lng = supermarket.lon;
          const title = supermarket.tags.name || "Unknown Supermarket";

          const supermarketLatLng = L.latLng(lat, lng);
          const distance = userLocation.distanceTo(supermarketLatLng); //distance to user's location
          const isWithinRange = distance <= 800;
          
          const marker = L.marker(supermarketLatLng, { title: title });
          marker.bindPopup(createSupermarketPopup(title, lat, lng, isWithinRange));
          marker.addTo(markersLayer);
        }
      });
    })
    .catch(error => console.log(error));
}

/* TEST GIA LAYER GROUPS/ LAYER CONTROL


// Create layer groups
const userLocationLayer = L.layerGroup();
const supermarketsLayer = L.layerGroup();

// Function to add user location marker
function addUserLocationMarker(lat, lng) {
  const locationMarker = L.marker([lat, lng], { draggable: false });
  locationMarker.bindPopup("<b>Your Location</b>");
  locationMarker.addTo(userLocationLayer);
}

// Function to add a supermarket marker
function addSupermarketMarker(lat, lng, title, isWithinRange) {
  const marker = L.marker([lat, lng], { title: title });
  marker.bindPopup(createSupermarketPopup(title, lat, lng, isWithinRange));
  marker.addTo(supermarketsLayer);
}



 // Create a layer control
 var layerControl = L.control.layers({
  "userLocationLayer": userLocationLayer,
}, {
  "supermarketsLayer": supermarketsLayer,
}).addTo(map);

*/


// Call fetchSupermarkets 
fetchSupermarkets();

    

// FORMS GIA ALLAGES =
function toggleOptions() {
  const optionsPanel = document.getElementById("options-panel");
  optionsPanel.style.display = optionsPanel.style.display === "none" ? "block" : "none";
}

function showChangeUsernameForm() {
  document.getElementById("change-username-form").classList.remove("hidden-form");
  document.getElementById("change-password-form").classList.add("hidden-form");
}

function showChangePasswordForm() {
  document.getElementById("change-username-form").classList.add("hidden-form");
  document.getElementById("change-password-form").classList.remove("hidden-form");
}
// Function to handle form visibility 
  document.addEventListener("click", function(event) {
    const optionsPanel = document.getElementById("options-panel");
    const changeUsernameForm = document.getElementById("change-username-form");
    const changePasswordForm = document.getElementById("change-password-form");

    // Check if the options panel is visible
    if (optionsPanel.style.display !== "none") {
      return; 
    }

    // If not visible, hide the forms
    if (!optionsPanel.contains(event.target)) {
      changeUsernameForm.classList.add("hidden-form");
      changePasswordForm.classList.add("hidden-form");
    }
  });
   