import hljs from '@highlightjs/cdn-assets/es/highlight.min.js';
console.log(hljs);
import javascript from '@highlightjs/cdn-assets/es/languages/javascript.min.js';
import ruby from '@highlightjs/cdn-assets/es/languages/ruby.min.js';
import markdown from '@highlightjs/cdn-assets/es/languages/markdown.min.js';
import swift from '@highlightjs/cdn-assets/es/languages/swift.min.js';
import bash from '@highlightjs/cdn-assets/es/languages/bash.min.js';
// import markdown from 'highlight.js/lib/languages/markdown';
// import swift from 'highlight.js/lib/languages/swift';
// import bash from 'highlight.js/lib/languages/bash';
// import javascript from 'javascript.js';
// import ruby from 'ruby.js'
// import markdown from 'markdown.js'
// import swift from 'swift.js'
// import bash from 'bash.js'
// import erb from 'erb.js'
// import latex from 'latex.js'
// import python from 'python.js'
// import yaml from 'yaml.js'
// import plaintext from 'plaintext.js'
// import json from 'json.js'
// import css from 'css.js'
// import scss from 'scss.js'

const highlightInit = () => {
  hljs.registerLanguage('javascript', javascript);
  hljs.registerLanguage('ruby', ruby);
  hljs.registerLanguage('markdown', markdown);
  hljs.registerLanguage('swift', swift);
  hljs.registerLanguage('bash', bash);
  // hljs.registerLanguage('erb', erb);
  // hljs.registerLanguage('latex', latex);
  // hljs.registerLanguage('python', python);
  // hljs.registerLanguage('yaml', yaml);
  // hljs.registerLanguage('plaintext', plaintext);
  // hljs.registerLanguage('json', json);
  // hljs.registerLanguage('css', css);
  // hljs.registerLanguage('scss', scss);

  hljs.configure({   // optionally configure hljs
    languages: ['javascript', 'ruby', 'markdown', 'swift', 'bash'] // 'erb', 'latex', 'python', 'yaml', 'plaintext', 'json', 'css', 'scss']
  });

  document.addEventListener("turbo:load", function(event) {
    console.log("turbo:load, highlighting")
    hljs.highlightAll();
  }, false)

  
}

export {highlightInit}