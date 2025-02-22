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
    
    func getVideoDetails(movieId: Int, key: String) {
      interactor?.getVideoDetails(movieId: movieId, key: key)
  }
    
    
}

//MARK: - Extension DetailNewsPresenter
extension  DetailPresenter : ITPDetailProtocol {
  func onSuccessGetVideoURL(videoURL: String) {
      view?.successGetVideoDetails(videoURL: videoURL) // Pass the video URL to the view
  }
func onFailedGet(message: String) {
 view?.failedGet(message: message)
}
}
