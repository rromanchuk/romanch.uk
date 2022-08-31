import { Controller } from "@hotwired/stimulus"
import { getMessaging, getToken } from "firebase/messaging";
import { firebase, VAPID_KEY } from "application";

export default class extends Controller {
  
  connect() {
    console.log('fcm controller')
  }

  currentToken() {
    const messaging = getMessaging(firebase);
    getToken(messaging, { vapidKey: VAPID_KEY }).then((currentToken) => {
      if (currentToken) {
        // Send the token to your server and update the UI if necessary
        // ...
        console.log('fcm token', currentToken);
        document.cookie = "fcm=" + currentToken + "; SameSite=Lax; Secure";
      } else {
        // Show permission request UI
        console.log('No registration token available. Request permission to generate one.');
      }
    }).catch((err) => {
      console.log('An error occurred while retrieving token. ', err);
    });
  }

  requestPermission() {
    Notification.requestPermission().then((permission) => {
      if (permission === 'granted') {
        console.log('Notification permission granted.');
        this.currentToken()
      } else {
        console.log('Unable to get permission to notify.');
      }
    });
  }
}