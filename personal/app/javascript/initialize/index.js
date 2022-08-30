import { fontAwesomeInit } from 'initialize/fa';
import { highlightInit } from 'initialize/highlight';

highlightInit();

const firebaseConfig = {
  apiKey: "AIzaSyDuQ4EhdFuCoX5OeIRig5lw-xBlNm1KUlo",
  authDomain: "ryan-romanchuk.firebaseapp.com",
  projectId: "ryan-romanchuk",
  storageBucket: "ryan-romanchuk.appspot.com",
  messagingSenderId: "460594802675",
  appId: "1:460594802675:web:d7d29fd5cb673b8cea2c86"
};

import { initializeApp } from "firebase/app";



const firebaseInit = () => {
  return initializeApp(firebaseConfig);
}

const gtagInit = () => {
  
}



export {fontAwesomeInit, firebaseInit, gtagInit}