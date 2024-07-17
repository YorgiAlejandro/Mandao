import Foundation

struct StoreDetail: Codable {
    let name: String
    let storeBanner: String
    let averageRatings: Double
    let storeStatus: Int
    let orderDeliveryTime: Int
    let timeOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case storeBanner = "store_banner"
        case averageRatings = "average_ratings"
        case storeStatus = "store_status"
        case orderDeliveryTime = "order_delivery_time"
        case timeOrder = "time_order"
    }
}

struct ProductDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let amount: Double
    let discountAmount: Double
    let discountType: Int
    let storeID: Int
    let store: StoreDetail
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case amount
        case discountAmount = "discount_amount"
        case discountType = "discount_type"
        case storeID = "store_id"
        case store
    }
}

struct ProductDetailsResponse: Codable {
    let status: Int
    let message: String
    let messageCode: Int
    let data: [ProductDetail]
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case messageCode = "message_code"
        case data
    }
}
