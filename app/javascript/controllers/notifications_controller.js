import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { hidden: Boolean }

  connect() {
    this.show()
  }

  show() {
    this.element.classList.remove("hidden")
    this.element.classList.add("opacity-100", "translate-x-0")

    setTimeout(() => {
      this.hide()
    }, 3000) // Automatically hide after 3 seconds
  }

  hide() {
    this.element.classList.add("opacity-0", "translate-x-6")
    this.element.classList.remove("opacity-100", "translate-x-0")

    setTimeout(() => {
      this.element.classList.add("hidden")
    }, 1000) // Matches the transition duration
  }
}
