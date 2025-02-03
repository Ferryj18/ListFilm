////
////  SearchRouter.swift
////  MovieList
////
////  Created by Ferry jati on 18/01/25.
////
//
//import Foundation
//import UIKit
//class SearchRouter: PTRSearchProtocol {
//  func navToDetail(data: [Title], nav: UINavigationController) {
//    let vw = SearchRouter.createSearchModule()
//        vw.dataSearch = data
//           nav.pushViewController(vw, animated: true)
//  }
//  
//  static func createSearchModule() -> SearchVC{
//    let view =  SearchVC()
//    let presenter =  SearchPresenter(viewController: view)
//    let interactor : PTISearchProtocol =  SearchInteractor()
//    let router : PTRSearchProtocol =  SearchRouter()
//    
//    presenter.view = view
//    presenter.router = router
//    presenter.interactor = interactor
//    interactor.presenter = presenter
//    view.presenter = presenter
//    return view
//  }
//}
