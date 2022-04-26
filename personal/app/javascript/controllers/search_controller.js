
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["form"];
  connect() {
    console.log("connect")
  }

  submit() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this._submit();
    }, 300);
  }

  _submit() {
    this.formTarget.requestSubmit();
  }
}
