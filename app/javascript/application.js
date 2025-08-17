// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
const VAPID_KEY = 'BM2qfAWTiwZuhoJ0c2by_HKDP50tNc2z6_eKW80i0hYCd2h5pct56DWPjsLXufgPTPZo2xZ_RBSwbDo5O8r0L1E'
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap';
import { fontAwesomeInit, firebaseInit } from "initialize";
//import { firebaseInit } from "initialize";
import * as ActionCable from '@rails/actioncable'

ActionCable.logger.enabled = true

import "channels/appearance_channel"

import * as ActionCable from '@rails/actioncable'

ActionCable.logger.enabled = true

import "channels/appearance_channel"


fontAwesomeInit()
const firebase = firebaseInit()



export {  VAPID_KEY, bootstrap, firebase };