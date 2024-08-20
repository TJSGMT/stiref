import ApplicationController from './application_controller'
export default class extends ApplicationController {
  static targets = ['query','emp']
  user_search (event) {
    event.preventDefault()
    this.stimulate('UserReflex#user_search', this.empTarget.value)
  }
}