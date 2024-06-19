import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class Dialog extends Controller {
  static targets = ["dialog"]
  open() {
    this.dialogTarget.show()
  }

  close() {
    this.dialogTarget.hide()
  }
}
