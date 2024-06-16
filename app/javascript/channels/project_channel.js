import consumer from "channels/consumer";
import { getCookie, reorderElements } from "helpers/utils";


consumer.subscriptions.create({channel: "ProjectChannel", project_id: "3"}, {
  connected() {
    console.log("Connected to ProjectChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from ProjectChannel");
  },

  received(data) {
    const currentUserId = parseInt(getCookie("current_user_id"));
    console.log(data.user_id, currentUserId);

    if (data.type === "reorder") {
      const oldPosition = data.old_position;
      const newPosition = data.new_position;
      const tableArray = window.sortableTable.toArray();
      const newTableOrder = reorderElements(
        tableArray,
        oldPosition - 1,
        newPosition - 1
      );

      if (currentUserId != data.user_id) {
        window.sortableTable.sort(newTableOrder, true);
      }
      console.log(data.user_id, currentUserId);
    }
  },
});
