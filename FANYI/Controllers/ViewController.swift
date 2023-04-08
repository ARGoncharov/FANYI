//
//  ViewController.swift
//  FANYI
//
//  Created by Алексей  on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
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
        
    }
}

