//
//  View Model.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation
import AlamofireImage


protocol ViewModelProtocol: AnyObject {
    func getData()
    func getPhoto()
    var data:UnsplashData? { get set }
}

class ViewModel:ViewModelProtocol {
    // MARK: - Propertires
    var data: UnsplashData?
    weak var changeImageDelegate: ChangeImageProtocol?
    let getDataManager = GetDataManager(getDataService: GetDataService())
    let getImageManger = GetImageManager(getImageService: GetImageService())
    
    
    // MARK: - Functions
    func getData() {
        getDataManager.getJsonData { data in
            self.data = data
            self.getPhoto()
        } onError: { error in
            print(error)
        }
    }
    
    func getPhoto() {
        guard let data = data else{
            return
        }
        getImageManger.getImage(url: data.urls.regular) { image in
            self.changeImageDelegate?.changeImage(image)
        } onError: { error in
            print(error as Any)
        }
    }
}
