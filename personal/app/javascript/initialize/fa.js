import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
import { faLinkedin, faStackOverflow, faGithub } from '@fortawesome/free-brands-svg-icons'

const fontAwesomeInit = () => {
  config.mutateApproach = 'sync'
  library.add(faLinkedin, faStackOverflow, faGithub)
  dom.watch()
}

export {fontAwesomeInit}