


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
    
    init(from decoder: Decoder) throws {
        // Create a container to hold the decoding context, which is based on the keys defined in CodingKeys.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode and assign values for each property using the container and their corresponding keys.
        id           = try container.decode(Int.self, forKey: .id)
        overview     = try container.decodeIfPresent(String.self, forKey: .overview)
        popularity   = try container.decode(Double.self, forKey: .popularity)
        poster_path  = try container.decodeIfPresent(String.self, forKey: .poster_path)
        release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        title        = try container.decodeIfPresent(String.self, forKey: .title)
        vote_average = try container.decode(Double.self, forKey: .vote_average)
    }
    
    init() {
        id = -1
        overview = nil
        popularity = nil
        release_date = nil
        title = nil
        vote_average = nil
    }
}
