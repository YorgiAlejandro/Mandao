import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var selectedProvince: City = City(id: 1, name: "La Habana") {
        didSet {
            onProvinceChangedBanners?()
            onProvinceChangedCategories?()
            onProvinceChangedStores?()
        }
    }

    var onProvinceChangedBanners: (() -> Void)?
    var onProvinceChangedCategories: (() -> Void)?
    var onProvinceChangedStores: (() -> Void)?
}
