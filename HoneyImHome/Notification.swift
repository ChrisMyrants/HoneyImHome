import Foundation
import UserNotifications
import Reporting

extension ViewController {
    func requestAuthorization() -> () {
        // This is going to be called just the first time the app is launched
        notificationCenter.requestAuthorization(options: [.sound,.badge]) { result, error in
            if result {
                Log.debug(text: "User Notification Center: registration succeeded")
                
            } else {
                guard let error = error else {
                    Log.debug(text: "User Notifcation Center: failed without an error")
                    return
                }
                Log.debug(text: "User Notification Center: registration failed with \(error)")
            }
        }
    }
    
    func configureNotification() -> () {
        
        let content = UNMutableNotificationContent.init()
        content.title = "Hi honey"
        content.body = "Happy to see you again"
        
        let request = UNNotificationRequest.init(
            identifier: "Local_notification",
            content: content,
            trigger: nil)
        notificationCenter.add(request) { [weak self] _ in
            guard let this = self else { return }
            Log.debug(text: "Yea, we did it")
            this.startLoad()
        }
    }
}
