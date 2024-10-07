import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item"
export default class extends Controller {
  static values = {
    name: String,
    detail: Object
  }

  dispatch(e) {
    console.log("Dispatch event", this.detailValue)
    const event = new CustomEvent(this.nameValue, {
      detail: this.detailValue
    })
  
    window.dispatchEvent(event)
  }
}
