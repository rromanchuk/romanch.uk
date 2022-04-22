import hljs from 'highlight';
import javascript from 'javascript.js';
import ruby from 'ruby.js'
import markdown from 'markdown.js'
import swift from 'swift.js'
import bash from 'bash.js'

const highlightInit = () => {
  hljs.registerLanguage('javascript', javascript);
  hljs.registerLanguage('ruby', ruby);
  hljs.registerLanguage('markdown', markdown);
  hljs.registerLanguage('swift', swift);
  hljs.registerLanguage('bash', bash);

  hljs.configure({   // optionally configure hljs
    languages: ['javascript', 'ruby', 'markdown', 'swift', 'bash']
  });
  return hljs
}

export {highlightInit}