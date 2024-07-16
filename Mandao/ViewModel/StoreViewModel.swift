import Alamofire
import SwiftUI

class StoreViewModel: ObservableObject {
    @Published var stores: [Store] = []

    func fetchStores(areaId: Int) {
        print("fetchStores called with areaId: \(areaId)")
        let url = "https://staging-delivery.mandao.app/api/v2/customer/delivery/store-list-by-area/\(areaId)"
        let request = AF.request(url)

        request.validate()
            .responseDecodable(of: StoreListResponse.self) { response in
                print("Response received")
                switch response.result {
                case .success(let storeListResponse):
                    print("Request succeeded with response: \(storeListResponse)")
                    if storeListResponse.status == 1 {
                        print("Status is 1, updating stores")
                        DispatchQueue.main.async {
                            self.stores = storeListResponse.storeList
                        }
                    } else {
                        print("Error: \(storeListResponse.message)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }

    func observeProvinceChanges(appState: AppState) {
        appState.onProvinceChangedStores = { [weak self] in
            guard let self = self else { return }
            print("Province changed, fetching stores for areaId: \(appState.selectedProvince.id)")
            self.fetchStores(areaId: appState.selectedProvince.id)
        }
    }
}
