
import { Controller } from "@hotwired/stimulus"
import { Viewer } from "object_viewer"

// const DEFAULT_CAMERA = '[default]';
// const Preset = {ASSET_GENERATOR: 'assetgenerator'};
// const MANAGER = new LoadingManager();

// // glTF texture types. `envMap` is deliberately omitted, as it's used internally
// // by the loader but not part of the glTF format.
// const MAP_NAMES = [
//   'map',
//   'aoMap',
//   'emissiveMap',
//   'glossinessMap',
//   'metalnessMap',
//   'normalMap',
//   'roughnessMap',
//   'specularMap',
// ];



export default class extends Controller {
  static values = {
    url: String,
  }
  //static targets = [ "container" ]

  connect() {
    console.log("three reporting for duty")
   
    console.log(this.urlValue)
    this.container = document.getElementById("container")
    this.viewer = new Viewer(this.container, {});
    this.viewer.load(this.urlValue, '', new Map())
  }
  
  handleChange(evt) {
    console.log("handle change")
    console.log(evt)
    console.log(evt.target)
    console.log(evt.target.selectedOptions)
    console.log(evt.target.value)
    this.urlValue = evt.target.value
    this.viewer.load(this.urlValue, '', new Map())
    dataLayer.push({ event: "model_changed", model_name: this.urlValue })
  }
}
