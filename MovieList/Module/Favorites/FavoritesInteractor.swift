//
//  FavoritesInteractor.swift
//  MovieList
//
//  Created by Ferry jati on 21/01/25.
//
//
import Foundation
import UIKit
import CoreData
//
//
class FavoritesInteractor: PTIFavoritesProtocol  {
  var presenter: ITPFavoritesProtocol?
    
    // MARK: - Private Properties
    private let appDelegate: AppDelegate
    
    // MARK: - Initializer
    init(appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    // MARK: - Download Title
    func downloadTitle(model: Title) {
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleItem(context: context)
        
        item.title = model.title
        item.id = Int64(model.id)
        item.overview = model.overview
        item.posterPath = model.posterPath
        
        do {
            try context.save()
            // Handle success (e.g., notify presenter)
        } catch {
            // Handle error (e.g., notify presenter)
        }
    }
    
    // MARK: - Fetch Titles
  // MARK: - Fetch Titles
      func fetchTitles(completion: @escaping (Result<[TitleItem], Error>) -> Void) { // Corrected method signature
          let context = appDelegate.persistentContainer.viewContext
          let request: NSFetchRequest<TitleItem> = TitleItem.fetchRequest()
          
          do {
              let titles = try context.fetch(request)
              completion(.success(titles)) // Return success with fetched titles
          } catch {
              completion(.failure(DatabaseError.failedToFetchData)) // Return failure with error
          }
      }
    
  // MARK: - Delete Title
      func deleteTitle(model: TitleItem) {
          let context = appDelegate.persistentContainer.viewContext
          
          context.delete(model)
          
          do {
              try context.save()
              // Handle success (e.g., notify presenter)
          } catch {
              // Handle error (e.g., notify presenter)
          }
      }
  }

// MARK: - Database Error Enum
enum DatabaseError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}
