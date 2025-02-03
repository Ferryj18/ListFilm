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

  
 
  
 
  
 
  
  func startNavToFavorites(data: [Title], index: Int, nav: UINavigationController) {
    guard index < data.count else {
            print("Index out of bounds: \(index) for data count: \(data.count)")
            return
        }
      let dataDetail = data[index] // Mengambil elemen dari array
      router?.navToFavorites(data: dataDetail, nav: nav) // Mengirimkan elemen tunggal
  }
  
    
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
  func getMovies(key: String) {
      interactor?.getMovies(key: key)
  }
  
    
    
    
    func startNavToDetail(data: [Title], index: Int, nav: UINavigationController) {
      guard index < data.count else {
              print("Index out of bounds: \(index) for data count: \(data.count)")
              return
          }
          let dataDetail = data[index] // Get the specific movie
          router?.navToDetailData(data: dataDetail, nav: nav) // Pass the single Title object
      }
//  func startNavToSearch(nav: UINavigationController) {
//    router?.navToSearch( nav: nav) // Pass the single Title object
//  }
  
 
    
    
}

//MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    
    func onSuccessGetMovies(data: [Title], movieType: MovieType) {
        // Call a unified method in the view
        view?.successGetMovies(data: data, movieType: movieType)
    }
    
    
    func onSuccessGetTrendingMovies(data: [Title]) {
        view?.successGetTrendingMovies(data: data)
    }
    
    
    
    func onFailedGet(message: String) {
        view?.failedGet(message: message)
    }
    
    
}

