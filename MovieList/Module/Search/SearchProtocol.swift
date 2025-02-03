////
////  SearchProtocol.swift
////  MovieList
////
////  Created by Ferry jati on 18/01/25.
////
//
//import UIKit
//
//protocol VTPSearchProtocol: AnyObject {
//    var view: PTVSearchProtocol? { get set }
//    var interactor: PTISearchProtocol? { get set }
//    var router: PTRSearchProtocol? { get set }
//  
////  func search(query: String, key: String)
//  func getTopSearch(key: String)
//  func startNavToDetail(data: [Title], nav: UINavigationController)
//}
//
//protocol PTVSearchProtocol: AnyObject {
////  func successGetSearch(data: [Title])
//  func successGetTopSearch(data: [Title])
//  func failedGet(message: String)
//}
//  
//
//protocol PTISearchProtocol: AnyObject {
//    var presenter: ITPSearchProtocol? { get set }
//// func  search(query: String, key: String)
//  func getTopSearch(key: String)
//}
//
//
//protocol ITPSearchProtocol: AnyObject {
//// func onSuccessGetSearch(data: [Title])
//  func onSuccessGetTopSearch(data: [Title])
//  func onFailedGet(message: String)
//}
//protocol PTRSearchProtocol: AnyObject {
//    static func createSearchModule() -> SearchVC
//  func navToDetail(data: [Title], nav: UINavigationController)
//}
