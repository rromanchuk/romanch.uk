
import { Controller } from "@hotwired/stimulus"
import Quill from "quill"

export default class extends Controller {
  static targets = [ "editor", "toolbar" ]
    
  connect() {
    console.log("connect")
  }

  editorTargetConnected(elem) {
    var options = {
      debug: 'info',
      modules: {
        toolbar: [
          [{ header: [1, 2, false] }],
          ['bold', 'italic', 'underline'],
          ['image', 'code-block']
        ]
      },
      placeholder: 'Compose an epic...',
      readOnly: false,
      theme: 'snow'
    };
    new Quill(elem, options);
  }
}
