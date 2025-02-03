////
////  FavoritesPresenter.swift
////  MovieList
////
////  Created by Ferry jati on 21/01/25.
////
//
//import Foundation
//import UIKit
//
import Foundation
//

import UIKit
class FavoritesPresenter: VTPFavoritesProtocol {
  
  var view: PTVFavoritesProtocol?
  var interactor: PTIFavoritesProtocol?
  var router: PTRFavoritesProtocol?
  var viewController : FavoritesVC!
  
  //MARK: - Lifecycle FavoritesPresenter
  init() {}
  
  init(viewController: FavoritesVC ) {
    self.viewController = viewController
  }
  func downloadTitle(model: Title) {
    interactor?.downloadTitle(model: model)
  }
  
 
  func fetchTitles(completion: @escaping (Result<[TitleItem], any Error>) -> Void) {
    interactor?.fetchTitles(completion: completion)
  }
  func deleteTitle(model: TitleItem) {
    interactor?.deleteTitle(model: model)
  }
  
  func starNavToHome(nav: UINavigationController) {
    router?.NavToHome(nav: nav)
  }
  
  //MARK: - Property FavoritesPresenter
}

//}
extension FavoritesPresenter: ITPFavoritesProtocol{
  func onSuccessDownloadTitle(model: Title) {
    view?.successDownloadTitle(model: model)
  }
  
  func onSuccessFetchTitles(data: [TitleItem]) {
    view?.successFetchTitles(data: data)
  }
  
  func onSuccessDelete(message: String) {
    view?.successDeleteTitle(message: message) // Adjust as necessary
  }
  
  func onFailed(message: String) {
    view?.failedGet(message: message)
  }
  
}
