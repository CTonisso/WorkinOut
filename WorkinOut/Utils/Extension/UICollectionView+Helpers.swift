//
//  UICollectionView+Helpers.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 17/05/23.
//

import Foundation
import UIKit

extension UICollectionViewCell: ReusableView {}

extension UICollectionView {
    
    public func registerWithClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Dequeueing a cell with identifier: \(T.reuseIdentifier) failed.")
        }
        return cell
    }

}

