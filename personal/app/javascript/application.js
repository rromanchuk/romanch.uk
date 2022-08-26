// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
//import { getAnalytics } from "firebase/analytics";

import { fontAwesomeInit, firebaseInit, gtagInit } from "initialize";

document.addEventListener("turbo:load", function(event) {
  console.log("trubo:load")
  
})

gtagInit()
fontAwesomeInit()

const firebaseApp = firebaseInit()
//const analytics = getAnalytics(firebaseApp, {debug_mode: true, transport_url: 'https://metrics.romanch.uk'});


export {  bootstrap, firebaseApp };