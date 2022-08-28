import { fontAwesomeInit } from 'initialize/fa';


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
  // window.dataLayer = window.dataLayer || [];
  // function gtag(){dataLayer.push(arguments);}
  // gtag('js', new Date());
  // gtag('config', 'G-24Q5EDRSF7', {
  //   transport_url: 'https://metrics.romanch.uk',
  //   first_party_collection: true
  // });

  // (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  //   new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  //   j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  //   'https://metrics.romanch.uk/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  //   })(window,document,'script','dataLayer','GTM-MBP9J44');
}



export {fontAwesomeInit, firebaseInit, gtagInit}