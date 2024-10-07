import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keypad"
export default class extends Controller {
  static outlets = ["total"]
  static targets = ["entry", "total", "balance", "submit"]
  static values = {
    total: { type: String, default: "" },
    amountEntered: { type: String, default: "" },
    balance: { type: String, default: "" }
  }

  init(event) {
    console.log("Checkout Start Event", this.totalOutlet)
    const formatter = Intl.NumberFormat("en-US", { style: "currency", currency: "USD" })
    this.totalValue = formatter.format(this.totalOutlet.totalValue).replace("$", "")
    console.log("Total", this.totalValue)
    this.totalTarget.innerText = this.totalValue
    this.entryTarget.innerText = formatter.format(this.amountEnteredValue).replace("$", "")
    this.balanceTarget.innerText = formatter.format(this.balanceValue).replace("$", "")
  }

  input(event) {
    const formatter = Intl.NumberFormat("en-US", { style: "currency", currency: "USD" })

    let value = Number(event.target.dataset.value)
    if (value < 0) {
      value = Number("0.00")
      this.amountEnteredValue = value
    } else if (value > 9) {
      this.amountEnteredValue = (value * 100) + ".00"
    } else {
      this.amountEnteredValue += value
    }

    let newValue = formatter.format(this.amountEnteredValue / 100)
    newValue = newValue.replace("$", "")

    this.balanceValue = Number(newValue) - Number(this.totalValue)
    this.balanceTarget.innerText = formatter.format(this.balanceValue).replace("$", "")
    this.entryTarget.innerText = newValue

    this.submitTarget.dataset.eventDetailValue = JSON.stringify({ tendered: Number(this.amountEnteredValue) / 100 })

    if (this.balanceValue >= 0) {
      this.submitTarget.removeAttribute("disabled")
    } else {
      this.submitTarget.setAttribute("disabled", "disabled")
    }
  }
}
