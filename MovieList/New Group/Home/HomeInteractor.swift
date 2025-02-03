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
  
  func getTrendingMovies(key: String) {
    let apiUrl = "\(Constants.baseURL)/3/trending/movie/day"
    let parameters: [String: Any] = [
      "api_key": key
    ]
    
    print("API URL: \(apiUrl)")
    print("Parameters: \(parameters)")
    
    AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
      print("HTTP Status Code: \(response.response?.statusCode ?? 0)")
      switch response.result {
      case .success(let value):
        print("Response Data: \(value)")
        let json = JSON(value)
        do {
          let movieResponse = try json["results"].rawData()
          let decoder = JSONDecoder()
          let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
          print("Parsed Movies: \(parsedMovies)")
          self.presenter?.onSuccessGetTrendingMovies(data: parsedMovies)
        } catch {
          print("Decoding error: \(error.localizedDescription)")
          let stringError = ErrorString.errorToString(error)
          self.presenter?.onFailedGet(message: stringError)
        }
      case .failure(let error):
        print("AF Request Error: \(error.localizedDescription)")
        let stringError = AFErrorToString.convertToString(error)
        self.presenter?.onFailedGet(message: stringError)
      }
    }
  }
  func getAllMovies(key: String) {
    let categories = ["upcoming", "popular", "top_rated"]
    var results: [Title] = []
    let group = DispatchGroup()
    
    for category in categories {
      group.enter()
      let apiUrl = "\(Constants.baseURL)/3/movie/\(category)"
      let parameters: [String: Any] = [
        "api_key": key,
        "language": "en-US",
        "page": 1
      ]
      
      AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
        switch response.result {
        case .success(let value):
          let json = JSON(value)
          do {
            let movieResponse = try json["results"].rawData()
            let decoder = JSONDecoder()
            let parsedMovies = try decoder.decode([Title].self, from: movieResponse)
            results.append(contentsOf: parsedMovies)
          } catch {
            print("Decoding error for \(category): \(error.localizedDescription)")
          }
          
        case .failure(let error):
          print("AF Request Error for \(category): \(error.localizedDescription)")
        }
        group.leave()
      }
    }
    
    group.notify(queue: .main) {
      // Handle the results here
      print("All Movies: \(results)")
      
      // Send results to the presenter
      if let presenter = self.presenter {
        presenter.onSuccessGetAllMovies(data: results)
      } else {
        print("Presenter not set. Process results here.")
      }
    }
  }
}
