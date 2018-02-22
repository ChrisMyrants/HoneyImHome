import Foundation
import Reporting

extension ViewController {
    func startLoad() {
        Log.debug(text: "Trying to connect")
        let url = URL(string: "https://api.github.com/users/octocat")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                Log.debug(text: "Client error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    Log.debug(text: "Server error: \(response.debugDescription)")
                    return
            }
            Log.debug(text: "DONE!")
        }
        task.resume()
    }
}
