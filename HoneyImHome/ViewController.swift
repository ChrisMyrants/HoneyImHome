import UIKit
import CoreLocation
import NetworkingKit
import FunctionalKit
import Reporting
import UserNotifications

class ViewController: UIViewController {
    
    let manager = CLLocationManager.init()
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        Log.debug(text: "We are in")
        Debug.isActive = true
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestAlwaysAuthorization()

        requestAuthorization()
    }
}

