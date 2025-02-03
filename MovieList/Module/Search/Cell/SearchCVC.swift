//
//  SearchCVC.swift
//  MovieList
//
//  Created by Ferry jati on 19/01/25.
//

import UIKit
import SDWebImage

class SearchCVC: UICollectionViewCell {

  @IBOutlet weak var imgSearch: UIImageView!
  
  
  
  
   static let identifier = "SearchCVC"
   static func nib() -> UINib{
     return UINib(nibName: "SearchCVC", bundle: nil)
   }
   var presenter: VTPHomeProtocol?
   var dataMovie: [Title] = []
    var parentViewController: UIViewController?
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
       imgSearch.sd_setImage(with: url) { (image, error, cacheType, url) in
         if let error = error {
           print("Error loading image: \(error.localizedDescription)")
         } else {
           print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
         }
       }
     }
   }
  

}
