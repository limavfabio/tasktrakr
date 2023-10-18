import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-checkbox"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  toggleComplete() {
    console.log("toggleComplete")
  }

}
