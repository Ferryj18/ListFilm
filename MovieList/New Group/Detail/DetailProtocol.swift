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
<<<<<<< Updated upstream:MovieList/Detail/DetailProtocol.swift
    
}

protocol PTVDetailProtocol: AnyObject {
    
=======
  
//  func getVideoDetails(movieId: Int, key: String)
  func getMovieTrailer(key: String, query: String)
}

protocol PTVDetailProtocol: AnyObject {
  func successGetMovieTrailer(videoElement: VideoElement)
//  func successGetVideoDetails(videoURL: String)
  func failedGet(message: String)
>>>>>>> Stashed changes:MovieList/Module/Detail/DetailProtocol.swift
}

protocol PTIDetailProtocol: AnyObject {
    var presenter: ITPDetailProtocol? { get set }
<<<<<<< Updated upstream:MovieList/Detail/DetailProtocol.swift
=======
//  func getVideoDetails(movieId: Int, key: String)
  func getMovieTrailer(key: String, query: String)
}
>>>>>>> Stashed changes:MovieList/Module/Detail/DetailProtocol.swift

}

protocol ITPDetailProtocol: AnyObject {
<<<<<<< Updated upstream:MovieList/Detail/DetailProtocol.swift
    
=======
//  func onSuccessGetVideoURL(videoURL: String)
  func onSuccessGetMovieTrailer(videoElement: VideoElement)
  func onFailedGet(message: String)
>>>>>>> Stashed changes:MovieList/Module/Detail/DetailProtocol.swift
}

protocol PTRDetailProtocol: AnyObject {
    static func createDetailModule() -> DetailVC
    
}
