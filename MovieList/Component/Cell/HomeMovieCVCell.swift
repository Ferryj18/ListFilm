//
//  HomeMovieCVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import SDWebImage
class HomeMovieCVCell: UICollectionViewCell {
  
  
  @IBOutlet weak var imgAllMovie: UIImageView!
  
  var parentViewController: UIViewController?
  var presenter: VTPHomeProtocol?
  static let identifier = "HomeMovieCVCell"
  var dataDetail: [Title] = []
  var tapGesture : UITapGestureRecognizer!
  var url: String?
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCVCell", bundle: nil)
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    //      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
    imgAllMovie.isUserInteractionEnabled = true
    //      imgAllMovie.addGestureRecognizer(tapGesture)
    
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
      imgAllMovie.sd_setImage(with: url) { (image, error, cacheType, url) in
        if let error = error {
          print("Error loading image: \(error.localizedDescription)")
        } else {
          print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
        }
      }
    }
  }
}
