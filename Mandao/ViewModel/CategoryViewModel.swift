import Alamofire
import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    func fetchCategories(areaId: Int) {
        print("fetchCategories called with areaId: \(areaId)")
        let url = "https://staging-delivery.mandao.app/api/v2/customer/restaurant-categories/\(areaId)"
        let request = AF.request(url)
        
        request.validate()
            .responseDecodable(of: CategoryListResponse.self) { response in
                switch response.result {
                case .success(let categoryListResponse):
                    if categoryListResponse.status == 1 {
                        print("Status is 1, updating categories")
                        DispatchQueue.main.async {
                            self.categories = categoryListResponse.data
                        }
                    } else {
                        print("Error: \(categoryListResponse.message)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }
    
    func observeProvinceChanges(appState: AppState) {
        appState.onProvinceChangedCategories = { [weak self] in
            guard let self = self else { return }
            print("Province changed, fetching categories for areaId: \(appState.selectedProvince.id)")
            self.fetchCategories(areaId: appState.selectedProvince.id)
        }
    }
}
