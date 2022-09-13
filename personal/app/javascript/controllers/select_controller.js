
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    
  }

  change(event) {
    console.log("change")
    const frame = document.getElementById('batches');
    frame.src=event.target.value;
    frame.reload();
  }
}
