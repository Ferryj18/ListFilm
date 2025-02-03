//
//  DetailEntity.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation

//struct Video: Codable {
//    let id: String
//    let key: String
//    let name: String
//    let site: String
//    let type: String
//}
struct Constants {
    static let API_KEY = "883b20661c35f38e181243f7361f28f3"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}
