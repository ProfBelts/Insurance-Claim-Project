import { Application } from "@hotwired/stimulus"
import ToastController from "./_toast_controller"    

const application = Application.start()
application.register("toast", ToastController)

export { application }


