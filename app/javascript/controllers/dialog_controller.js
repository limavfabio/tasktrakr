import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class Dialog extends Controller {
  static targets = ["dialog"]
  connect() {
    console.log("dialog connected", this.dialogTarget)
  }

  open() {
    console.log("open clicked")
    this.dialogTarget.show()
  }

  close() {
    console.log("close clicked")
    this.dialogTarget.hide()
  }
}
