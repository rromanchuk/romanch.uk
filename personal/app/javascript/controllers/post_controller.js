
import { Controller } from "@hotwired/stimulus"
import MarkdownIt from 'https://esm.run/markdown-it';

export default class extends Controller {
  static targets = [ "markdown", "html", "body" ]

  connect() {
    console.log("connect")
    console.log(this.markdownTarget.value)
    console.log(this.htmlTarget.value)
  }


  save() {
    console.log("save")
    var md = new MarkdownIt();
    this.htmlTarget.value = md.render(this.markdownTarget.value);;
  }

}
