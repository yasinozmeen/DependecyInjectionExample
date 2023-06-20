//
//  GEtImage.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation
import CoreGraphics
import AlamofireImage

class GetImageManager {
    private let getImageService: GetImageProtocol
    
    init(getImageService: GetImageProtocol) {
        self.getImageService = getImageService
    }
    
    func getImage(url: String, onSuccess: @escaping (Image)->(), onError: @escaping (String?)->()) {
        getImageService.getImage(url:url){ cgImage in
            onSuccess(cgImage!)
        } onError: { error in
            onError(error)
        }
    }
}

