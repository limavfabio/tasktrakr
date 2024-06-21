import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class Dropdown extends Controller {

  hide() {
    this.element.hide()
  }
}
