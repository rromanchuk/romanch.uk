// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, signInWithCredential, GoogleAuthProvider } from "firebase/auth";

import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faLinkedin, faStackOverflow, faGithub } from '@fortawesome/free-brands-svg-icons'

library.add(faLinkedin, faStackOverflow, faGithub)
dom.i2svg()



const firebaseConfig = {
  apiKey: "AIzaSyDuQ4EhdFuCoX5OeIRig5lw-xBlNm1KUlo",
  authDomain: "ryan-romanchuk.firebaseapp.com",
  projectId: "ryan-romanchuk",
  storageBucket: "ryan-romanchuk.appspot.com",
  messagingSenderId: "460594802675",
  appId: "1:460594802675:web:d7d29fd5cb673b8cea2c86",
  measurementId: "G-24Q5EDRSF7"
};


const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);



const googleOneTapCallback = (response) => {
  console.log("google callback")
  const auth = getAuth();
  let credential = GoogleAuthProvider.credential(response.credential);
  signInWithCredential(auth, credential).catch((error) => {
    console.log(error)
    // // Handle Errors here.
    // const errorCode = error.code;
    // const errorMessage = error.message;
    // // The email of the user's account used.
    // const email = error.email;
    // // The credential that was used.
    // const credential = GoogleAuthProvider.credentialFromError(error);
    // ...
  });
}
window.googleOneTapCallback = googleOneTapCallback
