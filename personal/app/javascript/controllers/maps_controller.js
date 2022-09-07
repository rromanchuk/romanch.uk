import { Controller } from "@hotwired/stimulus"
import { Loader } from "@googlemaps/js-api-loader"

const loader = new Loader({
  apiKey: "AIzaSyC7SrSeQCq3B9x3aFnhcDbO9GH1ePwMv6A",
  version: "weekly",
});

export default class extends Controller {
  static values = {
    
  }
  
  connect() {
    console.log("maps reporting for duty")

    loader.load().then(() => {
      console.log("maps loaded")
      this.map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: -34.397, lng: 150.644 },
        zoom: 8,
      });
    });
    
  }
}