////
////  FavoritesRouter.swift
////  MovieList
////
////  Created by Ferry jati on 21/01/25.
////
//
import Foundation
import UIKit
class FavoritesRouter: PTRFavoritesProtocol {
 
  
  
  static func createFavoritesModule() -> FavoritesVC{
    let view =  FavoritesVC()
    let presenter =  FavoritesPresenter(viewController: view)
    let interactor : PTIFavoritesProtocol =  FavoritesInteractor()
    let router : PTRFavoritesProtocol =  FavoritesRouter()
    
    presenter.view = view as! any PTVFavoritesProtocol
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    view.presenter = presenter
    return view
  }
  func NavToHome(nav: UINavigationController) {
    let vw = HomeRouter.createHomeModule()
    nav.pushViewController(vw, animated: true)
  }
  //  func goToHome(nav: UINavigationController) {
  //    let view = HomeRouter.createHomeModule()
  //            nav.pushViewController(view, animated: true)
  //  }
  //
  //// func navToDetail(data: [Title], nav: UINavigationController) {
  ////       let vw = DetailRouter.createDetailModule()
  ////   vw.dataMovie = data
  ////   vw.sections = .TrendingMovies
  ////       nav.pushViewController(vw, animated: true)
  ////   }
}
