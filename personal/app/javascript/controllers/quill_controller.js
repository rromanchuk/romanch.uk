
import { Controller } from "@hotwired/stimulus"
import Quill from "quill"

export default class extends Controller {
  static targets = [ "editor", "test" ]
    
  connect() {

    var editor = new Quill(this.editorTarget, {
      modules: { toolbar: '#toolbar' },
      theme: 'snow'
    });
    

    editor.on('text-change', (delta, oldDelta, source) => {
      if (source == 'api') {
        console.log("An API call triggered this change.");
      } else if (source == 'user') {
        console.log("A user action triggered this change.");
        console.log(editor.getText())
        console.log(this.testTarget)
        this.testTarget.value = editor.getText()
      }
    });

  }
}
