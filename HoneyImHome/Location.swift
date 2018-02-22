import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Status: notDetermined")
        case .restricted, .denied:
            print("Status: restricted or denied")
        case .authorizedAlways:
            print("Status: always")
            guard CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) else {
                print("Could not monitor for Beacon")
                return
            }
            guard let uuid = UUID.init(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D") else {
                print("Could not create UUID")
                return
            }
            let region = CLBeaconRegion.init(
                proximityUUID: uuid,
                identifier: "my_beacon")
            manager.startMonitoring(for: region)
        case .authorizedWhenInUse:
            print("Status: when in use")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Detected! Send notification")
        configureNotification()
    }
}
