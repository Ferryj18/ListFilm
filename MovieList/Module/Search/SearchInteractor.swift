////
////  SearchInteractor.swift
////  MovieList
////
////  Created by Ferry jati on 18/01/25.
////
//import Foundation
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class SearchInteractor: PTISearchProtocol {
//  
//  var presenter: ITPSearchProtocol?
//  
//  func getTopSearch(key: String) {
//      let apiUrl = "\(Constants.baseURL)/3/discover/movie"
//      let parameters: [String: Any] = [
//          "api_key": key,
//          "language": "en-US",
//          "sort_by": "popularity.desc",
//          "include_adult": false,
//          "include_video": false,
//          "page": 1,
//          "with_watch_monetization_types": "flatrate"
//      ]
//      
//      // Print the API URL and parameters for debugging
//      // print("API URL: \(apiUrl)")
//      // print("Parameters: \(parameters)")
//      
//      AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
//          switch response.result {
//          case .success(let value):
//              // Print the response data for debugging
//              // print("Response Data: \(value)")
//              let json = JSON(value)
//              do {
//                  let movieResponse = try json["results"].rawData()
//                  let decoder = JSONDecoder()
//                  let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
//                  // print("Parsed Movies: \(parsedMovies)")
//                  self.presenter?.onSuccessGetTopSearch(data: parsedMovies)
//              } catch {
//                  // print("Decoding error: \(error.localizedDescription)")
//                  let stringError = ErrorString.errorToString(error)
//                  self.presenter?.onFailedGet(message: stringError)
//              }
//          case .failure(let error):
//              // print("AF Request Error: \(error.localizedDescription)")
//              let stringError = AFErrorToString.convertToString(error)
//              self.presenter?.onFailedGet(message: stringError)
//          }
//      }
//  }
//  
//  
//  func search(query: String, key: String) {
//    // Encode the query to be URL-safe
//    guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
//      print("Failed to encode query")
//      return
//    }
//    
//    // Construct the URL for the YouTube API
//    let apiUrl = "\(Constants.YoutubeBaseURL)q=\(encodedQuery)&key=\(key)"
//    
//    // Print the API URL for debugging
//    print("API URL: \(apiUrl)")
//    
//    // Make the request using Alamofire
//    AF.request(apiUrl, method: .get).responseJSON { response in
//      switch response.result {
//      case .success(let value):
//        print("Response Data: \(value)")
//        let json = JSON(value)
//        do {
//          // Decode the response into the YoutubeSearchResponse model
//          let results = try json["items"].rawData()
//          let decoder = JSONDecoder()
//          let videoElements = try decoder.decode([VideoElement].self, from: results)
//          
//          // Ensure there is at least one result
//          if let firstVideo = videoElements.first {
//            // Handle the successful retrieval of the video element
//            print("First video: \(firstVideo)")
//          } else {
//            print("No results found")
//          }
//        } catch {
//          // Handle decoding error
//          print("Decoding error: \(error.localizedDescription)")
//        }
//      case .failure(let error):
//        // Handle request error
//        print("Request error: \(error.localizedDescription)")
//      }
//    }
//  }
//}
////    let apiUrl = "\(Constants.baseURL)/3/discover/movie"
////    let parameters: [String: Any] = [
////      "api_key": key,
////      "language": "en-US",
////      "sort_by": "popularity.desc",
////      "include_adult": false,
////      "include_video": false,
////      "page": 1,
////      "with_watch_monetization_types": "flatrate"
////    ]
////    
////    // Print the API URL and parameters for debugging
////    print("API URL: \(apiUrl)")
////    print("Parameters: \(parameters)")
////    
////    AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
////      switch response.result {
////      case .success(let value):
////        print("Response Data: \(value)")
////        let json = JSON(value)
////        do {
////          let movieResponse = try json["results"].rawData()
////          let decoder = JSONDecoder()
////          let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
////          // Notify the presenter of success
////          self.presenter?.onSuccessGetSearch(data: parsedMovies)
////        } catch {
////          // Handle decoding error
////          let stringError = ErrorString.errorToString(error)
////          self.presenter?.onFailedGet(message: stringError)
////        }
////      case .failure(let error):
////        // Handle request error
////        let stringError = AFErrorToString.convertToString(error)
////        self.presenter?.onFailedGet(message: stringError)
////      }
////    }
////  }
//  
////      // Encode the key to be URL-safe
////      guard let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
////        presenter?.onFailedGet(message: "Invalid search key.")
////        return
////      }
////  
////      // Construct the API URL
////      let apiUrl = "https://api.themoviedb.org/3/search/movie?api_key=\(Constants.API_KEY)&query=\(encodedKey)"
////  
////      // Make the API request using Alamofire
////      AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
////        switch response.result {
////        case .success(let value):
////          print("Response Data: \(value)")
////          let json = JSON(value)
////          do {
////            // Decode the results into an array of Title objects
////            let resultsData = try json["results"].rawData()
////            let decoder = JSONDecoder()
////            let parsedResults: [Title] = try decoder.decode([Title].self, from: resultsData)
////  
////            // Pass the parsed results to the presenter
////            self?.presenter?.onSuccessGetSearch(data: parsedResults) // Correctly pass the parsed results
////          } catch {
////            print("Decoding error: \(error.localizedDescription)")
////            self?.presenter?.onFailedGet(message: error.localizedDescription)
////          }
////        case .failure(let error):
////          print("AF Request Error: \(error.localizedDescription)")
////          self?.presenter?.onFailedGet(message: error.localizedDescription)
////        }
////      }
////    }
////  }
////}
