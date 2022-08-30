// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
import { getInstallations, getId } from "firebase/installations";
//import { getAnalytics } from "firebase/analytics";

import { fontAwesomeInit, firebaseInit, gtagInit } from "initialize";
gtagInit()
fontAwesomeInit()

const firebaseApp = firebaseInit()
const installations = getInstallations(firebaseApp)
const installationId = await getId(installations);
console.log(installationId);

const expires = new Date();
//expires.setTime(expires.getTime() + (60*60*24));
//document.cookie = "iid" + "=" installationId + ";expires=" + expires.toUTCString();
document.cookie = "iid=" + installationId + "; SameSite=Lax; Secure";

const getCookie = name => {
  var keyValue = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  return keyValue ? keyValue[2] : keyValue;
};

export {  bootstrap, firebaseApp, installationId, getCookie };