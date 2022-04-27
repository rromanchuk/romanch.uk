
import { Controller } from "@hotwired/stimulus"
import videojs from "https://esm.run/video.js"

export default class extends Controller {
  static targets = [ "video" ]

  static values = {
    autoplay: {type: String, default: 'any'},
    preload: {type: String, default: 'auto'},
    controls: {type: Boolean, default: true},
    debug: {type: Boolean, default: true},
  }

  connect() {
    console.log("connect")
    if (!this.player) {
      const options ={
        controls: this.controlsValue,
        autoplay: this.autoplayValue,
        preload: this.preloadValue,
        debug: this.debugValue,
        fluid: true
      }

      this.player = videojs(this.videoTarget, options, function() {
        console.log('player ready')
      });
    }
  }

  disconnect() {
    console.log("disconnect")
    if(this.player) {
      this.player.dispose();
    }
  }
}
