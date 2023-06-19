//
//  View.swift
//  DependencyInjectionExample
//
//  Created by Kadir Yasin Özmen on 19.06.2023.
//

import UIKit.UIView
import SnapKit

class Interface:UIView {
    // MARK: - UI Elements
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.stack.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Refresh", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .label
        button.layer.cornerRadius = 15
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        return button
    }()
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func configureUI() {
        backgroundColor = .systemGray5
        setupImageView()
        setupButton()
        setupActivityIndicator()
    }
    
    // MARK: -  Actions
    @objc func buttonDidTapped(){
    }
}

// MARK: - SnapKit Part
extension Interface {
    
    func setupImageView() {
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).offset(-30)
            make.height.equalTo(image.snp.width).multipliedBy(4.0/3.0)
        }
    }
    
    func setupButton() {
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(30)
            make.width.width.equalTo(image.snp.width)
            make.height.equalTo(100)
        }
    }
    
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
