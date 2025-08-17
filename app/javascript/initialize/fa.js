import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
import { faLinkedin, faStackOverflow, faGithub } from '@fortawesome/free-brands-svg-icons'
import { faKey, faCode, faCirclePlay, faPersonThroughWindow, faFaceSadCry } from '@fortawesome/free-solid-svg-icons'

const fontAwesomeInit = () => {
  config.mutateApproach = 'sync'
  library.add(faLinkedin, faStackOverflow, faGithub, faKey, faCode, faCirclePlay, faPersonThroughWindow, faFaceSadCry)
  dom.watch()
}

export { fontAwesomeInit }