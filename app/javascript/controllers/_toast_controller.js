import { Controller } from "@hotwired/stimulus";
import { Toast } from "bootstrap";

export default class extends Controller {
  connect() {
    const toasts = this.element.querySelectorAll(".toast");
    toasts.forEach((toast) => {
      let bsToast = new Toast(toast, { autohide: true, delay: 2000 });
      
      // Add event listeners for debugging
      toast.addEventListener('shown.bs.toast', () => {
        console.log('Toast is shown');
      });
      
      toast.addEventListener('hidden.bs.toast', () => {
        console.log('Toast is hidden');
      });
      
      bsToast.show();
    });
  }
}