import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "login", "fcmToken" ]
  static values = {
    userId: String,
    fcmToken: String,
  }
  
  connect() {
    console.log('current user controller');
  }
}