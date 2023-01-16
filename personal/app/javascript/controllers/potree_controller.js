
import { Controller } from "@hotwired/stimulus"
import { CloudViewer } from "cloud_viewer"


export default class extends Controller {
  static values = {
    url: String,
  }

  connect() {
    console.log("potree reporting for duty")
    this.viewer = new CloudViewer(this.element, {});
		this.viewer.load(this.urlValue)
  }
}