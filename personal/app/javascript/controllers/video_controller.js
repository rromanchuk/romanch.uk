
import { Controller } from "@hotwired/stimulus"
import videojs from "https://esm.run/video.js"

export default class extends Controller {
  static targets = [ "video" ]

  static values = {
    poster: String,
    streamUrl: String,
    autoplay: String,
    preload: String,
    controls: Boolean,
    debug: Boolean,
  }

  connect() {
    console.log("connect")
    const options ={
      poster: this.posterValue,
      controls: this.controlsValue,
      autoplay: this.autoplayValue,
      preload: this.preloadValue,
      debug: this.debugValue,
      responsive: true,
    }

    this.player = videojs(this.videoTarget, {}, function() {
      console.log('player ready')
    });
  }

  disconnect() {
    console.log("disconnect")
    if(this.player) {
      this.player.dispose();
    }
  }
}
