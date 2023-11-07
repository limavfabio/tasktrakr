import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-checkbox"
export default class extends Controller {
  toggleComplete(event) {
    // Get the checked state of the checkbox
    const isChecked = event.target.checked;
    const taskId = event.target.dataset.taskId

    // Assuming 'task' is available in your controller's scope
    // Set the 'task.completed' attribute based on the checkbox state
    // this.task.completed = isChecked;

    // Send an AJAX request to update the 'task.completed' on the server
    fetch(`/tasks/${taskId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ task: { completed: isChecked } }),
    })
      .then(response => {
        if (response.ok) {
          // console.log("Task completed status updated.");
        } else {
          console.error("Failed to update task status.");
        }
      })
      .catch(error => {
        console.error("An error occurred:", error);
      });
  }

}
