//
//  DetailPresenter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class DetailPresenter: VTPDetailProtocol {

  //MARK: - Property DetailNewsPresenter
  var view: PTVDetailProtocol?
  var interactor: PTIDetailProtocol?
  var router: PTRDetailProtocol?
  var viewController : DetailVC!

  //MARK: - Lifecycle DetailNewsPresenter
  init() {}
  
  init(viewController: DetailVC ) {
      self.viewController = viewController
  }
  
  //MARK: - Function DetailNewsPresenter
  
  
}

  //MARK: - Extension DetailNewsPresenter
extension  DetailPresenter : ITPDetailProtocol {

}
