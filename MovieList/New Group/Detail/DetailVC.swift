//
//  DetailVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

  
  
  @IBOutlet weak var wkMovie: WKWebView!
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblOverview: UILabel!
  
  var presenter: VTPDetailProtocol?
  var dataMovie: [Title] = []
  var dataAllMovie: [Title] = []
  var sections : sections = .TrendingMovies
  var indexNumb: Int = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  public func configure(with model: TitlePreviewViewModel) {
    lblTitle.text = model.title
    lblOverview.text = model.titleOverview
      
      guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
          return
      }
      
    wkMovie.load(URLRequest(url: url))
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
