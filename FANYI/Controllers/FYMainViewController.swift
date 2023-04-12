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
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.titleLabel?.textColor = UIColor.black
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 25
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: .infinity)
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resultView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(
            textField,
            submitButton,
            resultView,
            resultLabel
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
            make.bottom.equalToSuperview().inset(80)
            make.trailing.leading.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
        
        resultView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(400)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.left.right.equalTo(resultView).inset(15)
            make.top.equalTo(resultView).inset(15)
            make.bottom.equalTo(resultView).inset(50)
        }
    }
    
    @objc private func submitButtonTapped() {
        guard let text = textField.text, !text.isEmpty else { return }
        resultLabel.text = text
        textField.text = ""
    }
}

