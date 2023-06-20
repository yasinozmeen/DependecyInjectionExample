//
//  View.swift
//  DependencyInjectionExample
//
//  Created by Kadir Yasin Özmen on 19.06.2023.
//

import UIKit.UIView
import SnapKit
import AlamofireImage

protocol ChangeImageProtocol: AnyObject{
    func changeImage(_ image:Image)
}

class Interface:UIView {
    // MARK: - Properties
    weak var buttonDelegate: InterfaceProtocol?
    private let viewModel = ViewModel()
    
    // MARK: - UI Elements
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.stack.fill")
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Refresh", for: .normal)
        button.tintColor = .gray
        button.backgroundColor = .label
        button.layer.cornerRadius = 15
        button.isUserInteractionEnabled = false
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
        if !activityIndicator.isAnimating {
            image.isHidden = true
            activityIndicator.startAnimating()
            button.tintColor = .gray
            buttonDelegate?.buttonDidTapped()
            button.isUserInteractionEnabled = false
        }
    }
}
// MARK: - Change Image
extension Interface: ChangeImageProtocol{
    
    func changeImage(_ image: AlamofireImage.Image) {
        guard let cgImage = image.cgImage else {
            print("image not transform to cgImage")
            return
        }
        self.image.image = UIImage(cgImage: cgImage)
        activityIndicator.stopAnimating()
        self.image.isHidden = false
        button.tintColor = .white
        button.isUserInteractionEnabled = true
    }
}

// MARK: - SnapKit Part
extension Interface {
    
    func setupImageView() {
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
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
        
        activityIndicator.startAnimating()
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(image.snp.center)
        }
    }
}
