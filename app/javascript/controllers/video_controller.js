
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "video" ]

  static values = {
    autoplay: {type: String, default: 'any'},
    preload: {type: String, default: 'auto'},
    controls: {type: Boolean, default: true},
    debug: {type: Boolean, default: true},
    aspect: {type: String, default: '16:9'},
    poster: {type: String, default: ''},
    fill: {type: Boolean, default: true},
  }

  connect() {
    console.log(this.posterValue)
    if (!this.player) {
      const options ={
        controls: this.controlsValue,
        autoplay: this.autoplayValue,
        preload: this.preloadValue,
        debug: this.debugValue,
        aspect: this.aspectValue,
        responsive: false,
        fill: this.fillValue,
        poster: this.posterValue,
      }

      this.player = window.videojs('video-player', options, () => {
        gtag('event', 'video_start', { 'video_url': this.player.currentSrc(), 'video_current_time': this.player.currentTime(), 'video_duration': this.player.duration() })
      });

      this.player.on('pause', function() {

      });

      this.player.on('play', function() {
         
      });

      this.player.on('ended', () => {
        gtag('event', 'video_complete', { 'video_url': this.player.currentSrc(), 'video_current_time': this.player.currentTime(), 'video_duration': this.player.duration() })
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

// events https://docs.videojs.com/player#event:play
