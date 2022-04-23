# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/initialize", under: "initialize"

pin "firebase/app", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js"
pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-auth.js"
pin "firebase/analytics", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-analytics.js"
pin "@fortawesome/free-brands-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.1.1/index.es.js"
pin "@fortawesome/fontawesome-svg-core", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.1.1/index.es.js"

pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.esm.min.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.0/dist/esm/index.js"

pin "utils", to: "utils.js"


pin "quill" # @1.3.7
pin "buffer" # @2.0.0

pin "highlight", to: "highlight.min.js"
pin "ruby.js", to: "languages/ruby.min.js"
pin "markdown.js", to: "languages/markdown.min.js"
pin "javascript.js", to: "languages/javascript.min.js"
pin "bash.js", to: "languages/bash.min.js"
pin "swift.js", to: "languages/swift.min.js"
pin "erb.js", to: "languages/erb.min.js"

# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/json.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/python.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/ruby.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/bash.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/swift.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/objectivec.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/javascript.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/latex.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/erb.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/css.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/nginx.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/yaml.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/xml.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/shell.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/scss.min.js
# https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11.3.1/es/languages/markdown.min.jspin "video.js" # @7.18.1

