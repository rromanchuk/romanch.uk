import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

import { logEvent } from "firebase/analytics";
import { analytics } from "application";

export default class extends Controller {
  static values = {
    title: String,
  }
  
  connect() {
    console.log(this.titleValue)
    

    let backdrop = document.querySelector(".modal-backdrop");
    if (backdrop) {
      backdrop.remove();
    }
    this.modal = new Modal(this.element);
    this.modal.show();
    this.element.addEventListener('hidden.bs.modal', (event) => {
      this.element.remove();
      logEvent(analytics, 'modal_close');
    })
  }
}