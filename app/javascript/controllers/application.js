import { Application } from "@hotwired/stimulus"
import NotificationsController from "./notifications_controller"    

const application = Application.start()
application.register("notifications", NotificationsController)

export { application }


document.addEventListener("turbo:load", function() {
    setTimeout(() => {
        document.querySelectorAll('.toast').forEach(function(toastElement) {
            let toast = new bootstrap.Toast(toastElement, {
                autohide: true,  // Enables auto-hide
                delay: 2000      // Hides the toast after 2 seconds
            });
            toast.show();
        });
    }, 500); // Small delay before showing to avoid conflicts
});
