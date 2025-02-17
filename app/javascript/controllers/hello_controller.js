import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];

  connect() {
    console.log("Hello controller connected!"); // Debugging
  this.outputTarget.textContent = "Hello, Joseph!!";
  }

  greet() {
    console.log("Greeting...");
    this.outputTarget.textContent = "Hello, June!!";
  }
}
