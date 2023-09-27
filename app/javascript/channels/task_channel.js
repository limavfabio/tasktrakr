import consumer from "./consumer"

consumer.subscriptions.create("TaskChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel


    if (data.type === "reorder") {
      console.log("Task reordered!", data.task, "Old Position:", data.old_position)

    }


  }

});
