# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin "@rails/actioncable", to: "@rails--actioncable.js" # @8.0.100
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/initialize', under: 'initialize'
pin_all_from "app/javascript/channels", under: "channels"
pin 'utils', to: 'utils.js'

pin 'firebase/app', to: 'https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js'
pin 'firebase/installations', to: 'https://www.gstatic.com/firebasejs/11.1.0/firebase-installations.js'
pin 'firebase/messaging', to: 'https://www.gstatic.com/firebasejs/11.1.0/firebase-messaging.js'
# pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.9.3/firebase-auth.js"
pin 'firebase/analytics', to: 'https://www.gstatic.com/firebasejs/11.1.0/firebase-analytics.js'
pin 'firebase/messaging/sw', to: 'https://www.gstatic.com/firebasejs/11.1.0/firebase-messaging-sw.js'

pin '@fortawesome/free-brands-svg-icons', to: '@fortawesome--free-brands-svg-icons.js'
pin '@fortawesome/fontawesome-svg-core', to: '@fortawesome--fontawesome-svg-core.js'
pin '@fortawesome/free-solid-svg-icons', to: '@fortawesome--free-solid-svg-icons.js'

pin '@popperjs/core', to: "@popperjs--core--esm.js" # @2.11.8
pin 'bootstrap' # @5.2.0

pin 'buffer', preload: false # @6.0.3
pin "@googlemaps/js-api-loader", to: "@googlemaps--js-api-loader.js", preload: false # @1.16.8
#pin "@simplewebauthn/browser", to: "@simplewebauthn--browser.js" # @10.0.0
pin "@github/webauthn-json", to: "@github--webauthn-json.js", preload: false # @2.1.1


# pin 'three', preload: false
# pin "three/examples/jsm/loaders/GLTFLoader.js", to: "three--examples--jsm--loaders--GLTFLoader.js.js", preload: false # @0.172.0
# pin "three/examples/jsm/controls/OrbitControls.js", to: "three--examples--jsm--controls--OrbitControls.js.js", preload: false # @0.172.0
# pin "three/examples/jsm/libs/meshopt_decoder.module.js", to: "three--examples--jsm--libs--meshopt_decoder.module.js.js", preload: false # @0.172.0
# pin "three/examples/jsm/libs/stats.module.js", to: "three--examples--jsm--libs--stats.module.js.js", preload: false # @0.172.0
# pin "three/examples/jsm/loaders/RGBELoader.js", to: "three--examples--jsm--loaders--RGBELoader.js.js", preload: false # @0.172.0
# pin 'three-vignette.js', to: 'three-vignette.js', preload: false
# pin 'three-vignette.vert.js', to: 'three-vignette.vert.js', preload: false
# pin 'three-vignette.frag.js', to: 'three-vignette.frag.js', preload: false
# pin "fs" # @2.1.0
pin 'object_viewer', preload: false
pin 'cloud_viewer', preload: false

# pin "potree-core", preload: false # @2.0.10
# pin "dat.gui", preload: false # @0.7.9

pin "@highlightjs/cdn-assets/es/highlight.min.js", to: "@highlightjs--cdn-assets--es--highlight.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/javascript.min.js", to: "@highlightjs--cdn-assets--es--languages--javascript.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/ruby.min.js", to: "@highlightjs--cdn-assets--es--languages--ruby.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/swift.min.js", to: "@highlightjs--cdn-assets--es--languages--swift.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/python.min.js", to: "@highlightjs--cdn-assets--es--languages--python.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/bash.min.js", to: "@highlightjs--cdn-assets--es--languages--bash.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/markdown.min.js", to: "@highlightjs--cdn-assets--es--languages--markdown.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/json.min.js", to: "@highlightjs--cdn-assets--es--languages--json.min.js.js" # @11.11.1
pin "@highlightjs/cdn-assets/es/languages/yaml.min.js", to: "@highlightjs--cdn-assets--es--languages--yaml.min.js.js" # @11.11.1

