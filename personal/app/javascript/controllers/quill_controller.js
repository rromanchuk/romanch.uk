
import { Controller } from "@hotwired/stimulus"
import Quill from "quill"

export default class extends Controller {
  static targets = [ "editor", "toolbar", "deltaContent", "body" ]
  // static values = {
  //   original: Object,
  // }

  connect() {
    console.log("connect")
    console.log(this.deltaContentTarget.value)
    console.log(JSON.parse(this.deltaContentTarget.value))
    console.log(this.bodyTarget.value)
  }

  editorTargetConnected(elem) {
    var options = {
      debug: 'info',
      modules: {
        syntax: true,
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

    this.quill = new Quill(elem, options);
    this.quill.setContents(JSON.parse(this.deltaContentTarget.value))
  }

  save() {
    console.log("save")
    console.log(this.deltaContentTarget)
    this.deltaContentTarget.value = JSON.stringify(this.quill.getContents());
  }

  // originalValueChanged() {
  //   console.log("originalValueChanged")
  //   console.log(this.originalValue)
  // }
}
