import Foundation

struct Category: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String
    let createdAt: String
    let updatedAt: String
    let status: Int
    let visible: Int
    let position: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case status
        case visible
        case position
    }
}

struct CategoryListResponse: Decodable {
    let status: Int
    let message: String
    let data: [Category]
}

