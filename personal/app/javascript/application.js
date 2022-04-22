// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
import { faLinkedin, faStackOverflow, faGithub } from '@fortawesome/free-brands-svg-icons'

import hljs from 'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.5.1/build/es/highlight.min.js';
import javascript from 'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.5.1/build/es/languages/javascript.min.js';
import ruby from 'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.5.1/build/es/languages/ruby.min.js'
hljs.registerLanguage('javascript', javascript);
hljs.registerLanguage('ruby', ruby);

hljs.configure({   // optionally configure hljs
  languages: ['javascript', 'ruby']
});

config.mutateApproach = 'sync'
library.add(faLinkedin, faStackOverflow, faGithub)
dom.watch()



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

export { analytics, hljs };