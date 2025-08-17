
import { Controller } from "@hotwired/stimulus"
import markdownIt from 'https://cdn.jsdelivr.net/npm/markdown-it@14.1.0/+esm'
import markdownItFootnote from 'https://cdn.jsdelivr.net/npm/markdown-it-footnote@4.0.0/+esm'


export default class extends Controller {
  static targets = [ "markdown", "html", "body" ]

  connect() {
    console.log("connect")
    console.log(this.markdownTarget.value)
    console.log(this.htmlTarget.value)
  }

  save() {
    console.log("save")
    var md = new markdownIt({
      html: true,
      linkify: true,
    }).use(markdownItFootnote);
    this.htmlTarget.value = md.render(this.markdownTarget.value);;
  }
}
