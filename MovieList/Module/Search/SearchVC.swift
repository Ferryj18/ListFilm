////
////  SearchVC.swift
////  MovieList
////
////  Created by Ferry jati on 18/01/25.
////
//
//import UIKit
//
//class SearchVC: UIViewController{
//  
//  var presenter: VTPSearchProtocol?
//  
//  //  @IBOutlet weak var sbSearch: UISearchBar!
//  
//  @IBOutlet weak var tblSearch: UITableView!
//  
//  var dataSearch : [Title] = []
//  var key = "883b20661c35f38e181243f7361f28f3"
//  
//  let searchController = UISearchController(searchResultsController: nil)
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    setUpView()
//    setUpAction()
//    // Do any additional setup after loading the view.
//  }
//  func setUpView(){
//    tblSearch.dataSource = self
//    tblSearch.delegate = self
//    tblSearch.register(SearchTVC.nib(), forCellReuseIdentifier: SearchTVC.identifier)
//    
//  }
//  func setUpAction(){
//    //    sbSearch.isUserInteractionEnabled = true
//    
//    //            navigationItem.searchController = searchController
//    //           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sbSearchTapped(_:)))
//    //    sbSearch.addGestureRecognizer(tapGesture)
//    //
//    //  @objc func sbSearchTapped(_ gesture: UITapGestureRecognizer) {
//    //    if let navigation = navigationController{
//    //    presenter?.startNavToDetail(data: dataSearch, nav: navigation)
//    //
//    //          }
//    //      }
//    
//    
//  }
//}
//  
//extension SearchVC: PTVSearchProtocol {
////  func successGetSearch(data: [Title]) {
////    <#code#>
////  }
//  
//  
//  func successGetTopSearch(data: [Title]) {
//    dataSearch = data
//     print("dataSearch: \(dataSearch.count)")
//     tblSearch.reloadData()
//}
//
//  func failedGet(message: String) {
//    print(message)
//     Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
//  }
//  
//    
//  }
//
//
//extension SearchVC :  UITableViewDataSource, UITableViewDelegate {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return dataSearch.count
//  }
//  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//   guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTVC.identifier, for: indexPath) as? SearchTVC else {
//      return UITableViewCell() // Return an empty cell if casting fails
//            }
//      let item = dataSearch[indexPath.row] // Use dataSearch instead of data
//            cell.lblTitleSearch.text = item.title // Assuming Title has a 'title' property
//    cell.imgTblSearch.image = item.posterPath
//            return cell
//        }
//  
//}
