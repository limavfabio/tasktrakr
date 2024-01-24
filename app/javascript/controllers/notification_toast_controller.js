import { Controller } from "@hotwired/stimulus";
import { useTransition } from "stimulus-use";

// Connects to data-controller="notification-toast"
export default class extends Controller {
  static values = {
    delay: {
      default: 3000,
    },
    hidden: {
      default: false,
    },
  };

  initialize() {
    this.hide = this.hide.bind(this);
  }

  connect() {
    useTransition(this);

    if (this.hiddenValue === false) {
      this.show();
    }
  }

  show() {
    this.enter();

    this.timeout = setTimeout(this.hide.bind(this), this.delayValue);
  }

  async hide() {
    if (this.timeout) {
      clearTimeout(this.timeout);
    }

    await this.leave();

    this.element.remove();
  }
}
