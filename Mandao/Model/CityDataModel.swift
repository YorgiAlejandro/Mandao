import Foundation

struct City: Identifiable, Decodable {
    let id: Int
    let name: String
}

struct CityListResponse: Decodable {
    let status: Int
    let message: String
    let data: [City]
}
