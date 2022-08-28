import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

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
    gtag('event', 'modal_open', {'page_title': this.titleValue});
    this.element.addEventListener('hidden.bs.modal', (event) => {
      this.element.remove();
      gtag('event', 'modal_close', {'page_title': this.titleValue});
    })
  }
}