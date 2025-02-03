////
////  FavoritesVC.swift
////  MovieList
////
////  Created by Ferry jati on 20/01/25.
////
//
import UIKit
//
class FavoritesVC: UIViewController {
  
  
  @IBOutlet weak var tblMovieFavorites: UITableView!
  var presenter: VTPFavoritesProtocol?
  
  var titles: [TitleItem] = []
  var dataDownload: [Title] = []
  var dataMovie: [Title] = []
  var dataDetail: Title?
  var dataFavorites: Title?
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpView()
    setUpAction()
    setUpData()
    tblMovieFavorites.register(FavoritesTVC.nib(), forCellReuseIdentifier: FavoritesTVC.identifier)
    tblMovieFavorites.delegate = self
    tblMovieFavorites.dataSource = self
  }
  func setUpView(){
    
  }
  func  setUpAction(){
    
    
  }
  func setUpData(){
    presenter?.fetchTitles { [weak self] result in
      switch result {
      case .success(let fetchedTitles):
        self?.titles = fetchedTitles
        DispatchQueue.main.async {
          self?.tblMovieFavorites.reloadData() // Memperbarui tabel dengan data yang diambil
        }
      case .failure(let error):
        print("Gagal mengambil judul: \(error.localizedDescription)")
        // Tangani kesalahan (misalnya, tampilkan alert kepada pengguna)
      }
    }
  }
  func deleteTitle(at index: Int) {
          guard index >= 0 && index < titles.count else { return }
          
          let titleToDelete = titles[index]
          
          // Call the data persistence manager to delete the title
          DataPersistenceManager.shared.deleteTitleWith(model: titleToDelete) { [weak self] result in
              switch result {
              case .success:
                  print("Deleted from the database")
                  // Remove the title from the data source
                  self?.titles.remove(at: index)
                  DispatchQueue.main.async {
                      self?.tblMovieFavorites.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
                  }
              case .failure(let error):
                  print("Failed to delete title: \(error.localizedDescription)")
                  // Handle the error (e.g., show an alert to the user)
                  DispatchQueue.main.async {
                  }
              }
          }
      }
  // Function to delete a title
}
extension FavoritesVC: PTVFavoritesProtocol{
  func successDownloadTitle(model: Title) {
      print("Data download Count: \(dataDownload.count)")
    tblMovieFavorites.reloadData()
  }
  
  func successFetchTitles(data: [TitleItem]) {
    titles = data
      print("Data fetch Count: \(titles.count)")
    tblMovieFavorites.reloadData()
  }
  
  func successDeleteTitle(message: String) {
    print(message)
    tblMovieFavorites.reloadData()
  }
  
  func failedGet(message: String) {
    print(message)
      Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
            
    }
  }
  
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count // Mengembalikan jumlah item dalam dataMovie
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          switch editingStyle {
          case .delete:
              deleteTitle(at: indexPath.row) // Call the delete function
          default:
              break
          }
      }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Check if the index is within the bounds of the dataMovie array
    //    guard indexPath.row < dataMovie.count else {
    //      print("Index out of range: \(indexPath.row) for dataMovie count: \(dataMovie.count)")
    //      return UITableViewCell() // Return an empty cell if the index is out of range
    //    }
    //
    //    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTVC", for: indexPath) as? FavoritesTVC else {
    //      return UITableViewCell()
    //    }
    //
    //    // Configure the cell with data
    //    let movie = dataMovie[indexPath.row] // Access the movie safely
    //    cell.configure(with: movie)
    //
    //    return cell
    //  }
    
    //    guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTVC.identifier, for: indexPath) as? FavoritesTVC else {
    //      return UITableViewCell() // Kembalikan sel kosong jika tidak dapat dikonversi
    //    }
    //
    //    let titleItem = titles[indexPath.row]
    //
    //    // Konfigurasi sel
    //    cell.lblTitles.text = titleItem.title // Mengatur judul
    //
    //    // Reset image to nil before loading new image
    //    cell.imgFavorites.image = nil
    //
    //    if let posterPath = titleItem.posterPath, let url = URL(string: posterPath) {
    //      // Memuat gambar poster dari URL
    //      URLSession.shared.dataTask(with: url) { data, response, error in
    //        guard let data = data, error == nil else {
    //          print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
    //          return
    //        }
    //        DispatchQueue.main.async {
    //          // Pastikan sel masih terlihat dan URL masih sama
    //          if let currentCell = tableView.cellForRow(at: indexPath) as? FavoritesTVC {
    //            currentCell.imgFavorites.image = UIImage(data: data)
    //          }
    //        }
    //      }.resume()
    //    } else {
    //      cell.imgFavorites.image = nil // Atur gambar menjadi nil jika URL tidak valid
    //    }
    //
    //    return cell
    //  }
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTVC.identifier, for: indexPath) as? FavoritesTVC else {
      return UITableViewCell() // Return an empty cell if it cannot be cast
    }
    
    let titleItem = titles[indexPath.row]
    
    // Configure the cell
    cell.lblTitles.text = titleItem.title // Set the title
    
    // Reset image to nil before loading a new image
    cell.imgFavorites.image = nil
    
    if let posterPath = titleItem.posterPath {
      // Construct the full URL for the poster image
      let imageUrlString = "https://image.tmdb.org/t/p/w500/\(posterPath)"
      print("Image URL: \(imageUrlString)") // Debugging: print the image URL
      
      if let url = URL(string: imageUrlString) {
        // Use SDWebImage to load the image
        cell.imgFavorites.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png")) { (image, error, cacheType, url) in
          if let error = error {
            print("Error loading image: \(error.localizedDescription)")
            // Optionally set a default error image
            cell.imgFavorites.image = UIImage(named: "error.png")
          } else {
            print("Image loaded successfully from URL: \(url?.absoluteString ?? "")")
          }
        }
      } else {
        print("Error: Invalid URL")
        cell.imgFavorites.image = nil // Set image to nil if URL is invalid
      }
    } else {
      cell.imgFavorites.image = nil // Set image to nil if posterPath is nil
    }
    
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      // Return the height for each row
      return 300// Set your desired row height
  }
}
