
import { Controller } from "@hotwired/stimulus"
import { logEvent } from "firebase/analytics";
import { analytics } from "application";

export default class extends Controller {
  static targets = ["form", "input"];
  connect() {
    console.log("search reporting for duty")
  }

  submit() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this._submit();
    }, 300);
  }

  _submit() {
    console.log(this.inputTarget.value)
    this.formTarget.requestSubmit();
    logEvent(analytics, 'search', {search_term: this.inputTarget.value});
  }
}
