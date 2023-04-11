//
//  ViewController.swift
//  FANYI
//
//  Created by Алексей  on 09.04.2023.
//

import UIKit
import SnapKit

final class FYMainViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter the text..."
        textField.backgroundColor = UIColor.lightGray
        textField.layer.cornerRadius = 5
        textField.textColor = UIColor.black
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2.0
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(
            textField,
            submitButton
        )
        viewsConfiguration()
    }
    
    private func viewsConfiguration() {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.trailing.leading.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(80)
        }
    }
}

