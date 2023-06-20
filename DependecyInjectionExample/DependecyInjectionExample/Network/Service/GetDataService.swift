//
//  NetworkService.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Alamofire
import AlamofireImage
import CoreGraphics

protocol GetDataProtocol: AnyObject {
    func fetch<T>(path: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void) where T: Codable
}

final class GetDataService:GetDataProtocol {
    
    func fetch<T>(path: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void) where T: Codable {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else {
                print(response)
                return
            }
            onSuccess(model)
        }
    }
    
}
