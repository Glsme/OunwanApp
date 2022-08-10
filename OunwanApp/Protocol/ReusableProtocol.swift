//
//  ReusableProtocol.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/08/10.
//

import Foundation
import UIKit

protocol ReusableProtocol {
    static var reuseIdentifier: String { get }
}

extension UICollectionViewCell: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

