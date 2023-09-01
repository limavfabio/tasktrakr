import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="drag-and-drop"
export default class extends Controller {
  connect() {
    new Sortable(this.element, {
      animation: 150,
      delay: 100,
      delayOnTouchOnly: true,
      touchStartThreshold: 10,

      onEnd: (event) => {
        const taskId = event.item.dataset.taskId
        const projectId = event.item.dataset.projectId
        const newPosition = event.newIndex + 1

        fetch(`/projects/${projectId}/tasks/${taskId}/reorder`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ new_position: newPosition })
        })
        .then(response => {
          if (!response.ok) {
            throw new Error(`Request failed with status ${response.status}`);
          }
        })
        .catch(error => {
          console.error("Error:", error);
          // Handle the error as needed
        });
      }

    })
  }
}
