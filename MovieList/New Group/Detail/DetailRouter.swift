//
//  DetailRouter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class DetailRouter: PTRDetailProtocol {

  static func createDetailModule() -> DetailVC {
      let view =  DetailVC()
      let presenter =  DetailPresenter(viewController: view)
      let interactor : PTIDetailProtocol =  DetailInteractor()
      let router : PTRDetailProtocol =  DetailRouter()
      
      presenter.view = view as! any PTVDetailProtocol
      presenter.router = router
      presenter.interactor = interactor
      interactor.presenter = presenter
      view.presenter = presenter
      return view
  }
  
}
