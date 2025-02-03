//
//  DetailProtocol.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

protocol VTPDetailProtocol: AnyObject {
    var view: PTVDetailProtocol? { get set }
    var interactor: PTIDetailProtocol? { get set }
    var router: PTRDetailProtocol? { get set }
  
  func getVideoDetails(movieId: Int, key: String)
}

protocol PTVDetailProtocol: AnyObject {
  func successGetVideoDetails(videoURL: String)
  func failedGet(message: String)
}
  

protocol PTIDetailProtocol: AnyObject {
    var presenter: ITPDetailProtocol? { get set }
  func getVideoDetails(movieId: Int, key: String)
}


protocol ITPDetailProtocol: AnyObject {
  func onSuccessGetVideoURL(videoURL: String)
  func onFailedGet(message: String)
}
protocol PTRDetailProtocol: AnyObject {
    static func createDetailModule() -> DetailVC
    
}
