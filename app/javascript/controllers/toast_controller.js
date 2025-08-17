import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"

export default class extends Controller {
  static targets = [ "toast" ]

  connect() {
    let t = new Toast(this.toastTarget)
    t.show()
  }
}
