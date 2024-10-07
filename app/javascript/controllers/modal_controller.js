import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["overlay", "content"]

  connect() {
    console.log("Modal controller connected")
  }

  open() {
    this.overlayTarget.classList.remove("hidden")
    this.contentTarget.classList.remove("translate-y-full")
  }

  close(event) {
    // Close modal when clicking outside of modal content
    if (event.target === this.overlayTarget || event.target.closest("[data-action='click->modal#close']")) {
      this.contentTarget.classList.add("translate-y-full")
      this.overlayTarget.classList.add("hidden")
    }
  }
}
