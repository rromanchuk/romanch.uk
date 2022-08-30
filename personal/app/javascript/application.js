// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
import { fontAwesomeInit, firebaseInit } from "initialize";

fontAwesomeInit()
const firebase = firebaseInit()


export {  bootstrap, firebase };