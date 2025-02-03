//
//  HomeVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class HomeVC: UIViewController{
  
  @IBOutlet weak var btnSearch: UIButton!
  @IBOutlet weak var imgLogo: UIImageView!
  @IBOutlet weak var clcHeader: UICollectionView!
  @IBOutlet weak var tblMovie: UITableView!
  
  @IBOutlet weak var vwNav: UIView!
  
  var presenter: VTPHomeProtocol?
  var dataMovie : [Title] = []
  var dataTopRated : [Title] = []
  var dataUpcoming : [Title] = []
  var dataPopular : [Title] = []
  //  var endpoints: [MovieType] = [.popular, .upcoming, .topRated]
  var key = "883b20661c35f38e181243f7361f28f3"
  let sectionHeaders = ["Popular","Upcoming","Top Rated"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    setUpData()
    setUpAction()
    // Do any additional setup after loading the view.
  }
  
  func setUpView(){
    imgLogo.image = UIImage(named: "image_Logo")
    //
    
    clcHeader.register(HomeHeaderCVCell.nib(), forCellWithReuseIdentifier: HomeHeaderCVCell.identifier)
    clcHeader.delegate = self
    clcHeader.dataSource = self
    clcHeader.backgroundColor = .black
    clcHeader.isPagingEnabled = true // Enable paging
    tblMovie.register(HomeMovieCollTVCell.nib(), forCellReuseIdentifier: HomeMovieCollTVCell.identifier)
    tblMovie.delegate = self
    tblMovie.dataSource = self
    tblMovie.backgroundColor = .black
    vwNav.backgroundColor = .black
    view.backgroundColor = .black
    
  }
  func setUpAction() {
    //      btnSearch.isUserInteractionEnabled = true // Corrected line
    //      btnSearch.addTarget(self, action: #selector(btnSearchTapped), for: .touchUpInside)
  }
  
  func setUpData(){
    presenter?.getTrendingMovies(key: key)
    presenter?.getMovies(key: key)
    
  }
  // MARK: - Gesture Handling
}

extension HomeVC: PTVHomeProtocol{
    func successGetMovies(data: [Title], movieType: MovieType) {
        switch movieType {
        case .popular:
            dataPopular = data
            print("Data Popular Count: \(dataPopular.count)")
        case .upcoming:
            dataUpcoming = data
            print("Data Upcoming Count: \(dataUpcoming.count)")
        case .top_rated:
            dataTopRated = data
            print("Data TopRated Count: \(dataTopRated.count)")
        }
        
        // Reload the table view after updating the data
        tblMovie.reloadData()
    }
    
    
    func successGetTrendingMovies(data: [Title]) {
        dataMovie = data
        print("Data Movie Count: \(dataMovie.count)")
        clcHeader.reloadData()
        
    }
    
    func failedGet(message: String) {
        print(message)
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
        
    }
  
    
    
}

// header trending
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 // Only one section for horizontal scroll
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //    print("Data Movie Count: \(dataMovie.count)")
        return dataMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clcHeader.frame.width, height: clcHeader.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let navigation = navigationController {
            self.presenter?.startNavToDetail(data: dataMovie, index: indexPath.item, nav: navigation)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHeaderCVCell", for: indexPath) as? HomeHeaderCVCell else {
            return UICollectionViewCell()
        }
        // Configure the cell with data
        let movie = dataMovie[indexPath.row] // Assuming dataTo holds your movie data
        cell.configure(with: movie)
        
        return cell
        
    }
    
    
}
// All Movies table
extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMovieCollTVCell.identifier, for: indexPath) as? HomeMovieCollTVCell else {
          
            return UITableViewCell()
        }
      // Set the presenter and parent view controller
          cell.presenter = presenter // Set the presenter
          cell.parentViewController = self // Set the parent view controller

        switch indexPath.section {
        case 0: // Popular
            cell.configure(with: dataPopular)
        case 1: // Upcoming
            cell.configure(with: dataUpcoming)
        case 2: // Top Rated
            cell.configure(with: dataTopRated)
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        
        // Set label text dari section header
        label.text = sectionHeaders[section]
        
        // Set font dan ukuran sesuai kebutuhan
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Ganti dengan font yang diinginkan
        label.textColor = .white // Ganti dengan warna yang diinginkan
        label.backgroundColor = .black
        
        // Add label ke header view
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        // Set constraint untuk label agar tampil dengan benar
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15)
        ])
        
        // Styling untuk header view (opsional)
        headerView.backgroundColor = .black // Menambahkan warna latar belakang pada header
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
