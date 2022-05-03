// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
import { getAnalytics } from "firebase/analytics";

import { fontAwesomeInit, highlightInit, firebaseInit, gtagInit } from "initialize";


gtagInit()

fontAwesomeInit()
const hljs = highlightInit()
//const analytics = firebaseInit()

const firebaseApp = firebaseInit()
const analytics = getAnalytics(firebaseApp);


export {  hljs, bootstrap, firebaseApp, analytics };