//
//  HomePresenter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//
import Foundation
import UIKit

import Foundation

class HomePresenter: VTPHomeProtocol {
 
 
  
    
    //MARK: - Property HomePresenter
    var view: PTVHomeProtocol?
    var interactor: PTIHomeProtocol?
    var router: PTRHomeProtocol?
    var viewController : HomeVC!

    //MARK: - Lifecycle HomePresenter
    init() {}
    
    init(viewController: HomeVC ) {
        self.viewController = viewController
    }
    
    //MARK: - Function HomePresenter
    
  func getTrendingMovies(key: String){
        interactor?.getTrendingMovies(key: key)
    }
    
    func getAllMovies(key: String) {
        interactor?.getAllMovies(key: key)
    }
    
    func startNavToDetail(data: [Title], nav: UINavigationController) {
        router?.navToDetail(data: data, nav: nav)
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
  func onSuccessGetTrendingMovies(data: [Title]) {
    view?.successGetTrendingMovies(data: data)
  }
  
  func onSuccessGetAllMovies(data: [Title]) {
    view?.successGetAllMovies(data: data)
  }
  
  
    func onFailedGet(message: String) {
        view?.failedGet(message: message)
    }
    

}

