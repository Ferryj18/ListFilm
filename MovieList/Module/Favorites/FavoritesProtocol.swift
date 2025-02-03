////
////  FavoritesProtocol.swift
////  MovieList
////
////  Created by Ferry jati on 21/01/25.
////
//
import UIKit
import Foundation
//
protocol VTPFavoritesProtocol: AnyObject {
  var view: PTVFavoritesProtocol? { get set }
  var interactor: PTIFavoritesProtocol? { get set }
  var router: PTRFavoritesProtocol? { get set }
  
  func downloadTitle(model: Title)
  func fetchTitles(completion: @escaping (Result<[TitleItem], Error>) -> Void)// Shortened using typealias
  func deleteTitle(model: TitleItem)
  
  func starNavToHome(nav: UINavigationController)
}

protocol PTVFavoritesProtocol: AnyObject {
  func successDownloadTitle(model: Title) // Corrected method name
   func successFetchTitles(data: [TitleItem]) // Changed to accept data directly
  func successDeleteTitle(message: String)// Corrected method name
   func failedGet(message: String)
}
protocol PTIFavoritesProtocol: AnyObject {
      var presenter: ITPFavoritesProtocol? { get set }
  func downloadTitle(model: Title)
  func fetchTitles(completion: @escaping (Result<[TitleItem], Error>) -> Void)// Shortened using typealias
    func deleteTitle(model: TitleItem)
}

protocol ITPFavoritesProtocol: AnyObject {
  func onSuccessDownloadTitle(model: Title)
  func onSuccessFetchTitles(data: [TitleItem]) // Changed to [TitleItem] to match fetchTitles
  func onSuccessDelete(message: String)
  func onFailed(message: String)
}

  protocol PTRFavoritesProtocol: AnyObject {
    static func createFavoritesModule() -> FavoritesVC
      func NavToHome(nav: UINavigationController)
    
  }
