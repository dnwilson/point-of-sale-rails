import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static outlets = ["line-item"]
  static values = {
    total: { type: Number, default: 0 }
  }

  update(_) {
    let total = 0
    this.lineItemOutlets.forEach(outlet => {
      total += Number(outlet.subtotalValue)
    })

    this.totalValue = total
    const formatter = Intl.NumberFormat("en-US", { style: "currency", currency: "USD" })
    this.element.innerHTML = formatter.format(total)
  }
}
