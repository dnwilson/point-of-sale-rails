import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "template"]

  add(event) {
    event.preventDefault()
    const { id, name, price } = event.detail

    let data = event.detail
    data["type"] = "increment"
    let item = this.listTarget.querySelector(`[data-line-item-id-value='${id}']`)

    if (!item) {
      let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
      this.listTarget.innerHTML = content + this.listTarget.innerHTML
      
      item = this.listTarget.querySelector("[data-controller='line-item']")
      item.dataset.lineItemIdValue = id
      item.dataset.lineItemNameValue = name
      item.dataset.lineItemPriceValue = price
    }

    item.dispatchEvent(new CustomEvent("update", { detail: data }))
  }

  remove(event) {
    event.preventDefault()
    let wrapper = event.target.closest(".item")

    // New records are simply removed from the page
    if (wrapper.dataset.newRecord == "true") {
      // wrapper.remove()
      wrapper.querySelector("[data-controller='line-item']")
      wrapper.dispatchEvent(new CustomEvent("decrement", { detail: event.detail }))
      // Existing records are hidden and flagged for deletion
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = 'none'
    }
    // this.toggle()
  }
}