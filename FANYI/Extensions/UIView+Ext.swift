//
//  UIView+Ext.swift
//  FANYI
//
//  Created by Алексей  on 09.04.2023.
//

import Foundation

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
