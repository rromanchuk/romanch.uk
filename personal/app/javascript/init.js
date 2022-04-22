import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
import { faLinkedin, faStackOverflow, faGithub } from '@fortawesome/free-brands-svg-icons'

const fontAwesomeInit = () => {
  config.mutateApproach = 'sync'
  library.add(faLinkedin, faStackOverflow, faGithub)
  dom.watch()
}

import hljs from 'highlight';
import javascript from 'javascript.js';
import ruby from 'ruby.js'
import markdown from 'markdown.js'

const highlightInit = () => {
  hljs.registerLanguage('javascript', javascript);
  hljs.registerLanguage('ruby', ruby);
  hljs.registerLanguage('markdown', markdown);

  hljs.configure({   // optionally configure hljs
    languages: ['javascript', 'ruby', 'markdown']
  });
  return hljs
}

const firebaseConfig = {
  apiKey: "AIzaSyDuQ4EhdFuCoX5OeIRig5lw-xBlNm1KUlo",
  authDomain: "ryan-romanchuk.firebaseapp.com",
  projectId: "ryan-romanchuk",
  storageBucket: "ryan-romanchuk.appspot.com",
  messagingSenderId: "460594802675",
  appId: "1:460594802675:web:d7d29fd5cb673b8cea2c86",
  measurementId: "G-24Q5EDRSF7"
};

import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

const firebaseInit = () => {
  const app = initializeApp(firebaseConfig);
  return getAnalytics(app);
}

export {fontAwesomeInit, highlightInit, firebaseInit}