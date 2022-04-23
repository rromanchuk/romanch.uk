
import { Controller } from "@hotwired/stimulus"
import 'https://esm.run/video.js';

export default class extends Controller {
  connect() {
    console.log("connect")
  }
}
