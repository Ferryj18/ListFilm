//
//  HomeMovieCollTVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class HomeMovieCollTVCell: UITableViewCell {
  @IBOutlet weak var clcAllMovie: UICollectionView!
  
  var presenter: VTPHomeProtocol?
  var dataDetail : [Title] = []
  var parentViewController: UIViewController?
  var indexNumb: Int?
  var url: String?
  var dataFavorites : [Title] = []
  static let identifier = "HomeMovieCollTVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCollTVCell", bundle: nil)
  }
  func configure(with dataAllMovie: [Title]) {
    self.dataDetail = dataAllMovie
    clcAllMovie.reloadData()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    clcAllMovie.register(HomeMovieCVCell.nib(), forCellWithReuseIdentifier: HomeMovieCVCell.identifier)
    clcAllMovie.delegate = self
    clcAllMovie.dataSource = self
    clcAllMovie.backgroundColor = .black
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
    clcAllMovie.addGestureRecognizer(longPressGesture)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  //  @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
  //         let location = gesture.location(in: clcAllMovie)
  //         if let indexPath = clcAllMovie.indexPathForItem(at: location) {
  //             // Pastikan presenter sudah di-set
  //             guard let presenter = presenter else {
  //                 print("Presenter is not set")
  //                 return
  //             }
  //             
  //             // Tampilkan alert untuk pilihan download
  //             let alert = UIAlertController(title: "Pilih Aksi", message: "Apa yang ingin Anda lakukan?", preferredStyle: .actionSheet)
  //             
  //           alert.addAction(UIAlertAction(title: "Add to Favorites", style: .default, handler: { _ in
  //               // Panggil fungsi untuk mengunduh judul
  //               self.downloadTitleAt(indexPath: indexPath)
  //               
  //               // Mengambil title dan mengubahnya menjadi array
  //               let titleToAdd = [self.dataDetail[indexPath.item]] // Mengubah menjadi array
  //               
  //               // Panggil presenter untuk menavigasi ke favorites
  //               self.presenter?.startNavToFavorites(data: titleToAdd, index: indexPath.item, nav: self.parentViewController?.navigationController ?? UINavigationController())
  //           }))
  //
  //               // Opsi untuk melihat detail
  //               alert.addAction(UIAlertAction(title: "Lihat Detail", style: .default, handler: { [weak self] _ in
  //                   guard let self = self else { return }
  //                   
  //                   // Panggil presenter untuk menangani pemilihan
  //                   self.presenter?.startNavToDetail(data: self.dataDetail, index: indexPath.item, nav: self.parentViewController?.navigationController ?? UINavigationController())
  //               }))
  //             
  //             // Opsi untuk membatalkan
  //             alert.addAction(UIAlertAction(title: "Batal", style: .cancel, handler: nil))
  //             
  //             // Tampilkan alert
  //             parentViewController?.present(alert, animated: true, completion: nil)
  //         }
  //     }
  @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
    let location = gesture.location(in: clcAllMovie)
    if let indexPath = clcAllMovie.indexPathForItem(at: location) {
      // Pastikan presenter sudah di-set
      guard let presenter = presenter else {
        print("Presenter is not set")
        return
      }
      
      // Ambil data dari item yang ditekan
      let titleToCheck = dataDetail[indexPath.item]
      
      // Cek apakah title sudah ada di favorites
      let isFavorite = checkIfFavorite(title: titleToCheck) // Implementasikan fungsi ini
      
      // Tampilkan alert untuk pilihan download
      let alert = UIAlertController(title: "Pilih Aksi", message: "Apa yang ingin Anda lakukan?", preferredStyle: .actionSheet)
      
      // Tambahkan aksi "Add to Favorites" hanya jika item belum ada di favorites
      if !isFavorite {
        alert.addAction(UIAlertAction(title: "Add to Favorites", style: .default, handler: { _ in
          // Panggil fungsi untuk mengunduh judul
          self.downloadTitleAt(indexPath: indexPath)
          
          // Mengambil title dan mengubahnya menjadi array
          let titleToAdd = [self.dataDetail[indexPath.item]] // Mengubah menjadi array
          
          // Panggil presenter untuk menavigasi ke favorites
          self.presenter?.startNavToFavorites(data: titleToAdd, index: indexPath.item, nav: self.parentViewController?.navigationController ?? UINavigationController())
        }))
      }
      
      // Opsi untuk melihat detail
      alert.addAction(UIAlertAction(title: "Lihat Detail", style: .default, handler: { [weak self] _ in
        guard let self = self else { return }
        
        // Panggil presenter untuk menangani pemilihan
        self.presenter?.startNavToDetail(data: self.dataDetail, index: indexPath.item, nav: self.parentViewController?.navigationController ?? UINavigationController())
      }))
      
      // Opsi untuk membatalkan
      alert.addAction(UIAlertAction(title: "Batal", style: .cancel, handler: nil))
      
      // Tampilkan alert
      parentViewController?.present(alert, animated: true, completion: nil)
    }
  }
  func checkIfFavorite(title: Title) -> Bool {
    return dataFavorites.contains { favorite in
      // Misalkan Title memiliki properti 'id' yang dapat dibandingkan
      return favorite.id == title.id // Ganti 'id' dengan properti yang sesuai
    }
  }
}
//
extension HomeMovieCollTVCell:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataDetail.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // Dequeue the cell
    let cell = clcAllMovie.dequeueReusableCell(withReuseIdentifier: HomeMovieCVCell.identifier, for: indexPath) as! HomeMovieCVCell
    
    // Configure the cell with the movie data
    cell.configure(with: dataDetail[indexPath.row])
    
    // Return the properly configured cell
    return cell
  }
  //  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //      // Ensure the presenter is set
  //    // Ensure the presenter is set
  //    guard let presenter = presenter else {
  //        print("Presenter is not set")
  //        return
  //    }
  //
  //      // Call the presenter to handle the selection
  //    presenter.startNavToDetail(data: dataDetail, index: indexPath.item, nav: (parentViewController?.navigationController)!)  }
  //}
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          // Pastikan presenter sudah di-set
          guard let presenter = presenter else {
              print("Presenter is not set")
              return
          }
          
          // Ambil data yang sesuai dengan indeks yang dipilih
          let selectedMovie = dataDetail[indexPath.item]
          
          // Langsung navigasi ke detail
          presenter.startNavToDetail(data: self.dataDetail, index: indexPath.item, nav: self.parentViewController?.navigationController ?? UINavigationController())
      }
      
      func downloadTitleAt(indexPath: IndexPath) {
          print("Downloading title at index: \(indexPath.row)")
          
          DataPersistenceManager.shared.downloadTitleWith(model: dataDetail[indexPath.row]) { result in
              switch result {
              case .success():
                  NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
                  print("Download successful")
              case .failure(let error):
                  print("Download failed: \(error.localizedDescription)")
              }
          }
      }
  }
