////
////  SearchPresenter.swift
////  MovieList
////
////  Created by Ferry jati on 18/01/25.
////
//
//import UIKit
//
//class SearchPresenter: VTPSearchProtocol {
//  func getTopSearch(key: String) {
//    interactor?.getTopSearch(key: key)
//  }
//  
////  func search(query: String, key: String) {
////    interactor?.search(query: query, key: key)
////  }
//  
//  func startNavToDetail(data: [Title], nav: UINavigationController) {
//    router?.navToDetail(data: data, nav: nav)
//  }
//  
//  
//  
//  
//  
//    
//    //MARK: - Property SearchNewsPresenter
//    var view: PTVSearchProtocol?
//    var interactor: PTISearchProtocol?
//    var router: PTRSearchProtocol?
//    var viewController : SearchVC!
//    
//    //MARK: - Lifecycle SearchNewsPresenter
//    init() {}
//    
//    init(viewController: SearchVC ) {
//        self.viewController = viewController
//    }
//    
//   
//
//    
//}
//
////MARK: - Extension SearchNewsPresenter
//extension  SearchPresenter : ITPSearchProtocol {
//  func onSuccessGetTopSearch(data: [Title]) {
//    view?.successGetTopSearch(data: data)
//  }
//  
////  func onSuccessGetSearch(data: [Title]) {
////    view?.successGetSearch(data: data)
////  }
//  
//
//func onFailedGet(message: String) {
// view?.failedGet(message: message)
//}
//}
