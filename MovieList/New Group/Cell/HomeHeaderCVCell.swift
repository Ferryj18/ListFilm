//
//  HomeHeaderCVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import SDWebImage

class HomeHeaderCVCell: UICollectionViewCell {

  @IBOutlet weak var imgHeaderMovie: UIImageView!
 
  
  
  
  
  static let identifier = "HomeHeaderCVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeHeaderCVCell", bundle: nil)
  }
  var presenter: VTPHomeProtocol?
  var dataMovie: [Title] = []
   var parentViewController: UIViewController?
   var indexNumb: Int?
   var url: String?
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
    imgHeaderMovie.layer.cornerRadius = 20
    }
  override var isSelected: Bool {
      didSet {
          super.isSelected = isSelected
          // Configure the view for the selected state
          if isSelected {
              // Code for when the cell is selected
          } else {
              // Code for when the cell is deselected
          }
      }
  }
  func configure(with title: Title) {
    if let posterPath = title.posterPath {
      let imageUrlString = "https://image.tmdb.org/t/p/w500\(posterPath)"
      print("Image URL: \(imageUrlString)")
      let url = URL(string: imageUrlString)
      imgHeaderMovie.sd_setImage(with: url) { (image, error, cacheType, url) in
        if let error = error {
          print("Error loading image: \(error.localizedDescription)")
        } else {
          print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
        }
      }
    }
  }
  @objc func imageTapped(_ sender: UITapGestureRecognizer) {
      if let viewController = parentViewController {
          if let navigation = viewController.navigationController{
//                let vw = DetailNewsRouter.createDetailNewsModule()
//                vw.dataAllNews = dataTo
//                vw.indexNumb = indexNumb ?? 0
//                vw.navFrom = .AllHeadline
              let vw = DetailRouter.createDetailModule()
              navigation.pushViewController(vw, animated: true)
          }
      }
  }
}
