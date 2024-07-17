import Alamofire
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var imageData: Data?
    
    func loadImage(from url: String) {
        AF.request(url).responseData { response in
            if let data = response.data {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
        }
    }
}
