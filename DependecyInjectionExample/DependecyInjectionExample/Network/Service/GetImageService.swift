//
//  GetImageService.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation
import CoreGraphics
import Alamofire

protocol GetImageProtocol: AnyObject {
    func getImage(url: String, onSuccess: @escaping (CGImage?)->(), onError: @escaping (String?)->())
}

final class GetImageService:GetImageProtocol {
    
    
    func getImage(url: String, onSuccess: @escaping (CGImage?)->(), onError: @escaping (String?)->()) {
        AF.request(url).responseImage { response in
            if case .success(let image) = response.result {
                onSuccess(image.cgImage)
                print("image downloaded: \(image)")
            }else {
                onError("error when image dowloand")
            }
        }
    }
    
}
