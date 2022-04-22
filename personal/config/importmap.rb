# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "firebase/app", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js"
pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-auth.js"
pin "firebase/analytics", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-analytics.js"
pin "@fortawesome/free-brands-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.1.1/index.es.js"
pin "@fortawesome/fontawesome-svg-core", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.1.1/index.es.js"

pin "utils", to: "utils.js"


pin "quill" # @1.3.7
pin "buffer" # @2.0.0


pin "highlight.js/lib/core", to: "highlight.js--lib--core.js" # @11.5.1
pin "highlight.js/lib/languages/javascript", to: "highlight.js--lib--languages--javascript.js" # @11.5.1
