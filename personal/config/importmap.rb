# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers', preload: false
pin_all_from 'app/javascript/initialize', under: 'initialize'
pin_all_from 'app/javascript/aws', under: 'aws'

pin 'firebase/app', to: 'https://www.gstatic.com/firebasejs/10.12.2/firebase-app.js', preload: true
pin 'firebase/installations', to: 'https://www.gstatic.com/firebasejs/10.12.2/firebase-installations.js'
pin 'firebase/messaging', to: 'https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging.js', preload: false
# pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-auth.js"
pin 'firebase/analytics', to: 'https://www.gstatic.com/firebasejs/10.12.2/firebase-analytics.js'
pin 'firebase/messaging/sw', to: 'https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-sw.js', preload: false

pin '@fortawesome/free-brands-svg-icons', to: '@fortawesome--free-brands-svg-icons.js', preload: true # @6.1.2
pin '@fortawesome/fontawesome-svg-core', to: '@fortawesome--fontawesome-svg-core.js', preload: true # @6.1.2
pin '@fortawesome/free-solid-svg-icons', to: '@fortawesome--free-solid-svg-icons.js', preload: true # @6.1.2

pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.6/dist/esm/index.js' # @2.11.6

pin 'bootstrap' # @5.2.0


pin 'object_viewer', preload: false
pin 'cloud_viewer', preload: false

pin 'utils', to: 'utils.js'

pin 'buffer' # @6.0.3

pin 'highlight', to: 'highlight.min.js' # @9.12.0
pin 'ruby.js', to: 'languages/ruby.min.js', preload: false
pin 'markdown.js', to: 'languages/markdown.min.js', preload: false
pin 'javascript.js', to: 'languages/javascript.min.js', preload: false
pin 'bash.js', to: 'languages/bash.min.js', preload: false
pin 'swift.js', to: 'languages/swift.min.js', preload: false
pin 'erb.js', to: 'languages/erb.min.js', preload: false
pin 'latex.js', to: 'languages/latex.min.js', preload: false
pin 'python.js', to: 'languages/python.min.js', preload: false
pin 'json.js', to: 'languages/json.min.js', preload: false
pin 'xml.js', to: 'languages/xml.min.js', preload: false
pin 'css.js', to: 'languages/css.min.js', preload: false
pin 'scss.js', to: 'languages/scss.min.js', preload: false
pin 'plaintext.js', to: 'languages/plaintext.min.js', preload: false
pin 'sql.js', to: 'languages/sql.min.js', preload: false
pin 'pgsql.js', to: 'languages/pgsql.min.js', preload: false
pin 'json.js', to: 'languages/json.min.js', preload: false
pin 'objectivec.js', to: 'languages/objectivec.min.js', preload: false
pin 'yaml.js', to: 'languages/yaml.min.js', preload: false
#pin 'markdown-it', to: 'https://cdn.jsdelivr.net/npm/markdown-it/+esm'
# pin 'video.js', to: 'https://cdn.jsdelivr.net/npm/video.js/+esm'
pin 'dat.gui', to: 'https://ga.jspm.io/npm:dat.gui@0.7.9/build/dat.gui.module.js'
pin 'base64-js' # @1.5.1
pin 'ieee754' # @1.2.1
pin 'markdown-it-footnote' # @3.0.3
pin "@googlemaps/js-api-loader", to: "@googlemaps--js-api-loader.js", preload: false # @1.14.3
#pin "@simplewebauthn/browser", to: "@simplewebauthn--browser.js" # @10.0.0
pin "@github/webauthn-json", to: "@github--webauthn-json.js" # @2.1.1
pin "markdown-it" # @14.1.0
pin "entities" # @4.5.0
pin "linkify-it" # @5.0.0
pin "mdurl" # @2.0.0
pin "punycode.js" # @2.3.1
pin "uc.micro" # @2.1.0

pin 'three', preload: false # @0.143.0
pin "three/examples/jsm/loaders/GLTFLoader.js", to: "three--examples--jsm--loaders--GLTFLoader.js.js", preload: false # @0.167.1
pin "three/examples/jsm/controls/OrbitControls.js", to: "three--examples--jsm--controls--OrbitControls.js.js", preload: false # @0.167.1
pin "three/examples/jsm/libs/meshopt_decoder.module.js", to: "three--examples--jsm--libs--meshopt_decoder.module.js.js", preload: false # @0.167.1
pin "three/examples/jsm/libs/stats.module.js", to: "three--examples--jsm--libs--stats.module.js.js", preload: false # @0.167.1
pin "three/examples/jsm/loaders/RGBELoader.js", to: "three--examples--jsm--loaders--RGBELoader.js.js", preload: false # @0.167.1
pin 'three-vignette.js', to: 'three-vignette.js', preload: false
pin 'three-vignette.vert.js', to: 'three-vignette.vert.js', preload: false
pin 'three-vignette.frag.js', to: 'three-vignette.frag.js', preload: false