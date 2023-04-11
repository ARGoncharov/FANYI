//
//  ViewController.swift
//  FANYI
//
//  Created by Алексей  on 09.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(
            textField
        )
        viewsConfiguration()
    }
    
    private func viewsConfiguration() {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}

