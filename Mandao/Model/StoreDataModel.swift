import Foundation

struct Store: Identifiable, Decodable {
    let id: Int
    let name: String
    let banner: String
    let averageRatings: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "store_id"
        case name = "store_name"
        case banner = "store_banner"
        case averageRatings = "average_ratings"
    }
}

struct StoreListResponse: Decodable {
    let status: Int
    let message: String
    let storeList: [Store]

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case storeList = "store_list"
    }
}
