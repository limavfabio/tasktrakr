import Dropdown from 'stimulus-dropdown'

// Connects to data-controller="dropdown"
export default class extends Dropdown {
  connect() {
    super.connect()
    console.log('Dropdown_controller Connected')
  }

  toggle(event) {
    super.toggle()
    console.log('Dropdown_controller Toggled')

  }

  hide(event) {
    super.hide(event)
    console.log('Dropdown_controller has been hidden')

  }
}
