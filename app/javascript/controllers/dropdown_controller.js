import { Controller } from "@hotwired/stimulus"
import { useTransition } from "stimulus-use"

// Connects to data-controller="dropdown"
export default class Dropdown extends Controller {
  static targets = ["menu"]

  connect() {
    useTransition(this, {
      element: this.menuTarget,
    })
  }

  toggle() {
    this.toggleTransition()
  }

  hide(event) {
    // @ts-ignore
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.leave()
    }
  }
}
