//
//  DetailInteractor.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DetailInteractor: PTIDetailProtocol {
  
  var presenter: ITPDetailProtocol?
  
  // Function to get movies based on the title from dataDetail
  func getVideoDetails(movieId: Int, key: String) {
    let apiUrl = "https://api.themoviedb.org/3/movie/\(movieId)/videos"
    let parameters: [String: Any] = [
      "api_key": key,
      "language": "en-US"
    ]
    
    AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
      switch response.result {
      case .success(let value):
//        print("Response Data: \(value)")
        let json = JSON(value)
        do {
          let videoResponse = try json["results"].rawData()
          let decoder = JSONDecoder()
          let parsedVideos = try decoder.decode([Video].self, from: videoResponse)
          
          if let videoKey = parsedVideos.first?.key {
            // Construct the embed URL instead of the standard YouTube URL
            let videoURL = "https://www.youtube.com/embed/\(videoKey)?controls=0&rel=0"
            self.presenter?.onSuccessGetVideoURL(videoURL: videoURL)
          } else {
            self.presenter?.onFailedGet(message: "No videos found.")
          }
        } catch {
//          print("Decoding error: \(error.localizedDescription)")
          let stringError = ErrorString.errorToString(error)
          self.presenter?.onFailedGet(message: stringError)
        }
      case .failure(let error):
//        print("AF Request Error: \(error.localizedDescription)")
        let stringError = AFErrorToString.convertToString(error)
        self.presenter?.onFailedGet(message: stringError)
      }
    }
  }
}
