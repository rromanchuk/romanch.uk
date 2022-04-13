# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "firebase/app", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js"
pin "firebase/auth", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-auth.js"
pin "firebase/analytics", to: "https://www.gstatic.com/firebasejs/9.6.10/firebase-analytics.js"