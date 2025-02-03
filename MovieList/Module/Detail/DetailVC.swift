//
//  DetailVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import WebKit
import Kingfisher

class DetailVC: UIViewController {
    
    
    
    @IBOutlet weak var wkMovie: WKWebView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    var presenter: VTPDetailProtocol?
//    private var viewModel: TitlePreviewViewModel?
    var dataMovie: [Title] = []
    var dataDetail: Title?
  var key = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    //  var sections : sections = .TrendingMovies
    var indexNumb: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        setUpData()
        // Do any additional setup after loading the view.
    }
    
  func setUpView(){
    self.lblTitle.text = dataDetail?.originalName ?? dataDetail?.originalTitle
    self.lblOverview.text = dataDetail?.overview
    view.backgroundColor = .black
  
    wkMovie.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Make it responsive
  }
  func setUpAction(){
    
  }
  func setUpData(){
    guard let movieTitle = dataDetail?.originalName ?? dataDetail?.originalTitle else { return }
        presenter?.getMovieTrailer(key: key, query: movieTitle) // Pass the movie title as the query
    }
  }
extension DetailVC: PTVDetailProtocol {
  func successGetMovieTrailer(videoElement: VideoElement) {
    // Construct the YouTube embed URL using the video ID
           guard let videoId = videoElement.id.videoId else {
               print("Invalid video ID")
               return
           }
           
           let urlString = "https://www.youtube.com/embed/\(videoId)"
           if let url = URL(string: urlString) {
               let request = URLRequest(url: url)
               wkMovie.load(request) // Load the video in the WKWebView
           } else {
               print("Invalid YouTube URL: \(urlString)")
           }
           
           // Optional: Enable developer extras for debugging
           wkMovie.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
  }
  
 


   
  func failedGet(message: String) {
    print(message)
    Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    
}
  
  
  
}
