//
//  ImageString.swift
//  MovieList
//
//  Created by Ferry jati on 20/01/25.
//


import Foundation
import UIKit

func imageToString(_ image: UIImage) -> String? {
    if let imageData = image.jpegData(compressionQuality: 1.0) { // You can use pngData() if you prefer PNG format
        let base64String = imageData.base64EncodedString(options: .lineLength64Characters)
        return base64String
    }
    return nil
}

func stringToImage(_ base64String: String) -> UIImage? {
    if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
        let image = UIImage(data: imageData)
        return image
    }
    return nil
}

// MARK: Usage
//if let image = UIImage(named: "yourImageName") {
//    if let imageString = imageToString(image) {
//        print("Image as string:", imageString)
//
//        if let decodedImage = stringToImage(imageString) {
//            // Use the decodedImage
//        }
//    }
//}
