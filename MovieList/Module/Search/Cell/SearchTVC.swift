////
////  SearchTVC.swift
////  MovieList
////
////  Created by Ferry jati on 19/01/25.
////
//
//import UIKit
//import SDWebImage
//class SearchTVC: UITableViewCell {
//
//  
//  @IBOutlet weak var imgTblSearch: UIImageView!
//  
//  @IBOutlet weak var lblTitleSearch: UILabel!
//  
//  
//  
//  var presenter: VTPSearchProtocol?
//  var dataSearch: [Title] = []
//   var parentViewController: UIViewController?
//  static let identifier = "SearchTVC"
//     static func nib() -> UINib{
//         return UINib(nibName: "SearchTVC", bundle: nil)
//     }
//  
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//  override var isSelected: Bool {
//         didSet {
//             super.isSelected = isSelected
//             // Configure the view for the selected state
//             if isSelected {
//                 // Code for when the cell is selected
//             } else {
//                 // Code for when the cell is deselected
//             }
//         }
//     }
//  func configure(with title: TitleViewModel) {
//          if let posterPath = title.posterPath {
//              let imageUrlString = "https://image.tmdb.org/t/p/w500\(posterPath)"
//              print("Image URL: \(imageUrlString)")
//              let url = URL(string: imageUrlString)
//            imgTblSearch.sd_setImage(with: url) { (image, error, cacheType, url) in
//                  if let error = error {
//                      print("Error loading image: \(error.localizedDescription)")
//                  } else {
//                      print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
//                  }
//              }
//          }
//      }
//    
//}
