import Alamofire
import SwiftUI

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []

    func fetchCities() {
        print("fetchCities called")
        let url = "https://staging-delivery.mandao.app/api/v2/store/city-list"
        let request = AF.request(url)

        request.validate()
            .responseDecodable(of: CityListResponse.self) { response in
                switch response.result {
                case .success(let cityListResponse):
                    if cityListResponse.status == 1 {
                        DispatchQueue.main.async {
                            self.cities = cityListResponse.data
                        }
                        print("Status is 1, updating cities")
                    } else {
                        print("Error: \(cityListResponse.message)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }
}

