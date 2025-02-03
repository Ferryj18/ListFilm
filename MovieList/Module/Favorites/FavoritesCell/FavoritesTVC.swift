//
//  FavoritesTVC.swift
//  MovieList
//
//  Created by Ferry jati on 21/01/25.
//

import UIKit
import SDWebImage
class FavoritesTVC: UITableViewCell {
  
  
  @IBOutlet weak var imgFavorites: UIImageView!
  
  
  @IBOutlet weak var lblTitles: UILabel!
  var dataAllMovie: [Title] = []
  var url: String?
  static let identifier = "FavoritesTVC"
  static func nib() -> UINib{
    return UINib(nibName: "FavoritesTVC", bundle: nil)
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configure(with title: Title) {
      lblTitles.text = title.title // Set the title

      if let posterPath = title.posterPath, !posterPath.isEmpty {
          // Construct the full URL
          let baseURL = "https://image.tmdb.org/t/p/w500"
          let fullImageURLString = baseURL + posterPath
          print("Full Image URL: \(fullImageURLString)") // Debugging: Check the full URL

          // Safely create a URL object
          if let url = URL(string: fullImageURLString) {
              imgFavorites.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder")) { (image, error, cacheType, url) in
                  if let error = error {
                      print("Error loading image: \(error.localizedDescription)")
                  } else {
                      print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
                  }
              }
          } else {
              print("Invalid URL: \(fullImageURLString)") // Debugging: Check if URL creation failed
          }
      } else {
          print("Poster path is empty or nil") // Debugging: Check if posterPath is nil or empty
          imgFavorites.image = UIImage(named: "placeholder")
      }
  }
}
  
//  func configure(with title: Title) {
//          lblTitles.text = title.title // Mengatur judul
//          
//          if let posterPath = title.posterPath {
//              let imageUrlString = "https://image.tmdb.org/t/p/w500\(posterPath)"
//              print("Image URL: \(imageUrlString)") // Log untuk memeriksa URL
//              
//              if let url = URL(string: imageUrlString) {
//                  imgFavorites.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png")) { (image, error, cacheType, url) in
//                      if let error = error {
//                          print("Error loading image: \(error.localizedDescription)")
//                      } else {
//                          print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
//                      }
//                  }
//              } else {
//                  print("Invalid URL: \(imageUrlString)") // Log jika URL tidak valid
//              }
//          } else {
//              print("Poster path is nil") // Log jika posterPath nil
//              imgFavorites.image = nil // Atur gambar menjadi nil jika tidak ada poster path
//          }
//      }
//  }
