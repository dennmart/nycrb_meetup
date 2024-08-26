import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["contentField", "submitButton", "message"];

  connect() {
    this.contentFieldTarget.focus();
    this.submitButtonTarget.disabled = true;

    document.addEventListener(
      "turbo:before-stream-render",
      this._pruneMessages.bind(this)
    );
  }

  checkContent(event) {
    if (event.target.value.trim() !== "") {
      this.submitButtonTarget.disabled = false;
    } else {
      this.submitButtonTarget.disabled = true;
    }
  }

  submit(event) {
    if (event.detail.success) {
      this.contentFieldTarget.value = "";
      this.contentFieldTarget.focus();
      this.submitButtonTarget.disabled = true;
    }
  }

  _pruneMessages(event) {
    console.log("pruning", event);
    if (this.messageTargets.length >= 10) {
      this.messageTargets[this.messageTargets.length - 1].remove();
    }
  }
}
