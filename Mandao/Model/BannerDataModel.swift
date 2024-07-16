import Foundation

struct Banner: Identifiable, Decodable {
    let id: Int
    let image: String
    let title: String
    let description: String
    let location: String
    let destine: String
    let destineId: Int
    let position: Int
    let carouselId: Int
    let createdAt: String
    let updatedAt: String
    let status: Int
    let areaWiseId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case image
        case title
        case description
        case location
        case destine
        case destineId = "destine_id"
        case position
        case carouselId = "carousel_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case status
        case areaWiseId = "area_wise_id"
    }
}

struct BannerListResponse: Decodable {
    let status: Int
    let message: String
    let result: [Banner]
}
