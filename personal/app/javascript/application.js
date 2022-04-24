// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';

import { fontAwesomeInit, highlightInit, firebaseInit } from "initialize";


fontAwesomeInit()
const hljs = highlightInit()
const analytics = firebaseInit()



// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);

export { analytics, hljs, bootstrap };