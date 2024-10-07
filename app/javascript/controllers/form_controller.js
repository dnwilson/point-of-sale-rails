import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["tendered"]

  submit(event) {
    event.preventDefault()

    this.tenderedTarget.value = event.detail?.tendered

    this.element.submit()
  }
}
