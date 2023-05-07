# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/initialize', under: 'initialize'
pin_all_from 'app/javascript/aws', under: 'aws'

pin 'firebase/app', to: 'https://www.gstatic.com/firebasejs/9.21.0/firebase-app.js', preload: true
pin 'firebase/installations', to: 'https://www.gstatic.com/firebasejs/9.21.0/firebase-installations.js'
pin 'firebase/messaging', to: 'https://www.gstatic.com/firebasejs/9.21.0/firebase-messaging.js'
# pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-auth.js"
pin 'firebase/analytics', to: 'https://www.gstatic.com/firebasejs/9.21.0/firebase-analytics.js'
pin 'firebase/messaging/sw', to: 'https://www.gstatic.com/firebasejs/9.21.0/firebase-messaging-sw.js'

pin '@fortawesome/free-brands-svg-icons', to: '@fortawesome--free-brands-svg-icons.js', preload: true # @6.1.2
pin '@fortawesome/fontawesome-svg-core', to: '@fortawesome--fontawesome-svg-core.js', preload: true # @6.1.2
pin '@fortawesome/free-solid-svg-icons', to: '@fortawesome--free-solid-svg-icons.js', preload: true # @6.1.2

pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.6/dist/esm/index.js' # @2.11.6

pin 'bootstrap' # @5.2.0

pin 'three' # @0.143.0
pin 'three/examples/jsm/loaders/GLTFLoader.js', to: 'https://ga.jspm.io/npm:three@0.140.2/examples/jsm/loaders/GLTFLoader.js'
pin 'three/examples/jsm/controls/OrbitControls.js', to: 'https://ga.jspm.io/npm:three@0.140.2/examples/jsm/controls/OrbitControls.js'

pin 'three/examples/jsm/libs/meshopt_decoder.module.js', to: 'https://ga.jspm.io/npm:three@0.140.2/examples/jsm/libs/meshopt_decoder.module.js'
pin 'three/examples/jsm/libs/stats.module.js', to: 'https://ga.jspm.io/npm:three@0.140.2/examples/jsm/libs/stats.module.js'
pin 'three/examples/jsm/loaders/RGBELoader.js', to: 'https://ga.jspm.io/npm:three@0.140.2/examples/jsm/loaders/RGBELoader.js'
pin 'three-vignette.js', to: 'three-vignette.js'
pin 'three-vignette.vert.js', to: 'three-vignette.vert.js'
pin 'three-vignette.frag.js', to: 'three-vignette.frag.js'
pin 'object_viewer'
pin 'cloud_viewer'

pin 'utils', to: 'utils.js'

pin 'buffer' # @6.0.3

pin 'highlight', to: 'highlight.min.js', preload: true # @9.12.0
pin 'ruby.js', to: 'languages/ruby.min.js'
pin 'markdown.js', to: 'languages/markdown.min.js'
pin 'javascript.js', to: 'languages/javascript.min.js'
pin 'bash.js', to: 'languages/bash.min.js'
pin 'swift.js', to: 'languages/swift.min.js'
pin 'erb.js', to: 'languages/erb.min.js'
pin 'latex.js', to: 'languages/latex.min.js'
pin 'python.js', to: 'languages/python.min.js'
pin 'json.js', to: 'languages/json.min.js'
pin 'xml.js', to: 'languages/xml.min.js'
pin 'css.js', to: 'languages/css.min.js'
pin 'scss.js', to: 'languages/scss.min.js'
pin 'plaintext.js', to: 'languages/plaintext.min.js'
pin 'sql.js', to: 'languages/sql.min.js'
pin 'pgsql.js', to: 'languages/pgsql.min.js'
pin 'json.js', to: 'languages/json.min.js'
pin 'objectivec.js', to: 'languages/objectivec.min.js'
pin 'yaml.js', to: 'languages/yaml.min.js'
pin 'markdown-it', to: 'https://cdn.jsdelivr.net/npm/markdown-it/+esm'
pin 'video.js', to: 'https://cdn.jsdelivr.net/npm/video.js/+esm'
pin 'dat.gui', to: 'https://ga.jspm.io/npm:dat.gui@0.7.9/build/dat.gui.module.js'
pin 'base64-js' # @1.5.1
pin 'ieee754' # @1.2.1
pin 'markdown-it-footnote' # @3.0.3
pin "@googlemaps/js-api-loader", to: "@googlemaps--js-api-loader.js" # @1.14.3
