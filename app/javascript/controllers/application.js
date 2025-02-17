import { Application } from "@hotwired/stimulus"
import ToastController from "./_toast_controller"    
import HelloController from "./hello_controller"

const application = Application.start()
application.register("toast", ToastController)
application.register("hello", HelloController)
export { application }


