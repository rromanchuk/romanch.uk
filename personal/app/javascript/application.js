// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
//import { getAnalytics } from "firebase/analytics";

import { fontAwesomeInit, firebaseInit, gtagInit } from "initialize";
gtagInit()
fontAwesomeInit()

const firebaseApp = firebaseInit()



export {  bootstrap, firebaseApp };