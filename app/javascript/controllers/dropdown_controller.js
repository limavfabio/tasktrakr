import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class Dropdown extends Controller {
  static targets = ["dropdown"]

  connect() {
    console.log(this.element)
  }
  hide() {
    console.log("hide")
    this.element.hide()
  }
}
