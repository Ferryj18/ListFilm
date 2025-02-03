//
//  DataPersistenceManager.swift
//  MovieList
//
//  Created by Ferry jati on 21/01/25.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    
  func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let context = appDelegate.persistentContainer.viewContext
          
          // Buat permintaan untuk memeriksa apakah judul sudah ada
          let fetchRequest: NSFetchRequest<TitleItem> = TitleItem.fetchRequest()
          fetchRequest.predicate = NSPredicate(format: "id == %d", model.id) // Ganti 'id' dengan properti yang sesuai
          
          do {
              let existingTitles = try context.fetch(fetchRequest)
              
              // Jika judul sudah ada, kembalikan error
              if !existingTitles.isEmpty {
                  completion(.failure(DatabasError.failedToSaveData)) // Menggunakan error yang sama
                  return
              }
              
              // Jika judul belum ada, lanjutkan untuk menyimpannya
              let item = TitleItem(context: context)
              item.title = model.title
              item.id = Int64(model.id)
              item.overview = model.overview
              item.posterPath = model.posterPath
              
              try context.save()
              completion(.success(()))
          } catch {
              completion(.failure(DatabasError.failedToSaveData)) // Ganti dengan error yang sesuai
          }
      }
      
      // Fungsi untuk mengambil semua judul dari database
      func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let context = appDelegate.persistentContainer.viewContext
          
          let request: NSFetchRequest<TitleItem> = TitleItem.fetchRequest()
          
          do {
              let titles = try context.fetch(request)
              completion(.success(titles))
          } catch {
              completion(.failure(DatabasError.failedToFetchData))
          }
      }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>)-> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToDeleteData))
        }
        
    }
}
