import Alamofire
import SwiftUI

class BannerViewModel: ObservableObject {
    @Published var banners: [Banner] = []

    func fetchBanners(areaId: Int) {
        print("fetchBanners called with areaId: \(areaId)")
        let url = "https://staging-delivery.mandao.app/api/v2/banners/\(areaId)/home"
        let request = AF.request(url)

        request.validate()
            .responseDecodable(of: BannerListResponse.self) { response in
                switch response.result {
                case .success(let bannerListResponse):
                    if bannerListResponse.status == 1 {
                        print("Status is 1, updating banners")
                        DispatchQueue.main.async {
                            self.banners = bannerListResponse.result
                        }
                    } else {
                        print("Error: \(bannerListResponse.message)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }

    func observeProvinceChanges(appState: AppState) {
        appState.onProvinceChangedBanners = { [weak self] in
            guard let self = self else { return }
            print("Province changed, fetching banners for areaId: \(appState.selectedProvince.id)")
            self.fetchBanners(areaId: appState.selectedProvince.id)
        }
    }
}
