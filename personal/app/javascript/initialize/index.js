import { fontAwesomeInit } from 'initialize/fa';
import { highlightInit } from 'initialize/highlight';

import { initializeApp } from "firebase/app";
import { getAnalytics, logEvent } from "firebase/analytics";
import { getMessaging, isSupported } from "firebase/messaging";


highlightInit();

const firebaseConfig = {
  apiKey: "AIzaSyDuQ4EhdFuCoX5OeIRig5lw-xBlNm1KUlo",
  authDomain: "ryan-romanchuk.firebaseapp.com",
  projectId: "ryan-romanchuk",
  storageBucket: "ryan-romanchuk.appspot.com",
  messagingSenderId: "460594802675",
  appId: "1:460594802675:web:d7d29fd5cb673b8cea2c86",
  measurementId: "G-24Q5EDRSF7"
};


const firebaseInit = () => {
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
  isSupported().then((supported) => {
    if (supported) {
      const messaging = getMessaging(app);
      navigator.serviceWorker.register("/firebase-messaging-sw.js").then(swReg2 => {
        console.log("Worker is registered", swReg2);
      })
    } else {
      console.log("Messaging is not supported")
    }
  })
  return app;
}

const gtagInit = () => {

}



export {fontAwesomeInit, firebaseInit, gtagInit}