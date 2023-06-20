//
//  NetworkManager.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 20.06.2023.
//

import Foundation
import Alamofire
import CoreGraphics

final class NetworkManager {
    
    let networkService: NetworkHelperProtocol
    
    
    init(networkService: NetworkHelperProtocol) {
        self.networkService = networkService
    }
    
    
    
    
    
}
