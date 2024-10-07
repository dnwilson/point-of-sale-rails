import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-item"
export default class extends Controller {
  static targets = ["id", "quantity", "name", "visibleQuantity", "price", "total"]
  static values = {
    name: String,
    id: Number,
    quantity: { type: Number, default: 1 },
    price: { type: Number, default: 0 },
    subtotal: { type: Number, default: 0 }
  }

  connect() {
    this.update()

    this.element.addEventListener("update", this.update.bind(this))
  }
  
  disconnect() {
    this.element.addEventListener("update", this.update.bind(this))
  }

  update(event) {
    if (event) {
      const { price, type } = event.detail
      
      if (type == "increment") {
        this.quantityValue += 1
      } else {
        this.quantityValue -= 1
      }
      
      this.priceValue = Number(price)
    }

    const formatter = Intl.NumberFormat("en-US", { style: "currency", currency: "USD" })
    this.subtotalValue = this.quantityValue * this.priceValue

    this.visibleQuantityTarget.innerHTML = this.quantityValue
    this.priceTarget.innerHTML = formatter.format(this.priceValue)
    this.totalTarget.innerHTML = formatter.format(this.subtotalValue)

    this.nameTarget.innerHTML = this.nameValue
    this.idTarget.value = this.idValue
    console.log("ID VALUE", this.idValue)
    this.quantityTarget.value = this.quantityValue
  }
}
