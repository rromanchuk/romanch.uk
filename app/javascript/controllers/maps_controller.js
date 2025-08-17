import { Controller } from "@hotwired/stimulus"
import { Loader } from "@googlemaps/js-api-loader"

const loader = new Loader({
  apiKey: "AIzaSyC7SrSeQCq3B9x3aFnhcDbO9GH1ePwMv6A",
  version: "weekly",
});

export default class extends Controller {
  static values = {
    geoJson: String
  }
  
  connect() {
    console.log("maps reporting for duty")
    console.log(this.geoJsonValue)

    // const eqfeed_callback = function (results) {
    //   console.log(results)
    //   for (let i = 0; i < results.features.length; i++) {
    //     const coords = results.features[i].geometry.coordinates;
    //     const latLng = new google.maps.LatLng(coords[1], coords[0]);
    
    //     new google.maps.Marker({
    //       position: latLng,
    //       map: map,
    //     });
    //   }
    // };
    // window.eqfeed_callback = eqfeed_callback;

    loader.load().then(() => {
      console.log("maps loaded")
      console.log(this.geoJsonValue)
      this.map = new google.maps.Map(document.getElementById("map"), {
        center: {lat: 40, lng: -100},
        zoom: 4,
      });
      this.map.data.loadGeoJson(this.geoJsonValue);
    });
    
  }
}