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
  
  @IBOutlet weak var btnAddFavorites: UIButton!
  
  @IBOutlet weak var buttonAlreadyFavorites: UIButton!
  @IBOutlet weak var vwButtonFavorites: UIView!
  @IBOutlet weak var vwText: UIView!
  
  @IBOutlet weak var vwVideo: UIView!
  @IBOutlet weak var wkMovie: WKWebView!
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblOverview: UILabel!
  
  var presenter: VTPDetailProtocol?
  //    private var viewModel: TitlePreviewViewModel?
  var dataMovie: [Title] = []
  var dataDetail: Title?
  var dataFavorites: Title?
  var key = "883b20661c35f38e181243f7361f28f3"
  //  var sections : sections = .TrendingMovies
  var indexNumb: Int = 0
  var isFavorite: Bool = false // Menyimpan status apakah judul sudah difavoritkan
  var indexPath: IndexPath!
  //  var title: String?
  //  var posterPath: String?
  //  var data = favoritesModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    setUpAction()
    setUpData()
    // Do any additional setup after loading the view.
  }
  
  func setUpView(){
    //    navigationBar.delegate = self
    self.lblTitle.text = dataDetail?.title
    self.lblOverview.text = dataDetail?.overview
    lblTitle.textColor = .white
    lblOverview.textColor = .white
    view.backgroundColor = .black
    vwVideo.backgroundColor = .black
    vwText.backgroundColor = .black
    vwButtonFavorites.backgroundColor = .black
    wkMovie.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Make it responsive
  }
  func setUpAction(){
//    btnAddFavorites.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
    
  }
  func setUpData(){
    guard let movieId = dataDetail?.id else {
      print("Movie ID is nil.")
      return
    }
    presenter?.getVideoDetails(movieId: movieId, key: key)
  }
 
}
extension DetailVC: PTVDetailProtocol/*, NavigationBarDelegate*/ {
                 func successGetVideoDetails(videoURL: String) {
                   // Load the video URL in the WKWebView
                   if let url = URL(string: videoURL) {
                     let request = URLRequest(url: url)
                     wkMovie.load(request) // Load the video in the WKWebView
                   }
                 }
                 
                 
                 
                 
                 func failedGet(message: String) {
                   print(message)
                   Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
                   
                 }
                 //  func pressBack() {
                 //    self.navigationController!.popViewController(animated: true)
                 //  }
                 
                 
               }
