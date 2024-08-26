import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["contentField", "submitButton"];

  connect() {
    this.contentFieldTarget.focus();
    this.submitButtonTarget.disabled = true;
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
}
