//
//  HomeRouter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class HomeRouter: PTRHomeProtocol {
  func navToFavorites(data: Title, nav: UINavigationController) {
    let view = FavoritesRouter.createFavoritesModule()
    view.dataFavorites = data
    nav.pushViewController(view, animated: true)
}
  
  
  
  
//  func navToSearch(nav: UINavigationController) {
//    let vw = SearchRouter.createSearchModule()
//          nav.pushViewController(vw, animated: true)
//  }
  
    static func createHomeModule() -> HomeVC{
        let view =  HomeVC()
        let presenter =  HomePresenter(viewController: view)
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
  func navToDetailData(data: Title, nav: UINavigationController) {
//    print("Navigating to detail for movie at index: \(index)")
//    let detailVC = DetailRouter.createDetailModule() // Create the detail view controller
//           detailVC.dataDetail = data // Pass the selected movie data to the detail view controller
//           nav.pushViewController(detailVC, animated: true) // Push the detail view controller
          let view = DetailRouter.createDetailModule()
    view.dataDetail = data
          nav.pushViewController(view, animated: true)
      }
      
      func navToDetail(data: [Title], index: Int, nav: UINavigationController) {
          let vw = DetailRouter.createDetailModule()
          vw.dataMovie = data
          nav.pushViewController(vw, animated: true)
      }
  
    
    
  
}
