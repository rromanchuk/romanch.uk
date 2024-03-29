
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String,
  }
  connect() {
    var pdfUrl = this.urlValue
    var pdfjsLib = window['pdfjs-dist/build/pdf'];
    var pdfjsViewer = window['pdfjs-dist/web/pdf_viewer'];
    const container = document.getElementById("viewerContainer");
    const eventBus = new pdfjsViewer.EventBus();
    // (Optionally) enable hyperlinks within PDF files.
    const pdfLinkService = new pdfjsViewer.PDFLinkService({
      eventBus,
    });
    const pdfViewer = new pdfjsViewer.PDFViewer({
      container,
      eventBus,
      linkService: pdfLinkService,
    });

    pdfLinkService.setViewer(pdfViewer);
    eventBus.on("pagesinit", function () {
      console.log("pagesinit");
      // We can use pdfViewer now, e.g. let's change default scale.
      pdfViewer.currentScaleValue = "page-fit";

      // // We can try searching for things.
      // if (SEARCH_FOR) {
      //   eventBus.dispatch("find", { type: "", query: SEARCH_FOR });
      // }
    });

    pdfjsLib.GlobalWorkerOptions.workerSrc = '/static/pdfjs-dist/build/pdf.worker.min.js';
    // Asynchronous download of PDF
    var loadingTask = pdfjsLib.getDocument({url: pdfUrl});
    (async function () {
      const pdfDocument = await loadingTask.promise;
      // Document loaded, specifying document for the viewer and
      // the (optional) linkService.
      pdfViewer.setDocument(pdfDocument);

      pdfLinkService.setDocument(pdfDocument, null);
    })();


  }
}