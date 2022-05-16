
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

  connect() {
    this.viewer = new Viewer(this.element, {});
    this.viewer.load('/static/models/xp-mesh.gltf', '', new Map())
  }
}
