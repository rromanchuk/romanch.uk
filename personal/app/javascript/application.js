// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
import { getAnalytics } from "firebase/analytics";

import { fontAwesomeInit, highlightInit, firebaseInit, gtmInit } from "initialize";


fontAwesomeInit()
const hljs = highlightInit()
//const analytics = firebaseInit()

const firebaseApp = firebaseInit()
const analytics = getAnalytics(firebaseApp);

window.gtag('config', 'G-24Q5EDRSF7', {
  'transport_url': 'https://metrics.romanch.uk',
  'first_party_collection': true,
});
gtmInit()

// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);

export {  hljs, bootstrap, firebaseApp, analytics };