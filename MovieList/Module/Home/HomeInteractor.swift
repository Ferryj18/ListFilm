//
//  HomeInteractor.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation
import SwiftyJSON
import Alamofire

class HomeInteractor: PTIHomeProtocol  {
    
    
    var presenter: ITPHomeProtocol?
    
    struct Constants {
        static let API_KEY = "883b20661c35f38e181243f7361f28f3"
        static let baseURL = "https://api.themoviedb.org"
        static let YoutubeAPI_KEY = "AIzaSyDuHzNcNJM5q8plEkXx681SwPXN_530YK4"
        static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    }
    enum MovieCategory: String {
        case popular = "popular"
        case upcoming = "upcoming"
        case topRated = "top_rated"
    }
    
    func getTrendingMovies(key: String) {
        let apiUrl = "\(Constants.baseURL)/3/trending/movie/day"
        let parameters: [String: Any] = [
            "api_key": key
        ]
        
        //    print("API URL: \(apiUrl)")
        //    print("Parameters: \(parameters)")
        
        AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Response Data: \(value)")
                let json = JSON(value)
                do {
                    let movieResponse = try json["results"].rawData()
                    let decoder = JSONDecoder()
                    let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
//                    print("Parsed Movies: \(parsedMovies)")
                    self.presenter?.onSuccessGetTrendingMovies(data: parsedMovies)
                } catch {
//                    print("Decoding error: \(error.localizedDescription)")
                    let stringError = ErrorString.errorToString(error)
                    self.presenter?.onFailedGet(message: stringError)
                }
            case .failure(let error):
//                print("AF Request Error: \(error.localizedDescription)")
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onFailedGet(message: stringError)
            }
        }
    }
    func getMovies(endpoint: String, key: String) {
        let apiUrl = "\(Constants.baseURL)/3/movie/\(endpoint)"
        let parameters: [String: Any] = [
            "api_key": key
        ]
        
        AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                do {
                    let movieResponse = try json["results"].rawData()
                    let decoder = JSONDecoder()
                    let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
                    
                    // Use the enum to determine the movie type
                    if let movieType = MovieType(rawValue: endpoint) {
                        self.presenter?.onSuccessGetMovies(data: parsedMovies, movieType: movieType)
                    } else {
//                        print("Unknown endpoint")
                    }
                } catch {
                    let stringError = ErrorString.errorToString(error)
                    self.presenter?.onFailedGet(message: stringError)
                }
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onFailedGet(message: stringError)
            }
        }
    }
    // This function fetches movies for multiple endpoints
    func getMovies(key: String) {
        let endpoints: [MovieType] = [.popular, .upcoming, .top_rated]
        for endpoint in endpoints {
            getMovies(endpoint: endpoint.rawValue, key: key)
        }
    }
}

//  // Usage examples
//  func getPopularMovies(key: String) {
//    getMovies(endpoint: "popular", key: key)
//  }
//
//  func getUpcomingMovies(key: String) {
//    getMovies(endpoint: "upcoming", key: key)
//  }
//
//  func getTopRatedMovies(key: String) {
//    getMovies(endpoint: "top_rated", key: key)
//  }
//}

//    func getPopularMovies(key: String) {
//      let apiUrl = "\(Constants.baseURL)/3/movie/popular"
//      let parameters: [String: Any] = [
//        "api_key": key
//      ]
//
//      //    print("API URL: \(apiUrl)")
//      //    print("Parameters: \(parameters)")
//
//      AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
//        switch response.result {
//        case .success(let value):
//          print("Response Data: \(value)")
//          let json = JSON(value)
//          do {
//            let movieResponse = try json["results"].rawData()
//            let decoder = JSONDecoder()
//            let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
//            print("Parsed Movies: \(parsedMovies)")
//            self.presenter?.onSuccessGetPopularMovies(data: parsedMovies)
//          } catch {
//            print("Decoding error: \(error.localizedDescription)")
//            let stringError = ErrorString.errorToString(error)
//            self.presenter?.onFailedGet(message: stringError)
//          }
//        case .failure(let error):
//          print("AF Request Error: \(error.localizedDescription)")
//          let stringError = AFErrorToString.convertToString(error)
//          self.presenter?.onFailedGet(message: stringError)
//        }
//      }
//    }
//    func getUpcomingMovies(key: String) {
//      let apiUrl = "\(Constants.baseURL)/3/movie/upcoming"
//      let parameters: [String: Any] = [
//        "api_key": key
//      ]
//
//      //    print("API URL: \(apiUrl)")
//      //    print("Parameters: \(parameters)")
//
//      AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
//        switch response.result {
//        case .success(let value):
//          print("Response Data: \(value)")
//          let json = JSON(value)
//          do {
//            let movieResponse = try json["results"].rawData()
//            let decoder = JSONDecoder()
//            let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
//            print("Parsed Movies: \(parsedMovies)")
//            self.presenter?.onSuccessGetUpcomingMovies(data: parsedMovies)
//          } catch {
//            print("Decoding error: \(error.localizedDescription)")
//            let stringError = ErrorString.errorToString(error)
//            self.presenter?.onFailedGet(message: stringError)
//          }
//        case .failure(let error):
//          print("AF Request Error: \(error.localizedDescription)")
//          let stringError = AFErrorToString.convertToString(error)
//          self.presenter?.onFailedGet(message: stringError)
//        }
//      }
//    }
//
//    func getTopRatedMovies(key: String) {
//      let apiUrl = "\(Constants.baseURL)/3/movie/top_rated"
//      let parameters: [String: Any] = [
//        "api_key": key
//      ]
//
//      //    print("API URL: \(apiUrl)")
//      //    print("Parameters: \(parameters)")
//
//      AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
//        switch response.result {
//        case .success(let value):
//          print("Response Data: \(value)")
//          let json = JSON(value)
//          do {
//            let movieResponse = try json["results"].rawData()
//            let decoder = JSONDecoder()
//            let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
//            print("Parsed Movies: \(parsedMovies)")
//            self.presenter?.onSuccessGetTopRatedMovies(data: parsedMovies)
//          } catch {
//            print("Decoding error: \(error.localizedDescription)")
//            let stringError = ErrorString.errorToString(error)
//            self.presenter?.onFailedGet(message: stringError)
//          }
//        case .failure(let error):
//          print("AF Request Error: \(error.localizedDescription)")
//          let stringError = AFErrorToString.convertToString(error)
//          self.presenter?.onFailedGet(message: stringError)
//        }
//      }
//
//    }
//  }
//  func getTrendingMovies() {
//      APICaller.shared.getTrendingMovies { [weak self] result in
//          switch result {
//          case .success(let titles):
//              print("Received Titles: \(titles)")
//              self?.presenter?.onSuccessGetTrendingMovies(data: titles) // Pass data to Presenter
//          case .failure(let error):
//              print("Error: \(error.localizedDescription)")
//              self?.presenter?.onFailedGet(message: error.localizedDescription)
//          }
//      }
//  }
//
//    }


