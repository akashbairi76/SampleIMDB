


import Foundation

struct Results: Codable {
    var dates: Interval?
    var page: Int
    var results: [Movie]?
    var total_pages: Int
    var total_results: Int
}

struct Interval: Codable {
    var maximum: String
    var minimum: String
}

struct Movie: Codable, Identifiable {
    
    var id: Int
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var vote_average: Double?
}
