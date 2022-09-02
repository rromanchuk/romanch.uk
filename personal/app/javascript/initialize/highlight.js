import hljs from 'highlight';
import javascript from 'javascript.js';
import ruby from 'ruby.js'
import markdown from 'markdown.js'
import swift from 'swift.js'
import bash from 'bash.js'
import erb from 'erb.js'
import latex from 'latex.js'
import python from 'python.js'
import yaml from 'yaml.js'
import plaintext from 'plaintext.js'
import json from 'json.js'
import css from 'css.js'
import scss from 'scss.js'

const highlightInit = () => {
  hljs.registerLanguage('javascript', javascript);
  hljs.registerLanguage('ruby', ruby);
  hljs.registerLanguage('markdown', markdown);
  hljs.registerLanguage('swift', swift);
  hljs.registerLanguage('bash', bash);
  hljs.registerLanguage('erb', erb);
  hljs.registerLanguage('latex', latex);
  hljs.registerLanguage('python', python);
  hljs.registerLanguage('yaml', yaml);
  hljs.registerLanguage('plaintext', plaintext);
  hljs.registerLanguage('json', json);
  hljs.registerLanguage('css', css);
  hljs.registerLanguage('scss', scss);

  hljs.configure({   // optionally configure hljs
    languages: ['javascript', 'ruby', 'markdown', 'swift', 'bash', 'erb', 'latex', 'python', 'yaml', 'plaintext', 'json', 'css', 'scss']
  });

  document.addEventListener("turbo:load", function(event) {
    console.log("turbo:load, highlighting")
    hljs.highlightAll();
  }, false)

  
}

export {highlightInit}