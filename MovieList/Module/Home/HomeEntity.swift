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
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
    }
}

struct TrendingTitleResponse: Codable {
    let results: [Title]
}
enum MovieType: String {
    case popular /*= "popular"*/
    case upcoming /*= "upcoming"*/
    case top_rated/* = "top_rated"*/
}

struct AllMoviesResponse {
    let upcoming: [Title]
    let popular: [Title]
    let topRated: [Title]
}

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

//struct Constants {
//    static let API_KEY = "883b20661c35f38e181243f7361f28f3"
//    static let baseURL = "https://api.themoviedb.org"
//    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
//    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
//}
