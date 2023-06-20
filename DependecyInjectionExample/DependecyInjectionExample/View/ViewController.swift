//
//  ViewController.swift
//  DependecyInjectionExample
//
//  Created by Kadir Yasin Özmen on 19.06.2023.
//

import UIKit
protocol InterfaceProtocol:AnyObject {
    func buttonDidTapped()
}
class ViewController: UIViewController {
    // MARK: - Properties
    private let viewModel = ViewModel()
    var interface: Interface?
    weak var viewModelDelegate: ViewModelProtocol?
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        delegateImp()
        getFirstData()
    }
    
    // MARK: - Funcitons
    func configureUI() {
        interface = Interface()
        view = interface
    }
    
    func delegateImp() {
        interface?.buttonDelegate = self
        viewModel.changeImageDelegate = interface
        viewModelDelegate = viewModel
    }
    
    func getFirstData(){
        self.viewModelDelegate?.getData()
    }
}

extension ViewController: InterfaceProtocol{
    func buttonDidTapped() {
        self.viewModelDelegate?.getData()
    }
}

