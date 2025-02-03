////
////  ApiManager.swift
////  MovieList
////
////  Created by Ferry jati on 19/12/24.
////
//
//import UIKit
////
////  
//////enum Sections: Int {
//////    case Popular = 0
//////    case Upcoming = 1
//////    case TopRated = 2
//////  }
//////  
//  struct Constants {
//    static let API_KEY = "883b20661c35f38e181243f7361f28f3"
//    static let baseURL = "https://api.themoviedb.org"
//    static let YoutubeAPI_KEY = "AIzaSyDuHzNcNJM5q8plEkXx681SwPXN_530YK4"
//    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
//  }
////  
//  enum APIError: Error {
//    case failedTogetData
//  }
//  
//  class APICaller {
//    static let shared = APICaller()
//    
//    
//    
//    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//      guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
//      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//        guard let data = data, error == nil else {
//          return
//        }
//        
//        do {
//          let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//          completion(.success(results.results))
//          print(results)
//          
//        } catch {
//          completion(.failure(APIError.failedTogetData))
//        }
//      }
//      
//      task.resume()
//    }
//    
//    
//    
//    
//    
//    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//      guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
//      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//        guard let data = data, error == nil else {
//          return
//        }
//        
//        do {
//          let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//          completion(.success(results.results))
//          print(results)
//        } catch {
//          print(error.localizedDescription)
//          
//        }
//        
//      }
//      task.resume()
//    }
//    
//    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
//      guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
//      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//        guard let data = data, error == nil else {
//          return
//        }
//        
//        do {
//          let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//          completion(.success(results.results))
//          print(results)
//        } catch {
//          completion(.failure(APIError.failedTogetData))
//        }
//      }
//      
//      task.resume()
//    }
//    
//    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
//      guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return }
//      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//        guard let data = data, error == nil else {
//          return
//        }
//        
//        do {
//          let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//          completion(.success(results.results))
//          
//        } catch {
//          completion(.failure(APIError.failedTogetData))
//        }
//        
//      }
//      task.resume()
//    }
//  }
