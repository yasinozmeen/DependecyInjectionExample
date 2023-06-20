//
//  GEtImage.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation
import CoreGraphics

class GetImageManager {
    private let getImageService: GetImageProtocol
    
    init(getImageService: GetImageProtocol) {
        self.getImageService = getImageService
    }
    
    func getImage(url: String, onSuccess: @escaping (CGImage?)->(), onError: @escaping (String?)->()) {
        getImageService.getImage(url: "https://images.unsplash.com/photo-1685322556468-68028d914042?ixid=M3w0NTQyNTF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODcyNTI3NTZ8&ixlib=rb-4.0.3"){ cgImage in
            onSuccess(cgImage)
        } onError: { error in
            onError(error)
        }
    }
}
