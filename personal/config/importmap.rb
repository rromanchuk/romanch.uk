# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/initialize", under: "initialize"

# pin 'pdf.js', to: "pdfjs/build/pdf.js"
# pin 'pdf.worker.js', to: "pdfjs/build/pdf.worker.js"
# pin 'pdf_viewer.js', to: "pdfjs/web/pdf_viewer.js"
#pin_all_from "pdfjs/build", under: "build"

pin "firebase/app", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-app.js"
pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-auth.js"
pin "firebase/analytics", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-analytics.js"
pin "@fortawesome/free-brands-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.1.2/index.es.js"
pin "@fortawesome/fontawesome-svg-core", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.1.2/index.es.js"
pin "@fortawesome/free-solid-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.1.2/index.es.js"

pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/dist/esm/index.js" # @2.11.6

pin "bootstrap" # @5.2.0

pin "three", to: "https://ga.jspm.io/npm:three@0.140.2/build/three.module.js"
pin "three/examples/jsm/loaders/GLTFLoader.js", to: "https://ga.jspm.io/npm:three@0.140.2/examples/jsm/loaders/GLTFLoader.js"
pin "three/examples/jsm/controls/OrbitControls.js", to: "https://ga.jspm.io/npm:three@0.140.2/examples/jsm/controls/OrbitControls.js"

pin "three/examples/jsm/libs/meshopt_decoder.module.js", to: "https://ga.jspm.io/npm:three@0.140.2/examples/jsm/libs/meshopt_decoder.module.js"
pin "three/examples/jsm/libs/stats.module.js", to: "https://ga.jspm.io/npm:three@0.140.2/examples/jsm/libs/stats.module.js"
pin "three/examples/jsm/loaders/RGBELoader.js", to: "https://ga.jspm.io/npm:three@0.140.2/examples/jsm/loaders/RGBELoader.js"
pin "three-vignette.js", to: "three-vignette.js"
pin "three-vignette.vert.js", to: "three-vignette.vert.js"
pin "three-vignette.frag.js", to: "three-vignette.frag.js"
pin "object_viewer"
pin "cloud_viewer"

pin "utils", to: "utils.js"


pin "buffer" # @6.0.3

pin "highlight", to: "highlight.min.js"
pin "ruby.js", to: "languages/ruby.min.js"
pin "markdown.js", to: "languages/markdown.min.js"
pin "javascript.js", to: "languages/javascript.min.js"
pin "bash.js", to: "languages/bash.min.js"
pin "swift.js", to: "languages/swift.min.js"
pin "erb.js", to: "languages/erb.min.js"
pin "latex.js", to: "languages/latex.min.js"
pin "python.js", to: "languages/python.min.js"
pin "scss.js", to: "languages/scss.min.js"

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

pin "dat.gui", to: "https://ga.jspm.io/npm:dat.gui@0.7.9/build/dat.gui.module.js"
pin "base64-js" # @1.5.1
pin "ieee754" # @1.2.1
