//
//  GetData.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation

class GetDataManager {
    private let getDataService: GetDataProtocol
    private let url:String
    
    init(getDataService: GetDataProtocol) {
        self.getDataService = getDataService
        self.url = UnsplashUrl.url.rawValue
    }
    
    func getJsonData(onSuccess: @escaping (UnsplashData?)->(Void), onError: @escaping (String)->(Void)) {
        getDataService.fetch(path: url) { (response:UnsplashData) in
            onSuccess(response)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
}
