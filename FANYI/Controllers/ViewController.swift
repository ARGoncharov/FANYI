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
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
        }
    }
}

