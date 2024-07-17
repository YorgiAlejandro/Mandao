import Foundation
import Alamofire

class ProductDetailsViewModel: ObservableObject {
    @Published var products: [ProductDetail] = []
    @Published var store: StoreDetail?
    @Published var isLoading: Bool = false
    
    func fetchProductDetails(storeId: Int, currency: String) {
        self.isLoading = true
        let url = "https://staging-delivery.mandao.app/api/v2/customer/delivery/products"
        let parameters: [String: Any] = [
            "store_id": storeId,
            "currency_symbol": currency
        ]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: ProductDetailsResponse.self) { response in
                self.isLoading = false
                switch response.result {
                case .success(let productDetailsResponse):
                    if productDetailsResponse.status == 1 {
                        DispatchQueue.main.async {
                            self.products = productDetailsResponse.data
                            self.store = productDetailsResponse.data.first?.store
                        }
                    } else {
                        print("Error: \(productDetailsResponse.message)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }
}
