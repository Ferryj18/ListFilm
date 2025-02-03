//
//  HomeEntity.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation
import SwiftyJSON


struct Title: Codable {
    let id: Int
    let originalName: String?
    let originalTitle: String?
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalName = "original_name"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
    }
}

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct AllMoviesResponse {
    let upcoming: [Title]
    let popular: [Title]
    let topRated: [Title]
}

<<<<<<< Updated upstream:MovieList/Home/HomeEntity.swift
<<<<<<< Updated upstream:MovieList/Home/HomeEntity.swift
//struct TrendingTitleResponse: Codable {
//    let results: [Title]
//}
//
//struct Title: Codable {
//    let id: Int
//    let media_type: String?
//    let original_name: String?
//    let original_title: String?
//    let poster_path: String?
//    let overview: String?
//    let vote_count: Int
//    let release_date: String?
//    let vote_average: Double

struct TitlePreviewViewModel {
    let title: String
    let youtubeView: VideoElement
    let titleOverview: String?
}
struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}
=======
=======
>>>>>>> Stashed changes:MovieList/Module/Home/HomeEntity.swift
//struct TitlePreviewViewModel {
//    let title: String
//    let youtubeView: VideoElement
//    let titleOverview: String?
//}
//struct VideoElement: Codable {
//    let id: IdVideoElement
//}
//
//
//struct IdVideoElement: Codable {
//    let kind: String
//    let videoId: String?
//}
//struct YoutubeSearchResponse: Codable {
//    let items: [VideoElement]
//}
<<<<<<< Updated upstream:MovieList/Home/HomeEntity.swift
>>>>>>> Stashed changes:MovieList/Module/Home/HomeEntity.swift
=======
>>>>>>> Stashed changes:MovieList/Module/Home/HomeEntity.swift

//////struct Constants {
//////    static let API_KEY = "883b20661c35f38e181243f7361f28f3"
//////    static let baseURL = "https://api.themoviedb.org"
//////    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
//////    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
//////}
