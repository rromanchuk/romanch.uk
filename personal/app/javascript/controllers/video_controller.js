
import { Controller } from "@hotwired/stimulus"
import videojs from "https://esm.run/video.js"

export default class extends Controller {
  static targets = [ "video" ]

  static values = {
    autoplay: {type: String, default: 'any'},
    preload: {type: String, default: 'auto'},
    controls: {type: Boolean, default: true},
    debug: {type: Boolean, default: true},
    aspect: {type: String, default: '16:9'},
    poster: {type: String, default: ''},
  }

  connect() {
    console.log("video reporting for duty")
    console.log(this.posterValue)
    if (!this.player) {
      const options ={
        controls: this.controlsValue,
        autoplay: this.autoplayValue,
        preload: this.preloadValue,
        debug: this.debugValue,
        aspect: this.aspectValue,
        responsive: true,
        fill: true,
        poster: this.posterValue,
      }

      this.player = videojs('video-player', options, function() {
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
